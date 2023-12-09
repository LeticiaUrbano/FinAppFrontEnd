package edu.ifsp.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class APIServiceUser {

    @Autowired
    private RestTemplate restTemplate;

    public UserData getUserData() {
        String url = "https://jsonplaceholder.typicode.com/users/1";
        ResponseEntity<String> responseEntity = restTemplate.getForEntity(url, String.class);

        // Deserializa o JSON para a classe UserData
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            return objectMapper.readValue(responseEntity.getBody(), UserData.class);
        } catch (Exception e) {
            e.printStackTrace();
            return null; // Trate os erros adequadamente na sua aplicação
        }
    }
}
