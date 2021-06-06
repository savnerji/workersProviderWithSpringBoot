
package com.serviceProvider.config;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.serviceProvider.Entities.User;
import com.serviceProvider.Entities.Worker;

public class CustomUserDetails implements UserDetails {

	//private User user;

	private String username;
	private String password;
	private String role;

	public CustomUserDetails() {
		super();

	}

	

	public CustomUserDetails(User user) {
		super();
		this.username=user.getEmail();
		this.password=user.getPassword();
		this.role=user.getRole();
		
		//this.user = user;
	}
	
	public CustomUserDetails(Worker w) {
		super();
		this.username=w.getEmail();
		this.password=w.getPassword();
		this.role=w.getRole();
		
		//this.user = user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		//SimpleGrantedAuthority simpleGrantedAuthority2 = new SimpleGrantedAuthority(user.getRole());
		SimpleGrantedAuthority simpleGrantedAuthority2 = new SimpleGrantedAuthority(role);
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
		System.out.println(role);

		authorities.add(simpleGrantedAuthority2);
		return authorities;
	}

	@Override
	public String getPassword() {

		//return user.getPassword();
		return password;
	}

	@Override
	public String getUsername() {

		//return user.getEmail();
		return username;
	}

	@Override
	public boolean isAccountNonExpired() {

		return true;
	}

	@Override
	public boolean isAccountNonLocked() {

		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {

		return true;
	}

	@Override
	public boolean isEnabled() {

		return true;
	}

}
