class PoemsController < ApplicationController

  def index
    @poems = Poem.all(limit: 30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @poems }
    end
  end

  def show
    @poem = Poem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @poem }
    end
  end

  def new
    @poem = Poem.new

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @poem }
    end
  end

  def create
    poem = Poem.new(params[:poem])
    poem.user = current_user

    titles = Title.where(title: "Apprentice Wordsmith")

    if poem.save
      puts 'SAVED'
      render status: 201, json: {success: "Contact created."}
    end
  end

  # def update
  #   @poem = Poem.find(params[:id])

  #   respond_to do |format|
  #     if @poem.update_attributes(params[:poem])
  #       format.html { redirect_to @poem, notice: 'Poem was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @poem.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @poem = Poem.find(params[:id])
    @poem.destroy

    respond_to do |format|
      format.html { redirect_to poems_url }
      format.json { head :no_content }
    end
  end

  private

  def check_for_titles(poem)
  end
end
