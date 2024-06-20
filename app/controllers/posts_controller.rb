class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create  
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
				redirect_to posts_path
		else
				render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update post_params
				redirect_to posts_path
		else
				render :edit
		end
	end

	 # DELETE /comments/1 or /comments/1.json
	 def destroy
		@post = Post.find(params[:id])
		@post.destroy
		respond_to do |format|
		  format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
		  format.json { head :no_content }
		end
	  end

	private

	def post_params
		params.require(:post).permit(:title, :content, :answers_count)
	end
end