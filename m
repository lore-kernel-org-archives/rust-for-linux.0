Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8A725A2A4
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 03:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767670846; cv=none; b=P2t+/EBSlmod7poTv7x6Xzfzf6U/vfgdpf51x/Sz6+Nk9aU3pDI1erj953T9zYfc/v/c5WFvGCYplX3M7RquhfM3LygG5gss4IRx+bBnJW2Nq+G4rAuwLLFECj2YaFwmJHGo0NNmeoFOleAB9KjzVcotoC2L15OLgYcqsm8d3ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767670846; c=relaxed/simple;
	bh=OOuDQWL7rDlew/WGa3KSreC3fgOPOQ3rVxbYC3htb0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ke2NPHJzm2CYmFb9y713PmpbdDJuL0N9Nyqj2L6L6GOBCw1sKMG6/3QcgIeL5t3nX59c4U2Iq4e/BSKRDpeg1IxhRP6pSMuvLBG5Nv+a8q6H8VmtGXF5ia+p5cCYnLCt7nuXpLcUc3MfIS1sf/IiKbDzqOlonGkCg934YIDnyAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6mc9239; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6mc9239"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ee13dc0c52so4456221cf.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 19:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767670844; x=1768275644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RNrPWh5AE3rAmQHMWYYn+VrBXM2trm2Kn9xoWyeBbVA=;
        b=a6mc9239BvOPxNfb00Hf1c3GuyAKIFOMXRjEqjcqsUyj9tEb+6cN4x8Q4SgQGNVQO4
         u6yaLOMIFyMrn8MKtUEDFnVJv1iPZX1eFTtn7vcaRo6MI5+fsdvI0vhOmlR2jEpDbXVN
         TVDsx80K2IhQQX/n404OigH/j7WnfInZLYXpSckMO6/wye9iKdBB/j3zOBvxZKz9B9Ea
         ISsHLae2+Ms3ZUKRgXkhO6QYhKHWlMk23LdOHESgz9w9FmJ0qctElq91/Ml3hayD0yTn
         XMzRolleuU/z5dPfEc9uiSLcH6PHrG7M5eowhXThojl7ZlP0BbTOw2pvsjM3WzwK1+zT
         oQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767670844; x=1768275644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNrPWh5AE3rAmQHMWYYn+VrBXM2trm2Kn9xoWyeBbVA=;
        b=kKLFEi2OamYcWNVqNrO2DRNq5P1b6mjbfIJt5TEV7RY37SgsRm3wR3HX4O0atKuUaq
         c6cC+AhEPposQH5b3aVfhKVzNSB0v+pyfVeUxF50rdPK7imiRvHPwqRPuyyWKwk1p7tL
         gcrNTwvXOLMghZdfq22pqwG51oIr8RHmrNhV38p88zf4a6ugY4AA89wBS9Wru9YGn1vr
         txKrEuDAlXD/Mq5BgLFRuOpDQOLcmSUE7thgux6zjvoHerZ7IEwBqKGnViY47qKCwUHJ
         2Y2WBBd+m1ZIFud+ovTYBY7HgcCXetElSep1FUJRynSfFLIHYgGIg1E14/Hz0WAG2y+H
         IB/w==
X-Forwarded-Encrypted: i=1; AJvYcCU7XQ+euP1Lswy0YjZbw5PfUvR3bZj0d2isQ0RHWLkXYAlQ/4ZqNMTWBUngwJt2BjTSG1xGYlUfLx3IqQVFuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhIW2Rw8QGWv8FqAz9weSKFDH27aMk5HFBT4xvtkLZ93ML3kM5
	B9EGrn0BUaDQ2tXSmWcdypnDfmygElnuyo/o+Nt2YBw1fwjmE2yIzuvE
X-Gm-Gg: AY/fxX7wxh2FXhsUJb82yNJmU1V5PPj+9iWO4mTBt2MRcVpPpY72X0y5xlUH55U3bgi
	jfCmlhLaE0rHMKl6qQ0SBalWxOE2RyLe4OPKoouDKAlNQcF0hM2PNjzCigtuGML+tOESKHyeEXP
	PdA2G3i6tRXyc8cKeROsD+u4vb3K8FexOhbEYTJ/AyqiHbINI2mcI6yF/Gln+CdBq4fjNXQ3yL1
	YTfhnhH5MUSbq+wozgR58oodPCTOeyMB4oyjAR4DzdAsuKr3fCWU5EJ7exab/a5pbKKWUiXz0jp
	MkatghmjYJHjfHmiL/2NGZnT8qd71CFaG6opGE6mhlsezUe8u3jem/A+Xc35KaDyVvgSVB9YtWr
	DtEW8V1+NC9nlQZ2IzbyWJ7BMcjRr0gpA00MmGns/aT+Y23BmsqquNMlxGxrmPJuUDsXVD/7NLx
	EVfSXJE6CfS3Btz+JIxUIWh5jAlglEC3HJZuMv/CzaewIcv+9kq15ahx1UTmbSr4kkQfnyGFDee
	+28SX9BPAr1xbA=
