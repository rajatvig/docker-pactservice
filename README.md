### Pact Mock Service

#### Overview
This image run the [Pact Mock Service](https://github.com/bethesque/pact-mock_service) as a Docker Container.

#### How-to/usage
```bash
docker run -d -t -p "1234:80" -v "./pacts:/pacts" rajatvig/pactservice:latest
```
