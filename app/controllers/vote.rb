post '/vote/:type/:id/:up_down' do

  	target = params[:type].constantize.find(params[:id])
  	target.votes.create(value: params[:up_down])
	if request.xhr?
		erb :"vote-buttons", layout: false, locals: { data: target }
	else
  		redirect back
	end
end
