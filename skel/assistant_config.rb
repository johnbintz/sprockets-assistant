middleware do
  # use Rack::LiveReload
end

app do
  get '/' do
    erb :index
  end
end

compile do
  file "application.js"
  file "application.css"
end
