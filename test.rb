require 'httpclient'

NUM_OF_THREAD=30
START_TIME_OFFSET=1

clnt = HTTPClient.new
clnt.debug_dev = STDOUT
clnt.connect_timeout = 5
clnt.receive_timeout = 5

threads = []
NUM_OF_THREAD.times do
    sleep START_TIME_OFFSET
    threads << Thread.new do
        begin
            t0 = Time.now
            response = clnt.get("https://www.example.com/"){ |data|
                # print data
            }
            # p response.contenttype
            p "Fin XD ExecTime:#{Time.now - t0}s"
        rescue => e
            p "ERROR. ExecTime:#{Time.now - t0}s"
            p e
            puts e.backtrace.join("\n")
        end
    end
end

threads.each {|t| t.join}
