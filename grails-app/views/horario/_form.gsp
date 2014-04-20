<%@ page import="salias.Horario" %>


<div class="fieldcontain ${hasErrors(bean: horarioInstance, field: 'horaInicio', 'error')} required  form-group">
	<label for="horaInicio" class="col-lg-4 control-label">
		<g:message code="horario.horaInicio.label" default="Hora Inicio" />
		<span class="required-indicator">*</span>
	</label>
  <div class="col-lg-1">
        <g:select name="horaInicio" from="${['01','02','03','04','05','06','07','08','09','10','11','12']}" value="${horarioInstance?.horaInicio}" class="form-control"/>
        </div>
  <div class="col-lg-1">
        <g:select name="minutosInicio" from="${['00','05','10','15','20','25','30','35','40','45','50','55']}" format="" value="${horarioInstance?.minutosInicio}" class="form-control"/>
  </div>
  <div class="col-lg-2">
        <g:select name="meridianoInicio" from="${['PM', 'AM']}" value="${horarioInstance?.meridianoInicio}" class="form-control"/>
</div>
</div>
<div class="fieldcontain ${hasErrors(bean: horarioInstance, field: 'horaFin', 'error')} required  form-group">
	<label for="horaFin" class="col-lg-4 control-label">
		<g:message code="horario.horaFin.label" default="Hora Fin" />
		<span class="required-indicator">*</span>
	</label>
  <div class="col-lg-1">
        <g:select name="horaFin" from="${['01','02','03','04','05','06','07','08','09','10','11','12']}" value="${horarioInstance?.horaFin}" class="form-control"/>
        </div>
    <div class="col-lg-1">
        <g:select name="minutosFin" from="${['00','05','10','15','20','25','30','35','40','45','50','55']}" value="${horarioInstance?.minutosFin}" class="form-control"/>
    </div>
  <div class="col-lg-2">
        <g:select name="meridianoFin" from="${['PM', 'AM']}" value="${horarioInstance?.meridianoFin}" class="form-control"/>
</div>
</div>


