#
# Be sure to run `pod lib lint DAOBarBadge.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DAOBarBadge'
  s.version          = '0.1.1'
  s.summary          = 'A simple badge for shopping cart bar item or some what.'
  s.swift_versions   = '5.0' 

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Simply add DAOBarBadge in your navigation bar by IB or code view.'

  s.homepage         = 'https://github.com/daoseng33/DAOBarBadge'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DAO' => 'daoseng33@gmail.com' }
  s.source           = { :git => 'https://github.com/daoseng33/DAOBarBadge.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'DAOBarBadge/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DAOBarBadge' => ['DAOBarBadge/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
