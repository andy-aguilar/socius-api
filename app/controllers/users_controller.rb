class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.create(user_params)
        if user.valid?
            token = encode_token(user_id: user.id)
            render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        else
            render json: { error: 'failed to create user'}, status: :not_acceptable
        end
    end

    def show
        user = User.find(params[:id])
        if user
            render json: user
        else
            render json: {error: 'failed to find user'}
        end
    end

    def update
        user = User.find(params[:id])

        if params[:image].length > 0
            byebug
            blob = ActiveStorage::Blob.create_after_upload!(
                io: StringIO.new((Base64.decode64(params[:image].split(",")[1]))),
                filename: "user.png",
                content_type: "image/png",
            )
            user.image.attach(blob)
            render json: user
        else
            user.update(user_params)
            render json: user
        end

    end

    def search
        users_first = User.where("lower(first_name) LIKE ?", "%#{params[:query].downcase}%")
        users_last = User.where("lower(last_name) LIKE ?", "%#{params[:query].downcase}%")
        users_email = User.where("lower(email_address) LIKE ?", "%#{params[:query].downcase}%")

        if users_first || users_last || users_email
            users_concat = users_first + users_email + users_last
            users_final = users_concat.uniq
            render json: users_final
        else
            rendser json: {message: 'There are no users matching your search query.'}
        end
        
    end

    private

    def user_params
        params.require(:user).permit(:email_address, :password, :first_name, :last_name)
    end

end
