class OccurrencesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_occurrence, only: [:show, :edit, :update, :destroy]

  # GET /occurrences
  # GET /occurrences.json
  def index
    @display_name = current_user.name.nil? ? current_user.email : current_user.name
  end

  # GET /occurrences/1
  # GET /occurrences/1.json
  def show
  end

  # GET /occurrences/new
  def new
    @occurrence = Occurrence.new
  end

  # GET /occurrences/1/edit
  def edit
  end

  # POST /occurrences
  # POST /occurrences.json
  def create
    occurrence_params[:user_id] = current_user.id
    if params['file'].tempfile
      b64 = Base64.strict_encode64(params['file'].tempfile.read)
    end
    @occurrence = Occurrence.new(occurrence_params)

    respond_to do |format|
      if @occurrence.save
        if b64
          @occurrence.images.create(base64: b64)
        end
        format.html { redirect_to @occurrence, notice: 'Occurrence was successfully created.' }
        format.json { render :show, status: :created, location: @occurrence }
      else
        format.html { render :new }
        format.json { render json: @occurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /occurrences/1
  # PATCH/PUT /occurrences/1.json
  def update
    respond_to do |format|
      if @occurrence.update(occurrence_params)
        format.html { redirect_to @occurrence, notice: 'Occurrence was successfully updated.' }
        format.json { render :show, status: :ok, location: @occurrence }
      else
        format.html { render :edit }
        format.json { render json: @occurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occurrences/1
  # DELETE /occurrences/1.json
  def destroy
    @occurrence.destroy
    respond_to do |format|
      format.html { redirect_to occurrences_url, notice: 'Occurrence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def list_found
    @occurrences = Occurrence.found
  end

  def list_lost
    @occurrences = Occurrence.lost
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occurrence
      @occurrence = Occurrence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def occurrence_params
      params.require(:occurrence).permit(:date,
                                         :location_lat,
                                         :location_lon,
                                         :location_string,
                                         :animal_type,
                                         :animal_size,
                                         :animal_color,
                                         :occurrence_type,
                                         :date,
                                         :description,
                                         :stars)
    end
end
