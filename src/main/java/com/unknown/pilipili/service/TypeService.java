package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.Type;
import com.unknown.pilipili.repository.TypeRepository;
import com.unknown.pilipili.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/6 14:38
 */
@Service
public class TypeService {
    @Autowired
    private TypeRepository typeRepo;
    public List<Type> findAll(){
        return (List<Type>) typeRepo.findAll();
    }
    public Type findTypeByName(String name){
        return typeRepo.findTypeByName(name);
    }
    public Type findOne(Long id){
        return typeRepo.findOne(id);
    }
    public Type save(Type type){
        return typeRepo.save(type);
    }
    public void delete(Long id){
        typeRepo.delete(id);
    }
    public Page<Type> getEntityPage(Map<String, Object> filterParams, int pageNumber, int pageSize, String sortType){
        PageRequest pageRequest = PageUtil.buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Type> spec = PageUtil.buildSpecification(filterParams,Type.class);
        return typeRepo.findAll(spec,pageRequest);
    }
}
