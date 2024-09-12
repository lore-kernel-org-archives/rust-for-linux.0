Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5195E1C1725
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Sep 2024 19:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726171033; cv=none; b=uPZXcD3r2z0h0ZtNB4Fh9g5XsqBrqNcOGBUnLPBM1OkwdhXypdgM3tE2lFa2FRWN597vLID/73W66TzsYYclqvhssNn8W/b0EONdDFaP78H2MZy+5vpqX2RsE3abpwvbip36stIkJnkLJ4vRH3zkxWQuQkhexYxUSpf1w7zrTIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726171033; c=relaxed/simple;
	bh=VbK06qcABsMM09cwJzvrclQ93mnb+Q5QPxslepDCLnw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bIMP8WkImvzVGmz2+7/MCkMeFx0/V7ZW5JaVgtdFuFliBm/Vh7uwPldkCj5D63CkTPaFZznZhr0M4BtqQ4bCaxKkYPXRrBvJGM+oSuqnwyfLGjKBdYsfCUka38fMfiIzFHlqL0oB8onIUds8MEWOWSvSy2eZDAF6Fnb26JLFll8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=WXSO6fo1; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="WXSO6fo1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1726171023; x=1726430223;
	bh=ioxCKQoJPP1RrM0XHQsuL7TjavZxschOwKDn895QCdc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WXSO6fo1hHAQyYXVqrnQqEcpQ1KENRgNCj8zAPNaOShbNfzoSyRm72L2P7npbtyBS
	 g3hlxQb/EtZCXTU99XLuGKTxFvsIRKmqmgvRCEb/ClBJVjUOApQzyU28TEDZtlNTl8
	 KUHkC3wKPGa/1HeQLiSAMI4AINj0w0otvWQwXpwj0UAaDF4aIv2NvrjVbH8ateIg0L
	 KRk30tQn6ZjtP+ZapXGvnung+IsmeygaoJn7mV/y3PsxKnym08DKiu0ly9BO6wI+C+
	 hvaQSYy0DJoKAvfRzdHMt1ONJo5hEaJnyYWukZr5gUnI5iOROrgXB1Hw9suU2H8iOK
	 5U8gHVl/hZHAg==
Date: Thu, 12 Sep 2024 19:56:57 +0000
To: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, apw@canonical.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dwaipayanray1@gmail.com, gary@garyguo.net, joe@perches.com, linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, wedsonaf@gmail.com
From: Patrick Miller <paddymills@proton.me>
Cc: Patrick Miller <paddymills@proton.me>
Subject: [PATCH v3 2/2] checkpatch: warn on known non-plural rust doc headers
Message-ID: <20240912195649.227878-1-paddymills@proton.me>
Feedback-ID: 45271957:user:proton
X-Pm-Message-ID: 0994224a80c609493abbbab7f4e33e763946e7ee
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------a8f31ebb5b9f44d6538e62653999092623cb746570c051973a29fc584807f3f4"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------a8f31ebb5b9f44d6538e62653999092623cb746570c051973a29fc584807f3f4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Subject: [PATCH v3 2/2] checkpatch: warn on known non-plural rust doc headers
Date: Thu, 12 Sep 2024 15:56:49 -0400
Message-ID: <20240912195649.227878-1-paddymills@proton.me>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0

Adds a check for documentation in rust file. Warns if certain known
documentation headers are not plural.

The rust maintainers prefer document headers to be plural. This is to enforce
consistency among the documentation as well as to protect against errors when
additions are made. For example, if the header said "Example" because there was
only 1 example, if a second example was added, making the header plural could
easily be missed and the maintainers prefer to not have to remind people to fix
their documentation.

Link: https://github.com/Rust-for-Linux/linux/issues/1110

v1: https://lore.kernel.org/rust-for-linux/2024090628-bankable-refusal-5f20@gregkh/T/#t
v2: https://lore.kernel.org/rust-for-linux/92be0b48-cde9-4241-8ef9-7fe4d7c42466@proton.me/T/#t
  - fixed whitespace that was formatted due to editor settings 
v3:
  - move && to previous line and remove whitespace in WARN per Joe Perches
  - reformat following C coding style
---
 scripts/checkpatch.pl | 7 ++++
+++
 1 file changed, 7 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 39032224d504..5b18246ad511 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3900,6 +3900,13 @@ sub process {
 			     "Avoid using '.L' prefixed local symbol names for denoting a range of code via 'SYM_*_START/END' annotations; see Documentation/core-api/asm-annotations.rst\n" . $herecurr);
 		}
 
+# check that document section headers are plural in rust files
+		if ($realfile =~ /\.rs$/ &&
+		    $rawline =~ /^\+\s*\/\/\/\s+#+\s+(Example|Invariant|Guarantee|Panic)\s*$/) {
+			WARN("RUST_DOC_HEADER",
+			     "Rust doc headers should be plural\n" . $herecurr);
+		}
+
 # check we are in a valid source file C or perl if not then ignore this hunk
 		next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
 
-- 
2.46.0


--------a8f31ebb5b9f44d6538e62653999092623cb746570c051973a29fc584807f3f4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYIACcFAmbjR4cJEJtRGrsur54RFiEE3KdIkSvUnCve801mm1Eauy6v
nhEAABGZAP9CNmMVBNQnjTxTaW3YDlhHT/+9TtAP3HxG+yQgGb2vBAEAobkt
Udvo+sJ5puFEEKX61KKxkMwIMEqiFbIvMCRGpAo=
=sr4v
-----END PGP SIGNATURE-----


--------a8f31ebb5b9f44d6538e62653999092623cb746570c051973a29fc584807f3f4--

