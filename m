Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F55313E0D
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768652581; cv=none; b=C7PdKck1JyXTOL7Itxt3ApLH9DIJ9UTz2DgHeg15GMfYMIJ9gGxj5THQfnPwVIPxr06tk+AAeCbW6BNa4ue8PlFGy3UU3htrb+5XlEVfGpBJ/IorAUrw/87P+UqjUEh7NYmWsuLTehQt0moQX/wKuHi2ntUMHpuvTM/fs7vccd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768652581; c=relaxed/simple;
	bh=ypW5mDR1pdpYmnFGvy1k5garryQ20NH8PB64bMKaoRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZUvJy6Nya75dUWLBBunyaqMVL2Werd4oSGdUi8XhXEG3E2O3ZSq61BzwbtaYgNMbiHIIlIuiQxM1oQEbS/mqKZnY76KpO5BHc5myNYKuoP+n5PbjlaW/NARX+DgZUjB9tSNnSO8xGQZwgkRDL8nVXOfW46d8ds5F5ym+fSTbZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRGoRTfl; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRGoRTfl"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5013c1850bdso26432471cf.0
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 04:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768652579; x=1769257379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ezYTTB2Yi2q5O6hjbHNxnHEWCgaRA8NSsABtQ4Dr/Zk=;
        b=mRGoRTfl4oRa/my4bPocutX0w00DTkp3x4Mf/ICdMOiMuuMGHFsaQEeoWPlF3gEY8W
         zcBGRm7HJvRA3/KTCYpJ6ey72SHn12YKH0PVXNo6n8hdRjybMKarHu1aHqrUV1p+cSyT
         f+LRkuisoKB6XHItIUPBfJQAryYW22Oz9ddP1FbTlhV8RIQPB9uki6xsuEpWFLQTy4XL
         S79TUfV87Qto1sckxwoa7ba1c1tqoCv+cUQ1Fadt9q3RJcsI3teZJk7W6Ct3Bfj6klMC
         E6jkA4NWs9XYLXVVGHJGUw0LHtD6JfQnasj8m/ZH66U+R8Po8uDYvhHVuOVeKMCEdz8r
         aC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768652579; x=1769257379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezYTTB2Yi2q5O6hjbHNxnHEWCgaRA8NSsABtQ4Dr/Zk=;
        b=W6wqnHUkq/8yltPkkDyP9/CdmGk4qoI8vZwWwzf5KZSKkFzfmvtBndvyRdNkIdkJi1
         Rlu8m0drcvOLfwbwehhp6ScfDr/xDES80yLzeu6RgGn1Prc80rydsZ2rr8JRNPLnxo7+
         hKA7m84lIY+v0WcpQpoXu7GC9zafQKKeYxUL5F271JmGtTRKhaUMemSB9A43VPvhQ3+N
         wmset+QT2KAq6jFg0RAZ+h61hOhMj34ODZrK1ugOQxMhS2FVuoehISLa7oP1lTQ2WeGk
         anX1daYP7RsdBU0tWImcProEL1iRO9T9AiqBmR/itcKyKE2ufh1ULBsigoQHEeWVk5+Z
         Lqaw==
X-Gm-Message-State: AOJu0YxMHbLr9gCsKLZWVKKl6LxXJDQIkxBiIddLzF/BPQ5tZQm2RvpR
	pudYQUi6xfipyWEvOvE/u5LIku4I7TZyZfgBbgWTiy1YTBvHxJDcJmRk
X-Gm-Gg: AY/fxX5htDhc/vphTyMjbaA3S85KVDq0vwqxbpKE94FKZSWLT76WdF1+UxCsWcqHbps
	ns6KL8JdEluhx2/AozG+Rhabi3NxJPncWRsxVVEejunGIRgcwUcZJvxXiWU2oTCkAnAf2+Xy7Zw
	yIsgaHCmfYifyAei0ZkfZc4Lf5YBq1x0Y/7u7BJ5A3OIJbyItG7G82OHI2f/NZHifFQEIuuIm1O
	qwYLUGIxF0GPkQSWGngFV31gKIMxKY2RRgezvMry8p7di2HaMr5yE7q+AIxJc7z+ygkz3VNolT1
	UtK2BeKC2/h3Xfq2qh8I+lmSRpG+J5JfpejKjTrNZucMQhNX1J4naE0vh58LT4Y4XO8L3ne5vIp
	AinTwDUDaUvPLYj9EDBuTJgABiuytv5e8m0tPB84O1YHjcyyx9xYwJH9kjpdtJv8iZJrJjE+MUH
	LkvGBCznmdfIlDpJTeDHFa5AQptpn/PV3b0KqOPLNjIr/ZDLj5pwa2WHRlJ/rwC/8opgyWoF0PG
	76rYCkV7m6mEQQ=
