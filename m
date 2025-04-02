Received: from sonic310-24.consmr.mail.ne1.yahoo.com (sonic310-24.consmr.mail.ne1.yahoo.com [66.163.186.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CB91459F6
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Apr 2025 16:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.186.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743609673; cv=none; b=u/IX7ep/qGxqCKgU2m2lKluIfM2tOG6Cg6Ksv3g7rwULBQSvtPDEv6DNFsdB/j0kF3uOQBEK7yNPpHk2Tx4r/H2gqM021zeKv64kmPijKFT6lRPR2NX8EFaUza7pc78m/TAD15+z00mlrxJcR6aqin7HM1A63npUYKrlz3qk20w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743609673; c=relaxed/simple;
	bh=XLBSfKBJGgE+C/Kt0sp7QVIr0ZgJ3UJmX/SIHM9PPuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=qNKFlaT/D1wPnWKdrneT/SUrLugS2IoWoxKPf+e77vkCHvaTf979rSbCwGnw5AQC8cjgKafJ5899k4nTN7EEzdu3xVQ7kuSDTk7xpAd537nZZTMoAoTVo84cM+hX+bzTMtBZlZebTxLcXzKC1QG1nvy06Hx66Sjqok/4wlvGCQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=L9ZyPIRQ; arc=none smtp.client-ip=66.163.186.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="L9ZyPIRQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743609665; bh=X9OBgkQFeNlVZ+4ibzcaX//LqS2lc5b68sX1j2WU5to=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=L9ZyPIRQX6h5sQFEmql52dlBDuIcjrP6xIui0CT1LKLhvDGiVFICcxSoQyM/DVOQre/Tj22MEjTbR1hnKYETUHlgmrD+0Rm99SormyPc4x1SwUl/6PBs4XGm+OE4qeD4RWQ0n9UfOAfoRJw0bL5TCRro4Or+VzexuGby4s6fIlSB6C13pJlzz8PpFgjZAju23GhLnLs+yJ9OnzWgEnoeH+j+8idSIB7TSeZVnzJ+BCB2D4dtJ16ciiKlAg7Og9wwRd4+mkE2Crvhq8kxlW8GfJa18CQcgaYYSyCpyf899UQBNblzcENpXR3wwci+mUtuqKDtbQcYkD1XjPjAzdXMHQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743609665; bh=bYGFAZJE5gOGW+bSZ19jhYSmTqJ3gCsjrfFKGUBHafI=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=P9fCm9L55u4JoBIeEW5dYnK637Gz/VDbR93KQGI+OF/GF84xnikPjOuz16B9Ykj0S15O9zmTCL3qoXkL0QCmu1mTt+KUawTuY4VzLskA1Iv2GCtpDy/CIo6nHsHRMC8B647yPkG6n9WZJ7PA/OTWkYj4Ipagvdpk/X82DuT65y2AaOuXX4iXXyfQ0xnRWyJJFYAQDlOkHuZG+AFXLWM7nxaBjNIz16JsUyOQtf0HwFlD7IECsg30HZZDudq7CAxYxLSp6OiYBP9U6zziMhzxwZ3Kg+OTO9qOKSS9mQQigGHcOYKxpte72cDVRD8B54pnsz+Y+czqmbS7sFR+kxo4GQ==
X-YMail-OSG: jIBsnzUVM1nLEQ3nUVMfg6h.8OEr2pFs8Gw6OmWGXViABpmfWJ7Q2X78REh2D0z
 UJHDLk_aB3faoJ9YgA2NuzJeTVpGe95wSbQRQKlhfCtEUu0TpdWWCi83t6X9wFTY3rZxZO2lBjr8
 CkpwCNHK8789kT24Zoa9GAyO5vYHIovvr7bG5c5a3sz56fGzT6ajLR2MFExCY6n_CB510vQvYuJc
 r.OvbtAlCoBf4JTklqsF0FZbWhKeYgngVw8bLN9vcxAUM46lovCBb_jgfKKOW34yoAEq6Weckfik
 kRI08R9O9yGoP.zOwcMs4AT0GewNgGNypgqy8rDMIna1AoAB0_xvbbXXL_zuVRdDrsVdk4OHIPYW
 MORfhgeQ8uFmiOk16Fla8oEaQPz423Q.8bbhOs.7b99PIZIkAH0T1gyx7QcjBKMA9C7BevlZrVnq
 GI6txvMLrNUufoTfIjwPGoAnTikvGLCmO15PBSekFvbvSRhWAsgpY9Pr5Y3oR5Vw76ZXNf77nAdH
 hO03mdfiXu63I_WoWxV84EWFDJC8qHCXm9cZJOwY08hnvTsMF3CN7opchdpeNRH8gEvKnVipebyo
 Yo18aGFocvzZNJ9ibyYnKteQxYHJzWMYJ6MYePvG096_cNmxnCEL3e3y8_EzLWXKN5kKa4FTWFJf
 X0tBgQ7rHM7mddVuD5zLYBomJ1T9_5PxjkOqrzag6m3YhjI1RUdFZ9x7_KFy61U6v3H5LesObaP_
 AVa9SXcqRE6s_N5mwMS3BCfVvPiKG_5GarMLTfHI8VEQhGjmDHVh6gH_py39lPSVnu_9A3_.GsAG
 enWGljfdPUtBShE6bwd2zWenkCdz2ED1nAYW8YslZT.7wFq15e6V7PkId5NpueiE4BqsRGI7F3Ex
 02UMioyhWMjp6ylrXLZcUXMWg6QxbFs8wV7.6ZeV9FXeqgmuJ59em2U_SwufVq7hnQE86fCko1UO
 LpQa9Nnsmz8zqXi93SmiNidoiOMzoZ7Ne763u9DI7odMpdwg7Aj7URdVIXK3EEFsjZCjKt4i.WXO
 vXXv9yHec4v4v_UWMcxqi6_YFKqNklv9zU9XBH6.4wNR267kjsCLoRYl_eBYtgstQZN3UOPU8RGR
 wLVb1XlTSIiyp_YT.fSpsDx1eSDVEGqFQCXrp109A_9wNZO_Tv3KK2Y67FIoc_VKqcLKnG8ca1JJ
 oxShr2TPjj3hx2u.eDd8QIVzcDGbfpyXWwp1s3iNmaoCaekEePDDzAYDORWqJ9UxMmPtVmBz0Ncm
 69Uj3myYyGNw6CwfYotxNu5NApojFtGcn7gIVEKWJ2bHwb7TMyfr4E_du9CR86CPdYWByXQGpqVB
 NzTGHbWKtmV5__p8OED81LC.vfWb5HrLVNCSLTNf50Tx4Q9zzYsttiMhivLTzjHK5MpEvAeVfNry
 PCbnkHZ2HoExJFo.DMrOTMyRluxTFOnKQ8oYgPip0_hAPki.uxllc0OePISz4hPoHKkENMhjqtg0
 qyRwFBYgZ8KePD8ZDySKEh70IzyUyTNdhVYc5Ru2XFLfOhRIfCM2GwHXTizo5JkzrkW.KbHVvqay
 ytOLcbtcFgX2evBHxMvRuF44mBTi8enNT.JbTMjwypFGsZ5LHzBs10d5WXV5sCmnfXX8xJuysY4O
 Luk3U0f1.awE2AfLgbKG28LQsZccyDwm6jLVJyF8NSue7sluEYLxWlRlnRL.lq_C.nazBQQESmS.
 _qxtfj8AsofPOenDAtBitNQIxJCgqgJPUvXEfKpMiFHuXE.zk_Ui.WZbNlx0HgwuhZCl29dihTzZ
 29U47ZsxR35IY75O66UrXN7ibe7XsJzLCzfzUUpPRCK5Qn2713ADI5UjCDPS_2VQN1uuhJdqhJsL
 1q_ar03oOEjsPYxAD2d.JNm3SizopraGkz1If2PubPulDbeM0YEfP7hu2oR0NO4a_eibeHB5N2Ok
 VoviraBGYK2Du9UNuXg21wMwux_81mJezniYtmJsUAH1PHi69D91PphWq9Y6LCLMOvUi1pvY.u2Z
 13ewo5Y5rAE4BEAATN8KHI2YViTWlS12O7XVB_VgoTB7gVcL_IuBRkZHDSMgSsYlT_iV8eHWDNF.
 yVBUcRzA2h0e90TGo_W86OAVji6cDBQ_ZX4mmeox_ZdxN6Wiu1u1.u1iwZj.UAslNWhBkwM.IpE5
 oz4b1_zNPf08FdYX9Fkv1rLSn9XllZQ0Zmk7yxjK6wIcBOYwg1eDwPdoPw6c0csMGrXQPkA3RtWM
 Q2jXgqQAzo7Eou1Kqmf4B4vfXmFkGsyUMihwujlG253NZE61f3hYExFATt8irbhmsxjdnWFWZP35
 EPph0aZu381o3l2I-
X-Sonic-MF: <igor.korotin@yahoo.com>
X-Sonic-ID: a1b7ace1-246f-4b8f-b339-1964d0b2219b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Wed, 2 Apr 2025 16:01:05 +0000
Received: by hermes--production-ir2-54ff696c44-s4fnp (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 38c58ca12d76a6cd95a1fab2f38986c9;
          Wed, 02 Apr 2025 16:00:59 +0000 (UTC)
From: Igor Korotin <igor.korotin@yahoo.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Igor Korotin <igor.korotin@yahoo.com>
Subject: [PATCH v3] docs: rust: quick-start: update Ubuntu instructions
Date: Wed,  2 Apr 2025 17:00:47 +0100
Message-ID: <20250402160047.1827500-1-igor.korotin@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250402160047.1827500-1-igor.korotin.ref@yahoo.com>

Split installation instructions for Ubuntu into 2 different sections:
- For Ubuntu 25.04 and 24.10: these releases provide easy-to-install
  Rust packages.
- For Ubuntu 24.10 and below: these releases provide rust-1.80 and
  bindgen-0.65, which do not set their tools as defaults. The instructions
  for these versions have been updated to configure Rust tools properly.

Signed-off-by: Igor Korotin <igor.korotin@yahoo.com>
---

Changes since v2:
 - rewrote commit message to reflect the latest changes
 - split Installation section for Ubuntu distro into two sections for specific
   versions
 - https://lore.kernel.org/rust-for-linux/20250402104759.1764282-1-igor.korotin@yahoo.com/

Changes since v1:
 - rewrote commit message to be more concise
 - reworked instruction's steps not to make global changes
 - added overall build command for Ubuntu.
 - https://lore.kernel.org/rust-for-linux/20250331170118.1376899-1-igor.korotin@yahoo.com/

 Documentation/rust/quick-start.rst | 53 +++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 4aa50e5fcb8c..3fc4492c9ee7 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -87,18 +87,61 @@ they should generally work out of the box, e.g.::
 	zypper install rust rust1.79-src rust-bindgen clang
 
 
-Ubuntu
-******
+Ubuntu 25.04 and 24.10
+**********************
 
-Ubuntu LTS and non-LTS (interim) releases provide recent Rust releases and thus
-they should generally work out of the box, e.g.::
+The latest Ubuntu releases provide recent Rust releases and thus they should
+generally work out of the box, e.g.::
 
-	apt install rustc-1.80 rust-1.80-src bindgen-0.65 rustfmt-1.80 rust-1.80-clippy
+	apt install rustc rust-src bindgen rustfmt rust-clippy
+
+``RUST_LIB_SRC`` needs to be set when using the versioned packages, e.g.::
+
+	RUST_LIB_SRC=/usr/src/rustc-$(rustc --version | cut -d' ' -f2)/library
+
+For convenience, ``RUST_LIB_SRC`` can be exported to the global environment.
+
+In addition, for Ubuntu 24.10 non-LTS only, ``bindgen`` is version 0.66.1. 
+This version contains a bug https://github.com/rust-lang/rust-bindgen/pull/2567
+``bindgen-0.65`` should be installed instead, e.g.:: 
+
+	`apt install bindgen-0.65`
+
+In this case ``bindgen-0.65`` should be used explicitly, e.g.::
+
+	make LLVM=1 BINDGEN=bindgen-0.65 
+
+
+Ubuntu 24.04 LTS, 23.10 non-LTS or older
+****************************************
+
+Though Ubuntu 24.04 LTS and older versions still provide recent Rust
+releases, they require some additional configuration to be set, e.g.::
+
+	apt install rustc-1.80 rust-1.80-src bindgen-0.65 rustfmt-1.80 \
+		rust-1.80-clippy
+	ln -s /usr/lib/rust-1.80/bin/clippy-driver /usr/bin/clippy-driver-1.80
+
+None of these packages set their tools as defaults; therefore should be 
+specified explicitly, e.g.::
+
+	make LLVM=1 RUSTC=rustc-1.80 RUSTDOC=rustdoc-1.80 RUSTFMT=rustfmt-1.80 \
+		CLIPPY_DRIVER=clippy-driver-1.80 BINDGEN=bindgen-0.65
+
+or alternatively, modify the ``PATH`` variable to place the Rust 1.80 binaries
+first and set bindgen as the default, e.g.::
+
+	PATH=/usr/lib/rust-1.80/bin:$PATH
+	update-alternatives --install /usr/bin/bindgen bindgen \
+		/usr/bin/bindgen-0.65 100
+	update-alternatives --set bindgen /usr/bin/bindgen-0.65
 
 ``RUST_LIB_SRC`` needs to be set when using the versioned packages, e.g.::
 
 	RUST_LIB_SRC=/usr/src/rustc-$(rustc-1.80 --version | cut -d' ' -f2)/library
 
+For convenience, ``RUST_LIB_SRC`` can be exported to the global environment.
+
 In addition, ``bindgen-0.65`` is available in newer releases (24.04 LTS and
 24.10), but it may not be available in older ones (20.04 LTS and 22.04 LTS),
 thus ``bindgen`` may need to be built manually (please see below).
-- 
2.43.0

