class ItemsController < ApplicationController
    # この行に「:pay」を追加
    require 'payjp'

   
    # payを private よりも前に追加
    def pay
      book = Book.find_by!(slug: params[:slug])
      Payjp.api_key = 'sk_test_c62fade9d045b54cd76d7036'
      charge = Payjp::Charge.create(
        :amount => book.price,
        :card => params['payjp-token'],
        :currency => 'jpy',
      )

      #redirect_to book_path(book), notice: 'You successfully buy this book!'
      
      @sale = book.sales.create!(buyer_email: current_user.email)
      redirect_to pickup_url(uuid: @sale.uuid)
    end

    def pickup
        @sale = Sale.find_by!(uuid: params[:uuid])
        @book = @sale.book
    end
end
