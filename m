Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399003E7165
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 20:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569039; cv=none; b=gDxkTEr5RvyifxNEdJyYZEqgHsFtHEJ9NB91SwJSAFQe0DGHPGvmWY30xVGoIwyGk7U/xsyWjMTwJJ3nLqNyi6GlJcYdze66bB7gMeXvsNISXadi7bAs4Hm5iqYfqjHv/FCqE/9AXFd324ttiJLZn8cv34CuUgkOcsX9AO8WTEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569039; c=relaxed/simple;
	bh=9lBopCnAyhkwiXawDtFXjRwrZUoXdBnCkHoSFWpEvY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zxi3HCuT3+FmiPTn8paCAc/8RnSCv1+uacwBHptwfdhaJQuCX5gMH7bj0iX7LfoH6Rr1bVqw+O/vdJXg2syJ3e2fn5K7pZbAbwuMKO5prDniV8ulf/iJuBcwP2NAcnBYTxLChZnsd3fanXQulW9oscxdDtc/kPpiTUAKXFQAN20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n+gXLygw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n+gXLygw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA1DC116C6;
	Tue,  3 Mar 2026 20:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772569038;
	bh=9lBopCnAyhkwiXawDtFXjRwrZUoXdBnCkHoSFWpEvY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n+gXLygw55vmXe5Px7ZBSuNAqQt5GhAE/QD36MeAlP4TWhFLc8xk0c1vai+XYEheY
	 W/A/EzL8tnMufsIbQzL75X1tmvuCFat1MY0pCkKioLzC+1I2cY3yrJIKDJf1Wdb/UQ
	 Ybwpnu5bVyqWMI1tNWbqHtxY7gEQ1RYxhaTlwmGkrIISv3ixtYwDHKUrvJ+WCTTnrk
	 eznkFU3afgzDijpckXb7GtYlFWh/sS3w4x6Z2vC+XC9l3SsDSMsKWy8dOdQcNbAZRQ
	 ++nBt9xQ3WwT9qErlLSQIAfrVMC0Z1vqANBVEszjfqsrrrgq1knYLHCbEgKnEPdChn
	 efJRw6+sXE3fA==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id BA421F40068;
	Tue,  3 Mar 2026 15:17:17 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 03 Mar 2026 15:17:17 -0500
X-ME-Sender: <xms:zUGnab7jcnSH8JUm-m5V5XT_7VS_zRS0zJ_uD5MBU1PBiQDEjTNSJw>
    <xme:zUGnaaT3FVbw_2MIHBOA6DXNFgeqtEt1aqmVu0wHrnhhgK90RifKcaGfrxuAOtuuT
    xvCkE2SDpMi4DxqjOFC6Fa9YMotP6KADfK0VrLCk803jyD4s9xE-9k>
X-ME-Received: <xmr:zUGnaa8GB7dBYIcq5YRyjjtnS7Mi0uelkAcnCj-00xPTO_xYg_nwAUd4gnBIDGfF7f1ojYTpPXObhzdmblIwHAMREVmfMtPm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekieffgeevhefgudffveffheettdfgkeeilefhhfduhedugedvhedtteegvdeugfenucff
    ohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgr
    rhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpg
    hghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:zUGnabqQi2UFOqc_p9dbRKHU6A3LhJG_nXr84_JzXnm8vDF6EG0SKg>
    <xmx:zUGnaQXBmDbxW5S9_ZrgjY2TR0Dbou_ww5ZRpe3cVYmJby0ld__A5g>
    <xmx:zUGnaQ53knDS7OIz4HMZbHQID7edw50FFLSnottWuoal84jZCAFlsQ>
    <xmx:zUGnaWDnMCRa6Ju1i5KUzyeRvcsamp2ql0_6hRBBQJiAsOX4wzjccQ>
    <xmx:zUGnaceCdy5vxZGMd9VczT337N2n3_WSJMZgZfkvoIS32mrcVTkg3ILA>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 15:17:17 -0500 (EST)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 05/13] rust: helpers: Generify the definitions of rust_helper_*_cmpxchg*
Date: Tue,  3 Mar 2026 12:16:53 -0800
Message-ID: <20260303201701.12204-6-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260303201701.12204-1-boqun@kernel.org>
References: <20260303201701.12204-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Boqun Feng <boqun.feng@gmail.com>

To support atomic pointers, more cmpxchg helpers will be introduced,
hence define macros to generate these helpers to ease the introduction
of the future helpers.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260117122243.24404-4-boqun.feng@gmail.com
---
 rust/helpers/atomic_ext.c | 48 ++++++++++-----------------------------
 1 file changed, 12 insertions(+), 36 deletions(-)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index c5f665bbe785..240218e2e708 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -67,42 +67,18 @@ GEN_XCHG_HELPERS(i16, s16)
  * The architectures that currently support Rust (x86_64, armv7,
  * arm64, riscv, and loongarch) satisfy these requirements.
  */
-__rust_helper bool rust_helper_atomic_i8_try_cmpxchg(s8 *ptr, s8 *old, s8 new)
-{
-	return try_cmpxchg(ptr, old, new);
-}
-
-__rust_helper bool rust_helper_atomic_i16_try_cmpxchg(s16 *ptr, s16 *old, s16 new)
-{
-	return try_cmpxchg(ptr, old, new);
-}
-
-__rust_helper bool rust_helper_atomic_i8_try_cmpxchg_acquire(s8 *ptr, s8 *old, s8 new)
-{
-	return try_cmpxchg_acquire(ptr, old, new);
-}
-
-__rust_helper bool rust_helper_atomic_i16_try_cmpxchg_acquire(s16 *ptr, s16 *old, s16 new)
-{
-	return try_cmpxchg_acquire(ptr, old, new);
-}
-
-__rust_helper bool rust_helper_atomic_i8_try_cmpxchg_release(s8 *ptr, s8 *old, s8 new)
-{
-	return try_cmpxchg_release(ptr, old, new);
-}
-
-__rust_helper bool rust_helper_atomic_i16_try_cmpxchg_release(s16 *ptr, s16 *old, s16 new)
-{
-	return try_cmpxchg_release(ptr, old, new);
+#define GEN_TRY_CMPXCHG_HELPER(tname, type, suffix)				\
+__rust_helper bool								\
+rust_helper_atomic_##tname##_try_cmpxchg##suffix(type *ptr, type *old, type new)\
+{										\
+	return try_cmpxchg##suffix(ptr, old, new);				\
 }
 
-__rust_helper bool rust_helper_atomic_i8_try_cmpxchg_relaxed(s8 *ptr, s8 *old, s8 new)
-{
-	return try_cmpxchg_relaxed(ptr, old, new);
-}
+#define GEN_TRY_CMPXCHG_HELPERS(tname, type)					\
+	GEN_TRY_CMPXCHG_HELPER(tname, type, )					\
+	GEN_TRY_CMPXCHG_HELPER(tname, type, _acquire)				\
+	GEN_TRY_CMPXCHG_HELPER(tname, type, _release)				\
+	GEN_TRY_CMPXCHG_HELPER(tname, type, _relaxed)				\
 
-__rust_helper bool rust_helper_atomic_i16_try_cmpxchg_relaxed(s16 *ptr, s16 *old, s16 new)
-{
-	return try_cmpxchg_relaxed(ptr, old, new);
-}
+GEN_TRY_CMPXCHG_HELPERS(i8, s8)
+GEN_TRY_CMPXCHG_HELPERS(i16, s16)
-- 
2.50.1 (Apple Git-155)

