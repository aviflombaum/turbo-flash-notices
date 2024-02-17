class NoticesController < ApplicationController
  def index
    if params[:type]
      case params[:status]
      when "success"
        title = "Success!"
      when "error"
        title = "Error!"
      when "warning"
        title = "Warning!"
      when "info"
        title = "Info!"
      end

      case params[:type].to_sym
      when :alert
        respond_to do |f|
          f.html do
            flash[:notice] = {
              type: :alert,
              status: params[:status],
              title: title,
              message: "This is an alert notice."
            }
            redirect_to notices_root_path
          end
          f.turbo_stream do
            flash.now[:notice] = {
              type: :alert,
              status: params[:status],
              title: title,
              message: "This is an alert powered by Turbo Stream."
            }
          end
        end
      when :toast
        respond_to do |f|
          f.html do
            flash[:notice] = {
              type: :toast,
              status: params[:status],
              title: title,
              message: "This is a toast notice."
            }
            redirect_to notices_root_path
          end
          f.turbo_stream do
            flash.now[:notice] = {
              type: :toast,
              status: params[:status],
              title: title,
              message: "This is an toast powered by Turbo Stream."
            }
          end
        end
      end

    end
  end
end
