class V1::FirmaElectronicaController < ApplicationController
  before_action :token_validate

  def index
    if params[:accion].present?
      @result= case params[:accion].downcase
               when "firma" then V1::FirmaController.firma(params)
               when "digitalizacion" then V1::DigitalizacionController.digitalizacion(params)
               else {error: "Ingrese Acciones Validas", status:400}
               end
    else
      @result= {error: "Parametro Accion Obligatorio", status: 400}
    end
    render json: @result
  end

  private

  def token_validate
    return render json: {error: "Token Invalido", status: 400} unless params[:auth_token].present? and params[:auth_token] == 'Ab91572Ixtkh9n'
  end

end