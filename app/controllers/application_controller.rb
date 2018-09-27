class ApplicationController < ActionController::API

  def token_validate
    return render json: {error: "Token Invalido", status: 400} unless params[:auth_token].present? and params[:auth_token] == 'Ab91572Ixtkh9n'
  end

  def self.save_document(params)
    if params[:accion].downcase == 'firma'
      document = TableService.where(busy: false).last
      if document.present?
        update= document.update_attributes(institution: params[:Institucion],
                                           mime_type: params[:TipoDoc],
                                           description: params[:DescripcionDocumento],
                                           place_code: params[:File_mime],
                                           file: params[:File],
                                           signatories: params[:Firmantes],
                                           tags: params[:Tags],
                                           related_document: params[:DocRelacionados],
                                           busy: true)

        response= update ? {status:true, codigo_dec: document.dec_code} : {status:false}
      else
        response= {status: false}
      end
    elsif params[:accion].downcase == 'digitalizacion'
      document = TableService.where(busy: false).last
      if document.present?
        update= document.update_attributes(institution: params[:Institucion],
                                           mime_type: params[:TipoDoc],
                                           description: params[:DescripcionDocumento],
                                           place_code: params[:File_mime],
                                           file: params[:File],
                                           tags: params[:Tags],
                                           related_document: params[:DocRelacionados],
                                           busy: true)

        response= update ? {status:true, codigo_dec: document.dec_code} : {status:false}
      else
        response= {status: false}
      end
    end
    response
  end

  def validate_audit
    
  end

end