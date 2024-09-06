Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F7412EBD6
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Sep 2024 18:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725645912; cv=none; b=f/bemHqcVxXjnFnGINMmxcM0aWApDjlPqDnOr1B3UVflUHRbGqHkkEuqvq+6RQxzU/Ag5OYJYsU3ol2bX2lNNbxCzbiTsc6b5Qyrre5mNxpR0bkOnJHErsKxtcuVwrujqXrVzece0FK5gf8JZ71TQCYviIXWdUxYJsNYGcQCfv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725645912; c=relaxed/simple;
	bh=FqRhF+hgWt9gumhdbMzCTiLzUGjlH3cygb9/nG0z4q4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RvVsTjOEKxoGRe5aOh9dRyit/o0XBZXdAwjeBqRd+OrxmlL2sYLQwKoWM4Gb8PO6azD5K18Qy9jXXR9ero6lO9d0PVBz9Wv3EgErzDkUasR+3qEcH8RZWtsahR7sjJmK+pa3p8ukQIpBpF0kT1rW57DCEj1l3EP5R5EnC1l8LRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=gj7oYbgy; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="gj7oYbgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=o77m5vxrdvf55j7oaysbdkjv7e.protonmail; t=1725645907; x=1725905107;
	bh=hIDpKHjuNvEZhooEGipi9Zn1LoFFiUhBOiw2RNEcaCw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gj7oYbgy/i4Al1CZV97N6GCf3VdnHotg3xY/WwdK+B3nzisEVFSVmrwThvJcvUFsW
	 mi5rgI2ngP6am9TKrtxS0s9SKryOOQt5zu+bj/EKQbCJPSIbRcHJOHnOOz3Elauu41
	 tTRMhTkCtoTTnQOxCRcwW/uWK6SBWPsYSHPNhaNa1tEEkMupRqSDQINuwHB0EZZzOW
	 aD9kqe+DRYWxgBn9ExakDFzviJNOwCkQvMUp78QMaASJ27Pay75XMdk7JkZfUydVSM
	 qZ8kbUZ4SAdyYrpRJswIinhYzIrwejWUXotN1O+KyL3QBvCcJ1lTBpIe5swJTbcA6/
	 85qml8FHRzYZg==
Date: Fri, 06 Sep 2024 18:05:01 +0000
To: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, apw@canonical.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dwaipayanray1@gmail.com, gary@garyguo.net, joe@perches.com, linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, wedsonaf@gmail.com
From: Patrick Miller <paddymills@proton.me>
Cc: Patrick Miller <paddymills@proton.me>
Subject: [PATCH 2/2] checkpatch: warn on known non-plural rust doc headers
Message-ID: <20240906180456.2302688-1-paddymills@proton.me>
Feedback-ID: 45271957:user:proton
X-Pm-Message-ID: 02efb41ff8507f66a2862938f6a743984f27959e
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------b6345da3413b866fec74b81929953a5d1f572e8a9a8af0f251bd6273a8f880ec"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------b6345da3413b866fec74b81929953a5d1f572e8a9a8af0f251bd6273a8f880ec
Content-Type: multipart/mixed;
 boundary=02ee9be1f60f54d1ede820204ae95459c801db904821ca9e7722b0991a12
From: Patrick Miller <paddymills@proton.me>
To: a.hindborg@samsung.com,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	apw@canonical.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dwaipayanray1@gmail.com,
	gary@garyguo.net,
	joe@perches.com,
	linux-kernel@vger.kernel.org,
	lukas.bulwahn@gmail.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	wedsonaf@gmail.com
Cc: Patrick Miller <paddymills@proton.me>
Subject: [PATCH 2/2] checkpatch: warn on known non-plural rust doc headers
Date: Fri,  6 Sep 2024 14:04:56 -0400
Message-ID: <20240906180456.2302688-1-paddymills@proton.me>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0

--02ee9be1f60f54d1ede820204ae95459c801db904821ca9e7722b0991a12
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Adds a check for documentation in rust file. Warns if certain known
documentation headers are not plural. Even though some sections may
be singular (i.e. only one example), the header should still be plural
so that more examples can be added later without needing to change the
header.

Fixed the whitespace issue on my previous patch.

Signed-off-by: Patrick Miller <paddymills@proton.me>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1110

