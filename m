Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8271330642
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132947; cv=none; b=H1hDNufcxzRWDLo1mNRIzKLKoC3ifH1N79Jr3F13u5/wPDJQlGaiE74LTVGnMuI8SU3SqfPH0tc8LalWHZmApamAms2dsZQAa24MoTA8o1X2hl7Y/uHkLNlZQKuWRFLJQkkP+mlMYn9WrEl5tgAi5GA0kUDZVqT3DN3JUbS/9ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132947; c=relaxed/simple;
	bh=9on4ayuVv7+XTrtlfAIj7SsuIWOQRo1Z2nZVwpdRs4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JEyqomvz6X+9RNwh/UWx9JgLfuB+4wXcd1dn2KIFYcTJQ6uat2qD2a4JO9f7akiEUzplF7wIS2H4wJ2G0PkG3mJwms2af1fmu96Ntb/1VnKjcIt4NrIXGrrA1klgofeUgaq7q32gekKb93LN1dw8/f7dUM8Vvos91yaNZIhfhBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3xhJbCf; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3xhJbCf"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c2f74ffd81so577126085a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132945; x=1768737745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2gvqM6cgcNCPewaPlNPRQwapucK6C50wAJVV0/11pk8=;
        b=Z3xhJbCf07pUy/Fex1tI7B4Whp8wSEn4NlDLaGBLnnr6jjDc9Pvtp4PYC5JcEJ3fPP
         jbo2kpCieUJgcuW1nOnkp+E3qxuFmJu7y10imc9iTuNAlswZZfmPrCgBSUytHuEeFAwl
         GK99MLM+3YhIN0RKSqS0OuVswpAZ34isjrIRKYud5qhlJ/RbId9JiOijfiJ5J2xTwzes
         4JCiPuOXj1w5easPqRX9J6pFWYGu+n7ma7N0aca45QNpScuO1bhMOQSu8z93/XhqVZLV
         KdofGdVaEGsHLg+dH8ijjw36ht2+L8l4aem+QH1BIizrzJvUz7npnVFpLhbVNZqupmm/
         jhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132945; x=1768737745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2gvqM6cgcNCPewaPlNPRQwapucK6C50wAJVV0/11pk8=;
        b=NFLJaaQvKr6fu/hTTTdzIa/ZP+3oVQ8brugUkGtkgVJDpTkjEJiZsAIVUmb0Y3C1ow
         hA5vhNm9J5DMYg0NCxrcWiZqCjJAMpMMYBBy/FHIWkHGZAXH9TwX0lkKB2+5m6SvtV6P
         tfMbDgRebDrKUZ8hPBkx3MFxAZOJ6pcAx+qY1hG9b2V0OF4ZA/zTl5Jxzi9twOi9sz7t
         7oEDo+hE0vTw/Wd0R21EN+YPZN1oGZxQrvgG+GN0keqQl4UN8VXPMFIFYrYtrFpKFGAv
         R3eMEbVHmDcJ36Oi7KmkwYAcM7VQjhuYZ/MEcxqkurbpAex1F1fOnLICRk0jfi/M6luQ
         n8eQ==
X-Gm-Message-State: AOJu0YzoM1WxzdKVvnmfwlodMdYeYf39sATq2JxcWn5a9fYAVbOyc2jv
	uWjmgw09lE9RrzLDyaj/lhPT70+mLoBmlhXYMc+9oS6IgFNSSzRiBsqz
X-Gm-Gg: AY/fxX4NoNj2LbKKzeDJBlgLg/ksQpqDEGtPMdkHujG4VxtRliB1cF02ZOTpmlKvQqF
	/Ow7kD+cE2B6Z1yydhHSP4atDFFtM6dTEptX8ySeE/RhGcFos/vupk4EWMqplSljytZKdJO/YGl
	/uhxw7nwbeR3+74dMLBFBBsZsetNHXfdyMpYgxgtVSTiBh6VRB68O00wBXYJfiXs9J9zUXc21BJ
	NZvQqs3Hdm1QT5T9gCnsiQ+togb+sM/6zo+fY38B0sQ4jH4tw9vVjKu/KhU4C3pRvMWgLbDQPll
	p2sjl8ROSbYvadQqod/oevtrecQf9TeEUFFPF+ZS/8561jPeHcJ8paPfqOgS5Cmk2L4jZ8hionw
	z4O7XrHOlO3VhU43AFu7BBRmdQHCecN4VoXtHLlTWY7zY3nDesQ2ELGWyP+2og32NCVxfbAcUvo
	YIYO5zEfm273+HZgytraZLmKVcWQrQQKzVmUS7Z3p3HwjW2mWGPqTytHRA8eXBYgy13f7Z9FSGK
	9YXEHCZM0FTkUU=
