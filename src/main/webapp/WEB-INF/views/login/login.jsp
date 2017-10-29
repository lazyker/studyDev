<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="login-container">
	
		<div class="row">
	
			<div class="col-sm-6">
	
				<script type="text/javascript">
					jQuery(document).ready(function($)
					{
						// Reveal Login form
						setTimeout(function(){ $(".fade-in-effect").addClass('in'); }, 1);
						
						var loginId = $.cookie('loginId');
					    if (loginId != undefined) {
					        $('#conId').val(loginId);
					        $('#rememberid').prop('checked', true);
					    }
	
						// Validation and Ajax action
						$("form#login").validate({
							rules: {
								conId: {
									required: true
								},
	
								password: {
									required: true
								}
							},
	
							messages: {
								conId: {
									required: 'ID를 입력하세요.'
								},
	
								password: {
									required: '패스워드를 입력하세요.'
								}
							},
	
							// Form Processing via AJAX
							submitHandler: function(form)
							{
								show_loading_bar(70); // Fill progress bar to 70% (just a given value)
	
								var opts = {
									"closeButton": true,
									"debug": false,
									"positionClass": "toast-top-full-width",
									"onclick": null,
									"showDuration": "300",
									"hideDuration": "1000",
									"timeOut": "5000",
									"extendedTimeOut": "1000",
									"showEasing": "swing",
									"hideEasing": "linear",
									"showMethod": "fadeIn",
									"hideMethod": "fadeOut"
								};
	
								$.ajax({
									url: "loginCheck",
									method: 'POST',
									dataType: 'json',
									data: {
										do_login: true,
										conId: $(form).find('#conId').val(),
										password: $(form).find('#password').val(),
									},
									success: function(result)
									{
										show_loading_bar({
											delay: .5,
											pct: 100,
											finish: function(){
	
												// Redirect after successful login page (when progress bar reaches 100%)
												if(result) {
												    if($("#rememberid").prop('checked')) {
										                $.cookie('loginId', $("#conId").val());
										            } else {
										                $.removeCookie("loginId");
										            }
										            
										            window.location.href = '${pageContext.request.contextPath}/support/progress';
												}
												else {
												    toastr.options.positionClass = 'toast-bottom-full-width';
										            toastr.warning('아이디 또는 패스워드가 일치하지 않습니다.');
												}
											}
										});
	
										
										// Remove any alert
										$(".errors-container .alert").slideUp('fast');
	
	
										// Show errors
										if(resp.accessGranted == false)
										{
											$(".errors-container").html('<div class="alert alert-danger">\
												<button type="button" class="close" data-dismiss="alert">\
													<span aria-hidden="true">&times;</span>\
													<span class="sr-only">Close</span>\
												</button>\
												' + resp.errors + '\
											</div>');
	
	
											$(".errors-container .alert").hide().slideDown();
											$(form).find('#password').select();
										}
																		}
								});
	
							}
						});
	
						// Set Form focus
						$("form#login .form-group:has(.form-control):first .form-control").focus();
					});
				</script>
	
				<!-- Errors container -->
				<div class="errors-container">
	
					
				</div>
	
				<!-- Add class "fade-in-effect" for login form effect -->
				<form method="post" role="form" id="login" class="login-form fade-in-effect">
	
					<div class="login-header">
						<a href="dashboard-1.html" class="logo">
							<img src="${pageContext.request.contextPath}/resources/images/tonysearch.png" />
						</a>
	
						<p>Dear user, log in to access the admin area!</p>
					</div>
	
	
					<div class="form-group">
						<label class="control-label" for="conId">id</label>
						<input type="text" class="form-control" name="conId" id="conId" autocomplete="off" />
					</div>
	
					<div class="form-group">
						<label class="control-label" for="password">Password</label>
						<input type="password" class="form-control" name="password" id="password" autocomplete="off" />
					</div>
	
					<div class="form-group">
						<button type="submit" class="btn btn-primary  btn-block text-left">
							<i class="fa-lock"></i>
							Log In
						</button>
					</div>
	
					<div class="checkbox">
						<input id="rememberid" name="" type="checkbox" style="margin-left:0px;">
        				<label for="rememberid">Remember id</label>
					</div>
	
				</form>
			</div>
	
		</div>
	
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/TweenMax.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/resizeable.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/joinable.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/xenon-api.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/xenon-toggles.js" type="text/javascript"></script>  
    <script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.validate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/vendor/toastr.min.js" type="text/javascript"></script>  
    <script src="${pageContext.request.contextPath}/resources/js/vendor/jquery.cookie.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/xenon-custom.js" type="text/javascript"></script>