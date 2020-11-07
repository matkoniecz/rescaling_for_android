# requires imagemagick
# on Ubuntu installable with
# sudo apt-get install imagemagick

def main
  output_path_root = "/home/mateusz/Documents/install_moje/StreetComplete/app/src/main/res/"
  raise "nonexisting folder" if Dir.exist?(output_path_root) == false
  Dir["*.{png,jpg,jpeg}"].each do |file|
    generate_drawable(file, output_path_root)
  end
end

def generate_drawable(input_filepath, output_path_root)
  drawables_standard = [
    { name: "drawable-mdpi", size: '128x128' },
    { name: "drawable-hdpi", size: '192x192' },
    { name: "drawable-xhdpi", size: '256x256' },
    { name: "drawable-xxhdpi", size: '384x384' },
  ]
  # for example ramp quest, kerb height quest
  drawables_for_two_by_two_column = [
    { name: "drawable-mdpi", size: '160x120' },
    { name: "drawable-hdpi", size: '240x180' },
    { name: "drawable-xhdpi", size: '320x240' },
    { name: "drawable-xxhdpi", size: '480x360' },
  ]
  drawables = drawables_standard
  #drawables = drawables_for_two_by_two_column
  drawables.each do |drawable|
    output_folder_path = output_path_root + drawable[:name]
    rescale_square(input_filepath, output_folder_path, drawable[:size])
  end
end

def rescale_square(input_filepath, output_folder_path, size)
  output_filename = File.basename(input_filepath, ".*") + ".jpg"
  output_filepath = File.join(output_folder_path, output_filename)
  # recommended parameters from https://stackoverflow.com/a/44208640/4130619
  convert_command = "-resize #{size} -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace RGB"
  execute_command("convert \"#{input_filepath}\" #{convert_command} \"#{output_filepath}\"")
end

def execute_command(command)
  puts command
  `#{command}`
end

main