X-Google-Smtp-Source: AGHT+IEDnQUa9zSfL2lUv/4JtoHHxHSNyYruL2hbGDAes18H/X2//8OIQtWXrH+u0RfG3XMQujCiuw==
X-Received: by 2002:a05:620a:298c:b0:8a6:e160:9b1e with SMTP id af79cd13be357-8c389368b07mr2071391385a.17.1768132944566;
        Sun, 11 Jan 2026 04:02:24 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a794bsm1304424785a.9.2026.01.11.04.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:24 -0800 (PST)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id C0773F40068;
	Sun, 11 Jan 2026 07:02:23 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sun, 11 Jan 2026 07:02:23 -0500
X-ME-Sender: <xms:T5FjaSPYY5QlUuMPny6Rlo6fHd1cHh2nRJ_er8Aje3KvhjVTkmgy3A>
    <xme:T5FjaYhIiNOi4Ho_WLS7Nv1qK_-maOqkkZPGHUm7zGUpEnoLP-4WWxDWfAXnDkSCD
    _t-Z6l2akhoI_lvJfhjMto1DOfYfDzojSqBH4G9Rfut-7iZvogGqg>
X-ME-Received: <xmr:T5FjaY4cPGp_lDjAdwdRMnGHR68_ARMdmONhk192k1HUorH6-E1I9OKS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:T5Fjafcb22d466PvIccM01GqPurZ_bCNqiVV_gNz1vWSrSeDtMEtIw>
    <xmx:T5FjaRBacCHXqMr4i0sDDs572XNNLDTg36mEdjG0kKil-D4jkw2Q0w>
    <xmx:T5FjaeD2BvRrYFiFAToNoXWBz-Br-veNICEkkC2eZWB_kUmddiGB4w>
    <xmx:T5FjaTZ5QHV9J8pmKlt5AJwM8yzMvvNg1RAM-dPdFpevyM7AGVL0KQ>
    <xmx:T5FjabxriDyRDfQBgvA8Gb4hjs2c_7jUAYrAX82yyP9wW2VagEX_z_rL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:23 -0500 (EST)
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
	Joel Fernandes <joelagnelf@nvidia.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 05/36] rust: helpers: Add i8/i16 atomic_read_acquire/atomic_set_release helpers
Date: Sun, 11 Jan 2026 20:01:38 +0800
Message-ID: <20260111120209.6133-3-boqun.feng@gmail.com>
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

Add helper functions to expose smp_load_acquire() and
smp_store_release() for i8 and i16 types.

The smp_load_acquire() and smp_store_release() macros require type
information (sizeof) to generate appropriate architecture-specific
memory ordering instructions. Therefore, separate helper functions are
needed for each type size.

These helpers expose different symbol names than their C counterparts
so they are split into atomic_ext.c instead of atomic.c. The symbol
names; atomic_[i8|i16]_read_acquire and atomic_[i8|i16]_set_release
makes the interface Rust/C clear, consistent with i32/i64.

These helpers will be used by the upcoming Atomic<i8> and Atomic<i16>
implementation to provide proper Acquire/Release semantics across all
architectures.

[boqun: Rename the functions from {load,store} to {read,set} to avoid
future adjustment]

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251211113826.1299077-2-fujita.tomonori@gmail.com
---
 rust/helpers/atomic_ext.c | 23 +++++++++++++++++++++++
 rust/helpers/helpers.c    |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 rust/helpers/atomic_ext.c

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
new file mode 100644
index 000000000000..1fb624147aa4
--- /dev/null
+++ b/rust/helpers/atomic_ext.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <asm/barrier.h>
+
+__rust_helper s8 rust_helper_atomic_i8_read_acquire(s8 *ptr)
+{
+	return smp_load_acquire(ptr);
+}
+
+__rust_helper s16 rust_helper_atomic_i16_read_acquire(s16 *ptr)
+{
+	return smp_load_acquire(ptr);
+}
+
+__rust_helper void rust_helper_atomic_i8_set_release(s8 *ptr, s8 val)
+{
+	smp_store_release(ptr, val);
+}
+
+__rust_helper void rust_helper_atomic_i16_set_release(s16 *ptr, s16 val)
+{
+	smp_store_release(ptr, val);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 79c72762ad9c..15d75578f459 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -8,6 +8,7 @@
  */
 
 #include "atomic.c"
+#include "atomic_ext.c"
 #include "auxiliary.c"
 #include "barrier.c"
 #include "binder.c"
-- 
2.51.0

