Pod::Spec.new do |s|
  s.name         = 'IOSKnobControl'
  s.version      = '1.0'
  s.license      = 'BSD'
  s.homepage     = 'https://github.com/jdee/ios-knob-control'
  s.authors      =  {'Jimmy Dee' => 'jgvdthree@gmail.com'}
  s.summary      = ''

# Source Info
  s.platform     =  :ios, '7.0'
  s.source       =  {:git => 'https://github.com/jdee/ios-knob-control.git', :branch => 'master'}
  s.source_files = 'IOSKnobControl.{h,m}'
  s.requires_arc = true

end