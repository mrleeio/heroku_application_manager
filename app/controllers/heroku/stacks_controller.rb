class Heroku::StacksController < ApplicationController
  before_action :set_heroku_stack, only: %i[ show edit update destroy ]

  # GET /heroku/stacks or /heroku/stacks.json
  def index
    @heroku_stacks = Heroku::Stack.all
  end

  # GET /heroku/stacks/1 or /heroku/stacks/1.json
  def show
  end

  # GET /heroku/stacks/new
  def new
    @heroku_stack = Heroku::Stack.new
  end

  # GET /heroku/stacks/1/edit
  def edit
  end

  # POST /heroku/stacks or /heroku/stacks.json
  def create
    @heroku_stack = Heroku::Stack.new(heroku_stack_params)

    respond_to do |format|
      if @heroku_stack.save
        format.html { redirect_to heroku_stack_url(@heroku_stack), notice: "Stack was successfully created." }
        format.json { render :show, status: :created, location: @heroku_stack }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @heroku_stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heroku/stacks/1 or /heroku/stacks/1.json
  def update
    respond_to do |format|
      if @heroku_stack.update(heroku_stack_params)
        format.html { redirect_to heroku_stack_url(@heroku_stack), notice: "Stack was successfully updated." }
        format.json { render :show, status: :ok, location: @heroku_stack }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @heroku_stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heroku/stacks/1 or /heroku/stacks/1.json
  def destroy
    @heroku_stack.destroy!

    respond_to do |format|
      format.html { redirect_to heroku_stacks_url, notice: "Stack was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heroku_stack
      @heroku_stack = Heroku::Stack.find_by_based_uuid(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def heroku_stack_params
      params.require(:heroku_stack).permit(:name, :heroku_identifier, :heroku_name)
    end
end
