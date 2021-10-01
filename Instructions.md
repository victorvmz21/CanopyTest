# Canopy iOS Technical Assessment

Here's a starter Xcode project, a basic financial dashboard app. It has a single view, displaying the amount of money in a person's account. The view is built programmatically with some help from SnapKit, a third party library that makes it more efficient to define AutoLayout constraints to the view elements. Please do the following tasks, and then upload your project to Github and provide the link or zip up your finished work. Plan on walking us through your code via screen share and Xcode.

**Part One**

There are a few UI bugs in the app that were reported and need fixing:
- The design calls for a navigation bar title. The view model defines a string for the navigation bar title, but the view is not showing that value.
- The amount label is showing a different, unformatted string instead of the actual one provided by the view model.

** Part Two**

- Add a centered button at the bottom of the screen titled "Account Details". Give the button a background color of your choice and round the corners (4 pt radius) and a width of 2/3 of the screen width.
- Tapping this button should launch another view (can be pushed on the navigation stack or presented modally from the bottom). If the view is presented modally, make sure a user can somehow dismiss the new view.

This new view can be built using your choice of UI method: Storyboard, programmatic UIKit (how the first view is built), or SwiftUI. All we ask is that the view be built using either MVC or MVVM architecture. Prepare to walk us through which architecture you chose and why. The data for this new view is found in `AccountData.json`.

- This new view should display the user's name, a label that reads "Customer since: " and the date formatted like "Mar 3, 2021".
- Show a list of the user's bank accounts and display all the data provided, again formatting the date like "Mar 3, 2021". Consider how your view might handle a user who has 10 or more bank accounts.

Don't feel obligated to spend more than a couple hours on this. We want to evaluate your coding and not your UI design skills for the new view.


