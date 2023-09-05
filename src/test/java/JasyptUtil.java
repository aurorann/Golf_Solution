import java.text.ParseException;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.Test;

/*@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { 
		"file:src/test/resources/springmvc/*.xml",
		"file:src/test/resources/validator/*.xml"} )*/
public class JasyptUtil {
	
	@Test
	public void checkTime() throws ParseException {
		StandardPBEStringEncryptor pbeEnc = new StandardPBEStringEncryptor();
        
        pbeEnc.setAlgorithm("PBEWithMD5AndDES");
        pbeEnc.setPassword("apeak");

        String url = pbeEnc.encrypt("jdbc:log4jdbc:mysql://192.168.0.167:3306/mydb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC");
        String username = pbeEnc.encrypt("root");
        String password = pbeEnc.encrypt("apeak");

        System.out.println(url);
        System.out.println(username);
        System.out.println(password);
	}
}