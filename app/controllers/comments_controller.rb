class CommentsController < ApplicationController
    before_action :set_photo
    def create
        @comment = @photo.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            respond_to do |format|
                format.html { redirect_to root_path }
                format.js
            end
        else
            flash[:alert] = "Check the comment form, something went wrong."
            render root_path
        end
    end
    def destroy  
        @comment = @photo.comments.find(params[:id])

        @comment.destroy
        flash[:success] = "Comment deleted :("
        redirect_to root_path
    end  

    private

    def comment_params  
    params.require(:comment).permit(:content)
    end

    def set_photo  
    @photo = Photo.find(params[:photo_id])
    end  
end
