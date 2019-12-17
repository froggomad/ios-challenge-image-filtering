# Image Filtering

### Instructions

**Please read this entire README to make sure you understand what is expected of you before you begin.**

This challenge is to implement something that you haven't been specifically taught at this point in the iOS Track at Lambda School.

Begin by forking this repository. Clone your forked repository to your machine. Use the provided Xcode project in the repository as it contains the image you will need to filter. Commit as appropriate while you work. Push your final project to GitHub, then create a pull request back to this original repository.

Good luck!

### Screen Recording

Please view the screen recording so you will know what your finished project should look like:

![](https://tk-assets.lambdaschool.com/8a3d5a7a-3b76-4a32-a27d-37a5fd7b040c_LionImageFiltering.gif)

(The gif is fairly large in size. It may take a few seconds for it to appear)

## Requirements

For this challenge, you will take the image that is in the image view and use `Core Image` to filter it using the `CIPhotoEffectInstant` filter.

The starter project includes the view controller with outlets and an action set up for you. There is also an `ImageFilterer` class. In this class you will see a `let context = CIContext(options: nil)`. This will be necessary to filter the image. Do not remove or change it.

Along with that, there is a function called `func filterImage(_ image: UIImage?) -> UIImage?`. You can write additional functions if needed in the `ImageFilterer` class, but this should be the function where the filtering ultimately happens. The `UIImage?` you should return is the filtered image.

The view controller's `filterImage` action should call the `ImageFilter`'s

You are allowed to use any resource available to you aside from asking someone else or looking at their code. This assessment is to test your personal resourcefulness. If someone gives you the answer, that defeats the purpose. 😉

