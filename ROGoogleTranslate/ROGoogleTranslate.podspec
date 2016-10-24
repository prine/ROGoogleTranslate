#
# Be sure to run `pod lib lint ROGoogleTranslate.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
    spec.name         = 'ROGoogleTranslate'
    spec.version      = '0.0.1'
    spec.license      = { :type => 'MIT' }
    spec.homepage     = 'https://github.com/prine/ROGoogleTranslate'
    spec.authors      = { 'Robin Oster' => 'work@prine.ch' }
    spec.summary      = 'Simplifies the usage of the Google Translate API via Swift'
    spec.source       = { :git => 'https://github.com/prine/ROGoogleTranslate.git', :tag => "0.0.1" }
    spec.source_files = 'Source/**/*'
    spec.framework    = 'SystemConfiguration'
    spec.ios.deployment_target  = '9.0'
end
