package apeak.golf.model.dto;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserAuthDTO implements Serializable{
	private String userId;
	private String auth;
}