class HeadlinesController < ApplicationController
    before_action :find_headline, only: [:show, :edit, :update, :destroy]

    
    def index
		@headlines = Headline.all.order("created_at DESC")
    end
    
    def show
    end
 
    def new
        @headline = current_user.headlines.build
        @categories = Category.all.map{ |c| [c.name, c.id] }
    end
    
    def create
        @headline = current_user.headlines.build(headline_params)
        @headline.category_id = params[:category_id]
        
        if @headline.save
			redirect_to root_path
		else
			render 'new'
	end
    end
    
    def edit
    end

	def update
		if @headline.update(headline_params)
			redirect_to headline_path(@headline)
		else
			render 'edit'
		end
	end

	def destroy
	    @headline.destroy
		redirect_to root_path
	end
	
    private
    
      def headline_params
          params.require(:headline).permit(:title, :description, :author, :category_id)
      end
      
        def find_headline
			@headline = Headline.find(params[:id])
        end
end
