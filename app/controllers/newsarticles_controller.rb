class NewsarticlesController < ApplicationController
    before_action :find_newsarticle, only: [:show, :destroy]

    def new
        @newsarticle = Newsarticle.new
    end

    def create
        @newsarticle = Newsarticle.new newsarticle_params
        if @newsarticle.save
            flash[:notice] = "article created"
            redirect_to @newsarticle
        else
            render :new
        end
    end

    def index
        @newsarticles = Newsarticle.order(created_at: :DESC)
    end

    def destroy
        @newsarticle.destroy
        flash[:alert] = "news article destroyed"
        redirect_to newsarticles_path
    end

    def show

    end
    private 

    def find_newsarticle
        @newsarticle = Newsarticle.find params[:id]
    end

    def newsarticle_params
        params.require(:newsarticle).permit(:title,:description)
    end
end
