## WebGame-API

A simple .NET Web API project (targeting .NET 9) with xUnit tests and GitHub Actions CI.

### Features
- ASP.NET Core Web API
- Sample controller (`SampleController`) with a test endpoint
- xUnit test project with a sample test
- GitHub Actions workflow to run tests on every PR to `main`


### Running with Docker

#### Build the Docker image
```bash
docker build -t webgameapi-debug .
```

#### Run the container
```bash
docker run -d -p 8080:8080 -p 5005:5005 --name webgameapi-debug webgameapi-debug
```

The API will be available at `http://localhost:8080/api/sample/hello`.

To stop and remove the container:
```bash
docker stop webgameapi-debug && docker rm webgameapi-debug
```

---

### Getting Started

#### Prerequisites
- [.NET 9 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/9.0)

#### Build and Run
```bash
dotnet restore

dotnet build

dotnet run --project WebGameApi
```

The API will be available at `https://localhost:5001` or `http://localhost:5000` by default.

#### Test
```bash
dotnet test
```

### Sample Endpoint

- `GET /api/sample/hello` — returns a hello message.

### Continuous Integration

This project uses GitHub Actions to automatically run tests on every pull request to the `main` branch. See `.github/workflows/dotnet.yml` for details.

### AWS Deployment

You can deploy this API and a managed PostgreSQL database on AWS using the provided CloudFormation template:

- `cloudformation-ecs-fargate-pgsql.yml`

This template provisions:
	- An ECS Fargate cluster and service for the API (you must provide your container image URI)
	- A PostgreSQL RDS instance (db.t3.micro, 20–50GB)
	- All required networking and security resources

**Note:**
- Update the template with your Docker image URI before deploying.
- For production, consider adding an Application Load Balancer and multi-AZ subnets.

To deploy:
```bash
aws cloudformation create-stack \
	--stack-name webgame-api-stack \
	--template-body file://cloudformation-ecs-fargate-pgsql.yml \
	--parameters ParameterKey=DBPassword,ParameterValue=YOUR_DB_PASSWORD \
	--capabilities CAPABILITY_NAMED_IAM
```

---