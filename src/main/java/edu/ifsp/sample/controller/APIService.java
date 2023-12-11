package edu.ifsp.sample.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.ifsp.sample.model.request.AuthRequest;
import edu.ifsp.sample.model.request.ExpenseRequest;
import edu.ifsp.sample.model.request.UserRequest;
import edu.ifsp.sample.model.response.ExpenseResponse;

@Service
public class APIService {

	@Autowired
	private RestTemplate restTemplate;
	
	private final Gson gson = new Gson();
	
	public String getData() {
		String url = "https://jsonplaceholder.typicode.com/posts/1";
		ResponseEntity<String> responseEntity = restTemplate.getForEntity(url, String.class);
		String responseBody = responseEntity.getBody();
		return responseBody;
	}
	

//	public List<UserResponse.UserItem> getUsers() throws JsonMappingException, JsonProcessingException {
//		String url = "http://localhost:5001/finApp/v1/users";
//		String bearerToken = getToken();
//	    HttpHeaders headers = new HttpHeaders();
//	    headers.set("Authorization", "Bearer " + bearerToken);
//
//	    HttpEntity<String> requestEntity = new HttpEntity<>(headers);
//
//	    ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.GET, requestEntity, String.class);
//	    String responseBody = responseEntity.getBody();
//
//	    // Deserializar a resposta em um objeto Java
//	    ObjectMapper objectMapper = new ObjectMapper();
//	    UserResponse userResponse = objectMapper.readValue(responseBody, UserResponse.class);
//
//	    // Retornar a lista de itens
//	    return userResponse.getData().getItens();
//	}
	
	public void createNewUser(UserRequest userRequest) {
	    String url = "http://localhost:5001/finApp/v1/users/create";
	
	    // Converte o objeto UserRequest para JSON
	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonUser;
	
	    try {
	        jsonUser = objectMapper.writeValueAsString(userRequest);
	    } catch (JsonProcessingException e) {
	        // Lida com a exceção de serialização para JSON
	        e.printStackTrace();
	        return;
	    }
	
	    // Configura os headers
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	
	    // Cria a entidade HTTP com o JSON e os headers
	    HttpEntity<String> requestEntity = new HttpEntity<>(jsonUser, headers);
	
	    // Faz a requisição POST
	    ResponseEntity<String> responseEntity = restTemplate.postForEntity(url, requestEntity, String.class);
	
	    // Obtém a resposta do servidor
	    String responseBody = responseEntity.getBody();
	
	    // Trata a resposta conforme necessário
	    System.out.println("API Response: " + responseBody);
	}

	public void createNewExpense(ExpenseRequest expenseRequest) {
		String urlCriarNovoGasto = "http://localhost:5001/finApp/v1/expense";
		
		ObjectMapper objectMapper = new ObjectMapper();
	    String jsonGasto;
	
	    try {
	    	jsonGasto = objectMapper.writeValueAsString(expenseRequest);
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	        return;
	    }
	    
	 // Configura os headers
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	
	    // Cria a entidade HTTP com o JSON e os headers
	    HttpEntity<String> requestEntity = new HttpEntity<>(jsonGasto, headers);
	
	    // Faz a requisição POST
	    ResponseEntity<String> responseEntity = restTemplate.postForEntity(urlCriarNovoGasto, requestEntity, String.class);
	
	    // Obtém a resposta do servidor
	    String responseBody = responseEntity.getBody();
	
	    // Trata a resposta conforme necessário
	    System.out.println("API Response: " + responseBody);
		
	}
	
	public String checkToken(String token) {
        String urlCheckToken = "http://localhost:5001/finApp/v1/authentication/check-token";

        // Configurar os headers
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(token);

        // Configurar a requisição
        HttpEntity<?> requestEntity = new HttpEntity<>(headers);

        // Criar um RestTemplate
        RestTemplate restTemplate = new RestTemplate();

        // Fazer a requisição GET
        ResponseEntity<String> responseEntity = restTemplate.exchange(
                urlCheckToken,
                HttpMethod.GET,
                requestEntity,
                String.class
        );

        // Obter a resposta do servidor
        String responseBody = responseEntity.getBody();

        // Aqui, você pode processar a resposta conforme necessário
        return responseBody;
    }
	
	public String getToken(UserRequest userRequest) {
	    String url = "http://localhost:5001/finApp/v1/authentication";

	    AuthRequest requestBodyObject = new AuthRequest(userRequest.getEmail(), userRequest.getSenha());

	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);

	    HttpEntity<AuthRequest> requestEntity = new HttpEntity<>(requestBodyObject, headers);

	    // Fazer a requisição POST
	    ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class);
	    String responseBody = responseEntity.getBody();
	    
	    ObjectMapper objectMapper = new ObjectMapper();
	    JsonNode jsonNode;
	    try {
	    	
		    jsonNode = objectMapper.readTree(responseBody);
	    }catch (JsonProcessingException e) {
	    	e.printStackTrace();
	        return null;
		}
	    

	    // Verificar se o objeto JWT contém o token
	    JsonNode jwtNode = jsonNode.path("jwt");
	    String jwtToken = (jwtNode.isMissingNode() || jwtNode.isNull()) ? null : jwtNode.asText();

	    return jwtToken;
	}


	@Bean
	public RestTemplate restTemplate() {
	    return new RestTemplate();
	}


	public String getUserCode(String email, String token) {
        try {
            // URL da sua API ou endpoint
            String apiUrl = "http://localhost:5001/finApp/v1/users";

            // Construir a URL com os parâmetros
            String urlString = apiUrl + "?email=" + email;

            // Criar a conexão HTTP
            URL url = new URL(urlString);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Configurar o método HTTP (GET neste caso)
            connection.setRequestMethod("GET");

            // Adicionar o token como Bearer Token
            connection.setRequestProperty("Authorization", "Bearer " + token);

            // Ler a resposta da requisição
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                response.append(line);
            }

            // Fechar os recursos
            reader.close();
            connection.disconnect();

            // Converter a resposta para um objeto JSON
            JsonObject jsonResponse = new Gson().fromJson(response.toString(), JsonObject.class);

            // Acessar o campo "idExterno" dentro do objeto "data"
            JsonArray itens = jsonResponse.getAsJsonObject("data").getAsJsonArray("itens");
            String userCode = itens.get(0).getAsJsonObject().get("idExterno").getAsString();

            // Retornar o código do usuário
            return userCode;

        } catch (IOException e) {
            e.printStackTrace();
            // Tratar erros de IO ou conexão
            return null;
        }
    }


	public List<ExpenseResponse> getExpenses(String userCode, String token) {
        try {
            // URL da sua API ou endpoint
            String apiUrl = "http://localhost:5001/finApp/v1/users/" + userCode + "/expenses";

            // Criar a conexão HTTP
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Configurar o método HTTP (GET neste caso)
            connection.setRequestMethod("GET");
            
            connection.setRequestProperty("Authorization", "Bearer " + token);

            // Ler a resposta da requisição
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                response.append(line);
            }

            // Fechar os recursos
            reader.close();
            connection.disconnect();

            // Processar a resposta JSON
            JsonObject jsonResponse = gson.fromJson(response.toString(), JsonObject.class);

            // Extrair as despesas da resposta JSON
            List<ExpenseResponse> expenses = gson.fromJson(jsonResponse.getAsJsonArray("expense"), List.class);

            return expenses;

        } catch (IOException e) {
            e.printStackTrace();
            // Tratar erros de IO ou conexão
            return null;
        }
    }

}
