require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    params[:name].reverse
  end

  get '/square/:number' do
    @num = params[:number].to_i
    "#{@num * @num}"
  end

  get '/say/:number/:phrase' do
    @num = params[:number].to_i
    @phrase = params[:phrase]
    @new_string = ""
    @num.times {
      @new_string = @new_string + @phrase + " "
    }
    @new_string
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @values = params.values
    @sentence = @values.each_with_index.collect { |x,i| i + 1 == @values.length ? "#{x}." : "#{x} "}
  end

  get '/:operation/:number1/:number2' do
    @operation = params[:operation].downcase
    @num_1 = params[:number1].to_i
    @num_2 = params[:number2].to_i

    case @operation
    when "add"
      "#{@num_1 + @num_2}"
    when "subtract"
      "#{@num_1 - @num_2}"
    when "multiply"
      "#{@num_1 * @num_2}"
    when "divide"
      "#{@num_1 / @num_2}"
    end
  end
end
