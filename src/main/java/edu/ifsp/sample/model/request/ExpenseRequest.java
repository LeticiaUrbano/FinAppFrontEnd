package edu.ifsp.sample.model.request;

public class ExpenseRequest {
	
	private String expenseName;

    private double expensePrice;
    
    public ExpenseRequest(String expenseName, double expensePrice) {
        this.expenseName = expenseName;
        this.expensePrice = expensePrice;
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
}
