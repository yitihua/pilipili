package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.Dict;
import com.unknown.pilipili.repository.DictRepository;
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
 * @version 1.0, 2019/6/2 16:00
 */
@Service
public class DictService {
    @Autowired
    private DictRepository dictRepo;
    public Dict save(Dict dict){
        return dictRepo.save(dict);
    }
    public void delete(Long id){
        dictRepo.delete(id);
    }
    public Dict findOne(Long pkId){
        return dictRepo.findOne(pkId);
    }
    public Dict findDictByTypeAndName(String type, String name){
        return dictRepo.findDictByTypeAndName(type, name);
    }
    public List<Dict> findAll(){
        return (List<Dict>) dictRepo.findAll();
    }
    public Page<Dict> getEntityPage(Map<String, Object> filterParams, int pageNumber, int pageSize, String sortType){
        PageRequest pageRequest = PageUtil.buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Dict> spec = PageUtil.buildSpecification(filterParams,Dict.class);
        return dictRepo.findAll(spec,pageRequest);
    }
}
