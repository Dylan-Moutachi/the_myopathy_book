module Api
  module V1
    class ArticlesController < ApplicationController
      def create
        return unless current_user.is_admin?

        @article = Article.new(article_params.merge(user_id: current_user.id))
        if @article.save
          render json: { message: "Article successfully created.", data: @article }
        else
          render json: { message: "Article could not be created.", data: @article }
        end
      end

      def index
        @articles = Article.all

        render json: @articles
      end

      def show
        @article = Article.find(params[:id])

        render json: @article
      end

      def update
        return unless current_user.is_admin?

        @article = Article.find(params[:id])
        if @article.update!(article_params)
          render json: { message: "Article successfully updated.", data: @article }
        else
          render json: { message: "Article could not be updated.", data: @article }, status: :unprocessable_entity
        end
      end

      def destroy
        @article = Article.find(params[:id])

        if current_user.is_admin?
          @article.destroy
          render json: { message: "Article successfully deleted.", data: @article }
        else
          render json: { message: "Admin rights needed to delete article.", data: @article }, status: :unprocessable_entity
        end
      end

      private

      def article_params
        params.require(:article).permit(
          :title,
          :description,
          :content,
          :author
        )
      end
    end
  end
end
