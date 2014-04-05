<div class="modal fade" id="RegisterModal">
  <div class="modal-dialog">
    <div class="modal-content">
    	<g:form controller="login" action="register" class="form-horizontal container" method="post" name="register_form">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">x</button>
				<h3><g:message code="security.register.title"/></h3>
			</div>
			<div class="modal-body container">
				<div class="form-group">
					<label class="control-label" for="firstname">${message(code: 'security.firstname.label', default: 'Firstname')}</label>
					<input type="text" class="form-control col-md-3" name="firstname" id="firstname" placeholder="${message(code: 'security.firstname.label', default: 'Firstname')}">
				</div>
				<div class="form-group">
					<label class="control-label" for="lastname">${message(code: 'security.lastname.label', default: 'Lastname')}</label>
					<input type="text" class="form-control col-md-3" name="lastname" id="lastname" placeholder="${message(code: 'security.lastname.label', default: 'Lastname')}">
				</div>
				<div class="form-group">
					<label class="control-label" for="email">${message(code: 'security.email.label', default: 'Email')}</label>
					<input type="text" class="form-control col-md-3" name="email" id="email" placeholder="${message(code: 'security.email.label', default: 'Email')}">
				</div>
				<div class="form-group">
					<label class="control-label" for="password">${message(code: 'security.password.label', default: 'Password')}</label>
					<input type="password" class="form-control col-md-3" name="password" id="password" placeholder="${message(code: 'security.password.label', default: 'Password')}">
				</div>
				<div class="form-group">
					<label class="control-label" for="confirmpasswd">${message(code: 'security.password.confirm.label', default: 'Confirm')}</label>
					<input type="password" class="form-control col-md-3" name="confirmpasswd" id="confirmpasswd" placeholder="${message(code: 'security.password.confirm.label', default: 'Confirm')}">
				</div>
				<div class="form-group">
					<label class="checkbox" for="agreement">
						<input type="checkbox" value="" name="agreement" id="agreement" >
						${message(code: 'security.agreement.label', default: 'I have read and agree with the Terms of Use.')}
					</label>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary"><g:message code="security.register.label"/></button>
			</div>
			</g:form>
		</div>
	</div>
</div>
