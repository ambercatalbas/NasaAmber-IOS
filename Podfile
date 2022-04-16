# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

workspace 'NasaAmberIOS'

target 'NasaAmberIOS' do

 project 'NasaAmberIOS.xcodeproj'


  # Pods for NasaAmberIOS

   # Network
   pod 'Alamofire', '~> 5.4'
   
   # Helper
   pod "TinyConstraints", '~> 4.0'
   pod "IQKeyboardManagerSwift", '~> 6.5'
   pod 'SwiftLint', '~> 0.44'
   pod 'MobilliumBuilders', '~> 1.4'
   pod 'Kingfisher', '~> 6.3.1'

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

target 'UIComponents' do

  project 'UIComponents/UIComponents.xcodeproj'
  
  # Pods for UIComponents
  
  # Helper
  pod "TinyConstraints", '~> 4.0'
  pod 'SwiftGen', '~> 6.5'
  pod 'MobilliumBuilders', '~> 1.4'
  pod 'Kingfisher', '~> 6.3.1'
  pod 'SwiftEntryKit', '~> 1.2'
  
  target 'UIComponentsTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
end
