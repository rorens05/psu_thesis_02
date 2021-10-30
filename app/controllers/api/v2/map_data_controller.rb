class Api::V2::MapDataController < Api::V2::ApiController
  def barangay
    render json: Barangay.all.order(name: :asc)
  end
end