X-Received: by 2002:a05:622a:c9:b0:4f0:131f:66fe with SMTP id d75a77b69052e-502a1779249mr70449511cf.59.1768652579264;
        Sat, 17 Jan 2026 04:22:59 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm37969421cf.14.2026.01.17.04.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 04:22:58 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3FCEDF4007E;
	Sat, 17 Jan 2026 07:22:58 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 17 Jan 2026 07:22:58 -0500
X-ME-Sender: <xms:In9rabZ9dOm0Z4eCmfyNKaQntHppzTu-ZCKhJHLvr9ptELKtGfIK_Q>
    <xme:In9raTcAwiBc6_naCJoyNhI-1dUoan1s0wa3gl0OLhnRnkhauMa0O-3u55zjHcRcC
    ZKXW1eByyvfvHVC-QSQ8eCdT3NhMR5GtjlBSmOyXkMKAZP98DVg>
X-ME-Received: <xmr:In9raXDe6yczg7TYRaW2Imz3mXrFQ13pfaDPKzHMicQH9JkAoR_Z6lne>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedukedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeegleejiedthedvheeggfejveefjeejkefgveffieeujefhueeigfegueehgeeg
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunhdrfhgvnhhg
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpd
    hrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghp
    thhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnug
    gsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:In9radbUaDnHVdFyaLOnuHy152xjUGK1QWq2aSfh7B72LIdtLxKM1g>
    <xmx:In9raf7p-sC2gWtYaUjsQ337JRBe5MQm7nFqTRhw511bQZhA2efEEg>
    <xmx:In9raV-M6HojjeW4MdA0pfU8g8CzOXqU_RjPxSsqOE78LRC_Nf_7uw>
    <xmx:In9raZbzPEP4R5ngF8mNMLlPIy2zkABeUYPkKG_tenrlHyer26QlfQ>
    <xmx:In9rad3A7liurkWlHPANh_-kX3q6ogLOB3iPrjH3oS2q65IRSkMvAlqn>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 07:22:57 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 2/5] rust: helpers: Generify the definitions of rust_helper_*_xchg*
Date: Sat, 17 Jan 2026 20:22:40 +0800
Message-ID: <20260117122243.24404-3-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260117122243.24404-1-boqun.feng@gmail.com>
References: <20260117122243.24404-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support atomic pointers, more xchg helpers will be introduced, hence
define macros to generate these helpers to ease the introduction of the
future helpers.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/helpers/atomic_ext.c | 48 ++++++++++-----------------------------
 1 file changed, 12 insertions(+), 36 deletions(-)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index f471c1ff123d..c5f665bbe785 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -44,45 +44,21 @@ GEN_READ_SET_HELPERS(i16, s16)
  * The architectures that currently support Rust (x86_64, armv7,
  * arm64, riscv, and loongarch) satisfy these requirements.
  */
-__rust_helper s8 rust_helper_atomic_i8_xchg(s8 *ptr, s8 new)
-{
-	return xchg(ptr, new);
-}
-
-__rust_helper s16 rust_helper_atomic_i16_xchg(s16 *ptr, s16 new)
-{
-	return xchg(ptr, new);
-}
-
-__rust_helper s8 rust_helper_atomic_i8_xchg_acquire(s8 *ptr, s8 new)
-{
-	return xchg_acquire(ptr, new);
-}
-
-__rust_helper s16 rust_helper_atomic_i16_xchg_acquire(s16 *ptr, s16 new)
-{
-	return xchg_acquire(ptr, new);
-}
-
-__rust_helper s8 rust_helper_atomic_i8_xchg_release(s8 *ptr, s8 new)
-{
-	return xchg_release(ptr, new);
-}
-
-__rust_helper s16 rust_helper_atomic_i16_xchg_release(s16 *ptr, s16 new)
-{
-	return xchg_release(ptr, new);
+#define GEN_XCHG_HELPER(tname, type, suffix)					\
+__rust_helper type								\
+rust_helper_atomic_##tname##_xchg##suffix(type *ptr, type new)			\
+{										\
+	return xchg##suffix(ptr, new);					\
 }
 
-__rust_helper s8 rust_helper_atomic_i8_xchg_relaxed(s8 *ptr, s8 new)
-{
-	return xchg_relaxed(ptr, new);
-}
+#define GEN_XCHG_HELPERS(tname, type)						\
+	GEN_XCHG_HELPER(tname, type, )						\
+	GEN_XCHG_HELPER(tname, type, _acquire)					\
+	GEN_XCHG_HELPER(tname, type, _release)					\
+	GEN_XCHG_HELPER(tname, type, _relaxed)					\
 
-__rust_helper s16 rust_helper_atomic_i16_xchg_relaxed(s16 *ptr, s16 new)
-{
-	return xchg_relaxed(ptr, new);
-}
+GEN_XCHG_HELPERS(i8, s8)
+GEN_XCHG_HELPERS(i16, s16)
 
 /*
  * try_cmpxchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
-- 
2.51.0

