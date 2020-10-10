class VersionsController < ApplicationController
		PaperTrail::Version.where('created_at < ?', 1.day.ago).delete_all
		def revert
			@item = Item.find(params[:id])
			if @item.blank?
			format.html {redirect_to(rooth_path, :notice => 'Record not found') }
			elsif @item.reify
			@item.reify.save!
			else
			@item.item.destroy
			end
			link_name = params[:redo] == "true" ? "undo" : "redo"
			link = view_context.link_to(link_name, revert_version_path(@item.next, :redo => !params[:redo]), :method => :post)
			redirect_to :back, :notice => "Undid #{@item.event}. #{link}"
		end
	
end
