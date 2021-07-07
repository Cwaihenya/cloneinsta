class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
   skip_before_action :login_required, only: [:new, :create]
before_action :logged_in?, only: [:edit, :update, :delete]
before_action :own_user, only: [:edit, :update, :destroy]
    # GET /posts or /posts.json
    def index
      @user = User.all
    end

    def new
      @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save

          redirect_to user_path(@user), notice: "Account was successfully created"
        else
          render :new
        end
      end

      def show
        #@users = User.all
        @user = User.find(params[:id])
        # @posts =@user.posts
      #  @favorite_photos = @user.favorite_photos
      end

      def edit
              @user = User.find(params[:id])
      end
      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to show, notice: "Edited  "
        else
          render :edit
        end
        end
      private
      def set_user
      @user = User.find(params[:id])
      end
      def user_params
      params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation, :image, :image_cache)
      end
      def own_user
      if current_user.id != @user.id
      redirect_to user_path
    end
  end
    end
