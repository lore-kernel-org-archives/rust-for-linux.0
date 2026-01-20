Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A29423160
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 11:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909943; cv=none; b=d2u8qSyv8NORvI2Tx4LJ70wn8jzMdXJvMMm4zC9deXjfVMHGwTuljQf48o+yDXry43DR+L2I6jeCQY2eIOHuwOIQZnCdnRHSlN9bL3S757fF1XjMDUHJkZDRZi9apgX3n/1H8AZPOSSZZM1g8u7kd3ttUxrujUy7mvIWoftGM18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909943; c=relaxed/simple;
	bh=IgWAuNJ6h3E/R0Fu5awjtkTf/OgcqvY3PFwI4AxvJf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCiezOsUvgOcXMIeBY46CyC6+vjkKFH5gWLpBDfKiZZMziW+Wx24JDd0ei8/9faM9HwHaYBDtPEfpU6ShJUO8j9bQ94v3+KzRsek7oOls++AwenLa89gUg1QjS1ttWl2LEXMGsHVE5D/kUPKumOCOqbXwgURDS0OzUlDiyQs40Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzCa3A/l; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzCa3A/l"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-894638da330so4274086d6.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 03:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768909939; x=1769514739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=noKL7zQXHKYfYinQlJHUIYY5IKQR6tHuuXlN5E414EI=;
        b=gzCa3A/lBb272Jq1hJmmpYkHojOD7e6a9++PdVPlcn53UAEzy6vZFxAU8i/M91CL2O
         ALLAJI9gy+fgUoUx2Poj1q5kYGJl3ckcTqlEHiQa0fyl9w5lXG41WQKui9exAujhGr7X
         Po3Brufq+Bjfi6sQxIJuZkyLSVM3AQ06oxfyjfj6iHo9HlKDigGaQkEKsSfMrXDzDli7
         z9tX4AFkAGBXMFLloUfgow/OWYawQqsB/zQgec5X7hIPX9W4Sqa9CIwgDQu9duCqXxWk
         xVbVm13wGI9GeouH49YzzBIqwaliZL0da/59A7d6p8pzNpLJJ0VizVNWzCEXjdFtkA5W
         r8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909939; x=1769514739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noKL7zQXHKYfYinQlJHUIYY5IKQR6tHuuXlN5E414EI=;
        b=c2xYbCT6i1XvtMf6PE1CGOBdZTHHI8STTsmGPob/fH3WufzkM85S/gPOABH6ZNGkiE
         WD2BqKp9cRuIHX+2YW+s1KoGhjpn8wS3ALJ5Ok3eJSzIL7MBD/yJSDL+X7otgU1oi0dU
         0CUA737E8WZXpG+oJ3kKW8OLXVunNoKNpEj5WcRlTa3/0MZzQ8ljkUtoC8gUQfyGUprQ
         QmiY/PKAegzOunsKOcErON6tYpFSAgMCgxx6j+2N9g7ZNE44/zTv1LZ2uKZfMuFavyPL
         Et59ZVqkBs1Bx9nZwcU86uaVNDF1ilvx5pXDHtipNsaGUoatgOgROiDcR7AD89Zvuo4t
         l2mw==
X-Forwarded-Encrypted: i=1; AJvYcCUgI/oapOQQ7WRyvAJYBj6QTji1eOQljksE4NawUFahGgF6/8m8uxnkNIayMgbwDRjv1juyjuwbwVu6REOWSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr525mGyh/qs50LLjiYT2BsZ5ybJUjIpStTOdtZ5ieVO7yroSV
	VI0lwyfXhWNkFMOUGU147hMVcAmoVi416hLgC3F05IariMGvAaORvaee
X-Gm-Gg: AZuq6aKaLofrSMuAoAjizG3vbBY0eSwgfU955Gs62LxBo+/zA61KSfn95K806O9m2c5
	rIWPWJ1Bym1VuRRbLKK6v92VjtGYASt3w0gF3BM/SSmhJ72lgU9TUUycNUWNuFWezJYnTwqEkB4
	V+SFd4ha0Befy5xYnt8+yPX8LIPF62BLZOLKsT5hP/N1ZbkwsHtjwxBkVPVrJd1NZNDGa2HRT3A
	hOcP8y5B8Jy/s+h8G1vFR46gkUG8MjcM//NO+XVu+5e6RjFFtQpnDlyrSu5ERPKAB1+BH4upD6N
	UdlGwyWXLQpQAmt/OS/xS0rl8I8HG5piazHJLFOte/ZSjFiIB+F10QgTPPtz9JP1Ljpp7oJ8kzP
	XskVbvRWq163qkN487JSIzwMvUSGi/WsB8i1c9DdA2a/e8qNdDrBNivLpDgYObFRXxPX2uTKgVN
	2woT+Y64130pRtrdOM9nn6LnE+IiqH1q7jURjE+61x5bjuRZEMFGdr4k7yyAtY8fMBICcgSDPyy
	C/tSqHzJSJrq4nRUoDEif1rSg==
