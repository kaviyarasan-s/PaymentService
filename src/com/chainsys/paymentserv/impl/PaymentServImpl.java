package com.chainsys.paymentserv.impl;

import java.math.BigDecimal;
import java.util.Map;

import com.chainsys.csbank.model.Payee;
import com.chainsys.extension.PaymentGatewayImpl;
import com.chainsys.paymentserv.IPaymentServ;

public class PaymentServImpl implements IPaymentServ {

	public Map<String, String> doPayment(Payee payee) {

		PaymentGatewayImpl paymentGatewayImpl = new PaymentGatewayImpl();
		payee.setPayee_accountnumber(620410100000L);
		payee.setPayee_name("Aathi");
		payee.setPayee_ifsc("ATEK000138");
		Map<String, String> transactionStatus = paymentGatewayImpl.executePayment(payee);
		return transactionStatus;
	}

	public Map<String, String> doCardPayment(Payee payee) {

		PaymentGatewayImpl paymentGatewayImpl = new PaymentGatewayImpl();
		Map<String, String> transactionStatus = paymentGatewayImpl.executeCardPayment(payee);
		return transactionStatus;
	}
	
	public Map<String, String> doWalletPayment(Payee payee) {

		PaymentGatewayImpl paymentGatewayImpl = new PaymentGatewayImpl();
		Map<String, String> transactionStatus = paymentGatewayImpl.executeWalletPayment(payee);
		return transactionStatus;
	}

	@Override
	public String getAccountBalance(Payee payee) {
		PaymentGatewayImpl paymentGatewayImpl = new PaymentGatewayImpl();
		String accountBalance;
		try {
			accountBalance = String.valueOf(paymentGatewayImpl.getAccountBalance(payee));
		} catch (Exception e) {
			accountBalance=e.getMessage();
		}
		return accountBalance;
	}
	
}
