using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryLibrary
{
    public class GenericRepository<T> : IGenericRepository<T> where T : class
    {
        protected readonly DbContext context;

        public GenericRepository()
        {
            context = new db_rajputbookEntities();
        }

        protected virtual IQueryable<T> GetQueryable(
        Expression<Func<T, bool>> filter = null,
        Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null,
        int? pageNum = null,
        int? pageSize = null)
        {
            IQueryable<T> query = context.Set<T>();

            if (filter != null)
            {
                query = query.Where(filter);
            }
            
            if (orderBy != null)
            {
                query = orderBy(query);
            }

            if (pageNum.HasValue && pageSize.HasValue)
            {
                var skipRecord = (pageNum.Value * pageSize.Value);
                query = query.Skip(skipRecord);
                query = query.Take(pageSize.Value);
            }

            return query;
        }
        public async Task<IEnumerable<T>> GetAllAsync(Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null, int? pageNum = default(int?), int? pageSize = default(int?))
        {
            var n = await GetQueryable(null, orderBy, pageNum, pageSize).ToListAsync();
            return n;
        }

        public async Task<IEnumerable<T>> GetAsync(Expression<Func<T, bool>> filter = null, Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null, int? pageNum = default(int?), int? pageSize = default(int?))
        {
            return await GetQueryable(filter, orderBy,  pageNum, pageSize).ToListAsync();
        }

        public async Task<T> GetByIdAsync(object id)
        {
            return await context.Set<T>().FindAsync(id);
        }
        
        public async Task<int> GetCountAsync(Expression<Func<T, bool>> filter = null)
        {
            return await GetQueryable(filter).CountAsync();
        }

        public async Task<bool> GetExistsAsync(Expression<Func<T, bool>> filter = null)
        {
            return await GetQueryable(filter).AnyAsync();
        }

        public Task CreateAsync(T entity, string createdBy = null)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(T entity)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(object id)
        {
            throw new NotImplementedException();
        }

        public Task SaveAsync()
        {
            throw new NotImplementedException();
        }

        public Task UpdateAsync(T entity, string modifiedBy = null)
        {
            throw new NotImplementedException();
        }
    }
}