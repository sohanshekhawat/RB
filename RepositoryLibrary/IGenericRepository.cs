using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryLibrary
{
    public interface IGenericRepository<T> where T : class
    {
        Task<IEnumerable<T>> GetAllAsync(
            Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null,
            int? pageNum = null,
            int? pageSize = null);

        Task<IEnumerable<T>> GetAsync(
            Expression<Func<T, bool>> filter = null,
            Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null,
            int? pageNum = null,
            int? pageSize = null);

        Task<T> GetByIdAsync(object id);

        Task<int> GetCountAsync(Expression<Func<T, bool>> filter = null);

        Task<bool> GetExistsAsync(Expression<Func<T, bool>> filter = null);

        Task CreateAsync(T entity, string createdBy = null);

        Task UpdateAsync(T entity, string modifiedBy = null);

        Task DeleteAsync(object id);

        Task DeleteAsync(T entity);
        
        Task SaveAsync();
    }
}
