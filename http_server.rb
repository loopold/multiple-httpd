# http_server.rb
$stdout.reopen("out.log", "w")
$stderr.reopen("err.log", "w")
require 'socket'
require 'date'

PARAM_INSTANCE = ARGV[0].to_i

if ARGV.length != 1 || PARAM_INSTANCE > 100
  puts "Usage: ruby #{File.basename(__FILE__)} NUM"
  puts "  where NUM is number of instance to run (1-100)"
  exit
end

class WebInstance
  def initialize(num)
    @instance_no = num
    @startup_time = DateTime.parse(ENV['STARTUP_TIME']) rescue DateTime.now
    port = ( 5000 + @instance_no ).to_i
    @server = TCPServer.new port
  end
  
  def run
    while session = @server.accept
      request = session.gets
      puts request

      session.print "HTTP/1.1 200\r\n"
      session.print "Content-Type: text/html\r\n"
      session.print "\r\n"
      session.print "Server #{@server} number #{@instance_no} started at #{@startup_time}"
      session.print "\r\n"

      session.close
    end
  end
end

app1 = WebInstance.new(PARAM_INSTANCE)
app1.run
