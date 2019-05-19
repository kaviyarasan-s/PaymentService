package com.chainsys.paymentserv;

import java.math.BigDecimal;
import java.util.Map;

import com.chainsys.csbank.model.Payee;

public interface IPaymentServ {

	Map<String,String> doPayment(Payee payee);
	String getAccountBalance(Payee payee);
	
}
