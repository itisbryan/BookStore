module Api
  module V1
    class CategoryController < ApplicationController
      before_action :authenticate_user!
      before_action :set_category, only: %i[show update destroy]

      def index
        @categories = current_user.categories
        render json: CategorySerializer.new(@categories).serializable_hash.to_json
      end

      # GET /category
      def show
        @categories = Category.all
      end

      private

      def category_params
        params.require(:category).permit(:label, :short_description)
      end

      def set_category
        @category = Category.find(params[:id])
      end
    end
  end
end
