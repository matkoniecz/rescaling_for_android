# requires imagemagick
# on Ubuntu installable with
# sudo apt-get install imagemagick

def execute_command(command)
  puts command
  `#{command}`
end

def rescale_square(input_filepath, output_folder_path, size)
  output_filename = File.basename(input_filepath, ".*") + ".jpg"
  output_filepath = File.join(output_folder_path, output_filename)
  # recommended para,eters from https://stackoverflow.com/a/44208640/4130619
  convert_command = "-resize #{size}x#{size} -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace RGB"
  execute_command("convert \"#{input_filepath}\" #{convert_command} \"#{output_filepath}\"")
end

def generate_drawable(input_filepath, output_path_root)
  drawables = [
    { name: "drawable-mdpi", size: 128 },
    { name: "drawable-hdpi", size: 192 },
    { name: "drawable-xhdpi", size: 256 },
    { name: "drawable-xxhdpi", size: 384 },
  ]
  drawables.each do |drawable|
    output_folder_path = output_path_root + drawable[:name]
    rescale_square(input_filepath, output_folder_path, drawable[:size])
  end
end

def main
  output_path_root = "/home/mateusz/Documents/StreetComplete/app/src/main/res/"
  Dir["*.{png,jpg,jpeg}"].each do |file|
    generate_drawable(file, output_path_root)
  end
end

main
