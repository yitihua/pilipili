package com.unknown.pilipili.util;

import com.unknown.pilipili.config.orm.jpa.DynamicSpecifications;
import com.unknown.pilipili.config.orm.jpa.SearchFilter;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;

import java.util.Map;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/7 20:21
 */

public class PageUtil {
    public static PageRequest buildPageRequest(int pageNumber, int pageSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "id");
        } else{
            sort = new Sort(Sort.Direction.ASC, sortType);
        }
        return new PageRequest(pageNumber - 1, pageSize, sort);
    }
    public static <T>Specification<T> buildSpecification(Map<String, Object> filterParams,Class<T> entityClazz) {

        Map<String, SearchFilter> filters = SearchFilter.parse(filterParams);
        //if (StringUtils.isNotBlank(id)) {
        //    filters.put("id", new SearchFilter("id", SearchFilter.Operator.EQ, id));
        //}
        Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(), entityClazz);
        return spec;
    }
}
