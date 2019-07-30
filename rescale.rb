# requires imagemagick
# on Ubuntu installable with
# sudo apt-get install imagemagick
def rescale_square(input_filepath, output_folder_path, size)
  input_filepath = input_filepath.replace(/\.[^\.].*$/) + ".jpeg"
  output_filepath = "#{output_folder_path}#{output_file}"
  convert_command = "resize #{size}x#{size}"
  `convert "#{input_filepath}" #{convert_command} "#{output_filepath}"`
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
  generate_drawable(ARGV[0], output_path_root)
end

main
