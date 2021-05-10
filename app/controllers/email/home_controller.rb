module Email
  class HomeController < ApplicationController

    def index
      login_by_token(params[:auth_token])
      if current_user
        @address = current_user.addresses.build
      else
        @address = Profiled::Address.new
      end
      r = QqMapHelper.ip request.remote_ip
      area_params = r['ad_info']
      if area_params
        area = Profiled::Area.sure_find_full [area_params['province'], area_params['city'], area_params['district'].presence].compact
      else
        area = Profiled::Area.new
      end
      @address.area = area
    end

    def preview

    end

  end
end
