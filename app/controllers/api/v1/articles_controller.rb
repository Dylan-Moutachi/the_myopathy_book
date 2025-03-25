module api
  module v1
    class ArticlesController < ApplicationController
      def create
        @article = Article.new(article_params)

        render json: @article
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

        Article.transaction do
          @article.update!(article_params)
        end

        render json: @article
      end

      def destroy
        @article = Article.find(params[:id])
        @article.destroy

        render json: @article
      end

      private

      def article_params
        params.permit(
          title: params[:title],
          description: params[:description],
          content: params[:content],
          author: params[:author]
        )
      end
    end
  end
end
