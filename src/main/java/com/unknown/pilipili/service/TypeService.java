package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.Type;
import com.unknown.pilipili.repository.TypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
}
