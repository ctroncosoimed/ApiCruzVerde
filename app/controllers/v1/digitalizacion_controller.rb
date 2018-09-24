class V1::DigitalizacionController < ApplicationController

  def self.digitalizacion(params)
    params[:tipoDoc] = "pdf"

    @result=
      if (params[:auth_token].present? and params[:auth_token] == 'Ab91572Ixtkh9n') and params[:Institucion].present? and params[:TipoDoc].present? and params[:DescripcionDocumento].present? and params[:File_mime].present? and params[:File].present?
        @result= {CodError: 0,
                  Mensaje: 0,
                  CodigoDEC: "IMD#{rand(8000000000000000..9000000000000000)}"}
      else
        @result= {error: "Revisar Parametros Obligatorios", status: 400}
      end

    render json: @result
  end

end