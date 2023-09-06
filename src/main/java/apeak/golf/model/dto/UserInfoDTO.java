package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class UserInfoDTO {
	private String userId;
	private String userPw;
	private String userName;
	private String hp;
	private String regiDate;
	private String lastLogin;
	
	private List<UserAuthDTO> userAuthList;
}