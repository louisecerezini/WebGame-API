using WebGameApi.Controllers;
using Xunit;
using Microsoft.AspNetCore.Mvc;

namespace WebGameApi.Tests
{
    public class SampleControllerTests
    {
        [Fact]
        public void GetHello_ReturnsOkWithMessage()
        {
            // Arrange
            var controller = new SampleController();

            // Act
            var result = controller.GetHello() as OkObjectResult;

            // Assert
            Assert.NotNull(result);
            Assert.Equal(200, result.StatusCode);
            Assert.Equal("Hello from SampleController!", result.Value);
        }
    }
}
