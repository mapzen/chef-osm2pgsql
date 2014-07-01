def install_with_make_ark(ark)
  ChefSpec::Matchers::ResourceMatcher.new(:ark, :install_with_make, ark)
end
