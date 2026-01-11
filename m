Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AE533BBD8
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132985; cv=none; b=gzszalGkTTGIRy6NlGFy2IXxWENjyFxeyvZJOiyjejGbMAWslejuFfGGL9UQkSD0kHNfh27ldbqXOQEmUVQk+yf0pyKAbKWeW80KT4kyEtz10MVSfX+8C+/E8ziViyW//blW0OkdgXnsnkysrKUNkzzdotbC6iGm3wLAmNiVMpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132985; c=relaxed/simple;
	bh=51HcHN6b+jQqJky8TvDy91xxC4jpTrOAkHiQMb5HM1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MH08WMJH2GzRrFMdx8br74/yb2n29Xia75umOyfjXtqKn6raUcKXMKcax81P5uQGGyqcpZvOHUqWsM12Yrtz2AkO39h6hpCpONJWgHkklQXLncnl30VXBe95Fcf5JrgB2hLpxME1i6HpAXtSWWHep6NlVLNA9EA6MVAAoSPXV7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgrTJGwm; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgrTJGwm"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8887ac841e2so48460856d6.2
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132983; x=1768737783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8NH2Tw0atUokMKj0Dxx5Wxsz9k9StfkgyCq3EMjhsxI=;
        b=ZgrTJGwmvPF3xg3ooVG6Wrv0Z7DV3DXCnsyzbe+Z+M/p0zju957WTQ2LCA/mPmPmPB
         Ir8cvYUtBQ7jD5WDq1ydGN5TcRgJIBw/oUVU9vWtYlxai8c+luRWtmxRcgZE8+T2J1tN
         BaU58a0yOiwJUrf32QyiDNn/XEPDSX581ZDmaFDTP+I8yCOwV9Yr3779EdnNuS8Z2SjW
         l6Ia1c2VBhra/6IOauZnwd6SakcgJasnBf221kq1C5TalZoFoWB/2J4f//z1sR5A0yoW
         tMwGhb175BqKyy/NFkVwlTkcpNk1IpO/hbG+mxbs3PdoPUYVYSIj3OC6fxo/cjf23iBl
         +eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132983; x=1768737783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NH2Tw0atUokMKj0Dxx5Wxsz9k9StfkgyCq3EMjhsxI=;
        b=Ln5K0U2Da+DHESc56YjHj87VOgtyyI0XxplJqWDz3aV3X848W/A0f31dL6cZ56BATv
         juQfH6mLTQiZwrOAWaG03wJCeuhYceFproaiBsiQNZYGkVGgKGRx9HQmReKEC5CofpTU
         6BguRKhyuxl/bay5ghs2belMOmS9nwoKOvDnn3yJL2T+DBlzXNHM4KqDsmjJxLcMmZSE
         cJE/5n80oYhg/b+W8+utaR/3fMMUFHE91+3qiJvOhgDT7BqpMtwab0pUmIm9Sg56MY0m
         FjN/ZpFo6bnnLfofgYpXGppIWm+q0zFqZMMXGPBS41ILZ+r3SVKko665Whj6t7MuKX6j
         CFVw==
X-Gm-Message-State: AOJu0YwWzZXhVBfltHz/7SgTM6kob/A1Qcf2o6WPMiDJLX8cIfraZ0IK
	D+Vhu+YEVxaDz/xKI9pLqysaHaOJC2igOLokCqX3dlG6pRosw8cxOLpE
X-Gm-Gg: AY/fxX4yF3fLwbdRZkya9QKo6ZxZ9eiIcpqm6dlnaA2msjw/hPLnavRRaej9txfmhum
	plpSP5+kHJTuMjUKn9Dn1ldDUlVASuSPO+BtEc1TxZYPVPUzakOQacfbwSgD7VDCOgeJd4YSxWq
	NshbbHYr56npLAZUl/9DMkrtmAuhIcLU6eKC+OFQnaKpyj76yNtN0d0lzIOBwYwW3lTlwb2CYfG
	UnZJTQHMO2pe1cgzdjp5KWv2mrb1d430ojaSLg+GBQrO/VkZNk7x5v/jKEK1KQ0sAMWG3xB6jLu
	jGwJcgwOow5hv76FiaoRCXfIYBw9Xc710LFogdotfttRQjACYY/b6M2UmDKp2sEG3VC10GB3Acx
	E95s4UXi9tAbW3sJG/RNS11tnqpNyNzKSsxmG3QGXQNHjIDZl+P9Q0dbxgjrF5Y/kKrzJJm6qxp
	dDS9vcP/N6LlffvnGrwtS97q4qzWBGJNG8WAWqnWK+XGLrGoxCPw9E2BxKadhxMbPuPe0dcF/ig
	mLnVInYOx7MQww=
