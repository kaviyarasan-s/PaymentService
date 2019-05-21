<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
						/* var y = "${returnUrl}";
						console.log("return url" + y); */
						/* var param = $('#retUrl').val();
						console.log(param); */
						$("#acountnumber")
								.blur(function() {
											$("#accounterr").empty();
											$("#paymentamounterr").empty();
											$.ajax({
														url : 'PaymentServlet',
														type : 'post',
														data : {
															accountnumber : $(
																	"#acountnumber")
																	.val(),
															payment : "getAccountBal"
														},
														success : function(data) {
															if (data == "Invalid Account number") {
																$("#accounterr").html("<p style='color:red;'>"+ data+ "</p>");
															}
															else if(data == null)
															{
															$("#accounterr").html("<p style='color:red;'>Invalid Account number</p>");
															}
															else {
																$('#accountbalance').val(data);
															}
															
															
															var paymentAmount = $("#paymentamount").val();
															var accountBalance = $('#accountbalance').val();
													if (paymentAmount > 0) {
														if (Number(paymentAmount) <= Number(accountBalance)) {
															var remainingBal = accountBalance
																	- paymentAmount;
															$("#remainingamount").val(
																	remainingBal);

														} else {
															$("#paymentamounterr")
																	.html("<p style='color:red;'>Enter less than or equal to your accout balance</p>");
														}
													} else {
														$("#paymentamounterr")
																.html("<p style='color:red;'>Enter amount greater than zero</p>");
													}
														}

													})
								});

										});

						/* $("#paymentamount")
								.blur(
										function() {
											$("#paymentamounterr").empty();
											var paymentAmount = $(
													"#paymentamount").val();
											var accountBalance = $(
													'#accountbalance').val();
											if (paymentAmount > 0) {
												if (Number(paymentAmount) <= Number(accountBalance)) {
													var remainingBal = accountBalance
															- paymentAmount;
													$("#remainingamount").val(
															remainingBal);

												} else {
													$("#paymentamounterr")
															.html(
																	"<p style='color:red;'>Enter less than or equal to your accout balance</p>");
												}
											} else {
												$("#paymentamounterr")
														.html(
																"<p style='color:red;'>Enter amount greater than zero</p>");
											}

										})

					}); */
