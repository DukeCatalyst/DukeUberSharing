class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  Time.zone = 'Eastern Time (US & Canada)'

  # GET /posts
  # GET /posts.json
  def index
    @posts = []
    @datemap = {}
    Post.where("departure_time >= ?", Time.zone.now).each do |post|
      if post.riders.count < post.number_passengers
        @posts << post
      @datemap[post.id] = (post.departure_time.to_f- Time.zone.now.to_f) * 1000
      end 
    end 
    gon.push({:datemap => @datemap})
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.riders << @post.creator
    
    respond_to do |format|
      if @post.save
        UserMailer.welcome_email().deliver_now
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /posts/myposts
  def user_posts
    @posts = [] 
    Post.all.each do |post|
      if post.riders.include?(current_user.id)
        @posts << post
      end 
    end 
  end 

  # GET /posts/1/potentialrider
  def new_rider 
    @post = Post.find(params["id"])
    if @post.riders.include?(current_user.id)
      # Remove rider from list of current riders 
      @post.riders.delete(current_user.id)
      @post.save
    elsif @post.riders.count < @post.number_passengers
      # Add rider to list of current riders
      @post.riders << current_user.id
      @post.save
    end 
    redirect_to @post
  end 

  # GET /profile
  def profile
    @user = User.find(params[:id])
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:destination, :departure_time, :departure_location, :number_passengers, :creator)
    end

end
