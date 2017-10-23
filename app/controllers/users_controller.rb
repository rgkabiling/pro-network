class UsersController < ApplicationController
  def index
		@user = User.find(session[:user_id])
		usersinnetwork = @user.networkees
		usersinvited = @user.invitees
		invites = Invite.where(invitee: @user)
		inviteduser = []
		invites.each do |inv|
			inviteduser.push(inv.user)
		end
		users = User.all
		@nonconnect = []
		users.each do |user|
			if (usersinnetwork.include? user) || (usersinvited.include? user) || (inviteduser.include? user)

			else
				@nonconnect.push(user)
			end
		end
		@nonconnect.delete(@user)
	end


  	def create
    	if !session[:user_id]
   			 @user = User.create(name:params[:name],description:params[:description],email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation])
	  		if @user.valid?
	  			@user.save
	  			session[:user_id] = @user.id
	  			redirect_to '/professional_profile'
	  		else
	  		 	flash[:errors] = @user.errors.full_messages
      			redirect_to :back
	  		end
	  	end
  	end

  	def professional_profile
  		@users=User.all
  		@user = User.find(session[:user_id])
  		@invites = Invite.where(invitee: @user)

  	end


  	def login

      user = User.find_by_email(params[:email])

        if user && user.authenticate(params[:password])

          session[:user_id] = user.id
          redirect_to '/professional_profile'
        else
          flash[:errors] = ["Invalid combination"]
          redirect_to :back
        end
    end

  	def logout
      session[:user_id] = nil
      redirect_to '/'
    end

    def network_destroy
		network= Network.find_by(user: User.find(session[:user_id]), networkee: User.find(params[:id]))
		oppositeside = Network.find_by(user: User.find(params[:id]), networkee: User.find(session[:user_id]))
		network.destroy
		oppositeside.destroy
		redirect_to '/professional_profile'
	end

	def show
		@users=User.all
		@user=User.find(params[:id])
	end
end
