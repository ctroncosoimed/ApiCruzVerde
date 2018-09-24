class V1::FirmaController < ApplicationController

  def self.firma(params)
    return render json: {error: "La descripcion del documento debe ser completada", status: 400} if params[:TipoDoc] == 'txt' and params[:TextoDoc] == ""

    @rol_firmante = Array.new
    @email_firmantes = Array.new
    @rut_firmante = Array.new
    @nombre_completo = Array.new
    @tipo_firma = Array.new
    @auditoria = Array.new

    params[:Firmantes].each do |firmantes|
      @rol_firmante << firmantes["ROL"] if firmantes["ROL"].present?
      @email_firmantes << firmantes["EmailFirmante"] if firmantes["EmailFirmante"].present?
      @rut_firmante << firmantes["Rut"] if firmantes["Rut"].present?
      @nombre_completo << firmantes["NombreCompleto"] if firmantes["NombreCompleto"].present?
      @tipo_firma << firmantes["TipoFirma"] if firmantes["TipoFirma"].present?
      @auditoria << firmantes["Auditoria"] if firmantes["Auditoria"].present?
    end


    @result=
      if (params[:auth_token].present? and params[:auth_token] == 'Ab91572Ixtkh9n') and params[:Institucion].present? and params[:TipoDoc].present? and params[:DescripcionDocumento].present? and params[:File_mime].present? and params[:File].present? and params[:Firmantes].present?
         {CodError: 0,
                  Mensaje: 0,
                  CodigoDEC: "IMD#{rand(8000000000000000..9000000000000000)}",
                  LadrilloDeFirma: "Este documento es una representación de un documento original en formato electrónico. Para verificar el estado actual del documento verificarlo en 5cap.dec.cl Firmante: #{@rut_firmante.map{ |i|  %Q(#{i}) }.join(',')}, Institución: #{params[:Institucion]}, Fecha de Firma: #{DateTime.now.strftime("%d/%m/%Y")}, Auditoria: #{@auditoria.map{ |i|  %Q(#{i}) }.join(',')}, Operador: 1-9",
                  status: 201}
      else
         {error: "Revisar Parametros Obligatorios", status: 400}
      end
    render json: @result
  end
end