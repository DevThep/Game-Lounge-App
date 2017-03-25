class CommentsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	rescue_from ActiveRecord::RecordNotFound, :with => :post_not_found

  	def post_not_found
    	flash[:info] = "Post has been deleted!"
    	redirect_to request.referrer || root_url
  	end

	def create
		@comment = Comment.new(comment_params)
		@comment.user = current_user
		if @comment.save
			flash[:success] = "Comment Posted!"
			redirect_to @comment.post
		else
			flash[:danger] = "Comment cannot be blank!"
			redirect_to @comment.post
		end
	end

	def destroy
		@comment = Comment.find(params[:post_id])
		@comment.destroy
    	flash[:success] = "Comment deleted"
    	redirect_to request.referrer || root_url
	end

	private
		def comment_params
			params.require(:comment).permit(:content,:post_id)
		end

		#Confirms the correct user.
    	def correct_user
      		@comment = Comment.find(params[:post_id])
      		redirect_to request.referrer || root_url unless current_user?(@comment.user)
    	end
	
end
