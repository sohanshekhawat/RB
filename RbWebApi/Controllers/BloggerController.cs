using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace RbWebApi.Controllers
{
    public class BloggerController : ApiController
    {
        private readonly RepositoryLibrary.RepositoryCollection rc;
        public BloggerController()
        {
            rc = new RepositoryLibrary.RepositoryCollection();
        }

        // GET: api/Blogger
        public async Task<IEnumerable<RepositoryLibrary.tb_BloggerList>> Get()
        {
           return await rc.BloggerRepository.GetAllAsync();
        }

        // GET: api/Blogger/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Blogger
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Blogger/5;
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Blogger/5
        public void Delete(int id)
        {
        }
    }
}