---
 scripts/checkpatch.pl | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 39032224d504..cb5ecdb6df9b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3900,6 +3900,13 @@ sub process {
 			     "Avoid using '.L' prefixed local symbol names for denoting a range of code via 'SYM_*_START/END' annotations; see Documentation/core-api/asm-annotations.rst\n" . $herecurr);
 		}
 
+# check that document sec
tion headers are plural in rust files
+		if ($realfile =~ /\.rs$/
+			&& $rawline =~ /^\+\s*\/\/\/\s+#+\s+(Example|Invariant|Guarantee|Panic)\s*$/) {
+			WARN( "RUST_DOC_HEADER",
+				"Rust doc headers should be plural\n" . $herecurr );
+		}
+
 # check we are in a valid source file C or perl if not then ignore this hunk
 		next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
 
-- 
2.46.0


--02ee9be1f60f54d1ede820204ae95459c801db904821ca9e7722b0991a12
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - paddymills@proton.me
 - 0xDCA74891.asc"; name="publickey - paddymills@proton.me - 0xDCA74891.asc"
Content-Type: application/pgp-keys; filename="publickey -
 paddymills@proton.me - 0xDCA74891.asc"; name="publickey -
 paddymills@proton.me - 0xDCA74891.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tClZlcnNpb246IEdvcGVuUEdQIDIu
Ny40CkNvbW1lbnQ6IGh0dHBzOi8vZ29wZW5wZ3Aub3JnCgp4ak1FWWs0UnNSWUpLd1lCQkFIYVJ3
OEJBUWRBU1FhVy9FUmQ4dGZncXNNSHQweTY3ZFdRTEU3UnV2T3gzanphCmdhRWI0c0xOSzNCaFpH
UjViV2xzYkhOQWNISnZkRzl1TG0xbElEeHdZV1JrZVcxcGJHeHpRSEJ5YjNSdmJpNXQKWlQ3Q2p3
UVFGZ29BSUFVQ1lrNFJzUVlMQ1FjSUF3SUVGUWdLQWdRV0FnRUFBaGtCQWhzREFoNEJBQ0VKRUp0
UgpHcnN1cjU0UkZpRUUzS2RJa1N2VW5DdmU4MDFtbTFFYXV5NnZuaEZpcUFFQXQwVCtwZ3AwUm9X
d0lmbURQRlRuCjNsbVRRcVA0dUEreDRnNXB2OG5SSHBJQS8xVU1YLzh3akZlK24wZUM0V0pqeTRu
NS9OZUtxMXovOFBKdFlhdXMKZVZnT3pqZ0VZazRSc1JJS0t3WUJCQUdYVlFFRkFRRUhRRi9mTnBE
ZmxsRFJuSEhyZUh2VHRJdEZ3dURMM0taQQphaDhZd3dxV0FyNFJBd0VJQjhKNEJCZ1dDQUFKQlFK
aVRoR3hBaHNNQUNFSkVKdFJHcnN1cjU0UkZpRUUzS2RJCmtTdlVuQ3ZlODAxbW0xRWF1eTZ2bmhH
R2Z3RUFuWkFzR3BvTDdRaTlWQ05PcGNrcjB2OE41S3hic2xJTGZlUCsKMmNJU0hlY0Erd1RxWDNs
Z3dnNVJDN1lBT1MvUTBDc3EwY2tPSTBKbnNMS1VaU3I4TlJvQgo9VzE4bgotLS0tLUVORCBQR1Ag
UFVCTElDIEtFWSBCTE9DSy0tLS0t
--02ee9be1f60f54d1ede820204ae95459c801db904821ca9e7722b0991a12--

--------b6345da3413b866fec74b81929953a5d1f572e8a9a8af0f251bd6273a8f880ec
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYIACcFAmbbRE0JEJtRGrsur54RFiEE3KdIkSvUnCve801mm1Eauy6v
nhEAAFGqAP4wuJeb+8FpgBc3yXEdwyUcI4nondHbGEqFgYUXx5zVLwEA91xJ
Q2HcygmWeYNrhGSQfGZDRQsPoP5EdT3KRUTEvAY=
=FRQy
-----END PGP SIGNATURE-----


--------b6345da3413b866fec74b81929953a5d1f572e8a9a8af0f251bd6273a8f880ec--

