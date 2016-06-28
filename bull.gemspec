Gem::Specification.new do |s|
  s.name        = 'bull'
  s.version     = '0.0.0'
  s.date        = '2016-06-27'
  s.summary     = "Bull Framework"
  s.description = "Bull Framework. A realtime web framework"
  s.authors     = ["Miguel Alarcos"]
  s.email       = 'miguel.alarcos@gmail.com'
  s.files       = ["lib/bull/client.rb", "lib/bull/encode_times.rb", "lib/bull/symbolize.rb", "lib/bull/notification.rb", "lib/bull/mrelogin.rb",
                  "lib/bull/reactive_var.rb", "lib/bull/ui_core.rb", "lib/bull/utils.rb", "lib/bull/bcaptcha.rb",
                  "lib/bull/ui_common.rb", "lib/bull/server.rb", "lib/bull/start.rb", "lib/bull/mreport.rb"]
  s.homepage    = ''
  s.license     = 'MIT'
  s.add_runtime_dependency 'opal', '0.8.0'
  s.add_runtime_dependency 'reactive-ruby'
  s.add_runtime_dependency 'uglifier'
  s.add_runtime_dependency 'webrick'
end