</script>
</head>
<body>
	<div class="container">
		<br>
		<p class="text-center">
			<a href="PaymentGateway.html"> Payment Gateway</a>
		</p>
		<hr>



		<center>
			<p>PAYMENT DETAILS</p>
		</center>

		<article class="card">
		<div class="card-body p-5">

			<ul class="nav bg-light nav-pills rounded nav-fill mb-3"
				role="tablist">
				<li class="nav-item"><a class="nav-link active show"
					data-toggle="pill" href="#nav-tab-bank"> <i
						class="fa fa-university"></i> Bank Transfer
				</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="pill"
					href="#nav-tab-card"> <i class="fa fa-credit-card"></i> Credit
						Card
				</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="pill"
					href="#nav-tab-paypal"> <i class="fas fa-wallet"></i> Wallet
				</a></li>


			</ul>

			<div class="tab-content">
				<div class="tab-pane fade" id="nav-tab-card">
					<p class="alert alert-success">Some text success or error</p>
					<form role="form">
						<div class="form-group">
							<label for="username">Full name (on the card)</label> <input
								type="text" class="form-control" name="username" placeholder=""
								required="">
						</div>
						<!-- form-group.// -->

						<div class="form-group">
							<label for="cardNumber">Card number</label>
							<div class="input-group">
								<input type="text" class="form-control" name="cardNumber"
									placeholder="">
								<div class="input-group-append">
									<span class="input-group-text text-muted"> <i
										class="fab fa-cc-visa"></i>   <i class="fab fa-cc-amex"></i>  
										<i class="fab fa-cc-mastercard"></i>
									</span>
								</div>
							</div>
						</div>
						<!-- form-group.// -->

						<div class="row">
							<div class="col-sm-8">
								<div class="form-group">
									<label><span class="hidden-xs">Expiration</span> </label>
									<div class="input-group">
										<input type="number" class="form-control" placeholder="MM"
											name=""> <input type="number" class="form-control"
											placeholder="YY" name="">
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label data-toggle="tooltip" title=""
										data-original-title="3 digits code on back side of the card">CVV
										<i class="fa fa-question-circle"></i>
									</label> <input type="number" class="form-control" required="">
								</div>
								<!-- form-group.// -->
							</div>
						</div>
						<!-- row.// -->
						<button class="subscribe btn btn-primary btn-block" type="button"
							name="payment" value="CardPayment">Confirm</button>
					</form>
				</div>
				<!-- tab-pane.// -->
				<div class="tab-pane fade" id="nav-tab-paypal">
					<p>Wallet is easiest way to pay online</p>
					<p>
						<button type="button" class="btn btn-primary">
							<i class="fas fa-wallet"></i> Paytm Wallet
						</button>
						<button type="button" class="btn btn-primary">
							<i class="fas fa-wallet"></i> Phonepe Wallet
						</button>
						<button type="button" class="btn btn-primary">
							<i class="fas fa-wallet"></i> Airtel Money
						</button>
					</p>
					<p>
						<strong>Note:&nbsp;</strong>Never share your wallet password to
						anyone.
					</p>
				</div>
				<div class="tab-pane fade active show" id="nav-tab-bank">
					<center>
						<p style="font-size: 25px; color: blue;">BANK ACCOUNT DETAILS</p>
						<dl class="param">
							<p style="font-size: 25px; color: BLACK;">ATEK BANK</p>
					</center>
					<form action="PaymentServlet" method="post">
						<div class="form-group">
							<label for="username">Enter your Account Number</label> <input
								type="text" class="form-control" name="accountnumber"
								id="acountnumber" placeholder="Enter your account number"
								required pattern="^\d{12}$">
						</div>
						<div class="form-group">
							<div id="accounterr"></div>
						</div>
						<!-- form-group.// -->

						<div class="form-group">
							<label for="username">Account Balance</label> <input type="text"
								class="form-control" name="accountbalance" id="accountbalance"
								placeholder="your account number">
						</div>
						<div class="form-group">
							<label for="username">Payment Amount</label> <input type="text"
								class="form-control" name="amount" id="paymentamount"
								placeholder="Enter Payment Amount" required minimum="1"
								value="${paymentAmount }">
						</div>
						<div class="form-group">
							<div id="paymentamounterr"></div>
						</div>
						<div class="form-group">
							<label for="username">Remaining Account Balance</label> <input
								type="text" class="form-control" name="remainingamount"
								id="remainingamount"
								placeholder="After payment Remaining Amount" required
								minimum="1">
						</div>
						<!-- form-group.// -->
						<input type="hidden" name="retUrl" id="retUrl"
							value="${returnUrl}">

						<button class="subscribe btn btn-primary btn-block" type="submit"
							name="payment" value="bankPayment">Confirm</button>
					</form>
				</div>
				<!-- tab-pane.// -->
				<!-- <div class="tab-pane fade" id="nav-tab-paypal">
<p>Wallet is easiest way to pay online</p>
<p>
<button type="button" class="btn btn-primary"> <i class="fab fa-paypal"></i> Log into my Wallet </button>
</p>
<p><strong>Note:</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. </p>
</div> -->
				<!-- tab-pane.// -->
			</div>
			<!-- tab-content .// -->

		</div>
		<!-- card-body.// --> </article>
		<!-- card.// -->


		</aside>
		<!-- col.// -->
	</div>
	<!-- row.// -->

	</div>
	<!--container end.//-->

	<br>
	<br>
	<article class="bg-secondary mb-3">
	<div class="card-body text-center">


		<p style="font-size: 25px; color: black;">Safe Transaction Using
			256-bit Encryption</p>
		<br>

	</div>
	<br>
	<br>
	</article>
</body>
</html>