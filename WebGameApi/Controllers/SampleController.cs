using Microsoft.AspNetCore.Mvc;

namespace WebGameApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SampleController : ControllerBase
    {
        [HttpGet("hello")]
        public IActionResult GetHello()
        {
            return Ok("Hello from SampleController!");
        }
    }
}
