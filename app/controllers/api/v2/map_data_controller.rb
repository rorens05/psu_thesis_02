class Api::V2::MapDataController < Api::V2::ApiController
  def barangay
    render json: Barangay.all.order(name: :asc)
  end

  def tsunami
    render json: TsunamiArea.all.order(name: :asc)
  end
  
  def evacuation
    render json: EvacuationArea.all.order(name: :asc)
  end

  def flood
    render json: Flood.all
  end

  def storm_surge
    render json: StormSurge.all
  end
end
