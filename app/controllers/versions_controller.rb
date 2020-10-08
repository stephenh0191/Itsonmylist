class VersionsController < ApplicationController
	def revert
		@versions = Version.find(params[:id])
		if @versions.reify
		@versions.reify.save!
	else
		@versions.item.destroy
	end
	link_name =params [:redo] == "true" ? "fa fa-undo fa-lg" : "redo"
	link = view_context.link_to(link_name, revert_version_path(@version.next, :redo => !params[:redo]), :method => :post)
	redirect_to :back, notice: => "Action reverted! #{@version.event}. #{link}"
	end
end
