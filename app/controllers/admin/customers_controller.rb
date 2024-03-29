class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id)
    else
      render "edit"
    end
  end

  def withdrawal
    @customer = Customer.find(current_customer.id)
    @customer.update(is_delete: !@customer.is_deleted)
    if @customer.is_deleted
       flash[:notice] = "退会処理を実行いたしました"
    else
       flash[:notice] = "有効にします"
    end
       redirect_to root_path
  end


  private
  def customer_params
    params.require(:customer).permit(:name, :email, :is_delete, :star)
  end
end
