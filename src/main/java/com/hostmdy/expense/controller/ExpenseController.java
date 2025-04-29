package com.hostmdy.expense.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.expense.model.Expense;
import com.hostmdy.expense.model.ExpenseDAO;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/expense")
public class ExpenseController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/living_expense")
	private DataSource dataSource;

	private ExpenseDAO expenseDAO;
	
	public ExpenseController() {
		super();
	}
	
	@Override
	public void init() throws ServletException {
		
		expenseDAO = new ExpenseDAO(dataSource);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		if(mode == null) {
			mode = "LIST";
		}
		
		switch (mode) {
		case "LIST":
			showList(req, resp);
			break;
		case "FORM":
			showForm(req, resp);
			break;
		case "CREATE":
			createExpense(req, resp);
			break;
		case "DETAILS":
			showDetails(req, resp);
			break;
		case "LOAD":
			loadExpense(req, resp);
			break;
		case "UPDATE":
			updateExpense(req, resp);
			break;
		case "DELETE":
			deleteExpense(req, resp);
			break;
			}
		}
		
	
	private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Expense> expenses = expenseDAO.getAllExpense(1L);
		System.out.println("the size of expense "+expenses.size());
		req.setAttribute("expenses", expenses);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/index.jsp");
		dispatcher.forward(req, resp);
	}
	
	private void showDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long expenseId = Long.parseLong(req.getParameter("expenseId"));
		
		Expense expense = expenseDAO.getExpenseById(expenseId);
		
		if(expense == null) {
			System.out.println("expense with id ="+expenseId+" is not found.");
			return;
		}
		
		req.setAttribute("expense", expense);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/expense/expense-details.jsp");
		dispatcher.forward(req, resp);
	}
	
	private void loadExpense(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long expenseId = Long.parseLong(req.getParameter("expenseId"));
		
		Expense expense = expenseDAO.getExpenseById(expenseId);
		
		if(expense == null) {
			System.out.println("expense with id ="+expenseId+" is not found.");
			return;
		}
		
		req.setAttribute("expense", expense);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/expense/expense-update.jsp");
		dispatcher.forward(req, resp);
	}
	
	private void showForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/expense/expense-form.jsp");
		dispatcher.forward(req, resp);
	}
	
	private void updateExpense(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long expenseId = Long.parseLong(req.getParameter("expenseId"));
		String name  = req.getParameter("name");
		Integer qty  = Integer.parseInt(req.getParameter("qty"));
		Double price =  Double.parseDouble(req.getParameter("price"));
		String description = req.getParameter("description");
		String image = req.getParameter("image");
		
		
		
		Expense expense = new Expense(expenseId,name, qty, price, description, image);
		boolean ok = expenseDAO.updateExpense(expense);
		
			if(ok) {
				resp.sendRedirect("expense?mode=DETAILS&expenseId="+expenseId);
			}else {
				
				resp.sendRedirect("expense?mode=LOAD&expenseId="+expenseId);
			}
				
	}
	
	
	
	private void createExpense(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		Integer qty = Integer.parseInt(req.getParameter("qty"));
		Double price = Double.parseDouble(req.getParameter("price"));
		String description = req.getParameter("description");
		String image = req.getParameter("image");
		
		Expense expense = new Expense(name, qty, price, description, image);
		boolean ok = expenseDAO.createExpense(expense);
		
		if(ok) {
			System.out.println("expense created");
			showList(req, resp);
		}else {
			req.setAttribute("ok", ok);
			showForm(req, resp);
		}
		
		
	}
	
	protected void deleteExpense(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long expenseId = Long.parseLong(req.getParameter("expenseId"));
		boolean ok = expenseDAO.deleteExpense(expenseId);
		if(ok) {
			resp.sendRedirect("expense");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
