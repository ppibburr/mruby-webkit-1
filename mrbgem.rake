  ## Conflicts with `mruby-webkitgtk-3`
  ##                `mruby-gtk3`
  
  MRuby::Gem::Specification.new('mruby-webkitgtk-1') do |spec|
    spec.license = 'MIT'
    spec.authors = ['ppibburr']
    spec.version = "0.0.0"
    
    spec.add_dependency('mruby-gtk2', '>= 0.0.0')     
  end
