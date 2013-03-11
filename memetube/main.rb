require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'
require 'active_support/all'

before do
  sql = 'select distinct genre from clips'
  @nav_rows = run_sql(sql)
end

get '/clips/:genre' do
  sql = "select * from clips where genre = '#{params['genre']}';"
  @rows = run_sql(sql)
  erb :clips
end

get '/clips' do
  sql = 'select * from clips;'
  @rows = run_sql(sql)
  erb :utube
end

post '/create' do
  code = params[:url]
  sql = "insert into clips (title, description, genre, url) values ('#{params[:title]}', '#{params[:description]}', '#{params[:genre]}', '#{code}')"
  run_sql(sql)
  redirect to('/clips')
end

get '/' do
  erb :home
end

get '/new' do
  erb :new
end

get '/clips/:clip_id/delete' do
  sql = "delete from clips where id = #{params['clip_id']}"
  run_sql(sql)
  redirect to('/clips')
end

get '/clips/:clip_id/edit' do
  sql = "select * from clips where id = #{params['clip_id']}"
  rows = run_sql(sql)
  @row = rows.first
  erb :new
end

post '/clips/:clip_id' do
  sql = "update clips set title = '#{params['title']}', description = '#{params['description']}', genre = '#{params['genre']}', url = '#{params['url']}' where id = #{params['clip_id']}"
  run_sql(sql)
  redirect to('/clips')
end

def run_sql(sql)
  conn = PG.connect(:dbname =>'tubedb', :host => 'localhost')
  result = conn.exec(sql)
  conn.close

  result
end


