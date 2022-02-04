class LinksController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destory]
    def index
    end

    def all
        @links = Link.all
        @base_url = "#{ENV["BASE_URL"]}"
    end

    def new
        @link = Link.new
    end
    

    def create
        @links = Link.new(link_param)
        if @links.save
          flash[:notice] = "New link successfully created"
          render 'all'
        else
          render 'new'
        end
    end
    
    def update
        if @link.update(link_param)
          flash[:notice] = "Link was successfully updated"
          render 'all'
        else
        #   flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def edit
    end

    def destroy
        @link.destroy
        redirect_to links_path
    end

    private

    def set_link
        @link = Link.find(params[:id])
    end

    def link_param
        params.require(:link).permit(:link_source, :link_short)
    end

end