X-Google-Smtp-Source: AGHT+IHxC3GLxP2uU71mYCKNA9W30x5Cz81+kFYZ7QfeUSFgXUvH7ja/9RuB546wY6MNOWsmqOyxjQ==
X-Received: by 2002:a05:622a:418a:b0:4ee:1ed1:43c6 with SMTP id d75a77b69052e-4ffa7699f97mr21800511cf.10.1767670843731;
        Mon, 05 Jan 2026 19:40:43 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907727c6besm6387786d6.54.2026.01.05.19.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 19:40:43 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9B58FF4006C;
	Mon,  5 Jan 2026 22:40:42 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 05 Jan 2026 22:40:42 -0500
X-ME-Sender: <xms:OoRcaUf8R5TYFlU7eU_xOJfr1hoD_M84P-GdtJNIB7Kflr2906EuMw>
    <xme:OoRcaWr7Lg7gzhN_jv5IL4SY8T7YTT8L3Nmj_IRNyZ2zm6Via9GS6jEwWQF4rkfwP
    Ih_AcqaXCZv5cmNtzm6uAWDwxlm0PDBOXbhqkyiH8hG3pEpn7UgbQ>
X-ME-Received: <xmr:OoRcaa-LWMbgNk4lTtFFBw1_ybH2pj9DnnZm-EUQVuW6C8TuEa4avQ49>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelledufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgeeljeeitdehvdehgefgjeevfeejjeekgfevffeiueejhfeuiefggeeuheeggefg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhugidquhhmsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtg
    hpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghruges
    nhhougdrrghtpdhrtghpthhtoheprghnthhonhdrihhvrghnohhvsegtrghmsghrihgugh
    gvghhrvgihshdrtghomhdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhsohhluhht
    ihhonhhsrdhnvghtpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpd
    hrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepsghpsegr
    lhhivghnkedruggvpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhinhhugidrih
    hnthgvlhdrtghomh
X-ME-Proxy: <xmx:OoRcaX4Kv57O0rk0RhqC5Xxvyi9QdLZFyl_Gq76Oga3txO7TDN57QQ>
    <xmx:OoRcaUgkpCJaMiVQyAWj_JDSf8RxsUPhdIDiBBNoNWzVcBbGU0lT2A>
    <xmx:OoRcaeoppTBz5qtC1J4Yz33_hiwLutSkQNMHmB4yjTmvAsBGZXrYbA>
    <xmx:OoRcaQL6dBClgSp70KgbCbA3R-tmK3Ybs9qT7_BeQnO0t8zgVB118w>
    <xmx:OoRcabvlVRZAMpBmzSLua6UK3OGP8Q-stAcwkCU0JbZn02kXwJQRalPE>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jan 2026 22:40:41 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-um@lists.infradead.org,
	x86@kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH] arch: um/x86: Select ARCH_SUPPORTS_ATOMIC_RMW for UML_X86
Date: Tue,  6 Jan 2026 11:40:34 +0800
Message-ID: <20260106034034.60074-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aVxcAZe6AEXEfx3G@tardis-2.local>
References: <aVxcAZe6AEXEfx3G@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

x86 atomic instructions are used for um on UML_X86, therefore atomics
on UML_X86 support native atomic RmW as x86 does, hence select
ARCH_SUPPORTS_ATOMIC_RMW.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
UM & x86 maintainers,

I need this to avoid a build error for Rust atomics since Rust currently
only support Atomic<i8/i16> on ARCH_SUPPORTS_ATOMIC_RMW archs. I will
add it to my upcoming PR if I get some Acked-by, thanks!

 arch/x86/um/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/um/Kconfig b/arch/x86/um/Kconfig
index bdd7c8e39b01..44b12e45f9a0 100644
--- a/arch/x86/um/Kconfig
+++ b/arch/x86/um/Kconfig
@@ -9,6 +9,7 @@ endmenu
 config UML_X86
 	def_bool y
 	select ARCH_USE_QUEUED_RWLOCKS
+	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select DCACHE_WORD_ACCESS
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
-- 
2.51.0

