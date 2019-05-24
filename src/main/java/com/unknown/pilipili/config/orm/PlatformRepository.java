package com.unknown.pilipili.config.orm;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.io.Serializable;

/**
 * PlatformRepository Class
 *
 * @author <b>Oxidyc</b>, Copyright &#169; 2003
 * @version 1.0, 2019-04-26 1:51
 */
@NoRepositoryBean
public interface PlatformRepository<T,ID extends Serializable> extends JpaSpecificationExecutor<T>,PagingAndSortingRepository<T,ID> {
}
