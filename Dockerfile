# Use the official .NET SDK image for build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy solution and restore as distinct layers
COPY WebGameApi.sln ./
COPY WebGameApi/*.csproj ./WebGameApi/
COPY WebGameApi.Tests/*.csproj ./WebGameApi.Tests/
RUN dotnet restore

# Copy everything else and build
COPY WebGameApi/. ./WebGameApi/
COPY WebGameApi.Tests/. ./WebGameApi.Tests/
WORKDIR /src/WebGameApi
# Publish in Debug mode for debugging
RUN dotnet publish -c Debug -o /app/publish --no-restore

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
# Expose debugger port
EXPOSE 5005
# Set environment to Development for debugging
ENV ASPNETCORE_ENVIRONMENT=Development
ENTRYPOINT ["dotnet", "WebGameApi.dll"]
