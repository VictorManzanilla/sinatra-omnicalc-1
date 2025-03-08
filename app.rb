require "sinatra"
require "sinatra/reloader"
require "active_support/all"


get("/square/new") do
 
  erb(:square_new)
end

get("/square/results") do
   @number = params.fetch("number").to_f

  @result = @number * @number
  erb(:square_results)
end

############################################################################
get("/square_root/new") do

  erb(:square_root_new)
end
get("/square_root/results") do
  @user_number = params.fetch("user_number").to_f
  @user_result = Math.sqrt(@user_number).to_f
  erb(:square_root_result)
end


########################################################################

get("/payment/new") do

  erb(:payment_new)
end

get("/payment/results") do
  user_apr = params.fetch("user_apr").to_f
  
  @apr_result = (user_apr / 100) / 12
  @formatted_apr = (@apr_result * 100).to_fs(:percentage, { :precision => 4} )
  

  @years = params.fetch("user_years").to_i
  months = @years * 12

  @principal = params.fetch("user_pv").to_f

  @payment = (@apr_result * @principal) / (1 - ((1 + @apr_result.to_f) ** -months))
  @formatted_payment = @payment.to_fs(:currency, precision: 2)

  erb(:payment_result)
end
############################################################################
get("/random/new") do
  
  erb(:random_new)
end

get("/random/results") do
  @minimum = params.fetch("user_min").to_f
  @maximum = params.fetch("user_max").to_f

  @rand_num = rand(@minimum..@maximum).to_f
  erb(:random_results)
end
