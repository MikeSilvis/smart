set :output, "./cron.log"

every 10.minutes do
  rake :pull
end

every 1.minute do
  rake :open
end

every 1.minute do
  rake :close
end