X-Google-Smtp-Source: AGHT+IGh3HIx18uEf+LW60t+iHVD7tajeNot7nf2QR4TrEupA1yfki2HRCZVVhXQWFANkN7a0tIaNw==
X-Received: by 2002:a05:6214:3109:b0:880:5851:3c49 with SMTP id 6a1803df08f44-890840e46afmr186895356d6.0.1768132983464;
        Sun, 11 Jan 2026 04:03:03 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907724ef8fsm115115876d6.42.2026.01.11.04.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:03 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id AB1B0F40068;
	Sun, 11 Jan 2026 07:03:02 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 11 Jan 2026 07:03:02 -0500
X-ME-Sender: <xms:dpFjaW1I_gfCPGz3lS1ksqswDNGJ9D59kHglWMVu_wV6LeHb7Zm-QQ>
    <xme:dpFjaTfZB65l1VxOh44rRKhIghdvCdiMiaFI7AhSOmTbuOrTBWFsycEZWskG1cx10
    JjfgNJ58exsAnbjNd4qekbaZ0v3DNpsQYNbOj1nEtvPlUL6UtEXLg>
X-ME-Received: <xmr:dpFjaVCG-cPl3a_e7sA7_L6V-XMiLOEyenO5uhqCxsu9Y2VZbLxmgV89>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepvd
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
X-ME-Proxy: <xmx:dpFjaS80Ee3GokeAQZKU3APGxp0EGqKBok3eyQFnjhkNSVmgLbsZ4Q>
    <xmx:dpFjaRp3tNbgZNZsAPuaLfuo9Edl8zb7Lq-BSvxOvJkcBMsMnj64Cg>
    <xmx:dpFjaUGFehkSfy0yPRT7_VYPlEdGQTeP3lQZLflTPx-KUF9-8FhpLQ>
    <xmx:dpFjad-SsoMQbhJm-L6XAwgJaa1pWaQ26hwMHaHFH1pJ-uGYtRMgmg>
    <xmx:dpFjaZSyIqG9Ke7PuG-aE8AJpsGTTVhCIp8h30o0y8u0eGgOGts2fEy5>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:02 -0500 (EST)
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
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 19/36] rust: sync: atomic: Add i8/i16 xchg and cmpxchg support
Date: Sun, 11 Jan 2026 20:01:52 +0800
Message-ID: <20260111120209.6133-17-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111120209.6133-1-boqun.feng@gmail.com>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
 <20260111120209.6133-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add atomic xchg and cmpxchg operation support for i8 and i16 types
with tests.

Note that since the current implementation of
Atomic::<{i8,i16}>::{load,store}() is READ_ONCE()/WRITE_ONCE()-based.
The atomicity between load/store and xchg/cmpxchg is only guaranteed if
the architecture has native RmW support, hence i8/i16 is currently
AtomicImpl only when CONFIG_ARCH_SUPPORTS_ATOMIC_RWM=y.

[boqun: Make i8/i16 AtomicImpl only when
CONFIG_ARCH_SUPPORTS_ATOMIC_RWM=y]

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251228120546.1602275-4-fujita.tomonori@gmail.com
---
 rust/kernel/sync/atomic/internal.rs  | 8 +++++++-
 rust/kernel/sync/atomic/predefine.rs | 4 ++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index 1b2a7933bc14..0dac58bca2b3 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -37,10 +37,16 @@ pub trait AtomicImpl: Sized + Send + Copy + private::Sealed {
     type Delta;
 }
 
+// The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
+// guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
+#[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
 impl AtomicImpl for i8 {
     type Delta = Self;
 }
 
+// The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
+// guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
+#[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
 impl AtomicImpl for i16 {
     type Delta = Self;
 }
@@ -274,7 +280,7 @@ fn set[release](a: &AtomicRepr<Self>, v: Self) {
 );
 
 declare_and_impl_atomic_methods!(
-    [ i32 => atomic, i64 => atomic64 ]
+    [ i8 => atomic_i8, i16 => atomic_i16, i32 => atomic, i64 => atomic64 ]
     /// Exchange and compare-and-exchange atomic operations
     pub trait AtomicExchangeOps {
         /// Atomic exchange.
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 51e9df0cf56e..248d26555ccf 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -149,7 +149,7 @@ fn atomic_acquire_release_tests() {
 
     #[test]
     fn atomic_xchg_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             let old = v;
@@ -162,7 +162,7 @@ fn atomic_xchg_tests() {
 
     #[test]
     fn atomic_cmpxchg_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             let old = v;
-- 
2.51.0