X-Received: by 2002:a0c:f6d0:0:b0:894:4793:efb5 with SMTP id 6a1803df08f44-89463837a6cmr13834676d6.4.1768909938912;
        Tue, 20 Jan 2026 03:52:18 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6c9a9dsm107071836d6.43.2026.01.20.03.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:52:18 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8EB16F40068;
	Tue, 20 Jan 2026 06:52:17 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 20 Jan 2026 06:52:17 -0500
X-ME-Sender: <xms:cWxvae6kc1TFcI9TJPWN-r0Pi54xEVHRlnTp-vtGY1_5kR1y9bNnsw>
    <xme:cWxvaczkpMf4NjmQMHZz9DaKkERaCs-ewKaWwY6SKRG7FlYpzDD6ttDVLp4-B8Ptq
    9TGgF5MDOIAZaMxRxBpNVj8MMU1t4okSniNUn08IIj-wX5gr_DJig>
X-ME-Received: <xmr:cWxvaWD7IC7dfygFMVaTHzAYsQAUPgjYrvLCDOAmhrvV765T-eUhM4XQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedtfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeegleejiedthedvheeggfejveefjeejkefgveffieeujefhueeigfegueehgeeg
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhfshguvghvvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhgrshgrnhdquggvvhesghhoohhglhgvghhrohhuphhsrdgt
    ohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvg
    htvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvghn
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmh
    drtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:cWxvacaWZh4sjTdNnxvo-RY08pCAGMHU6oz3GtYY83TahsLzo3zhPA>
    <xmx:cWxvaVH9v9jIsSv3xBvewOIYhqwrvpqIM-4f5SBsPuYuerGbhySryA>
    <xmx:cWxvaYuLdN-3g2qZTwjnkdP5nvAjWgUAp8FbfGHHKKMntdAi0DlrmQ>
    <xmx:cWxvaTIFjoNqnVJsZBRniY4Unvx_7-2ldrTR_nrHxhWNyETxhfMZ7Q>
    <xmx:cWxvaeO4loKUB_fs2fsM5G6nADvOiAYKujq3cBHqFJYbyNu4pFPDyWDl>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 06:52:16 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kasan-dev@googlegroups.com
Cc: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Elle Rhumsaa <elle@weathered-steel.dev>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Elver <elver@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 1/2] rust: sync: atomic: Remove bound `T: Sync` for `Atomci::from_ptr()`
Date: Tue, 20 Jan 2026 19:52:06 +0800
Message-ID: <20260120115207.55318-2-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120115207.55318-1-boqun.feng@gmail.com>
References: <20260120115207.55318-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Originally, `Atomic::from_ptr()` requires `T` being a `Sync` because I
thought having the ability to do `from_ptr()` meant multiplle
`&Atomic<T>`s shared by different threads, which was identical (or
similar) to multiple `&T`s shared by different threads. Hence `T` was
required to be `Sync`. However this is not true, since `&Atomic<T>` is
not the same at `&T`. Moreover, having this bound makes `Atomic::<*mut
T>::from_ptr()` impossible, which is definitely not intended. Therefore
remove the `T: Sync` bound.

Fixes: 29c32c405e53 ("rust: sync: atomic: Add generic atomics")
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 224bd57da1ab..d49ee45c6eb7 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -215,10 +215,7 @@ pub const fn new(v: T) -> Self {
     /// // no data race.
     /// unsafe { Atomic::from_ptr(foo_a_ptr) }.store(2, Release);
     /// ```
-    pub unsafe fn from_ptr<'a>(ptr: *mut T) -> &'a Self
-    where
-        T: Sync,
-    {
+    pub unsafe fn from_ptr<'a>(ptr: *mut T) -> &'a Self {
         // CAST: `T` and `Atomic<T>` have the same size, alignment and bit validity.
         // SAFETY: Per function safety requirement, `ptr` is a valid pointer and the object will
         // live long enough. It's safe to return a `&Atomic<T>` because function safety requirement
-- 
2.51.0

