class Parse
def initialize(app)
@app = app
end
def call(env)
	 @status, @headers, @response = @app.call(env)

  map '/' do
    run Rails.application
  end

  map '/version' do
    run Proc.new {|env| [200, {"Content-Type" => "text/html"}, "infinity 0.1"] }
  end
end
