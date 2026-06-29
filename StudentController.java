package com.api.sample.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


class Student {
	String name;
	String dept;
	int age;
	Student(String name, String dept, int age) {
		this.name = name;
		this.dept = dept;
		this.age = age;
	}
	@Override
	public String toString() {
		return this.name + "|" + this.dept + "|" + this.age;
	}
}

@RestController
@RequestMapping("student")
public class StudentController {
	private ArrayList<Student> li = new ArrayList<>();
    @GetMapping("/all")
    public String getAll() {
        return li.toString();
    }

	@GetMapping("/{id}")
	public String getById(@PathVariable("id") int id) {
		try {
			Student obj = li.get(id);
			return "student details: " + obj;
		} catch(Exception e) {
			return "something went wrong";
		}
	}
	@PostMapping("/{name}/{dept}/{age}")
	public String addNewStudent(
		@PathVariable("name") String name,
		@PathVariable("dept") String dept,
		@PathVariable("age") int age
	) {
		Student obj = new Student(name, dept, age);
		li.add(obj);
		return "successfully added.";
	}
	@PutMapping("/{id}/name/{name}")
	public String updateName(
		@PathVariable("id") int id,
		@PathVariable("name") String name
	) {
		try {
			Student obj = li.get(id);
			obj.name = name;
			li.set(id, obj);
			return "updated the value";
		} catch(Exception e) {
			return "something went wrong";
		}
	}
	@DeleteMapping("/{id}")
	public String delete(@PathVariable("id") int id) {
 		try {
			li.remove(id);
			return "deleted successfully";
		} catch(Exception e) {
			return "something went wrong";
		}
	}
}
