module Api
  module V1
    class CategoryController < ApplicationController
      before_action :authenticate_user!
      before_action :set_category, only: %i[show update destroy]

      include Pageable
      include JsonResponse

      # GET /category
      def index
        @categories = current_user.categories.page(current_page).per(per_page)
        options = get_links_serializer_options('api_v1_category_index_path', @categories)
        json_response(CategorySerializer.new(@categories, options))
      end

      # POST /category
      def create
        @category = Category.new(category_params)
        @category.user = current_user
        if @category.save
          # render json: CategorySerializer.new(@category).serializable_hash.to_json, status: :created
          json_response(CategorySerializer.new(@category), :created)
          return
        end
        error_response(@category)
      end

      # GET /category/:id
      def show
        if @category.user != current_user
          not_found_category
          return
        end
        json_response(CategorySerializer.new(@category, include_chain))
      end

      # PUT(PATCH) /category/:id
      def update
        if @category.user != current_user
          not_found_category
          return
        end
        if @category.update(category_params)
          head :no_content
          return
        end
        error_response(@category)
      end

      # DELETE /category/:id
      def destroy
        if @category.user != current_user
          not_found_category
          return
        end
        if @category.destroy
          head :no_content
          return
        end
        error_response(@category)
      end

      private

      def include_chain
        Hash.new(include: [:books])
      end

      def not_found_category
        render json: { success: false, errors: ['You don\'t have this category']}, status: :not_found
      end

      def category_params
        params.require(:category).permit(:label, :short_description, :is_public)
      end

      def set_category
        @category = Category.find(params[:id])
      end
    end
  end
end
