class ResponsiblesController < ApplicationController
  # GET /responsibles
  # GET /responsibles.json
  def index
    @responsibles = Responsible.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @responsibles }
    end
  end

  # GET /responsibles/1
  # GET /responsibles/1.json
  def show
    @responsible = Responsible.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @responsible }
    end
  end

  # GET /responsibles/new
  # GET /responsibles/new.json
  def new
    @responsible = Responsible.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @responsible }
    end
  end

  # GET /responsibles/1/edit
  def edit
    @responsible = Responsible.find(params[:id])
  end

  # POST /responsibles
  # POST /responsibles.json
  def create
    @responsible = Responsible.new(params[:responsible])

    respond_to do |format|
      if @responsible.save
        format.html { redirect_to @responsible, notice: 'Responsible was successfully created.' }
        format.json { render json: @responsible, status: :created, location: @responsible }
      else
        format.html { render action: "new" }
        format.json { render json: @responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /responsibles/1
  # PUT /responsibles/1.json
  def update
    @responsible = Responsible.find(params[:id])

    respond_to do |format|
      if @responsible.update_attributes(params[:responsible])
        format.html { redirect_to @responsible, notice: 'Responsible was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responsibles/1
  # DELETE /responsibles/1.json
  def destroy
    @responsible = Responsible.find(params[:id])
    @responsible.destroy

    respond_to do |format|
      format.html { redirect_to responsibles_url }
      format.json { head :no_content }
    end
  end

  def destroy_all
    Responsible.destroy_all
	
	respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
end
