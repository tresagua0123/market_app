class TransactionsController < ApplicationController 

    def new
    end

    def create
     
        book = Book.find_by!(slug: params[:slug])
        sale = book.sales.create(
            amount: book.price, 
            buyer_email: current_user.email,
            seller_email: book.user.email,
            stripe_token: params[:stripeToken])
        sale.process! 
        

        if sale.finished?
            redirect_to pickup_url(uuid: sale.uuid)
        else
            redirect_to book_path(book), 
            notice: e.message
         
=begin       
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
=end
        #redirect_to pickup_url(uuid: @sale.uuid)
=begin
        rescue Stripe::CardError => e
            flash[:notice] = e.message
        ensure
=end 

        end
    end

    def pickup
        @sale = Sale.find_by!(uuid: params[:uuid])
        @book = @sale.book
    end

end
