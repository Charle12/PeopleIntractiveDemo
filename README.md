# PeopleIntractiveDemo

Requirement:

You are expected to implement a simple navigational application consisting of two screens. 

First one, which is aLanding screen & that would be a list of users where every user has some information like

* Name 
* Phone & Website
* Company Name
* Star




We'll are using the most viewed section of this API.https://jsonplaceholder.typicode.com/users To test this API, For testAPI we used

This is configurable in ServiceHelper.Swift file in Project. We used MVVM Design pattern and swift generic approach to develop this application. For CI/CD App using XcodeServer + Fastlane combination.

We are generating TestCase and Coverage report using three tools, you can opt out any one as per your connivance:

* XcodeServer TestCase and Coverage report.
* Fastlane+scan+slather TestCase and Coverage reports.
* SonarQube TestCase and Coverage reports.

# App Flow:


<img src="https://media.giphy.com/media/Toc9RLeVSxdwCKb3XV/giphy.gif" width="414" height="896" />


# Tools And Resources Used

* CocoaPods - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 33 thousand libraries and is used in over 2.2 million apps. CocoaPods can help you scale your projects elegantly.
* fastlane - The easiest way to automate building and releasing your iOS and Android apps.
* SonarQube - SonarQube provides the capability to not only show health of an application but also to highlight issues newly introduced. With a Quality Gate in place, you can fix the leak and therefore improve code quality systematically.
* SwiftLint - A tool to enforce Swift style and conventions.
* Sonar-swift - This is an open source initiative for Apple Swift language support in SonarQube.

# TODO

* Sorting option for user to sort article based popularity, Date, Alphabetically
* Configure fastlane lanes/XcodeServerBot for build creation and provising and certificate managment.
* Configure Fastlane lanes for build upload on iTunesConnect.

# Installation

* Installation by cloning the repository
* Go to directory
* use command + B or Product -> Build to build the project
* Press run icon in Xcode or command + R to run the project on Simulator

# CI/CD

* Xcode Server + Fastlane combination is used for CI/CD. Xcode server bots post script will be used to trigger fastlane lanes. We canrun them using terminal also.

# XcodeServer And XcodeServer Bot

* Xcode server is setup on local development machine with a new user. Steps for Xcode Server Setup: https://developer.apple.com/library/content/documentation/IDEs/Conceptual/xcode_guide-continuous_integration/index.html

* Xcode Bot is setup on development machine with git configuration using master branch. Bot run periodically once per-day and configured for the following jobs:

* Pull changes from remote repository if there any .
* Configure to test parallel on specific simulator.
* Run unit test cases.
* Run UI Test cases.
* Run the Static analyser for leaks and warnings.
* Generate the report for UnitTest,UITest,Static analyser on project codebase.
* We did not setup for exporting the build or code-singing for now as iTunes credential required. Once credential is there we can setup these activity by re-edit the XcodeServer Bot .
* Post script for trigger fastlane lanes for screen shot and fastlane+scan code coverage.
* To run fastlane lanes configure PATH in XcodeServer Bot configuration under environment tab

# PATH="/usr/local/bin:$PATH"

# XcodeServer Bot TestCase Code Coverage Report: 75.00%

* Total TestCase: 11
* Passed : 11
* Failed: 0
* TestCase Code Coverage: 75.00%

<a href="https://ibb.co/k9m3gcN"><img src="https://i.ibb.co/dLmb0K8/Screen-Shot-2021-02-06-at-1-39-56-AM.png" alt="Screen-Shot-2021-02-06-at-1-39-56-AM" border="0"></a><br /><a target='_blank' href='https://nonprofitlight.com/nh/swanzey/monadnock-humane-society-inc'>monadnock humane society</a><br />

<a href="https://ibb.co/s5n78kL"><img src="https://i.ibb.co/Fs2pRNG/Screen-Shot-2021-02-06-at-1-40-21-AM.png" alt="Screen-Shot-2021-02-06-at-1-40-21-AM" border="0"></a><br /><a target='_blank' href='https://nonprofitlight.com/md/bethesda/one-schoolhouse-inc'>one schoolhouse</a><br />

# Fastlane

Fastlane is setup on Xcode server and integrated in development project also for following activity (Lane):

* Generating TestCase success and code coverage reports using scan and slather.
* Generating screen shot.
* We did not setup code-singing for now as iTunesConnect credential required. Once credential is there we can setup these activity by creating new lane.
Installation

* Make sure you have the latest version of the Xcode command line tools installed:

# xcode-select --install

* Install fastlane using gem install fastlane

* For fastlane test coverage report install scan and slather

* Install scan using gem install scan

* Install slather using gem install slather

# Running The Tests Manually

Follow the steps to get test case reports:

* Enable coverage Data under test schema section:
* Select the Test Icon by pressing and holding Xcode Run Icon OR press Command+Control+U
* In the Project Navigator under Test Navigator tab, check test status and coverage

# Architecture

We used MVVM :

<a href="https://ibb.co/88n9h2C"><img src="https://i.ibb.co/12YTSKg/41942613-a4008032-79bd-11e8-98b5-a40e7d871203.png" alt="41942613-a4008032-79bd-11e8-98b5-a40e7d871203" border="0"></a>
