class PagesController < ApplicationController
    def home
        @posts = Post.all
        @comments = Comment.all
    end

    def viewpost
        @posts = Post.all
    end

    def viewcomment
        @comments = Comment.all
    end
  end