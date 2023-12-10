package edu.ifsp.sample.controller;

import java.util.List;

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
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.ifsp.model.request.AuthRequest;
import edu.ifsp.model.response.UserResponse;

@Service
public class APIService {

	@Autowired
	private RestTemplate restTemplate;
	
	public String getData() {
		String url = "https://jsonplaceholder.typicode.com/posts/1";
		ResponseEntity<String> responseEntity = restTemplate.getForEntity(url, String.class);
		String responseBody = responseEntity.getBody();
		return responseBody;
	}
	
	public List<UserResponse.UserItem> getUsers() throws JsonMappingException, JsonProcessingException {
		String url = "http://localhost:5001/finApp/v1/users";
		String bearerToken = getToken();
		createNewUser();
	    HttpHeaders headers = new HttpHeaders();
	    headers.set("Authorization", "Bearer " + bearerToken);

	    HttpEntity<String> requestEntity = new HttpEntity<>(headers);

	    ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.GET, requestEntity, String.class);
	    String responseBody = responseEntity.getBody();

	    // Deserializar a resposta em um objeto Java
	    ObjectMapper objectMapper = new ObjectMapper();
	    UserResponse userResponse = objectMapper.readValue(responseBody, UserResponse.class);

	    // Retornar a lista de itens
	    return userResponse.getData().getItens();
	}
	
	public void createNewUser() {
        String url = "http://localhost:5001/finApp/v1/users/create";

        // Criar o JSON do usuário
        String jsonUser = "{ \"nome\": \"teste\", \"sobrenome\": \"teste\", \"email\": \"teste123@teste.com\", \"senha\": \"teste\" }";

        // Configurar os headers
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // Criar a entidade HTTP com o JSON e os headers
        HttpEntity<String> requestEntity = new HttpEntity<>(jsonUser, headers);

        // Fazer a requisição POST
        ResponseEntity<String> responseEntity = restTemplate.postForEntity(url, requestEntity, String.class);

        // Obter a resposta do servidor
        String responseBody = responseEntity.getBody();

        // Tratar a resposta conforme necessário
        System.out.println("API Response: " + responseBody);
    }
	
	
	public String getToken() throws JsonMappingException, JsonProcessingException {
        String url = "http://localhost:5001/finApp/v1/authentication";

        AuthRequest requestBodyObject = new AuthRequest("admin@dsw.net", "admin@dsw");

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<AuthRequest> requestEntity = new HttpEntity<>(requestBodyObject, headers);

        // Fazer a requisição POST
        ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class);
        String responseBody = responseEntity.getBody();

        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(responseBody);

        // Extrair o token JWT
        String jwtToken = jsonNode.path("jwt").asText();

        return jwtToken;
    }

	@Bean
	public RestTemplate restTemplate() {
	    return new RestTemplate();
	}

}
