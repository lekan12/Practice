class HeadlinesController < ApplicationController
    def index
    end    
    
    def new
        @headline = Headline.new
    end
    
    def create
        @headline = Headline.new(headline_params)
        
        if @headline.save
			redirect_to root_path
		else
			render 'new'
	end
    end
    
    private
    
      def headline_params
          params.require(:headline).permit(:title, :description, :author)
      end
end
