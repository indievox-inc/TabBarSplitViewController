Pod::Spec.new do |spec|
  spec.name = "TabBarSplitViewController"
  spec.version = "1.0.0"
  spec.summary = "Adaptive UISplitViewController with UITabBarController as primary view controller."
  spec.homepage = "https://github.com/indievox-inc/TabBarSplitViewController"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Denken" => 'denkeni@indievox.com' }
  spec.social_media_url = "https://twitter.com/denkeni"

  spec.platform = :ios, "8.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/indievox-inc/TabBarSplitViewController.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "TabBarSplitViewController/**/*.{h,swift}"
end
