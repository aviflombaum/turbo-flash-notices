class JobPostsController < ApplicationController
  def create
    @job_post = JobPost.new(params[:job_post])
    if @job_post.save
      redirect_to job_post_path(@job_post), notice: "Job Post created successfully."
    else
      render :new
    end
  end
end
