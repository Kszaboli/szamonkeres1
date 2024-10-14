using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Mysqlx.Crud;
using ProductApi;
using System.Reflection.PortableExecutable;
using WebApplication1.Model;
using static WebApplication1.dto.DTO;

namespace WebApplication1.Controllers
{
    public class JegyController
    {
        [Route("jegyek")]
        [ApiController]
        public class jegyController : ControllerBase
        {
            private Connect conn = new();

            [HttpGet]
            public List<Jegy> Get()
            {
                List<Jegy> jegyek = new();
                string sql = "SELECT * FROM szamonkeres";

                conn.Connection.Open();
                MySqlCommand cmd = new MySqlCommand(sql, conn.Connection);
                MySqlDataReader reader = cmd.ExecuteReader();

                reader.Read();

                do
                {
                    var result = new Jegy
                    {
                        Id = reader.GetGuid(0),
                        jegy = reader.GetInt32(1),
                        leiras = reader.GetString(2),
                        letrehozas_ideje = reader.GetDateTime(3)
                    };

                    jegyek.Add(result);
                }
                while (reader.Read());

                conn.Connection.Close();

                return jegyek;
            }

            [HttpPost]
            public ActionResult<Jegy> Post(CreateJegyDto jegyek)
            {
                var result = new Jegy
                {
                    Id = Guid.NewGuid(),
                    jegy = jegyek.jegy,
                    leiras = jegyek.leiras,
                    letrehozas_ideje = DateTime.Now
                };
                string sql = $"INSERT INTO `szamonkeres`(`id`, `Jegy`, `Leiras`, `Letrehozas_ideje`) VALUES('{result.Id}'," +
                    $" '{result.jegy}', '{result.leiras}', '{result.letrehozas_ideje}')";

                return Ok(new { message = "" });
            }

            [HttpPost]
            public object Post(Jegy jegyek)
            {
                conn.Connection.Open();


                string sql = $"INSERT INTO `products`(`Id`, `Name`, `Price`, `CreatedTime`) VALUES ('{Guid.NewGuid()}'" +
                    $",'{jegyek.jegy}',{jegyek.leiras},'{DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss")}')";

                MySqlCommand cmd = new MySqlCommand(sql, conn.Connection);
                cmd.ExecuteNonQuery();


                conn.Connection.Close();

                return new { message = "Új rekord felvéve!" };
            }
        }
    }
}