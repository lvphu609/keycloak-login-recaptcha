<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
	<#if section = "header">
		${msg("emailForgotTitle")}
	<#elseif section = "form">
		<form id="kc-reset-password-form" style="padding-top: 20px" class="reset-password-block ${properties.kcFormClass!}" action="${url.loginAction}" method="post">
			<div class="custom-reset-password-row">
				<div class="custom-reset-password-label">
					<label for="username ${properties.kcLabelWrapperClass!}" class="custom-el-desktop ${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("username")}<#else>${msg("username")}</#if></label>
				</div>
				<div class="custom-reset-password-content">
					<div class="${properties.kcInputWrapperClass!} p-0">
						<#if auth?has_content && auth.showUsername()>
							<input type="text" id="username" name="username" placeholder="${msg("username")}" class="${properties.kcInputClass!}" autofocus value="${auth.attemptedUsername}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
						<#else>
							<input type="text" id="username" name="username" placeholder="${msg("username")}" class="${properties.kcInputClass!}" autofocus aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
						</#if>

						<#if messagesPerField.existsError('username')>
							<span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
						</#if>
					</div>
				</div>
			</div>
			<div class="custom-reset-password-info">
				Quên mật khẩu? Chỉ cần nhập vào tên đăng nhập và chúng tôi sẽ giúp bạn cập nhật lại.
			</div>
			<div class="custom-reset-password-row">
				<div class="custom-reset-password-label"></div>
				<div class="custom-reset-password-content">
					<#if recaptchaRequired??>
						<div class="p-0 ${properties.kcInputWrapperClass!}">
							<div class="g-recaptcha" data-theme="dark" data-size="normal" data-sitekey="${recaptchaSiteKey}"></div>
						</div>
					</#if>
				</div>
			</div>
			<div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
				<div id="kc-form-buttons" class="custom-reset-password-button-container ${properties.kcFormButtonsClass!}">
					<input class="custom-reset-password-button ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
				</div>

				<div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
					<div class="kc-login-options ${properties.kcFormOptionsWrapperClass!}">
						<span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
					</div>
				</div>
			</div>

		</form>
	<#elseif section = "info" >
		${msg("emailInstruction")}
	</#if>
</@layout.registrationLayout>
