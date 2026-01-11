Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F7033B6C6
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132709; cv=none; b=sdxJtG2juOYI3+krEOdhZwyiF25tiXyNQS3ESzri5XEe2OYbqjNR0ckQ2yIe+lhUWKerq8mWAf77xULECaRGH3nQ7IX/08lo5O0K2f1GOckFO2lvu1SHoRbENHppBS8Rs4DAZVxoDKj2VCmMaLBRDabHe6EivdOGBAL8+BFfTxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132709; c=relaxed/simple;
	bh=qoDNG6DumbB68T3T/3idHm5J3FT4KY0Gxz5BLyi2v+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ccdbvlqy2q3LYAi6vh7p5hD6s5lu7vALu1g0SoDbJ7caD7jZRXw2UGWnvwytOPjpm5rsNmqpgip+3d1Cbguzymk+hC7uu/Z62O55u5AGBq5wexEZaR90SPUNHscd+iRJNP08Bh80NObZp+ISlamx5egMO4rddimXLlI0K0Ah7rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVU1WMBU; arc=none smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVU1WMBU"
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-88a2fe9e200so52855456d6.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 03:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132707; x=1768737507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zzUujVMOfW0CmXB1JVajE/vv1q+DHQuZ+S5KxfCqrRc=;
        b=fVU1WMBUX8s0CSo1dloAcpgPU1rVi7C3jLwmEmOzmqOdfqJvUj/3cM3nXZa3LKVEO+
         0j5+s6NLpOqKa6Gr7+oHpzVxtj+bTw6ALQ0EH9vFsXVVmvtF5XE+Q+Hm8BzBgRi9EiSi
         q4/4QNieylF4ve6rmePxcibM4saWZ1qy9/XYjp3QCsDMDfGlbyBsYcPLTEeteqAMQjND
         qTlvu4azRxQke6enL7DkC8tM1PcQ3iF/8X1jKbP9se6PfjPfKKat+KhXkQyr8MNq8JRK
         oMXpiriC7mpyJsp0M6RnAxQlq8Wd5tjaiDmrW6cIeqIEUfiY2fGJJtXYhA7nOB5VUWTg
         wiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132707; x=1768737507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzUujVMOfW0CmXB1JVajE/vv1q+DHQuZ+S5KxfCqrRc=;
        b=MFMogaqsIGjy72tHFYUwhW91k2M4fS99nKyqb4nQnVGS6pJkGR81RgiOCa7yCNleFZ
         NvVc0yHNxry4umx5B+0zwgm4mtNLLTOws1tsv0prLUgVA+EOAqR7H2H8NPkD2vuqhznN
         gsV5ZoZSymTp4OLk6tFrS90qwV8Ok/L/DrRAzad8rA1wvP/BLErCqlML87sazPdVluRP
         xSu1TV5sLI8XcnG0AoFwmP8aMyuhpnlI1BVsldsr1echNwO0s9p/jijM5UXov2Dx55V7
         0Z+TDnOEpTxA6+EpuqrnL+V7BVsxfZNfX0uqzcvf1xwG66vb558V8APQT/g0dHDRxcda
         Mu5Q==
X-Gm-Message-State: AOJu0YxhULwiCqMIpfhqn6rj8vaoqwlGhDsQQcF0IrRAMffujtVo4jGe
	KrWioUxSTYPGfiVighH8LCoTScvb+Ac1QyWtIwdlzunOuTbpGgQpmUSg
X-Gm-Gg: AY/fxX6u/nDnsEZ8zJQ6OaOtoertBAi8SIpLziivrTEpOrFrLLHE0Dtk8jm1yJKYmBx
	bpDXLrd+rEaMazeO8xAJyqxuD+lPPEBUqxmTEmog641JgKU4bO5kIVajbAi8/5a00xpFPfOCDB3
	zN6LhQU8LOO3JQCXflJ45kxEzLbx71tOTsMeCqTyl1UlG9B2DtghKpN9MiwM5qOm3YaFe50vWnx
	fnvHwsmT6GaBWoOq5wSv9QGGBFPye5g/wpd9MUCjaZ2gtPY+27/1l5oFFKKv+KG+FUdTSOOqlf9
	0hayAFNhtzepVEWgJFbX2l17l9d/ndEPCrgEugbQ6eJRC09zY+OWPI7SWIupFVv9pa8poUh75Vx
	OLnjeqIQTIV6pxu7xkSz67p4N8exOvdiycD42YWegdPm6Df0rqkdrlgAmg11W0JsKNK+kE2dwkp
	+83UIOUxFjQv9p1/0AcaJnZVNkoDAonbbkuPThEKG/q8Yz54Ld3EZHQWNJ2lnurprfRWHRAcHAL
	WnwbbE/mpz6uM8=
