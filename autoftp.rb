require 'net/ftp'

  def connect_ftp(host)
    $ftp = Net::FTP.new(host)
    $ftp.login("username","password")
  end
  
  def list_file(file)
    connect_ftp("ftp_Server")
    files = $ftp.chdir('path/')
    files = $ftp.list("*#{file}*")
	if files.length >0
	 puts files
	else
	 puts ""
	 puts "Can't find the file of match #{file}"
	end
  end
  
  def download_file(rfilename,localfile)
    connect_ftp('ftp_server')
    files = $ftp.chdir('path/')
	$ftp.getbinaryfile(rfilename, localfile, 1024)
  end

puts ""
puts " ------------- Menu ---------- "
puts ""
puts "1-- List the files"
puts ""
puts "2-- Download the file"  
puts ""
puts "Please select..."
puts ""

option = gets.chomp

case option
  when "1" 
   puts ""
   puts "Please put keyword of file name"
   listfile = gets.chomp
   list_file(listfile)
   puts "Need to download the package(y/n) ?"
   y_n = gets.chomp
   if y_n == "y" || y_n =="Y"
     puts ""
     puts "Please puts file name"
     rfilename = gets.chomp
     puts ""
     puts "Please puts store path of local"
     storepath = gets.chomp
     loaclpath = storepath +"\\"+ "#{rfilename}"
     download_file(rfilename,loaclpath)
	 puts "The file be stored under #{loaclpath}."
   end  
  when "2"
   puts ""
   puts "Please puts file name"
   rfilename = gets.chomp
   puts ""
   puts "Please puts store path of local"
   storepath = gets.chomp
   loaclpath = storepath +"\\"+ "#{rfilename}"
   download_file(rfilename,loaclpath)
   puts "The file be stored under #{loaclpath}."
end
  
