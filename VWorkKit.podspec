Pod::Spec.new do |s|
  s.name         = "VWorkKit"                #名称
  s.version      = "0.0.4"                  #版本号
  s.summary      = "VWork项目库"               #简短介绍
  s.description  = <<-DESC 
                      包含VWork所有项目模块
                   DESC
  s.homepage     = "https://github.com/xiexingyu"
  s.license      = "MIT"                    #开源协议
  s.author             = { "xiexingyu" => "281266447@qq.com" }
  s.source       = { :git => "https://github.com/xiexingyu/VWorkKit.git", :tag => s.version }
  s.platform     = :ios, "8.0"              #支持的平台及版本
  s.requires_arc = true                     #是否使用ARC
  s.frameworks   = 'UIKit', 'Foundation'    #所需的framework,多个用逗号隔开
  s.subspec 'Affair' do |affair|
      affair.source_files = 'VWorkKit/Classes/Affair/**/*'
      affair.resource_bundles = {
        'affair' => ['VWorkKit/Assets/Affair/*']
      }
      affair.dependency 'AFNetworking', '~> 3.0.4'
      affair.dependency 'YYKit'
      affair.dependency 'MJRefresh'
      affair.dependency 'WXKit', '~> 0.0.7'
      affair.dependency 'ReactiveObjC', '~> 2.1.2'
  end
end