>  but how on earth do I manage to get the pictures into Android Studio?

Android app expects images to be provided not once, but into multiple sizes.

Manual resizing images and putting them into `app/src/main/res/drawable-mdpi`, `app/src/main/res/drawable-hdpi`, `app/src/main/res/drawable-xhpi`, `app/src/main/res/drawable-xxhdpi` folders is quite obnoxious.

I was unable to automate it using built-in Android Studio feature, or with a working plugin.

I ended creating this Ruby script achieving this.

It can rescale images for Android programs at proper locations.

For now script features hardcoded path, feel free to create an issue if more generic CLI tool would be useful for you.

If you want I may document it better and maybe make it properly configurable. Its dependencies is Ruby (for running script) and imagemagick (for image resizing).

Script is pretty trivial and in the ends it just runs some commands, so porting it to Bash or whatever else should be fairly easy if you want to do this.

## Usage

- Clone this repository.
- Modify hardcoded path (feel free to create an issue if more generic CLI tool would be useful for you)
- Put images into folder with the script
- Run `ruby rescale.rb`
