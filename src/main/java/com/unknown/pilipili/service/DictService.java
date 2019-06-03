package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.Dict;
import com.unknown.pilipili.repository.DictRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public Dict findOne(Long pkId){
        return dictRepo.findOne(pkId);
    }
    public Dict findDictByTypeAndName(String type, String name){
        return dictRepo.findDictByTypeAndName(type, name);
    }
    public List<Dict> findAll(){
        return (List<Dict>) dictRepo.findAll();
    }
}
