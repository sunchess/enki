class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :set_content_type

  protected

  def set_content_type
    headers['Content-Type'] ||= 'text/html; charset=utf-8'
  end

  def enki_config
    @@enki_config = Enki::Config.default
  end
  helper_method :enki_config

 def ajax_redirect(location)
    render :update do | page |
      page << "window.location.replace('#{location}');" 
    end
  end

  def ajax_alert(mes)
    render :update do | page |
      page << "alert('#{escape_javascript( mes )}');" 
    end
  end
end
