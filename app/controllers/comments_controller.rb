class CommentsController < ApplicationController

    skip_before_action :authorized, only: [:index, :show]

    def index
        @comments = Comment.all
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(comment_params.merge(user: current_user))
        if @comment.valid?
            redirect_to @comment
        else
            flash[:notice] = @comment.errors.full_messages
            render :new
        end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.valid?
            @comment.update(comment_params)
            redirect_to @comment
        else
            flash[:notice] = comment.errors.full_messages
            render :edit
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:name, :description, :image, :price, :light_instructions, :water_instructions, :other_instructions)
    end

end
