package com.jp.learnahobby.util;

import org.springframework.stereotype.Component;

@Component
public class PaymentUtility {

	public String doPayment(String paymentGateway, Float amount) {
		
		//go to payment gateway and complete payment. If success return transaction details else return null.
		//Since we are not integrating a payment gateway we are using dummy value.
		
		String transactionDetails = "Transaction Id: 1234567890, XYZ Bank, Amount = " + amount;
		
		return transactionDetails;
	}
}
