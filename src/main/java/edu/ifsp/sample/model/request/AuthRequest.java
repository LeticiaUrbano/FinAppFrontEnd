package edu.ifsp.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AuthRequest {
	@JsonProperty("email")
    private String email;

    @JsonProperty("senha")
    private String senha;

    // Construtores, getters e setters (necessários para o Jackson)
    
    // Exemplo de construtor
    public AuthRequest(String email, String senha) {
        this.email = email;
        this.senha = senha;
    }

    // Exemplo de getters e setters
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
