module Spree
  module Admin
    class CaptchaSettingsController < BaseController
      def update
        #Spree::Captcha::Config.set(params[:preferences])

        params[:preferences].each do |name, value|
          next unless Spree::Captcha::Config.has_preference? name

          Spree::Captcha::Config[name] = value
        end

        #Spree::Captcha::Config.use_captcha = false

        respond_to do |format|
          format.html { redirect_to edit_admin_captcha_settings_path }
        end
      end
    end
  end
end
