class Title < ApplicationRecord
	require 'streamio-ffmpeg'

	mount_uploader :file, VideoUploader

end