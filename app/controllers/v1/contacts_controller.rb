class V1::ContactsController < ApplicationController
    def index
        @contacts = Contact.all
        render json: @contacts, status: :ok
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            render json: @contact, status: :created
        else
            render json: {errors: @contact.errors.full_messages}
        end
        
    end

    def update
        contact = Contact.find(params[:id])
        if contact.update(contact_params)
            render json: contact, status: :created
        else
            render json: {errors: @contact.errors.full_messages}
        end
    end

    def destroy
        @contact = Contact.where(id: params[:id]).first
        if @contact.destroy
            head(:ok)
        else
            head(:bad_request)
        end
    end
    
    private
    def contact_params
        params.require(:contact).permit(:first_name, :last_name, :email)
    end
end
