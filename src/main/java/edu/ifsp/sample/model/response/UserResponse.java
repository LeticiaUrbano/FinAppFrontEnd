package edu.ifsp.sample.model.response;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class UserResponse {
    private boolean success;

    private UserData data;

    public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public UserData getData() {
		return data;
	}

	public void setData(UserData data) {
		this.data = data;
	}

	public static class UserData {
        private List<UserItem> itens;
        private Paginacao paginacao;

		public List<UserItem> getItens() {
			return itens;
		}

		public void setItens(List<UserItem> itens) {
			this.itens = itens;
		}

		public Paginacao getPaginacao() {
			return paginacao;
		}

		public void setPaginacao(Paginacao paginacao) {
			this.paginacao = paginacao;
		}
		
		
    }

    public static class UserItem {
        @JsonProperty("nomeCompleto")
        private String nomeCompleto;

        @JsonProperty("email")
        private String email;

        @JsonProperty("idExterno")
        private String idExterno;

        @JsonProperty("nome")
        private String nome;

        @JsonProperty("sobrenome")
        private String sobrenome;

		public String getNomeCompleto() {
			return nomeCompleto;
		}

		public void setNomeCompleto(String nomeCompleto) {
			this.nomeCompleto = nomeCompleto;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getIdExterno() {
			return idExterno;
		}

		public void setIdExterno(String idExterno) {
			this.idExterno = idExterno;
		}

		public String getNome() {
			return nome;
		}

		public void setNome(String nome) {
			this.nome = nome;
		}

		public String getSobrenome() {
			return sobrenome;
		}

		public void setSobrenome(String sobrenome) {
			this.sobrenome = sobrenome;
		}
    }
    
    public static class Paginacao {
        private int totalDeElementos;
        private int tamanhoDaPagina;
        private int numeroDaPagina;
        private int totalPaginas;
        private int ultimaPagina;
        private boolean possuiPaginaAnterior;
        private boolean possuiPaginaSeguinte;
        private int paginaAnterior;
        private int paginaSeguinte;
		public int getTotalDeElementos() {
			return totalDeElementos;
		}
		public void setTotalDeElementos(int totalDeElementos) {
			this.totalDeElementos = totalDeElementos;
		}
		public int getTamanhoDaPagina() {
			return tamanhoDaPagina;
		}
		public void setTamanhoDaPagina(int tamanhoDaPagina) {
			this.tamanhoDaPagina = tamanhoDaPagina;
		}
		public int getNumeroDaPagina() {
			return numeroDaPagina;
		}
		public void setNumeroDaPagina(int numeroDaPagina) {
			this.numeroDaPagina = numeroDaPagina;
		}
		public int getTotalPaginas() {
			return totalPaginas;
		}
		public void setTotalPaginas(int totalPaginas) {
			this.totalPaginas = totalPaginas;
		}
		public int getUltimaPagina() {
			return ultimaPagina;
		}
		public void setUltimaPagina(int ultimaPagina) {
			this.ultimaPagina = ultimaPagina;
		}
		public boolean isPossuiPaginaAnterior() {
			return possuiPaginaAnterior;
		}
		public void setPossuiPaginaAnterior(boolean possuiPaginaAnterior) {
			this.possuiPaginaAnterior = possuiPaginaAnterior;
		}
		public boolean isPossuiPaginaSeguinte() {
			return possuiPaginaSeguinte;
		}
		public void setPossuiPaginaSeguinte(boolean possuiPaginaSeguinte) {
			this.possuiPaginaSeguinte = possuiPaginaSeguinte;
		}
		public int getPaginaAnterior() {
			return paginaAnterior;
		}
		public void setPaginaAnterior(int paginaAnterior) {
			this.paginaAnterior = paginaAnterior;
		}
		public int getPaginaSeguinte() {
			return paginaSeguinte;
		}
		public void setPaginaSeguinte(int paginaSeguinte) {
			this.paginaSeguinte = paginaSeguinte;
		}

    }
}