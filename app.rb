require "sinatra"
require "sinatra/reloader"
require "active_support/all"


get("/square/new") do
 
  erb(:square_new)
end

get("/square/results") do
   @number = params.fetch("number")

  @result = @number.to_i * @number.to_i
  erb(:square_results)
end

############################################################################
get("/square_root/new") do

  erb(:square_root_new)
end
get("/square_root/results") do
  @user_number = params.fetch("user_number").to_i
  @user_result = Math.sqrt(@user_number)
  erb(:square_root_result)
end


########################################################################

get("/payment/new") do

  erb(:payment_new)
end

get("/payment/results") do
  user_apr = params.fetch("user_apr").to_f
  
  @apr_result = (user_apr / 100) / 12

  @years = params.fetch("user_years").to_i
  months = @years * 12

  @principal = params.fetch("user_pv").to_i.to_fs(:currency, { :precision => 2 })

  @payment = (@apr_result * @principal) / (1 - (1+ @apr_result) ** - months).to_fs(:currency, { :precision => 2 })

  erb(:payment_result)
end
############################################################################
get("/random/new") do

  erb(:random_new)
end
