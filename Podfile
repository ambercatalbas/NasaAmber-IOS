# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

# Comment the next line if you don't want to use dynamic frameworks
use_frameworks!

workspace 'NasaAmberIOS'

target 'NasaAmberIOS' do

 project 'NasaAmberIOS.xcodeproj'


  # Pods for NasaAmberIOS

   # Network
   pod 'Alamofire', '~> 5.4'
   
   # Helper
   pod "TinyConstraints", '~> 4.0'
   pod 'Segmentio', '~> 4.1'
   pod 'SwiftGen', '~> 6.5'
   pod 'SwiftLint', '~> 0.44'
   pod 'MobilliumBuilders', '~> 1.4'
   pod 'Kingfisher', '~> 7.0'
   target 'NasaAmberIOSTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NasaAmberIOSUITests' do
    # Pods for testing
  end

end

target 'DataProvider' do
  
  project 'DataProvider/DataProvider.xcodeproj'
  
  # Pods for DataProvider
  
  # Network
  pod 'Alamofire', '~> 5.4'
  target 'DataProviderTests' do
    inherit! :search_paths
    # Pods for testing
    
    # Network
    pod 'Alamofire', '~> 5.4'
    
  end
  
end

target 'Utilities' do
  
  project 'Utilities/Utilities.xcodeproj'
  
  # Pods for Utilities
  
  # Helper
  
  target 'UtilitiesTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
end

post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = '$(inherited)'
        end
    end
end
