# Simple Website Visit Farming Bash Script

### Features

- Checks for internet connection
- Checks for needed packages
- Continuously requests website using curl
- Visits website in 1 to 10 parallel processes (for faster execution)
- Suitable for lower-end systems
- By default limited to 1 second delay and max 10 parallel processes
- curl requests are randomized with rotation of User-Agent and other headers
- curl doesn't store session or cookies (filters non-IP rate limiting mechanisms)
- Intended to farm views on websites (like GItHub,...)
- This is not a DDoS program! Don't use it as such!

### Necessary packages

Install them by using appropriate command of your linux distro/flavour<br />
Example: `sudo apt-get install parallel`

- curl
- parallel
- bc

### How-to

- clone this GitHub repository<br />
`git clone https://github.com/BakirGracic/simple-website-views-farming-script.git`

- 'cd' into the repo directory<br />
`cd simple-website-views-farming-script`

- add execution permission (root or sudo perm needed)<br />
`sudo chmod +x script.sh`

- execute the script<br />
`./script.sh`

- input script variables best suiting your needs

### Possible improvements

- implement in-script changing proxy to peroodically change requesting IP address to make vistis more natural and to avoid rate limiting on certain systems
- make .bat (Windows compatible) version

### Recommended use
- spin up a VPS, do 'How-to' steps, and leave the script running
- you can also do it directly on your own linux-flavoured machine

### Make sure to use this script legally and lawfully and at your own risk!
