class Flight

  def initialize(flight_number, database)
    @database_handle = database.init
    @flight_number = flight_number
  end
end