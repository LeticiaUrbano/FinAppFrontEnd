package edu.ifsp.sample.model.request;

public class ExpensePutRequest {
	
	private String expenseCode;
	
		private String expenseName;

	    private double expensePrice;
	    
	    private String expenseType;
	    
	    public ExpensePutRequest(String expenseName, double expensePrice, String expenseType, String expenseCode) {
	        this.expenseName = expenseName;
	        this.expensePrice = expensePrice;
	        this.expenseType = expenseType;
	        this.expenseCode = expenseCode;
	    }

		public String getExpenseName() {
			return expenseName;
		}

		public void setExpenseName(String expenseName) {
			this.expenseName = expenseName;
		}

		public double getExpensePrice() {
			return expensePrice;
		}

		public void setExpensePrice(double expensePrice) {
			this.expensePrice = expensePrice;
		}

		public String getExpenseType() {
			return expenseType;
		}

		public void setExpenseType(String expenseType) {
			this.expenseType = expenseType;
		}

		public String getExpenseCode() {
			return expenseCode;
		}

		public void setExpenseCode(String expenseCode) {
			this.expenseCode = expenseCode;
		}
}
