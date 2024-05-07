# Nginx Maintenance Example

This project is a simple example that demonstrates maintenance status using an Nginx server.

## Descrption

### flow

1. If a `maintenance/block-access` file exists, all requests will receive a 503 response.
2. If testing of maintenance results is necessary, delete the `maintenance/block-access` file and create a `maintenance/ip-access` file.
3. If there is a `maintenance/ip-access` file, IP requests that do not correspond to the IP list in `nginx/accessible-ip.conf` will respond with 503.
4. When all maintenance is complete, delete the `maintenance/ip-access` file.

## Notice

Currently `network_mode: "host"` does not work in Docker Desktop.
`network_mode: "host"` only works on linux.

I conducted a test on Docker Desktop, and nginx's `remote_addr` was assigned Docker's internal IP (e.g. 172.23.0.1), not the client's IP.
[Docker Desktop Issue]

Please test `accessible-ip` using `Docker CE`.

## Installation

To install and run this project locally, follow these steps:

1. Clone this repository to your local machine

```bash
git clone https://github.com/leejaehyup/nginx-maintenance-exmaple.git
```

1. Run the service container defined in `docker-compose.yml`

```bash
docker-compose up -d --build
```

## Usage

Call http://localhost:4000 in the browser.

You can test it by modifying the files in the maintenance folder.

## Copyright and license

This project is licensed under the [MIT License].

```
The MIT License (MIT)

Copyright (c) 2024 Jaehyup Lee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Author

Jaehyup Lee - dlwoguq321@gmail.com

[Docker Desktop Issue]: https://github.com/docker/roadmap/issues/238
[MIT License]: https://github.com/leejaehyup/nginx-maintenance-exmaple/blob/main/LICENSE.md
