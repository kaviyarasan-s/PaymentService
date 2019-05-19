package com.chainsys.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chainsys.csbank.model.Payee;
import com.chainsys.paymentserv.IPaymentServ;
import com.chainsys.paymentserv.impl.PaymentServImpl;

/**
 * Servlet implementation class PaymentServlet
 */
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PaymentServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String paymentMode = request.getParameter("payment");
		if ("bankPayment".equals(paymentMode)) {
			long accountNumber = 0;
			String strAccountNumber = request.getParameter("accountnumber");
			Payee payee = new Payee();
			if (!strAccountNumber.isEmpty() && strAccountNumber != null) {
				accountNumber = Long.parseLong(strAccountNumber);

			}

			BigDecimal amount = new BigDecimal(0);
			String strAmount = request.getParameter("amount");
			if (!strAmount.isEmpty() && strAmount != null) {
				amount = new BigDecimal(strAmount);

			}
			if (accountNumber > 0 && String.valueOf(accountNumber).length() == 12) {
				payee.setAccountnumber(accountNumber);
			}

			if (amount.longValue() > 0) {
				payee.setAmount(amount);
			}
			IPaymentServ paymentServ = new PaymentServImpl();
			Map<String, String> trasactionStatus = paymentServ.doPayment(payee);
			request.setAttribute("transactionStatus", trasactionStatus);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("http://localhost:8081/Admission/ApplyNowServlet?\r\n" + 
					".jsp");
			requestDispatcher.forward(request, response);

		} else if ("CardPayment".equals(paymentMode)) {

			// call cardpayment method

		} else if ("Wallet".equals(paymentMode)) {

			// calll wallet payment method

		} else if ("getAccountBal".equals(paymentMode)) {

			long accountNumber = 0;
			String strAccountNumber = request.getParameter("accountnumber");
			Payee payee = new Payee();
			if (!strAccountNumber.isEmpty() && strAccountNumber != null) {
				accountNumber = Long.parseLong(strAccountNumber);

			}
			if (accountNumber > 0 && String.valueOf(accountNumber).length() == 12) {
				payee.setAccountnumber(accountNumber);
			}
			
			IPaymentServ paymentServ = new PaymentServImpl();
			String accountBalance= "";
			try
			{
				accountBalance=paymentServ.getAccountBalance(payee);
			
			}
			catch(Exception e)
			{
				accountBalance=e.getMessage();
			}
			
			response.getWriter().write(String.valueOf(accountBalance));
		}
	}

}
