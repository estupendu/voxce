<%@page import="com.TrialManager.model.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib uri="/Voxce/WebContent/WEB-INF/tld/functions.tld" prefix="tl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VOXCE :: New Era in Clinical Trial Optimization</title>

<script type="text/javascript" src="JQuery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="JQuery/ddaccordion.js"></script>
<script type="text/javascript" src="js/payment.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="JQuery/cal/date/jquery.datepick.js"></script>
<script type="text/javascript">
	$(function() {
		$("#patient_payment_chequedate").datepick({dateFormat: 'yyyy-mm-dd'});
		$("#chequedate").datepick({dateFormat: 'yyyy-mm-dd'});
		$("#study_chequedate").datepick({dateFormat: 'yyyy-mm-dd'});
		
		
	});
	</script>
<script type="text/javascript">
ddaccordion.init({
 headerclass: "expandable", //Shared CSS class name of headers group that are expandable
 contentclass: "categoryitems", //Shared CSS class name of contents group
 revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
 mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
 collapseprev: true, //Collapse previous content (so only one open at any time)? true/false 
 defaultexpanded: [7], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
 onemustopen: false, //Specify whether at least one header should be open always (so never all headers closed)
 animatedefault: false, //Should contents open by default be animated into view?
 persiststate: true, //persist state of opened contents within browser session?
 toggleclass: ["", "openheader"], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
 togglehtml: ["prefix", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
 animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
 oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
  //do nothing
 },
 onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
  //do nothing
 }
});

</script>
<link href="css/accordion.css" rel="stylesheet" type="text/css" />
<link href="css/crumbs.css" rel="stylesheet" type="text/css" />

<link type="text/css" rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/ui-lightness/jquery-ui.css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/creategroup.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<link href="css/view_list.css" rel="stylesheet" type="text/css" />
<link href="css/payment.css" rel="stylesheet" type="text/css" />

<style type="text/css">
@import "JQuery/cal/date/jquery.datepick.css";
</style>


</head>

