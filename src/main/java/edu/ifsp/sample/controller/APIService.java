package edu.ifsp.sample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

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
	@Bean
	public RestTemplate restTemplate() {
	    return new RestTemplate();
	}

}
