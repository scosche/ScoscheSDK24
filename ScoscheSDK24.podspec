Pod::Spec.new do |s|
    s.name         = "ScoscheSDK24"
    s.version      = "0.2.6"
    s.summary      = "Framework for communicating with Scosche Rythmn 24"
    s.description  = <<-DESC
    Framework for communicating with Scosche Rythmn 24.
    DESC
    s.homepage     = "https://www.scosche.com"
    s.license      = "MIT"
    s.author       = { "NPE" => "scosche@npe-inc.com" }
    s.source       = { :git => "scosche/ScoscheSDK24.git", :tag => "#{s.version}" }
    s.vendored_frameworks = "ScoscheSDK24.framework"
    s.platform = :ios
    s.swift_version = "5"
    s.ios.deployment_target  = "12.0"
end