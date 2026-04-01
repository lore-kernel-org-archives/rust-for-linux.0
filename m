Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DA9401A2D;
	Wed,  1 Apr 2026 10:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041125; cv=none; b=uD43eC5iau92M+jUOsKH4xkbTfhchj+ZzRWHJlPnniHZ6V5oVt6bs++DJXt/Pan+Rh4yxVuc7GSEn4aqTIvNgNpXDo1XF3IOmwZGh3gw7dGhbyS+K5OZnJ/SusFG+51fChecl7DHrlMk4SWF2rCD4vQ1/U51YqNuUicmac/MfYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041125; c=relaxed/simple;
	bh=iuDCeBICWCEAGLWzwTYGIRNqhRPxnmgimNAA8n/l4HU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XS6mGVY4KqCPjSOgTvrRaqjWUEkK/dQd6zH4v+FdW7wQhq38o8RCUZTq08/OGiszpZ5RGwkA4bwHTD5CPOdS7jL6GjDUFDKkej6Li7ELEVj7SKJtqvTWWVJZt/mOEUcZo3hBWfkASwc6ER5orP+fo5OtUXBWBFcgImSm8jw+Vkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=oiCUWXZZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vl7Pouho; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="oiCUWXZZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vl7Pouho"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BD14F14002E8;
	Wed,  1 Apr 2026 06:58:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 01 Apr 2026 06:58:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1775041121; x=1775127521; bh=b911pCxv3z14WGPq1LV2H
	l5mWcekl4Q0CUpT3S+yfnU=; b=oiCUWXZZwKSwbTw+Zyw0HAOInKB8Fka7YTRwy
	NHG40PX3+xPOVQS7U+6HXm2TDbO6gPUcDKIwRwMuLLSGVlb4gptodMIvSrh7Pj6J
	z/5fjTBCr6rrcJuNV1aQYuml72qEmN/ZpiETRX2UQ5myAyRbtXlLdWygzxAXrY8z
	d6NdF79mn1tj2AshFqf0RxkSmenFzduun3xd1jyzVJHziYB3jYaLrqIV3H90j4Od
	OsirMJR+zOWvaDlfPfjVe8mmy8shYgxhbkoBbKyZXZBii/LwOu9+fFazeM/icU2t
	hHpMiRBeWZCRtVAexu6Pa1HXt21pT0bckyDH3VpfM9MLmbQug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775041121; x=1775127521; bh=b911pCxv3z14WGPq1LV2Hl5mWcekl4Q0CUp
	T3S+yfnU=; b=vl7PouhoiW8gonYKWtrpUliBYvRJTyYc2HekecRx461P2m7SekP
	ZXL81RACKaY9YeXazwdGadzo5pndk7shh3RKrwbVEGvTiu8cgpWObYCiuTtAIgiD
	QyVyB//y8w7anTA+hc3lf8mUaYX7znPfA/mo94PSJpmfHLJHIbslt/0PzaYqFDyh
	cK/yZGii2IJ2dOGitIVjomqqzKjYMyzjaTE06jZUhtgoYmAzZDdSLEXbGwHxDYlB
	BSyaq/kf3ptNEboiWiwFWQqjnqMLR1LEEnE5J9dmZlv7+74qA3Y3BH0J2B4mOYo7
	zHBHIouY9jgXprIK6RtkPNC0Ob6nexVW74A==
X-ME-Sender: <xms:YfrMafshwQqIHHPgbai52wHP7NYrtsKlB1xcwZJmCJt1suUrvY-LOQ>
    <xme:YfrMaa0OXJ065eLTO4BafMc6l6cjXT6k53Qz2v9Ax_vn91-XUyBGlN2YeAPycFvPV
    skHqluc3Yy_oOj8XYfiWYf-lBskjlRKjKIGpBky8gABENSONKMAwSE>
X-ME-Received: <xmr:YfrMaY5NpO8hOd0AIVuwPVFeG08TWBjeh5Rsiu1JyIBv0BLL3jB49-FKYK2-LgAqBWZjRyyr-Mpy57lHYwRfuZMNualDpyRzdpNjoxCmQ_BnQPGpMWMEy3iynOjIZTgFw3sRbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepffgrvhhiugcutfhhvghi
    nhhssggvrhhguceouggrvhhiugesrhgvrggurghhvggrugdrvghuqeenucggtffrrghtth
    gvrhhnpeekiedvgeegheelleetudejjeehvdefvdeiieeivdetvedvjeehgfektefggfeg
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurg
    hvihgusehrvggruggrhhgvrggurdgvuhdpnhgspghrtghpthhtohepudehpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgusehrvggruggrhhgvrggurdgv
    uhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhorh
    gvnhiiohdrshhtohgrkhgvshesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepvhgsrggs
    khgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihgrmhdrhhhofihlvghtthesoh
    hrrggtlhgvrdgtohhmpdhrtghpthhtohepuhhrvgiikhhisehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepsghoqhhunheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihse
    hgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:YfrMaZW98WS3L1TMZdvhlWvkFUyFHNw_euNU4dxZxlH1f2H6L3xShw>
    <xmx:YfrMaYibyLpuLoXPXDFZYEiUwsCujtSbe2EytJLPfX6lUqt-FyA_hg>
    <xmx:YfrMaRfcMEjR82FacAkd3XJTlBpQtxm-gU3UP0RJPA7cPfaReRgimQ>
    <xmx:YfrMaf3PodqFwDXi-neZ-LeKpVC2K4Lb1XAepIIj8w6kbznJ15khkA>
    <xmx:YfrMaVQ_A2hMk-6G-N3ZaShJj6cJdqABdfoFpjdn16LFKmoOXKt2RN5s>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Apr 2026 06:58:37 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: David Rheinsberg <david@readahead.eu>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust/alloc: mention layout in Box::from_raw()
Date: Wed,  1 Apr 2026 12:58:28 +0200
Message-ID: <20260401105829.173742-1-david@readahead.eu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the safety requirements of `Box::from_raw()` to mention that the
layout of the allocation must match exactly. Even though the underlying
allocators maintain allocation layout information to some degree, the
Rust abstraction strictly requires the layout to match exactly.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 rust/kernel/alloc/kbox.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 622b3529edfc..1b30c51f87ab 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -170,15 +170,16 @@ impl<T, A> Box<T, A>
     ///
     /// # Safety
     ///
-    /// For non-ZSTs, `raw` must point at an allocation allocated with `A` that is sufficiently
-    /// aligned for and holds a valid `T`. The caller passes ownership of the allocation to the
-    /// `Box`.
+    /// For non-ZSTs, `raw` must point at an allocation allocated with `A` with a layout
+    /// of `Layout::for_value::<T>()`. The caller passes ownership of the allocation
+    /// to the `Box`.
     ///
     /// For ZSTs, `raw` must be a dangling, well aligned pointer.
     #[inline]
     pub const unsafe fn from_raw(raw: *mut T) -> Self {
         // INVARIANT: Validity of `raw` is guaranteed by the safety preconditions of this function.
-        // SAFETY: By the safety preconditions of this function, `raw` is not a NULL pointer.
+        // SAFETY: By the safety preconditions of this function, `raw` is not a NULL pointer and
+        // was allocated via `A` for `Layout::for_value::<T>()`.
         Self(unsafe { NonNull::new_unchecked(raw) }, PhantomData)
     }
 
-- 
2.53.0

