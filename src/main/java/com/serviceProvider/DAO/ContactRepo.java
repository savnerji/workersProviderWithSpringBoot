package com.serviceProvider.DAO;

import org.springframework.data.repository.CrudRepository;

import com.serviceProvider.Entities.Contact;

public interface ContactRepo extends CrudRepository<Contact, Integer> {

}
