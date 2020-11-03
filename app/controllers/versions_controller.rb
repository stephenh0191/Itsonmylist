# class VersionsController < ApplicationController
# 		PaperTrail::Version.where('created_at < ?', 1.day.ago).delete_all
# 		def revert
# 			@version = Version.find(params[:id])
# 			@version.reify
# 			@version.reify.save!
# 			else
# 			@version.item.destroy
# 			end
# 			link_name = params[:redo] == "true" ? "undo" : "redo"
# 			link = view_context.link_to(link_name, revert_version_path(, @Version.next, :redo => !params[:redo]), :method => :post)
# 			redirect_to :back, :notice => "Undid #{@Version.event}. #{link}"
# 		end
	
# end
