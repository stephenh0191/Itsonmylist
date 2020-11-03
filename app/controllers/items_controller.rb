class ItemsController < ApplicationController
	before_action :find_item, only: [:show, :edit, :update, :destroy]

	def index
		if user_signed_in?
			@items = Item.where(:user_id => current_user.id).order("created_at DESC")
	#	else
		#	@category_id = Category.find_by(name: params[:category]).id
		#	@items = Item.where(:category_id => @category_id).order("Created_at DESC")
		end
	end

	def show
	end

	def new
		@item = current_user.items.build
		@genres = Category.all.map{|c| [c.name, c.id]}
	end

	def create
		@item = current_user.items.build(item_params)
		if @item.save
			redirect_to root_path, :notice =>  "Congrats! Task was created!"
		else
			render 'new' 
		end
	end

	def edit
	end

	def update
		if @item.update(item_params)
			redirect_to item_path(@item), :notice =>  "Congrats! Task was updated!"
			undo_link = view_context.link_to("")
		else
			render 'edit'
		end
	end

	def destroy
		@item.destroy
		redirect_to root_path , :notice => "Task was Deleted! To Revert click. "#{undo_link}
	end

	def complete
		@item = Item.find(params[:id])
		@item.update_attribute(:completed_at, Time.now)
		redirect_to root_path  , :notice => "To undo completed task please click" #{undo_link}"
		
	end
	

	private
	
	def item_params
		params.require(:item).permit(:title, :description)
	end

	def find_item
		@item = Item.find(params[:id])
	end
	# def undo_link
	# 	view_context.link_to("undo",revert_version_path(@item.versions.scope.last), :method => :post)
	# end
end