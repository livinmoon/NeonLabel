Pod::Spec.new do |s|
  s.name             = 'NeonLabel'
  s.version          = '1.0.0'
  s.summary          = 'A UILabel-like component with customizable neon light effects using Core Animation.'
  s.description      = <<-DESC
  NeonLabel is a lightweight UILabel alternative that renders glowing neon text using CATextLayer and CATextLayer.
                       DESC

  s.homepage         = 'https://github.com/livinmoon/NeonLabel'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'livinmoon' => 'livinmoon@gmail.com' }
  s.source           = { :git => 'https://github.com/livinmoon/NeonLabel.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '10.0'
  s.source_files = 'NeonLabel/Classes/**/*'
end
