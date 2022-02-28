class TicketsController < ApplicationController

    before_action :find_ticket, except: [:index, :new, :create, :show, :from_author, :admin, :alluser, :verify, :deleteuser]
    before_action :authenticate_user!
    @pais = [['Honduras','HN'],['Mexico','MX']];
    # @tickets = Ticket.id

    def show
        @tickets = Ticket.order(created_at: :desc)
        # @tickets = Ticket.order(created_at: :desc)
    end


    def alluser
        @user = User.all
        puts "All Users: #{@user}"
    end
    
    def delete2
        @user = User.find(params[:id])
        puts "User con id: #{@user}"
        # @user.destroy
        redirect_to tickets_path
    end


    def admin
        @tickets = Ticket.all
        @user = User.all
        @regionVisible = 'tickets';
    end

    def new
        @tickets = Ticket.new
    end

    def create
        @tickets = Ticket.new(ticket_params)
        if @tickets.save
          current_user.add_role :creator, @tickets
          flash[:success] = "#{@tickets.id}"
          redirect_to root_path
        else
          render :new, status: :unprocessable_entity
        end
      end


    def verify
        @ticket2 = Ticket.find(params[:id])
        @id_ticket = params[:id]
        puts "ticket verificado: #{@ticket2.id}"
    end

    def edit
        puts "Edit Ticket"
    end
    

    def update
        if @tickets.update(ticket_params)
          current_user.add_role :editor, @tickets
          flash[:info] = "#{@tickets.id}"
          redirect_to root_path
        else
          render :edit, status: :unprocessable_entity
        end
      end

    def edit2
        puts "Edit Ticket"
    end

    def update2
        @tickets = Ticket.find(params[:id])
        @tickets2.update(ticket_params)
        flash[:info] = " #{@tickets.pais}-#{@tickets.ciudad}-#{@tickets.ubicacion}-#{@tickets.id}"
        puts "ver tickets: #{@tickets.pais}-#{@tickets.ciudad}-#{@tickets.ubicacion}-#{@tickets.id}"
        redirect_to verify_path
    end

    def delete
        @tickets.destroy
        # flash[:success] = "#{@tickets.id}"
        redirect_to root_path, notice: "Ticket #{@tickets.id} destroy successfully."
    end

    def from_author
        @user = User.find(params[:user_id])
        puts "correo: #{@user.email}"
    end


        # estatus tickets
        #############
    
    def find_ticket
        @tickets = Ticket.find(params[:id])
    end

    # protection data - pararmetros fuertes
    def ticket_params
        params.require(:ticket).permit(
            :telefono,
            :nombre_usuario,
            :email_cliente,
            :departamento,
            :pais,
            :ciudad,
            :ubicacion,
            :asunto,
            :mensaje,
            :solucion,
            :estado_ticket,
            :state
        ) 
    end
end
