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

  def new_comment
    user = current_user
    occ_id = params[:occurrence_id].to_i
    if occ_id.present? && params[:comment_msg].present?
      if params[:date].nil?
        date = Date.today
      else
        date = params[:date]
      end
      Comment.create(occurrence_id: occ_id, message: params[:comment_msg], user_id: user.id, date: date)
      redirect_to occurrence_path(id: occ_id)
    else
      redirect_to root_path, notice: 'Ocorreu um erro ao salvar comentário.'
    end
  end

  # GET /occurrences/1/edit
  def edit
  end

  # POST /occurrences
  # POST /occurrences.json
  def create
    occurrence_params[:user_id] = current_user.id
    if params['file'].present?
      temp = params['file'].tempfile
      b64 = Base64.strict_encode64(temp.read)
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
      unless occurrence_params[:location_lat].present?
        occurrence_params[:location_lat] = @occurrence.location_lat
      end
      unless occurrence_params[:location_lon].present?
        occurrence_params[:location_lon] = @occurrence.location_lat
      end
      unless occurrence_params[:location_string].present?
        occurrence_params[:location_string] = @occurrence.location_lat
      end
      if @occurrence.update(occurrence_params)
        if params['file'].present?
          temp = params['file'].tempfile
          b64 = Base64.strict_encode64(temp.read)
        end
        @occurrence.images.first.update(base64: b64)
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
    @occurrences = Occurrence.found.order(:resolved)
  end

  def list_lost
    @occurrences = Occurrence.lost.order(:resolved)
  end

  def resolve
    parameters = {}
    occurrence = Occurrence.find(params[:occurrence_id])
    parameters[:resolve_message] = params[:resolve_msg]
    parameters[:resolved] = true
    parameters[:resolve_date] = Date.today
    occurrence.update(parameters)
    redirect_to occurrence_path(id: params[:occurrence_id])
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
