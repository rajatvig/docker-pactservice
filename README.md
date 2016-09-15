[![Build Status](https://travis-ci.org/rajatvig/docker-pactservice.svg?branch=master)](https://travis-ci.org/rajatvig/docker-pactservice)
[![](https://images.microbadger.com/badges/image/rajatvig/pactservice.svg)](http://microbadger.com/images/rajatvig/pactservice "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/rajatvig/pactservice.svg)](http://microbadger.com/images/rajatvig/pactservice "Get your own version badge on microbadger.com")

### Pact Mock Service

#### Overview
This image run the [Pact Mock Service](https://github.com/bethesque/pact-mock_service) as a Docker Container.

#### How-to/usage
```bash
docker run -d -t -p "1234:80" -v "./pacts:/pacts" rajatvig/pactservice:latest
```
