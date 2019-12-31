#
# Be sure to run `pod lib lint BEKSpeechToText.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BEKSpeechToText'
  s.version          = '1.0.1'
  s.summary          = 'A short description of BEKSpeechToText.'
  s.summary      = "A Swift Library to Convert Speech to Text Using Google API"
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A Swift Library to Convert Speech to Text Using Google API.
Using the configuration you can change the language from the default (Persian) to all google supported languages.
                       DESC

  s.homepage         = 'https://github.com/behrad-kzm/BEKSpeechToText'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'behrad-kzm' => 'behrad.kzm@gmail.com' }
  s.source           = { :git => 'https://github.com/behrad-kzm/BEKSpeechToText.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.social_media_url = 'https://web.telegram.org/#/im?p=@berad'
  s.swift_versions = '5.0'
  s.source_files = 'BEKSpeechToText/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BEKSpeechToText' => ['BEKSpeechToText/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
