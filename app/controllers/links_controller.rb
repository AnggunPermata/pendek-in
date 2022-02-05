class LinksController < ApplicationController
    before_action :set_link, only: [:edit, :update, :show, :destroy]
    def index
      
    end

    def show
      
    end

    def all
        @links = Link.all
        @base_url = "#{ENV["BASE_URL"]}"
    end

    def new
        @link = Link.new
    end
    

    def create
        @link = Link.new(link_param)
        if @link.save
          flash[:notice] = "New link successfully created"
          redirect_to links_path
        else
          render :new, status: :unprocessable_entity
        end
    end
    
    def update
        if @link.update(link_param)
          flash[:notice] = "Link was successfully updated"
          redirect_to links_path
        else
        #   flash[:error] = "Something went wrong"
          render 'edit', status: :unprocessable_entity
        end
    end

    def edit
    end

    def destroy
        @link.destroy
        redirect_to links_path, status: 303
    end

    def access
      link_param = params[:link_short]
      link = Link.where(link_short: link_param)
      # check if link is empty (if array is empty?)
      is_link_empty = link.empty?
    
      if is_link_empty
        puts "PLEASE MAKE THE LINK FIRST!!!!!!!!!"
        flash[:error] = "Link is not exist."
        redirect_to links_path, allow_other_host: true
      else
        # get source link
        get_source_link = link.pluck(:link_source)
        source_link = "#{get_source_link[0]}"
        redirect_to source_link, allow_other_host: true
      end
    end


    private

    def set_link
        @link = Link.find(params[:id])
    end

    def link_param
        params.require(:link).permit(:link_source, :link_short)
    end

end