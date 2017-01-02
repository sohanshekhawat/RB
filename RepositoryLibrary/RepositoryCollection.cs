using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryLibrary
{
    public class RepositoryCollection
    {
        private GenericRepository<tb_BloggerList> bloggerRepository;

        public GenericRepository<tb_BloggerList> BloggerRepository
        {
            get
            {
                if (this.bloggerRepository == null)
                {
                    this.bloggerRepository = new GenericRepository<tb_BloggerList>();
                }
                return bloggerRepository;
            }
        }
    }
}