<body>
	<%
		Users obj = (Users) session.getAttribute("CurrentUser");
	%>
	<input type="hidden" name="InterfaceState" id="InterfaceState"
		value="${CurrentForm}" />
	<input type="hidden" name="PaymentScheduleMessage"
		id="PaymentScheduleMessage" value="${Message}" />
	<input type="hidden" name="PaymentCodeMessage" id="PaymentCodeMessage"
		value="${related_to}" />
	<input type="hidden" name="secondform" id="secondform"
		value="${showform}" />



	<!-- wrapper starts here -->
	<div class="wrapper">

		<%@include file="../header.jsp"%>
		<!-- menu ends here -->

		<!-- content starts here -->
		<div class="body_content">
			<!-- left navigation starts here -->
			<div class="left_nav" id="MainDiv">
				<div class="left_nav_header">NAVIGATION</div>
				<div class="nav_body">

					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">Payments</h3>
						<ul class="categoryitems">
							<c:if test="${tl:rightsofView(resourceList,'View Payments')==1}">
								<li><a
									href="<c:url value='ShowPayments.pay?studyid=${currentstudy.study_id}' />"
									name="href_view_payment_div" id="href_view_payment_div"
									onclick="">&bull; View Patient Payments</a></li>
							</c:if>
							<li><a
								href="<c:url value='ShowSitePayments.pay?studyid=${currentstudy.study_id}' />"
								name="href_view_payment_div" id="href_view_payment_div"
								onclick="Loadpage('View_Payment_Div')">&bull; View
									Study/Site Payments</a></li>
							<c:if
								test="${tl:rightsofView(resourceList,'Create Study Payment')==1}">
								<li><a href="#" name="href_create_study_payment_div"
									id="href_create_study_payment_div"
									onclick="Loadpage('Study_Payment_Div')">&bull; Create Study
										Payments</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Create Site Payment')==1}">
								<li><a href="#" name="href_create_site_payment_div"
									id="href_create_site_payment_diview_drugs"
									onclick="Loadpage('Site_Payment_Div')">&bull; Create Site
										Payments</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Create Visit CRF Payment')==1}">
								<li><a href="#" name="href_create_visit_payment_div"
									id="href_create_visit_payment_div"
									onclick="Loadpage('Visit_Payment_Div')">&bull; Create
										Visit/CRF Payments</a></li>
							</c:if>
						</ul>
					</div>

					<div class="arrowlistmenu">

						<h3 class="menuheader expandable">Payment Code</h3>
						<ul class="categoryitems">
							<c:if
								test="${tl:rightsofView(resourceList,'View Payment Code')==1}">
								<li><a
									href="<c:url value='ShowPaymentCode.pay?studyid=${currentstudy.study_id}&payment_code_form=1' />"
									name="href_create_payment_code_div" onclick="">&bull; View
										Payment Code</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Create Payment Code')==1}">
								<li><a
									href="<c:url value='ShowPaymentCode.pay?studyid=${currentstudy.study_id}&payment_code_form=2' />"
									name="href_create_payment_code_div" onclick="">&bull;
										Create New Payment Code</a></li>
							</c:if>
						</ul>
					</div>

					<div class="arrowlistmenu">
						<h3 class="menuheader expandable">Payment Schedule</h3>
						<ul class="categoryitems">
							<c:if
								test="${tl:rightsofView(resourceList,'View Payment Schedule')==1}">
								<li><a
									href="<c:url value='ShowPaymentSchedule.pay?studyid=${currentstudy.study_id}&pay_sched_form=1' />"
									name="href_view_payment_schedule_div" onclick="">&bull;
										View Payments Schedule</a></li>
							</c:if>
							<c:if
								test="${tl:rightsofView(resourceList,'Create Payment Schedule')==1}">
								<li><a
									href="<c:url value='ShowPaymentSchedule.pay?studyid=${currentstudy.study_id}&pay_sched_form=2' />"
									name="href_create_payment_schedule_div" onclick="">&bull;
										Create Payment Schedule</a></li>
							</c:if>
						</ul>
					</div>


					<!-- ==================================================================================================================== -->

				</div>

				<div class="nav_bottom"></div>
				<div class="nav_shade"></div>
			</div>
			<!-- left navigation ends here -->

			<!-- right body content starts here -->
			<div class="right_body_content" id="mainFormsDiv">


				<!--  												Start Payments View-->
				<!--  												Start Payments View-->


				<div class="body_inner" id="View_Payment_Div" style="display: none;">
					<div class="body_inner_header"
						id="Home_Study_createstudy_div_Title">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ViewStudy.study?studyid=${currentstudy.study_id}' />">${currentstudy.study_name}</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowPayments.pay?studyid=${currentstudy.study_id}' />">Payments</a>
							</div>
							<div class="crumbs-link">
								<a href="#">Payments List</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<!-- 
 -->
				</div>

				<!--  												End Payments View -->
				<!--  												End Payments View-->

				<!--  												Start site payment -->
				<!--  												Start site payment-->

				<div class="body_inner" id="Site_Payment_Div" style="display: none;">
					<div class="body_inner_header"
						id="Home_Study_createstudy_div_Title">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ViewStudy.study?studyid=${currentstudy.study_id}' />">${currentstudy.study_name}</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowPayments.pay?studyid=${currentstudy.study_id}' />">Payments</a>
							</div>
							<div class="crumbs-link">
								<a href="#" id="site_payment_title">Create Site Payments</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->

					</div>

					<div class="create_group_container">
						<div id="" class="myform payment">
							<form id="create_site_payment_form"
								name="create_site_payment_form" method="post"
								action="sitePayment.pay" class="payment">

								<input name="site_payment_date_created"
									id="site_payment_date_created" type="text" value="0"
									class="input_txt" style="display: none" /> <input
									name="site_payment_createdby" id="site_payment_createdby"
									type="text" value="0" class="input_txt" style="display: none" />
								<input name="SitePaymentAddEdit" id="SitePaymentAddEdit"
									type="text" value="0" class="input_txt" style="display: none" />
								<input type="hidden" name="selected_site" id="selected_site" />
								<span id="Site_Payment_Main_Error" class="error_label_grp"
									style="display: none;">${EMessage}</span> <span
									id="Site_Payment_Main_Success" class="chk_avail_yes"
									style="display: none;">${SMessage}</span> <label>Site :</label>
								<select name="site" id="site" class="drop_txt">
									<c:forEach items="${siteslist}" var="siteslt"
										varStatus="status">
										<option id="${siteslt.site_id}" value="${siteslt.site_id}">${siteslt.site_name}
										</option>
									</c:forEach>
								</select> <span id="Site_selection_Error" class="error_label_grp"></span>

								<label>Payment Type :</label> <select name="Site_Payment_Type"
									id="Site_Payment_Type" class="drop_txt">
									<c:forEach items="${codelist}" var="codes" varStatus="status">
										<c:if test="${codes.related_to == 'Site'}">
											<option id="${codes.payment_code_id}"
												value="${codes.payment_code_id}">${codes.name}</option>
										</c:if>
									</c:forEach>
								</select> <span id="Site_Payment_Type_Error" class="error_label_grp"></span>

								<label>Payment Amount :</label> <input id="payment_amount_site"
									name="payment_amount_site" type="text" style="width: 100px;"
									value="${editsitePayment.pay_amount}" class="input_txt"
									maxlength="11" /><span class="error_label"
									id="Payment_Amount_Site_Error"></span> <label>Over Head
									%:</label> <input id="siteoverhead" name="siteoverhead" type="text"
									style="width: 100px;" value="${editsitePayment.overhead}"
									class="input_txt" maxlength="3" /> <span class="error_label"
									id="Overhead_Error_Site"></span> <label>Total Payment :</label>
								<input id="total_pay_site" name="total_pay_site" type="text"
									style="width: 100px;" value="${editsitePayment.total_payment}"
									class="input_txt" readonly="readonly" /> <label>Pay To
									:</label> <select name="Payment_To_User" id="Payment_To_User"
									class="drop_txt">
									<option id="111" value="" onclick=""></option>
									<c:forEach items="${userslist}" var="users" varStatus="status">
										<option id="${users.user_id}" value="${users.user_id}">${users.first_name}
											${users.middle_name} ${users.last_name}</option>
									</c:forEach>
								</select><span id="Payment_To_Error" class="error_label_grp"></span> <label>Pay
									to User Name: </label> <input id="Payment_To_User_name"
									name="Payment_To_User_name" type="text"
									value="${editsitePayment.pay_to_user_name}" class="input_txt2"
									maxlength="20"
									onfocus="if(this.value == 'User Name')this.value = '';" /><span
									id="Payment_To_name_Error" class="error_label_grp"></span> <label>Pay
									to User Address: </label> <input id="Payment_To_User_address"
									name="Payment_To_User_address" type="text"
									value="${editsitePayment.pay_to_user_address}"
									class="input_txt2" maxlength="250"
									onfocus="if(this.value == 'User Address')this.value = '';" /><span
									id="Payment_To_address_Error" class="error_label_grp"></span> <label>Cheque
									Number :</label> <input id="cheque_no" name="cheque_no" type="text"
									value="${editsitePayment.cheque_no}" class="input_txt"
									maxlength="11" style="width: 100px;" /> <span
									id="Chequeno_error" class="error_label"></span> <label>PO
									Number :</label> <input id="po_no" name="po_no" type="text"
									value="${editsitePayment.po_no}" class="input_txt"
									maxlength="11" style="width: 100px;" /> <span
									class="error_label" id="PoNo_error"></span> <label>Invoice
									Number :</label> <input id="invoice_no" name="invoice_no" type="text"
									value="${editsitePayment.invoice_no}" class="input_txt"
									maxlength="11" style="width: 100px;" /> <span
									class="error_label" id="InvoiceNo_error"></span> <label>Cheque
									Date :</label> <input type="text" readonly="readonly" name="chequedate"
									id="chequedate" value="${editsitePayment.cheque_date}"
									class="input_txt" style="width: 100px;" /><img
									src="images/calender.png" alt="" border="0"
									style="float: left; margin: 0;" /> <span id="Chequedate_Error"
									class="error_label"></span>

								<div
									style="clear: both; margin-bottom: 8px; padding-bottom: 5px;">
									<label>Payment Status :</label><br /> <input
										name="payment_status" id="payment_status_site1" type="radio"
										value="Sent" checked="checked" /> <span class="txt_norm">Sent</span>
									<input name="payment_status" id="payment_status_site2"
										type="radio" value="Paid" /> <span class="txt_norm">Paid</span>
								</div>



								<div class="spacer"></div>
								<div style="clear: both; margin-top: 10px; padding-left: 170px;">
									<button id="submit1" class="blue-pill" type="submit">Apply</button>
									<button onclick="Loadpage('View_Payment_Div')"
										class="grey-pill" type="reset">Cancel</button>
								</div>
							</form>
						</div>
					</div>

				</div>

				<!--  												End site payment -->
				<!--  												End site payment-->

				<!--  												Start study payment -->
				<!--  												Start study payment-->

				<div class="body_inner" id="Study_Payment_Div"
					style="display: none;">
					<div class="body_inner_header"
						id="Home_Study_createstudy_div_Title">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ViewStudy.study?studyid=${currentstudy.study_id}' />">${currentstudy.study_name}</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowPayments.pay?studyid=${currentstudy.study_id}' />">Payments</a>
							</div>
							<div class="crumbs-link">
								<a href="#" id="study_payment_title">Create Study Payments</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform payment">
							<form id="create_study_payment_form" name="form" method="post"
								action="studyPayment.pay" class="payment">

								<input name="edit_id_study_payment" id="edit_id_study_payment"
									type="text" value="0" class="input_txt" style="display: none" />
								<input name="study_payment_date_created"
									id="study_payment_date_created" type="text" value="0"
									class="input_txt" style="display: none" /> <input
									name="study_payment_createdby" id="study_payment_createdby"
									type="text" value="0" class="input_txt" style="display: none" />
								<input name="payment_level" id="payment_level" type="text"
									value="0" class="input_txt" style="display: none" /> <span
									id="Study_Payment_Main_Error" class="error_label_grp"
									style="display: none;">${EMessage}</span> <span
									id="Study_Payment_Main_Success" class="chk_avail_yes"
									style="display: none;">${SMessage}</span>
								<c:set var="payamount" value="0" scope="page" />
								<label>Payment Type :</label> <select name="Study_Payment_Type"
									id="Study_Payment_Type" class="drop_txt">
									<c:forEach items="${codelist}" var="codes" varStatus="status">
										<c:if test="${codes.related_to == 'Study'}">
											<option id="${codes.payment_code_id}"
												value="${codes.payment_code_id}">${codes.name}</option>
										</c:if>
									</c:forEach>
								</select> <span id="Study_payment_Type_error" class="error_label_grp"></span>

								<label>Payment Amount :</label> <input id="payment_amount_study"
									name="payment_amount_study" type="text" style="width: 100px;"
									value="" class="input_txt" maxlength="11" /><span
									class="error_label" id="payment_amount_study_Error"></span> <label>Over
									Head %:</label> <input id="study_overhead" name="study_overhead"
									type="text" style="width: 100px;" value="" class="input_txt"
									maxlength="3" /> <span class="error_label"
									id="Study_Overhead_Error"></span> <label>Total Payment
									:</label> <input id="total_pay_study" name="total_pay_study"
									type="text" style="width: 100px;" value="" class="input_txt"
									readonly="readonly" /> <label>Pay To :</label> <select
									name="Payment_To_User" id="Study_Payment_To_User"
									class="drop_txt">
									<option id="111" value="" onclick=""></option>
									<c:forEach items="${userslist}" var="users" varStatus="status">
										<option id="${users.user_id}" value="${users.user_id}"
											onclick="">${users.first_name} ${users.middle_name}
											${users.last_name}</option>
									</c:forEach>
								</select> <span id="Study_Payment_To_Error" class="error_label_grp"></span>
								<label>Pay to User Name: </label> <input
									id="Study_Payment_To_User_name"
									name="Study_Payment_To_User_name" type="text" value="User Name"
									class="input_txt2" maxlength="20"
									onfocus="if(this.value == 'User Name')this.value = '';" /> <span
									id="Study_Payment_To_name_Error" class="error_label_grp"></span>
								<label>Pay to User Address: </label> <input
									id="Study_Payment_To_User_address"
									name="Study_Payment_To_User_address" type="text"
									value="User Address" class="input_txt2" maxlength="250"
									onfocus="if(this.value == 'User Address')this.value = '';" />
								<span id="Study_Payment_To_address_Error"
									class="error_label_grp"></span> <label>Cheque Number :</label>
								<input id="study_cheque_no" name="cheque_no" type="text"
									value="" class="input_txt" maxlength="11" style="width: 100px;" />
								<span id="study_cheque_no_Error" class="error_label"></span> <label>PO
									Number :</label> <input id="study_po_no" name="po_no" type="text"
									value="" class="input_txt" maxlength="11" style="width: 100px;" />
								<span class="error_label" id="study_po_no_Error"></span> <label>Invoice
									Number :</label> <input id="study_invoice_no" name="invoice_no"
									type="text" value="" class="input_txt" maxlength="11"
									style="width: 100px;" /> <span class="error_label"
									id="study_invoice_no_Error"></span> <label>Cheque Date
									:</label> <input type="text" readonly="readonly"
									name="study_chequedate" id="study_chequedate" value=""
									class="input_txt" style="width: 100px;" /><img
									src="images/calender.png" alt="" border="0"
									style="float: left; margin: 0;" /> <span
									id="study_chequedate_Error" class="error_label"></span>

								<div
									style="clear: both; margin-bottom: 8px; padding-bottom: 5px;">
									<label>Payment Status :</label><br /> <input
										name="payment_status" id="payment_status_study1" type="radio"
										value="Sent" checked="checked" /> <span class="txt_norm">Sent</span>
									<input name="payment_status" id="payment_status_study2"
										type="radio" value="Paid" /> <span class="txt_norm">Paid</span>
								</div>


								<div class="spacer"></div>
								<div style="clear: both; margin-top: 10px; padding-left: 170px;">
									<button id="submit11" class="blue-pill" type="submit">Apply</button>
									<button onclick="Loadpage('View_Payment_Div')"
										class="grey-pill" type="reset">Cancel</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!--  												End study payment -->
				<!--  												End study payment-->

				<!--  												Start crf payment -->
				<!--  												Start crf payment-->

				<div class="body_inner" id="Visit_Payment_Div"
					style="display: none;">

					<div class="body_inner_header"
						id="Home_Study_createstudy_div_Title">
						<!-- ************************Navigation***************************************** -->
						<div class="crumb_left"></div>
						<div class="crumb_mid">
							<div class="crumbs-user">
								<a href="<c:url value='ShowHomeIndex.home' />">Home</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ViewStudy.study?studyid=${currentstudy.study_id}' />">${currentstudy.study_name}</a>
							</div>
							<div class="crumbs-link">
								<a
									href="<c:url value='ShowPayments.pay?studyid=${currentstudy.study_id}' />">Payments</a>
							</div>
							<div class="crumbs-link">
								<a href="#" id="patient_payment_title">Create Visit/CRF
									Payments</a>
							</div>
						</div>
						<div class="crumb_right"></div>
						<!-- ************************Navigation******************************* -->
					</div>
					<div class="create_group_container">
						<div id="" class="myform payment">

							<form id="create_patient_payment_form"
								name="create_patient_payment_form" method="post"
								action="patientPayment.pay" class="payment">

								<input name="patient_payment_date_created"
									id="patient_payment_date_created" type="text" value="0"
									class="input_txt" style="display: none" /> <input
									name="patient_payment_createdby" id="patient_payment_createdby"
									type="text" value="0" class="input_txt" style="display: none" />
								<input name="PatientPaymentAddEdit" id="PatientPaymentAddEdit"
									type="text" value="0" class="input_txt" style="display: none" />

								<span id="Patient_Payment_Main_Error" class="error_label_grp"
									style="display: none;">${EMessage}</span> <span
									id="Patient_Payment_Main_Success" class="chk_avail_yes"
									style="display: none;">${SMessage}</span> <label>Site :</label>
								<select name="patient_site" id="patient_site" class="drop_txt">
									<c:forEach items="${siteslist}" var="siteslt"
										varStatus="status">
										<option id="${siteslt.site_id}" value="${siteslt.site_id}">${siteslt.site_name}
										</option>
									</c:forEach>
								</select> <span id="Patient_site_error" class="error_label_grp"></span> <label>Patient
									Number :</label> <select name="patient_payment_num"
									id="patient_payment_num" class="drop_txt">
									<c:forEach items="${patientsList}" var="pat" varStatus="status">
										<option id="${pat.patient_id}" value="${pat.patient_id}"
											onclick="">${pat.patient_number}</option>
									</c:forEach>
								</select> <span id="patient_num_Error" class="error_label_grp"></span> <label>Visit
									:</label> <select name="patient_visit" id="patient_visit"
									class="drop_txt">
									<c:forEach items="${VisitsWithNames}" var="visitslist"
										varStatus="status">
										<option id="${visitslist.visitid}"
											value="${visitslist.visitid}" onclick="">${visitslist.visitname}</option>
									</c:forEach>
								</select> <span id="patient_visit_Error" class="error_label_grp"></span>



								<label>CRF :</label> <select name="patient_payment_crf"
									id="patient_payment_crf" class="drop_txt">
									<c:forEach items="${CaseReportFormsli}" var="patcrf"
										varStatus="status">
										<option id="${patcrf.crf_id}" value="${patcrf.crf_id}">${patcrf.crf_name}</option>
									</c:forEach>
								</select> <span id="patient_payment_crf_Error" class="error_label_grp"></span>

								<label>Payment Type :</label> <select
									name="Patient_Payment_Type" id="Patient_Payment_Type"
									class="drop_txt">
									<c:forEach items="${codelist}" var="codes" varStatus="status">
										<c:if test="${codes.related_to == 'Site'}">
											<option id="${codes.payment_code_id}"
												value="${codes.payment_code_id}">${codes.name}</option>
										</c:if>
									</c:forEach>
								</select> <span id="Patient_Payment_Type_error" class="error_label_grp"></span>

								<label>Payment Amount :</label> <input
									id="payment_amount_patient" name="payment_amount_patient"
									type="text" style="width: 100px;"
									value="${editpayment.payment_amount}" class="input_txt"
									maxlength="11" /><span class="error_label"
									id="patient_amount_error"></span> <label>Over Head %:</label> <input
									id="patient_payment_overhead" name="patient_payment_overhead"
									type="text" style="width: 100px;"
									value="${editpayment.over_head}" class="input_txt"
									maxlength="3" /> <span class="error_label"
									id="patient_overhead_error"></span> <label>Total
									Payment :</label> <input id="total_pay_crf" name="total_pay_crf"
									type="text" style="width: 100px;"
									value="${editpayment.total_payment}" class="input_txt"
									readonly="readonly" /> <label>Pay To :</label> <select
									name="Patient_Payment_To_User" id="Patient_Payment_To_User"
									class="drop_txt">
									<option id="111" value="" onclick=""></option>
									<c:forEach items="${userslist}" var="users" varStatus="status">
										<option id="${users.user_id}" value="${users.user_id}"
											onclick="">${users.first_name} ${users.middle_name}
											${users.last_name}</option>
									</c:forEach>
								</select><span id="Patient_Payment_To_Error" class="error_label_grp"></span>

								<label>Pay to User Name: </label> <input
									id="Patient_Payment_To_User_name"
									name="Patient_Payment_To_User_name" type="text"
									value="${editpayment.pay_to_user_name}" class="input_txt"
									maxlength="20"
									onfocus="if(this.value == 'User Name')this.value = '';" /><span
									id="Patient_Payment_To_name_Error" class="error_label_grp"></span>

								<label>Pay to User Address: </label> <input
									id="Patient_Payment_To_User_address"
									name="Patient_Payment_To_User_address" type="text"
									value="${editpayment.pay_to_user_address}" class="input_txt"
									maxlength="250"
									onfocus="if(this.value == 'User Address')this.value = '';" /><span
									id="Patient_Payment_To_address_Error" class="error_label_grp"></span>

								<label>Cheque Number :</label> <input
									id="patient_payment_cheque_no" name="patient_payment_cheque_no"
									type="text" value="${editpayment.cheque_no}" class="input_txt"
									maxlength="11" style="width: 100px;" /> <span
									id="patient_cheque_no_Error" class="error_label"></span> <label>PO
									Number :</label> <input id="patient_payment_po_no"
									name="patient_payment_po_no" type="text"
									value="${editpayment.po}" class="input_txt" maxlength="11"
									style="width: 100px;" /> <span class="error_label"
									id="patient_po_no_Error"></span> <label>Invoice Number
									:</label> <input id="patient_payment_invoice_no"
									name="patient_payment_invoice_no" type="text"
									value="${editpayment.invoice}" class="input_txt" maxlength="11"
									style="width: 100px;" /> <span class="error_label"
									id="patient_invoice_no_Error"></span> <label>Cheque
									Date :</label> <input type="text" readonly="readonly"
									name="patient_payment_chequedate"
									id="patient_payment_chequedate"
									value="${editpayment.cheque_date}" class="input_txt"
									style="width: 100px;" /><img src="images/calender.png" alt=""
									border="0" style="float: left; margin: 0;" /> <span
									id="patient_chequedate_error" class="error_label"></span>

								<div
									style="clear: both; margin-bottom: 8px; padding-bottom: 5px;">
									<label>Payment Status :</label><br /> <input
										name="patient_payment_status" id="ppayment_status1"
										type="radio" value="Sent" checked="checked" /> <span
										class="txt_norm">Sent</span> <input
										name="patient_payment_status" id="ppayment_status2"
										type="radio" value="Paid" /> <span class="txt_norm">Paid</span>
								</div>


								<div class="spacer"></div>
								<div style="clear: both; margin-top: 10px; padding-left: 170px;">
									<button id="submit111" class="blue-pill" type="submit">Apply</button>
									<button onclick="Loadpage('View_Payment_Div')"
										class="grey-pill" type="reset">Cancel</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!--  												End crf payment -->
				<!--  												End crf payment-->
				<!-- right body content ends here -->

			</div>
			<!-- content ends here -->

			<!-- footer starts here -->
			<%@include file="../footer.jsp"%>
			<!-- footer ends here -->

		</div>
	</div>
	<form id="patientpaymenthiddenform" name="patientpaymenthiddenform"
		action="HiddenActions.pay">
		<input type="hidden" id="typeofaction" name="typeofaction"
			value="${TypeOfAction}"></input> <input type="hidden"
			id="ppHiddenValue1" name="ppHiddenValue1"
			value="${currentpatientpayment.site_id}"></input> <input
			type="hidden" id="ppHiddenValue2" name="ppHiddenValue2" value=""></input>
		<input type="hidden" id="ppHiddenValue3" name="ppHiddenValue3"
			value="${currentpatientpayment.visit_id}"></input> <input
			type="hidden" id="ppHiddenValue4" name="ppHiddenValue4"
			value="${currentpatientpayment.crf_id}"></input> <input type="hidden"
			id="ppHiddenValue5" name="ppHiddenValue5"
			value="${currentpatientpayment.payment_code_id}"></input> <input
			type="hidden" id="ppHiddenValue6" name="ppHiddenValue6"
			value="${currentpatientpayment.payment_amount}"></input> <input
			type="hidden" id="ppHiddenValue7" name="ppHiddenValue7"
			value="${currentpatientpayment.over_head}"></input> <input
			type="hidden" id="ppHiddenValue8" name="ppHiddenValue8"
			value="${currentpatientpayment.total_payment}"></input> <input
			type="hidden" id="ppHiddenValue9" name="ppHiddenValue9"
			value="${currentpatientpayment.pay_to}"></input> <input type="hidden"
			id="ppHiddenValue10" name="ppHiddenValue10"
			value="${currentpatientpayment.pay_to_user_name}"></input> <input
			type="hidden" id="ppHiddenValue11" name="ppHiddenValue11"
			value="${currentpatientpayment.pay_to_user_address}"></input> <input
			type="hidden" id="ppHiddenValue12" name="ppHiddenValue12"
			value="${currentpatientpayment.cheque_no}"></input> <input
			type="hidden" id="ppHiddenValue13" name="ppHiddenValue13"
			value="${currentpatientpayment.po}"></input> <input type="hidden"
			id="ppHiddenValue14" name="ppHiddenValue14"
			value="${currentpatientpayment.invoice}"></input> <input
			type="hidden" id="ppHiddenValue15" name="ppHiddenValue15"
			value="${currentpatientpayment.cheque_date}"></input>
	</form>
	<!-- wrapper ends here -->
</body>
</html>