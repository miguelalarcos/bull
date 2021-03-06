#$LOAD_PATH.unshift '..'
require 'eventmachine'
require 'em-websocket'
require 'rethinkdb'
require 'time'
require_relative 'mreport'

def start app_controller, key_path
  puts Time.now
  #MReport.load_reports

  $r = RethinkDB::RQL.new
  conn = $r.connect()

  EM.run do
    EM::WebSocket.run(:host => "0.0.0.0",
                      :port => 3000,
                      :secure => true,
                      :tls_options => {
                        :private_key_file => File.join(key_path, 'privateKey.key'), # "../../privateKey.key",
                        :cert_chain_file => File.join(key_path, 'certificate.crt') #"../../certificate.crt"
                      }
                      ) do |ws|
      controller = nil

      ws.onopen { |handshake| controller = app_controller.new ws, conn}

      ws.onmessage do |msg|
        begin
          controller.notify msg
        rescue Exception => e
          puts 'message: ', e.message
          puts 'trace: ', e.backtrace.inspect
        end
      end

      ws.onclose { controller.close; controller = nil }

      ws.onerror { |e| puts "Error: #{e.message}"}
    end
  end
end

