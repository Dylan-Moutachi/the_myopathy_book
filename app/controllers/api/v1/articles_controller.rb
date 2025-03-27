module Api
  module V1
    class ArticlesController < ApplicationController
      def create
        @article = Article.new(article_params.merge(user_id: current_user.id))
        if @article.save
          render json: {message: "Article successfully created.", data: @article}
        else
          render json: {message: "Article could not be created.", data: @article}
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
        @article = Article.find(params[:id])
        if @article.update!(article_params)
          render json: {message: "Article successfully updated.", data: @article}
        else
          render json: {message: "Article could not be updated.", data: @article}
        end
      end

      def destroy
        @article = Article.find(params[:id])
        @article.destroy

        render json: @article
      end

      private

      def article_params
        params.require(:article).permit(
          title: params[:title],
          description: params[:description],
          content: params[:content],
          author: params[:author]
        )
      end
    end
  end
end
