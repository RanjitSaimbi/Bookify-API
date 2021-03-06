class UsersController < ApplicationController

    def signup
      user_by_email = User.find_by(email: params[:email])
      user_by_username = User.find_by(username: params[:username])
      if user_by_email || user_by_username
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

      def get_book_messages
        user = get_current_user
        messages = Message.where(book_id: params[:book_id])
        if user
          render json: messages, each_serializer: MessageSerializer
        else
          render json: {error: 'Invalid user.'}, status: 404
        end 
      end

      def get_sender_recipient_messages
        user = get_current_user
        grouped_messages = Message.where(recipient_id: user.id).or(Message.where( sender_id: user.id)).group_by{|x|x.book.id }

        serialized_grouped_messages = grouped_messages.transform_values do |v|
          v.map {|message| MessageSerializer.new(message)}
        end

        if user
          render json: serialized_grouped_messages
        else
          render json: {error: 'Invalid user.'}, status: 404
        end 
      end 

      def send_message 
        book = Book.find_by(id: params[:book])
        user = get_current_user
        recipient = User.find_by(username: params[:recipient])
        message = Message.create(book: book, sender: user, recipient: recipient, body: params[:body])
        if user
          render json: {message: MessageSerializer.new(message)}
        else
          render json: {error: 'Invalid user.'}, status: 404
        end 
      end 

      def delete_message
        user = get_current_user
        message = Message.find_by(id: params[:id])
        if user
            if message.sender == user  || message.recipient == user 
                message.destroy
                render json: {ok: 'Message successfully deleted.'}, status: 200
            else 
                render json: {error: 'Invalid request.'}, status: 400
            end 
        else
          render json: {error: 'Invalid request.'}, status: 400
        end 
      end 

      # private 

      # def signup_params 
      #   params.require(:user).permit(:email, :username, :password)
      # end 

end
