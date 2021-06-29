class ItemsController < ApplicationController
    before_action :find_item, only: [:update, :destroy]
    def index 
        @items = Item.all
        render json: {items: @items}, status: :ok
    end

    def show
        @item = Item.find_by(id: params[:id])
        render json: {item: @item}, status: :ok
    end

    def create
        @item = Item.new(item_params)
        @item.user = @@user
        @item.save
        if item.valid?
            render json: {item: @item}, status: :ok
        else 
            render json: {msg: "There was an error in creating your item"}, status: :bad
        end 
    end

    def update
        if @item.update(item_params)
            render json: {item: @item}, status: :ok
        else
            render json: {msg: "There was an error in updating your item"}, status: :ok
        end 
    end

    def destroy 
        if @item.destroy
            render json: {msg: "Item succesfully deleted."}, status: :ok
        else 
            render json: {msg: "There was an error in deleting your item"}, status: :not_acceptable
        end
    end 
    private

    def find_item
        @item = Item.find_by(id: params[:id])
    end

    def item_params
        params.require(:item).permit!
    end
end
