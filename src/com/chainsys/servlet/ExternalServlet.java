package com.chainsys.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ExternalServlet
 */
@WebServlet("/ExternalServlet")
public class ExternalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ExternalServlet() {
        super();
    }	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url=request.getParameter("retUrl");
		String paymentAmount=request.getParameter("paymentAmount");
		request.setAttribute("returnUrl", url);
		request.setAttribute("paymentAmount", paymentAmount);
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("PaymentGateway.jsp");
		requestDispatcher.forward(request, response);
	}
	

}
