package god.epeople;

import java.net.URL;

import org.apache.commons.io.IOUtils;
import org.junit.Test;

public class ApiTest {

	@Test
	public void test() throws Exception {
		String spec = "http://www.epeople.go.kr/shareApi/getIdeaList.do";
		System.out.println(spec);
		URL url = new URL(spec);
		String s = IOUtils.toString(url.openStream());
		System.out.println(s);
	}

}
