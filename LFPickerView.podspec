Pod::Spec.new do |s|
s.name = 'LFPickerView'
s.version = '1.0'
s.license = { :type => "MIT", :file => "LICENSE" }
s.summary = '将PickerView，DatePicker封装得更加简单易用，并可搭配UITextField使用'
s.homepage = 'https://github.com/zhanglinfeng/LFPickerView'
s.authors = { '张林峰' => '1051034428@qq.com' }
s.source = { :git => 'https://github.com/zhanglinfeng/LFPickerView.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'LFBubbleView/*.{h,m}'
end
