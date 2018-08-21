require_relative 'get_data'

while true
  if presence_check
    write_to_channel
    sleep 3600
  end
end
