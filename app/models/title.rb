class Title < ApplicationRecord
	require 'streamio-ffmpeg'
	
	mount_uploader :file, VideoUploader

	#after_create :setDuration

	private
		#def self.setDuration id
			##self.update(duration: (FFMPEG::Movie.new("public/uploads/title/file/#{self.id}/#{self.file.url}") / 60).to_i)
			#title = Title.find id
			#title.update(duration: (FFMPEG::Movie.new("public/uploads/title/file/#{title.id}/#{title.file.url}") / 60).to_i)
		#end
end