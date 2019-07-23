mkdir SBAPI.Domain
cd SBAPI.Domain
dotnet new classlib
dotnet add package Newtonsoft.Json
rm Class1.cs
mkdir ValueObjects
cd ..


mkdir SBAPI.Application
cd SBAPI.Application
dotnet new classlib
mkdir UseCases
mkdir Repository

dotnet add package Newtonsoft.Json
dotnet add package AutoMapper
dotnet add package AutoMapper.Extensions.Microsoft.DependencyInjection
dotnet add package MediatR
dotnet add package MediatR.Extensions.Microsoft.DependencyInjection
dotnet add package Swashbuckle.AspNetCore

rm Class1.cs
dotnet add SBAPI.Application.csproj reference ../SBAPI.Domain/SBAPI.Domain.csproj
cd ..


mkdir SBAPI.Infrastructure
cd SBAPI.Infrastructure
dotnet new classlib
mkdir Repository

dotnet add package Newtonsoft.Json
dotnet add package AutoMapper

rm Class1.cs
dotnet add SBAPI.Infrastructure.csproj reference ../SBAPI.Domain/SBAPI.Domain.csproj
dotnet add SBAPI.Infrastructure.csproj reference ../SBAPI.Application/SBAPI.Application.csproj
cd ..


mkdir SBAPI.Api
cd SBAPI.Api
dotnet new webapi
mkdir UseCases
mkdir Infrastructure

dotnet add package Newtonsoft.Json
dotnet add package AutoMapper
dotnet add package AutoMapper.Extensions.Microsoft.DependencyInjection
dotnet add package MediatR
dotnet add package MediatR.Extensions.Microsoft.DependencyInjection
dotnet add package Swashbuckle.AspNetCore

dotnet add SBAPI.Api.csproj reference ../SBAPI.Domain/SBAPI.Domain.csproj
dotnet add SBAPI.Api.csproj reference ../SBAPI.Application/SBAPI.Application.csproj
dotnet add SBAPI.Api.csproj reference ../SBAPI.Infrastructure/SBAPI.Infrastructure.csproj
cd ..


dotnet new sln
ren api.sln SBAPI.sln
dotnet sln SBAPI.sln add SBAPI.Domain/SBAPI.Domain.csproj
dotnet sln SBAPI.sln add SBAPI.Application/SBAPI.Application.csproj
dotnet sln SBAPI.sln add SBAPI.Infrastructure/SBAPI.Infrastructure.csproj
dotnet sln SBAPI.sln add SBAPI.Api/SBAPI.Api.csproj
