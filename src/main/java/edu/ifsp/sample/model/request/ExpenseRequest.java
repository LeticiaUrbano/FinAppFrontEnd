package edu.ifsp.sample.model.request;

public class ExpenseRequest {
	
	private String expenseName;

    private double expensePrice;
    
    private String expenseType;
    
    public ExpenseRequest(String expenseName, double expensePrice, String expenseType) {
        this.expenseName = expenseName;
        this.expensePrice = expensePrice;
        this.expenseType = expenseType;
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
	
	
}
