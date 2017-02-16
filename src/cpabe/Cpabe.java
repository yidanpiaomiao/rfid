package cpabe;
import it.unisa.dia.gas.jpbc.Element;

import java.security.NoSuchAlgorithmException;

import bswabe.Bswabe;
import bswabe.BswabeCph;
import bswabe.BswabeCphKey;
import bswabe.BswabeElementBoolean;
import bswabe.BswabeMsk;
import bswabe.BswabePrv;
import bswabe.BswabePub;
import bswabe.SerializeUtils;
import cpabe.policy.LangPolicy;

public class Cpabe {

	/**
	 * @author Junwei Wang(wakemecn@gmail.com)
	 */

	public Cpabe() {
		// TODO Auto-generated constructor stub
	}
	
	//unused
	public void setup(String pubfile, String mskfile) throws Exception,
			ClassNotFoundException {
		byte[] pub_byte, msk_byte;
		BswabePub pub = new BswabePub();
		BswabeMsk msk = new BswabeMsk();
		Bswabe.setup(pub, msk);

		/* store BswabePub into mskfile */
		pub_byte = SerializeUtils.serializeBswabePub(pub);
		Common.spitFile(pubfile, pub_byte);

		/* store BswabeMsk into mskfile */
		msk_byte = SerializeUtils.serializeBswabeMsk(msk);
		Common.spitFile(mskfile, msk_byte);
	}

	//unused
	public void keygen(String pubfile, String prvfile, String mskfile,
			String attr_str) throws NoSuchAlgorithmException, Exception {
		BswabePub pub;
		BswabeMsk msk;
		byte[] pub_byte, msk_byte, prv_byte;

		/* get BswabePub from pubfile */
		pub_byte = Common.suckFile(pubfile);
		pub = SerializeUtils.unserializeBswabePub(pub_byte);

		/* get BswabeMsk from mskfile */
		msk_byte = Common.suckFile(mskfile);
		msk = SerializeUtils.unserializeBswabeMsk(pub, msk_byte);

		String[] attr_arr = LangPolicy.parseAttribute(attr_str);
		//add by wwh
		BswabePrv prv = Bswabe.keygen(pub, msk, attr_arr);

		/* store BswabePrv into prvfile */
		prv_byte = SerializeUtils.serializeBswabePrv(prv);
		Common.spitFile(prvfile, prv_byte);
	}

	//Call in UencMapper
	public byte[] enc(byte[] pubBytes, String policy, String input) throws Exception {
		BswabePub pub;
		BswabeCph cph;
		BswabeCphKey keyCph;
		byte[] cphBuf;
		byte[] aesBuf;
		Element m;

		pub = SerializeUtils.unserializeBswabePub(pubBytes);

		keyCph = Bswabe.enc(pub, policy);
		cph = keyCph.cph;
		m = keyCph.key;
		System.err.println("m = " + m.toString());

		if (cph == null) {
			System.out.println("Error happed in enc");
			System.exit(0);
		}

		cphBuf = SerializeUtils.bswabeCphSerialize(cph);
		aesBuf = AESCoder.encrypt(m.toBytes(), input.getBytes());
		
		return Common.combineCpabeBytes(cphBuf, aesBuf);
	}

	//Call in UdecMapper
	public byte[] dec(byte[] pubBytes, byte[] prvBytes, byte[] encBytes) throws Exception {
		
		byte[] aesBuf, cphBuf;
		byte[][] tmp;
		BswabeCph cph;
		BswabePrv prv;
		BswabePub pub;

		/* get BswabePub from pubfile */
		pub = SerializeUtils.unserializeBswabePub(pubBytes);

		/* read ciphertext */
		//important wwh
		tmp = Common.splitCpabeBytes(encBytes);
		
		aesBuf = tmp[0];
		cphBuf = tmp[1];
		
		System.out.println("Aes: "+aesBuf.length+"\tCph: "+cphBuf.length);
		
		cph = SerializeUtils.bswabeCphUnserialize(pub, cphBuf);
		/* get BswabePrv form prvfile */
		prv = SerializeUtils.unserializeBswabePrv(pub, prvBytes);
		BswabeElementBoolean beb = Bswabe.dec(pub, prv, cph);
		System.err.println("e = " + beb.e.toString());
		
		if (beb.b) {
			return AESCoder.decrypt(beb.e.toBytes(), aesBuf);
		} else {
			return null;
		}
	}

}
