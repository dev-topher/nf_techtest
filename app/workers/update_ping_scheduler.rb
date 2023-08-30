require 'sidekiq-scheduler'

class UpdatePingScheduler
  include Sidekiq::Worker

  def perform
    devices = Device.all

    devices.each do |device|
      server_url = "http://127.0.0.1:3000/api/v1/devices/#{device.id}"
      server_available = server_available?(server_url)

      device.ping_update(server_available)
    end
  end

  private

  def server_available?(url) # Función que sirve de ping (devuelve true en caso de ser positivo y false en caso de no encontrarlo)
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.path)

    begin
      response = http.request(request)
      return true if response.is_a?(Net::HTTPSuccess)
    rescue Net::HTTPError, Timeout::Error, Errno::ECONNREFUSED
      return false
    end

    false
  end
end