X-Google-Smtp-Source: AGHT+IHJW7k+GRHqRAb3CL2r7KFiYmpigdll/HxAJp1W6BUhyxhwHpd+lAJ8vIkHXKff/LZD/yUmww==
X-Received: by 2002:a05:6214:578a:b0:87c:268d:bbda with SMTP id 6a1803df08f44-890842dc7a0mr200399756d6.60.1768132706668;
        Sun, 11 Jan 2026 03:58:26 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907723469fsm128951486d6.37.2026.01.11.03.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 03:58:26 -0800 (PST)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 90FE3F40068;
	Sun, 11 Jan 2026 06:58:25 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sun, 11 Jan 2026 06:58:25 -0500
X-ME-Sender: <xms:YZBjaW32bhQwzqEM_PoYdKiKJ4N1YgRFfC0uhv0MGr3lEletSLsIvw>
    <xme:YZBjaTfvVZ6jAtpia8IEm6Dxq_OFbcwm7RVEUE9R6qYDUriIDFVEKSA0X2N07QFPJ
    QCg2X4Fpmjjku4oSejOoo10TVaLYIN4L7zSQgW2cID_YLlgtBQXKg>
X-ME-Received: <xmr:YZBjaVDk_IRpnXP6XdMjEmsuYahEOaBTINRiEGGzB5jNz7QwCX4Sb14K>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudegheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:YZBjaS869MnO9k4iQqbc2d5uepj5FgkNN_C3m_2kqhMegrHOOoDiEA>
    <xmx:YZBjaRoFwmI9pDJlKmB5Nm0xm6bbw0ROvJ-SHkLV1A06N_Vc63F1jA>
    <xmx:YZBjaUH709DpihEM-PqfQAGvJYgEnEknZNUEtoBkkBHLZF5BqwiA3A>
    <xmx:YZBjad_Qzbzr3l96hpJFHgYDZlnGctwM5FQvZIwkIE7wIV7nztA0sA>
    <xmx:YZBjaZQYcJMA3BddhoPbw_6uG_4ooS108sidchM02x_xpCvjd4rz13GX>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 06:58:25 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>,
	"Ingo Molnar" <mingo@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Will Deacon" <will@kernel.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 01/36] rust: sync: Refactor static_lock_class!() macro
Date: Sun, 11 Jan 2026 19:57:33 +0800
Message-ID: <20260111115808.5702-2-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111115808.5702-1-boqun.feng@gmail.com>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Ryhl <aliceryhl@google.com>

By introducing a new_static() constructor, the macro does not need to go
through MaybeUninit::uninit().assume_init(), which is a pattern that is
best avoided when possible.

The safety comment not only requires that the value is leaked, but also
that it is stored in the right portion of memory. This is so that the
lockdep static_obj() check will succeed when using this constructor. One
could argue that lockdep detects this scenario, so that safety
requirement isn't needed. However, it simplifies matters to require that
static_obj() will succeed and it's not a burdensome requirement on the
caller.

Suggested-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20250811-lock-class-key-cleanup-v3-1-b12967ee1ca2@google.com
---
 rust/kernel/sync.rs | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 5df87e2bd212..1dfbee8e9d00 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -45,6 +45,21 @@ pub struct LockClassKey {
 unsafe impl Sync for LockClassKey {}
 
 impl LockClassKey {
+    /// Initializes a statically allocated lock class key.
+    ///
+    /// This is usually used indirectly through the [`static_lock_class!`] macro.
+    ///
+    /// # Safety
+    ///
+    /// * Before using the returned value, it must be pinned in a static memory location.
+    /// * The destructor must never run on the returned `LockClassKey`.
+    #[doc(hidden)]
+    pub const unsafe fn new_static() -> Self {
+        LockClassKey {
+            inner: Opaque::uninit(),
+        }
+    }
+
     /// Initializes a dynamically allocated lock class key. In the common case of using a
     /// statically allocated lock class key, the static_lock_class! macro should be used instead.
     ///
@@ -101,12 +116,9 @@ fn drop(self: Pin<&mut Self>) {
 macro_rules! static_lock_class {
     () => {{
         static CLASS: $crate::sync::LockClassKey =
-            // Lockdep expects uninitialized memory when it's handed a statically allocated `struct
-            // lock_class_key`.
-            //
-            // SAFETY: `LockClassKey` transparently wraps `Opaque` which permits uninitialized
-            // memory.
-            unsafe { ::core::mem::MaybeUninit::uninit().assume_init() };
+            // SAFETY: The returned `LockClassKey` is stored in static memory and we pin it. Drop
+            // never runs on a static global.
+            unsafe { $crate::sync::LockClassKey::new_static() };
         $crate::prelude::Pin::static_ref(&CLASS)
     }};
 }
-- 
2.51.0

