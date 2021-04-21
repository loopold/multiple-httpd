desc "Start some http servers, where \"num\" is a quantity"
task :start_http_servers, [:num] do |t, args|
  $inst = args.num.to_i
  if $inst > 100
    $inst = 100
  end
  if $inst < 1
    $inst = 1
  end
  $i = $inst
  while $i > 0 do
    system "ruby http_server.rb #{$i} &" 
    sleep(1)
    $i -= 1
  end
end