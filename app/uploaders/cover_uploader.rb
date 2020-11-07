class CoverUploader < CarrierWave::Uploader::Base
    #
    # Modules
    #

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
    # Landscape
    version :landscape do
        process resize_to_fit: [200, 50]
    end

    ##
    # Create different versions of your uploaded files:
    # Poster
    version :poster do
        process resize_to_fit: [50, 200]
    end

    ##
    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_whitelist
        %w(jpg jpeg gif png)
    end
end
