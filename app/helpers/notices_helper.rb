module NoticesHelper
  def flash_alert
    return unless flash[:notice].present?
    flash[:notice].symbolize_keys!

    if flash[:notice][:type].to_sym == :alert
      render "layouts/alert"
    end
  end
end
