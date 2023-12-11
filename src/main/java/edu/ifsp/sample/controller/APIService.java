package edu.ifsp.sample.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
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
import edu.ifsp.sample.model.request.ExpensePutRequest;
import edu.ifsp.sample.model.request.ExpenseRequest;
import edu.ifsp.sample.model.request.UserRequest;
import edu.ifsp.sample.model.response.ExpenseCreateResponse;
import edu.ifsp.sample.model.response.ExpenseResponse;

@Service
public class APIService {

	@Autowired
	private RestTemplate restTemplate;
	
	private final Gson gson = new Gson();
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
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

	public String createNewExpense(ExpenseRequest expenseRequest, String token) {
	    try {
	        // URL da sua API ou endpoint
	        String urlCriarNovoGasto = "http://localhost:5001/finApp/v1/expense";

	        // Crie a URL e abra a conexão
	        URL url = new URL(urlCriarNovoGasto);
	        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

	        // Configurações da conexão
	        connection.setRequestMethod("POST");
	        connection.setRequestProperty("Authorization", "Bearer " + token);
	        connection.setRequestProperty("Content-Type", "application/json");
	        connection.setDoOutput(true);

	        // Converta o objeto ExpenseRequest para JSON
	        String jsonInputString = objectMapper.writeValueAsString(expenseRequest);

	        // Obtenha a saída da conexão e escreva os dados JSON
	        try (OutputStream os = connection.getOutputStream()) {
	            byte[] input = jsonInputString.getBytes();
	            os.write(input, 0, input.length);
	        }

	        // Obtenha a resposta da requisição
	        int responseCode = connection.getResponseCode();

	        // Leia a resposta, se necessário
	        String response;
	        try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
	            StringBuilder responseStringBuilder = new StringBuilder();
	            String line;
	            while ((line = reader.readLine()) != null) {
	                responseStringBuilder.append(line);
	            }
	            response = responseStringBuilder.toString();
	        }

	        // Feche a conexão
	        connection.disconnect();

	        return response;

	    } catch (Exception e) {
	        e.printStackTrace();
	        // Trate os erros, se necessário
	        return null;
	    }
	}
	
	public String vincularGastoComUser(ExpenseRequest expenseRequest, String token, String userEmail) {
	    String response = createNewExpense(expenseRequest, token);
	    String expenseCode = null;
	    // Verifique se a resposta não é nula ou vazia
	    if (response != null && !response.isEmpty()) {
	        try {
	            // Use o ObjectMapper para desserializar o JSON em um objeto Java
	            ObjectMapper objectMapper = new ObjectMapper();
	            ExpenseCreateResponse expenseResponse = objectMapper.readValue(response, ExpenseCreateResponse.class);

	            // Agora você pode acessar os itens separadamente
	            expenseCode = expenseResponse.getCode();
	            
	            // Faça o que precisar com os itens
	            System.out.println("Code: " + expenseCode);

	        } catch (Exception e) {
	            e.printStackTrace();
	            // Trate erros de desserialização, se necessário
	        }
	        
	    }
	    String userCode = getUserCode(userEmail, token);
	    gerarVinculo(userCode, token, expenseCode);
	    return response;
	}
	
	 public void gerarVinculo(String userCode, String token, String expenseCode) {
	        try {
	            // URL da sua API ou endpoint
	            String urlGerarVinculo = "http://localhost:5001/finApp/v1/users/" + userCode + "/expense";

	            // Crie a URL e abra a conexão
	            URL url = new URL(urlGerarVinculo);
	            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

	            // Configurações da conexão
	            connection.setRequestMethod("PUT");
	            connection.setRequestProperty("Authorization", "Bearer " + token);
	            connection.setRequestProperty("Content-Type", "application/json");
	            connection.setDoOutput(true);

	            // Converta o expenseCode para o formato esperado no corpo da requisição
	            String jsonInputString = "[{\"idExterno\": \"" + expenseCode + "\"}]";

	            // Obtenha a saída da conexão e escreva os dados JSON
	            try (OutputStream os = connection.getOutputStream()) {
	                byte[] input = jsonInputString.getBytes();
	                os.write(input, 0, input.length);
	            }

	            // Obtenha a resposta da requisição
	            int responseCode = connection.getResponseCode();

	            // Leia a resposta, se necessário
	            // Exemplo:
	            // BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	            // String line;
	            // while ((line = reader.readLine()) != null) {
	            //     System.out.println(line);
	            // }

	            // Feche a conexão
	            connection.disconnect();

	        } catch (Exception e) {
	            e.printStackTrace();
	            // Trate os erros, se necessário
	        }
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


	public void deleteGasto(String expenseCode, String token) {
	        try {
	            // URL da sua API ou endpoint
	            String urlDesassociar = "http://localhost:5001/finApp/v1/expense/del/" + expenseCode;

	            // Criar a conexão HTTP
	            URL url = new URL(urlDesassociar);
	            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

	            // Configurar o método HTTP (DELETE neste caso)
	            connection.setRequestMethod("DELETE");

	            // Configurar o token no cabeçalho da requisição
	            connection.setRequestProperty("Authorization", "Bearer " + token);

	            // Obter o código de resposta
	            int responseCode = connection.getResponseCode();

	            // Verificar se a exclusão foi bem-sucedida (código 204 indica sucesso)
	            if (responseCode == 204) {
	                System.out.println("Registro excluído com sucesso.");
	            } else {
	                System.out.println("Erro ao excluir o registro. Código de resposta: " + responseCode);
	            }

	            // Fechar os recursos
	            connection.disconnect();
	            
	            excluirGasto(expenseCode, token);

	        } catch (IOException e) {
	            e.printStackTrace();
	            // Tratar erros de IO ou conexão
	        }
	    }
	private void excluirGasto(String expenseCode, String token) {
        try {
            // URL da sua API ou endpoint
            String urlExcluir = "http://localhost:5001/finApp/v1/expense/" + expenseCode;

            // Criar a conexão HTTP
            URL url = new URL(urlExcluir);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Configurar o método HTTP (DELETE neste caso)
            connection.setRequestMethod("DELETE");

            // Configurar o token no cabeçalho da requisição
            connection.setRequestProperty("Authorization", "Bearer " + token);

            // Obter o código de resposta
            int responseCode = connection.getResponseCode();

            // Verificar se a exclusão foi bem-sucedida (código 204 indica sucesso)
            if (responseCode == 204) {
                System.out.println("Registro excluído com sucesso.");
            } else {
                System.out.println("Erro ao excluir o registro. Código de resposta: " + responseCode);
            }

            // Fechar os recursos
            connection.disconnect();

        } catch (IOException e) {
            e.printStackTrace();
            // Tratar erros de IO ou conexão
        }
    }


	public void atualizarGasto(ExpensePutRequest expensePutRequest, String token) {
	    try {
	        // URL da sua API ou endpoint
	        String urlAtualizarGasto = "http://localhost:5001/finApp/v1/expense/" + expensePutRequest.getExpenseCode();

	        // Crie a URL e abra a conexão
	        URL url = new URL(urlAtualizarGasto);
	        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

	        // Configurações da conexão
	        connection.setRequestMethod("PUT");
	        connection.setRequestProperty("Authorization", "Bearer " + token);
	        connection.setRequestProperty("Content-Type", "application/json");
	        connection.setDoOutput(true);

	        // Converta o objeto ExpensePutRequest para JSON
	        String jsonInputString = objectMapper.writeValueAsString(expensePutRequest);

	        // Obtenha a saída da conexão e escreva os dados JSON
	        try (OutputStream os = connection.getOutputStream()) {
	            byte[] input = jsonInputString.getBytes();
	            os.write(input, 0, input.length);
	        }

	        // Obtenha a resposta da requisição
	        int responseCode = connection.getResponseCode();

	        // Leia a resposta, se necessário
	        // Exemplo:
	        // BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	        // String line;
	        // while ((line = reader.readLine()) != null) {
	        //     System.out.println(line);
	        // }

	        // Feche a conexão
	        connection.disconnect();

	    } catch (Exception e) {
	        e.printStackTrace();
	        // Trate os erros, se necessário
	    }
	}


}
