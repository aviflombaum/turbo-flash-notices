module FlashHelper
  def flash_alert(&block)
    return tag.div id: "alert" unless flash[:notice].present?
    flash[:notice].symbolize_keys!

    if flash[:notice][:type].to_sym == :alert
      render "layouts/alert", &block
    end
  end
end
