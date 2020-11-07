class VideoUploader < CarrierWave::Uploader::Base

    #
    # Modules
    #

    include CarrierWave::Video
    include CarrierWave::Video::Thumbnailer
    include CarrierWave::MiniMagick

    #
    # Configs
    #

    ##
    # Choose what kind of storage to use for this uploader:
    storage :file

    #
    # Methods
    #

    ##
    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    ##
    # Create different versions of your uploaded files:
    # Default thumb for the videos
    version :thumb do
        process thumbnail: [{format: 'png', quality: 10, size: 192, strip: true, logger: Rails.logger}]

        def full_filename for_file
            png_name for_file, version_name
        end
    end

    ##
    # Create different versions of your uploaded files:
    # Low resolution thumb for the videos
    version :small_thumb, from_version: :thumb do
        process resize_to_fill: [20, 200]
    end

    def png_name(for_file, version_name)
        %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.png}
    end

    ##
    # Override the filename of the uploaded files:
    # Avoid using model.id or version_name here, see uploader/store.rb for details.
    def filename
        original_filename.chomp(File.extname(original_filename)) + '.mp4'
    end

    ##
    # Build the uploaded file name
    def full_filename(for_file)
        super.chomp(File.extname(super)) + '.mp4'
    end
end
