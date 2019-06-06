class UsersController < ApplicationController

    def signin
        user = User.find_by(email: params[:email])
        if user and user.authenticate(params[:password])
          render json: {token: issue_token({id: user.id})}
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

end
