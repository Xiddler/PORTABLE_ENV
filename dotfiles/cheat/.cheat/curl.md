# Handy guides
https://everything.curl.dev/
https://curl.se/docs/httpscripting.html

# Download a file and specify a new filename

curl http://example.com/file.zip -o new_file.zip                            (This will download file.zip and save it to new_file.zip)

->% curl -O https://github.com/pop-os/cosmic-files/blob/master/README.md    (This will download the file README.md to the current folder)

# Download a single file to display in the terminal
curl http://path.to.the/file

# Download multiple files
curl -O URLOfFirstFile -O URLOfSecondFile

# Download all sequentially numbered files (1-24)
curl http://example.com/pic[1-24].jpg

# Download a file and pass HTTP Authentication
curl -u username:password URL 

# Download a file with a Proxy
curl -x proxysever.server.com:PORT http://addressiwantto.access

# Download a file from FTP
curl -u username:password -O ftp://example.com/pub/file.zip

# Get an FTP directory listing
curl ftp://username:password@example.com

# Resume a previously failed download
curl -C - -o partial_file.zip http://example.com/file.zip

# Fetch only the HTTP headers from a response
curl -I http://example.com

# Fetch your external IP and network info as JSON
curl http://ifconfig.me/all.json

# Limit the rate of a download
curl --limit-rate 1000B -O http://path.to.the/file

# Get your global IP
curl httpbin.org/ip 

# Get only the HTTP status code
curl -o /dev/null -w '%{http_code}\n' -s -I URL

# get file contents without opening a browser
example: run a sever in the directory containing the file plaintext.html then ->% python -m http.server 7000 and then 
-> % curl 127.0.0.1/plaintext.html
 will output the contents to STDOUT

# use curl as a dictionary
->% curl dict.org/d:imminent

# get weather report
->% curl wttr.in/Limerick


