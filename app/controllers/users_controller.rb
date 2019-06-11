class UsersController < ApplicationController

    def signup
      user_by_email = User.find_by(email: params[:email])
      if user_by_email 
        render json: { error: "This user already exists." }, status: 400
      else 
        user = User.create(username: params[:username], password:params[:password], email:params[:email])
          if user 
            render json: {token: issue_token({id: user.id})}
          else
            render json: { error: "User sign-up failed." }, status: 400
          end
      end 
    end 



    def signin
        user = User.find_by(email: params[:email])
        if user and user.authenticate(params[:password])
          render json: {token: issue_token({id: user.id}), username: user.username}
        else
          render json: { error: "User/password combination failed." }, status: 400
        end
      end
    
      def validate
        user = get_current_user
        if user
          render json: {username: user.username}
        else
          render json: {error: 'Invalid user.'}, status: 404
        end 
      end

      # private 

      # def signup_params 
      #   params.require(:user).permit(:email, :username, :password)
      # end 

end
