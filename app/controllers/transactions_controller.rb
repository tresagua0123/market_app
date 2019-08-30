class TransactionsController < ApplicationController 

    def new
    end

    def create
        
        book = Book.find_by!(slug: params[:slug])
        begin
        
          
        
            customer = Stripe::Customer.create(
            :email => params[:stripeEmail], 
            :source  => params[:stripeToken] 
          )
        #token = params[:stripeToken]
        charge = Stripe::Charge.create(
            :customer    => customer.id,
            :amount      => book.price,
            :description => 'Rails Stripe customer',
            :currency    => 'usd'
          )
   

        @sale = book.sales.create!(buyer_email: current_user.email)
            redirect_to pickup_url(uuid: @sale.uuid)
        rescue Stripe::CardError => e
            flash[:notice] = e.message
        ensure
        

        end
    end

    def pickup
        @sale = Sale.find_by!(uuid: params[:uuid])
        @book = @sale.book
    end

end
