package edu.ifsp.sample;

//import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

//@JsonIgnoreProperties(ignoreUnknown = true)
public class UserData {
    private int id;
    private String name;
    private String username;

    // getters e setters

        // Construtor vazio necessário para deserialização do JSON
        public UserData() {
        }

        // Métodos getters e setters

        public int getId() {
            return id;
        }

        public String getName() {
            return name;
        }

        public String getUsername() {
            return username;
        }

    }
