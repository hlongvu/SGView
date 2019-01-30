#
# Be sure to run `pod lib lint SGView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SGView'
  s.version          = '0.1.0'
  s.summary          = 'Airbnb/Epoxy Inspired Models-View Frameworks for iOS. Building complex screens for iOS by UITableView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  To build a long and complex ui screen is a tedious task. We often using UITableView to make this kind of screen. Inspired by Airbnb/Epoxy library, I recreate a small and lightweight similar library for iOS. This library handles all the complex and repeatible task when dealing with UITableView DataSource and Delegate, and showing a nicer and cleaner API.

                       DESC

  s.homepage         = 'https://github.com/hlongvu/SGView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hlongvu' => 'hlongvu@gmail.com' }
  s.source           = { :git => 'https://github.com/hlongvu/SGView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'SGView/Classes/**/*'
  s.swift_version = '4.2'
  # s.resource_bundles = {
  #   'SGView' => ['SGView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
