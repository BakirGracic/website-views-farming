# Simple Website Views Farming Bash Script

### Features

- Checks for internet connection
- Checks for needed packages
- Continuously requests website using `curl`
- Visits website in 1 to 10 parallel processes
- Suitable for lower-end systems
- By default limited to 1 second delay and max 10 parallel processes
- `curl` requests are randomized with rotation of `User-Agent` and other headers
- `curl` doesn't store session or cookies (this filters non-IP rate limiting mechanisms)
- Intended to farm views on websites
- This is not a DDoS program! Don't use it as such!

### Necessary packages

- `curl`
- `parallel`
- `bc`

You can install them all using (for Debian): `sudo apt-get install curl parallel bc`

### How-to

- clone this GitHub repository<br />
`git clone https://github.com/BakirGracic/website-views-farming.git`

- 'cd' into the repo directory<br />
`cd website-views-farming`

- add execution permissions<br />
`sudo chmod +x script.sh`

- execute/start the script<br />
`./script.sh`

- input script variables best suiting your needs

<hr />

### Make sure to use this script legally and lawfully and at your own risk!
