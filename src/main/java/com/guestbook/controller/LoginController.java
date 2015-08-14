package com.guestbook.controller;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

import com.guestbook.models.Review;
import com.guestbook.models.Reviewque;
import com.guestbook.models.Users;
import com.guestbook.services.ReviewService;
import com.guestbook.services.ReviewqueService;
import com.guestbook.services.UserService;

@RestController
public class LoginController {
	@Autowired
    private ReviewqueService reviewqueservice;
	@Autowired
    private UserService userservice;
	@Autowired
	private ReviewService reviewservice;
	@RequestMapping(value = { "/", "/home" })
	public String getUserDefault() {
		
		return "home";
	}

	@RequestMapping("/login")
	public ModelAndView getLoginForm(@ModelAttribute Users users,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		
		String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
		String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
		String message = "";
		if (error != null) {
			message = "Incorrect username or password !";
		} else if (logout != null) {
			message = "Logout successful !";
		}
		return new ModelAndView("login", "message", message);
	}

	

	@RequestMapping("/user**")
	public String getUserProfile() {
		return "user";
	}

	@RequestMapping("/403")
	public ModelAndView getAccessDenied() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = "";
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			username = userDetail.getUsername();
		}

		return new ModelAndView("403", "username", username);
	}
	@RequestMapping("main")
	public String getMainPage(ModelMap map) {
		Authentication authentication = SecurityContextHolder.getContext().
                getAuthentication();
	        String name = authentication.getName();
	        map.addAttribute("username",name);
	       map.addAttribute("reviewque",reviewqueservice.getAllReviews());
		 map.addAttribute("user", new Users());
	     map.addAttribute("userlist", userservice.getAllUsers());
		return "main";
	}
	@RequestMapping("admin")
	public String getAdmin(ModelMap map) {
		Authentication authentication = SecurityContextHolder.getContext().
                getAuthentication();
	        String name = authentication.getName();
	        map.addAttribute("username",name);
	       map.addAttribute("reviewque",reviewqueservice.getAllReviews());
		 map.addAttribute("user", new Users());
	     map.addAttribute("userlist", userservice.getAllUsers());
	     
		return "adminpanel";
	}
	@RequestMapping("reviews")
	public String geReviewPage(ModelMap map) {
		Authentication authentication = SecurityContextHolder.getContext().
		                getAuthentication();
			        String name = authentication.getName();
			map.addAttribute("reviewque",new Reviewque());
	      map.addAttribute("username", name);
		  DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
	       Date dateobj = new Date();
	       map.addAttribute("date", df.format(dateobj));
		 map.addAttribute("review", new Review());
	     map.addAttribute("reviewlist", reviewservice.getAllReviews());
		return "review";
	}
	 @RequestMapping(value = "adminreviews/addreview", method = RequestMethod.POST)
	// @ResponseStatus(HttpStatus.NO_CONTENT) // THIS WAS MISSING
	    public String addReview(@ModelAttribute(value="id") int id,@ModelAttribute(value="review") Review review, BindingResult result)
	    {
		 reviewqueservice.deleteReview(id);
		 
	       reviewservice.addReview(review);
	        return "redirect:/reviews";
	    }
	 @RequestMapping(value = "reviews/addreviewque", method = RequestMethod.GET)
	    public  @ResponseBody  String addReviewque(@RequestParam("user") String user,@RequestParam("content") String content,@RequestParam("date") Date date){
			Reviewque reviewque=new Reviewque();
			reviewque.setUser(user);
	    reviewque.setContent(content);
	    reviewque.setDate(date);
		reviewqueservice.addReview(reviewque);
	        return "redirect:/reviews";
	    }
	 @RequestMapping(value = "/addguest", method = RequestMethod.POST)
	    public String addUser(@ModelAttribute(value="user") Users user, BindingResult result)
	    {
		userservice.addUser(user);
	        return "redirect:/add";
	    }
	 @RequestMapping("/deleteuser/{user}")
     public String deleteUser(@PathVariable("user") String user) {

            userservice.deleteUser(user);

          
            return "redirect:/main";
     }
	 @RequestMapping(value = "adminreviews/deletereview", method = RequestMethod.POST)
     public String deleteReviewquer(@ModelAttribute(value="id") int id) {
        
            reviewqueservice.deleteReview(id);

          
            return "redirect:/main";
     }
	 @RequestMapping(value="edit/edituser", method = RequestMethod.POST)
		public String editUser(@RequestParam("username") String username,
				@RequestParam("lastname") String lastname,
				@RequestParam("password") String password,
				@RequestParam("contact") String contact,
				@RequestParam("adress") String adress,
				@RequestParam("email") String email) {
		
			userservice.setUser(username, lastname, adress, contact, password, email);
			return "redirect:/main";
			
		}
	@RequestMapping(value="edit/{user}",method = RequestMethod.GET)
	public String geEditPage(Model map, @PathVariable("user") String user) {
		map.addAttribute("userlist",userservice.getUser(user));
		return "edit";
	}
	@RequestMapping("add")
	public String getSignUpPage(Model map) {
		map.addAttribute("user",new Users());
		return "add";
	}
	
	@RequestMapping(value="/adminreviews/{id}",method = RequestMethod.GET)
	public String getAdmin(Model model,@PathVariable("id") int id) {
		model.addAttribute("reviewquelist", reviewqueservice.getReview(id));
		model.addAttribute("reviewque", new Reviewque());
		model.addAttribute("review", new Review());
		return "admin";
	}

}
