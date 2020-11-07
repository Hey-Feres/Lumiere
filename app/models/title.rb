# frozen_string_literal: true

class Title < ApplicationRecord
	require 'streamio-ffmpeg'

	mount_uploader :file, VideoUploader

end