<%@ page import="salias.Horario" %>


<div class="fieldcontain ${hasErrors(bean: horarioInstance, field: 'horaInicio', 'error')} required">
	<label for="horaInicio">
		<g:message code="horario.horaInicio.label" default="Hora Inicio" />
		<span class="required-indicator">*</span>
	</label>
        <g:select name="horaInicio" from="${['01','02','03','04','05','06','07','08','09','10','11','12']}" value="${horarioInstance?.horaInicio}" />:
        <g:select name="minutosInicio" from="${['00','05','10','15','20','25','30','35','40','45','50','55']}" format="" value="${horarioInstance?.minutosInicio}" />
        <g:select name="meridianoInicio" from="${['PM', 'AM']}" value="${horarioInstance?.meridianoInicio}" />
</div>

<div class="fieldcontain ${hasErrors(bean: horarioInstance, field: 'horaFin', 'error')} required">
	<label for="horaFin">
		<g:message code="horario.horaFin.label" default="Hora Fin" />
		<span class="required-indicator">*</span>
	</label>
        <g:select name="horaFin" from="${['01','02','03','04','05','06','07','08','09','10','11','12']}" value="${horarioInstance?.horaFin}" />:
        <g:select name="minutosFin" from="${['00','05','10','15','20','25','30','35','40','45','50','55']}" value="${horarioInstance?.minutosFin}" />
        <g:select name="meridianoFin" from="${['PM', 'AM']}" value="${horarioInstance?.meridianoFin}" />
</div>


