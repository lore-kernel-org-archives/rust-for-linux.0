Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6F433290A
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132970; cv=none; b=fo1xH1eMRBaPojm0s2e3JZA5FQJI8HY1L8F/V/2nib4zFzwXZlzr9LVziNLiN/fH/n05TRWCUo/9pakiBCgoPzUY+MIc9y08wPu/lgYcjYhg0fX4SZwc7Bjz/EVGrwXujfi1I4NrEc0bPBJO2pMisnT6HhtGzWRiKg3ItQ/KEWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132970; c=relaxed/simple;
	bh=x4qvEcU7+HcFlbXAqdB+wWm49mUKrdRQFfIXS93SX8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTfn6b2zUbB+ZTxC7abQy2TMU6ff4ZYETEwbynw7w1IDSSupvolhcbQW3z2C/AivS7EB2TOnI/hs3BSqjfAZbithZTK7thQpl3fK8BCLnynWyhtKFWaP1pY0btWLvp082T38dm3ZA1uUE23tNU10K8AFHAYL5MUkfYSsZSDqVH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbEh5D+K; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbEh5D+K"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8bc53dae8c2so829711385a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132965; x=1768737765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aoRXZKve/4zF2jFuojC/oiQarJ05Yh2+jAk74rthGNY=;
        b=QbEh5D+Kuok7LoCdjMpcBTMGlAILhOx9feV2TT90ecwia29BhLqaNA0U9/isgNx/QL
         rNcWMTbBycZ2bqNy+ucldi4UN2zAssbw21kC1gEieADThMW9Btb8YrUTSnrrqK5jnCUu
         7uhvszhuT9WfOqiV4bwxpQfIscOWxbE9NWpWpJ4kzhRhSt5pSaOXN0Nhmqf6bVgLxI2A
         VQw0o4rq9K+NU6EvZMXAD83vphrAj8MROAm3bt1YxSHGu9WNDds3a6Bp+gUeo8f7jrm7
         J7IpUL6fC9t1+3xuX/mE8kvkai7IvZDI8+v17P6eF2iIZN5KX8OErBZ+5tlOGJTRw9f2
         vJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132965; x=1768737765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoRXZKve/4zF2jFuojC/oiQarJ05Yh2+jAk74rthGNY=;
        b=Iq7YyMkczqzxqAiLyC+jgKuyp21RTVWzQSMapytU38j1wpEO0qWiD/zkFhdhbpLGui
         dQ4ELBw05JWE8aW42RQ/sRQmTr5Xzh6zyf7qTo22MTJ29Y4GCpzboiz6Tn0Fx1+1Ho+x
         jkiB8OSEI4MpXfFRwGJkZk6TIwwSeItGdsLXEh/ZiZSZPMmZ+FKcmk9MZ/8qeKb9bpnV
         ds1qF6zGC7Rbac59vD3aEKWB/NON/JC5aTgukJ6CnfJUnjr5LKqdCitvKu4hO8vN9tO/
         6QhHRF5MggKuF79OcIuiCR8XLfvPDL4Pb6V6YGe3qMmof2FmsWj0WsCW1pHaY/MjiTIm
         dgQA==
X-Gm-Message-State: AOJu0YyShkO890AnAuEME7NQgJ033UAH1KoJa2o1M1ns3NT2eWemisch
	8zm42PG+42EAykvj5AWC4ytdq5lOVIGP63t6/hNyp3w/CzmMjYRJnHgr
X-Gm-Gg: AY/fxX6gu2VZVkzX3cZTfv0krtRHOw2J+gxxKlYeHrrhHbwyjqQIPwJg079HZIT7uN/
	TkYrqiNNEGooIT6PCmaM00CO8o5VafIu+A6xljkZcYh8sBeFl1QrZ7WE02mE+7ddhaA462/HVLt
	iuHAOGXxUjRudn+WbrqgOavMdI9cCfEdGmm3VKbeIgo6jSxPi7hGjrQLTOgGPpZJKai/ulR4bUn
	9AI9ckK40StKpx/ik6NkOwuvwbUTPpgl0l6Tgf1O7fJ3YTHQyGsOc0qHvqi3XEZKNPcpOpcS1rk
	ilCw2DpBUW3DiupRdPWJbqBwEWZyBDcwPQ71Nn2qdEYGLScqc2f8cqQ15vi6s56q3BHB5ziPT61
	cCr0lTWtPq8OE9YQ0e9Lox3qwykjGDIOFj0PJJ4yxWRtfE9BJ47PI9wwEoWzmny0xG8ZLi2F/yq
	x+oRyBmpZBiDKWFz/pUMFi8olZpelGDxL6W10gtNUHVsPC+YDuty8Ugr4sIIm7MT5XtiEwd894l
	jKfkb/m2bD6p8K49oMx3oKk8Q==
X-Google-Smtp-Source: AGHT+IGoPPHCe2bSTw3vmt573zgYvlUbQ9jhXsUccNKFys6ibG/hfXWJrRN48ulPrm8Hf0e+CfovnQ==
X-Received: by 2002:a05:620a:3196:b0:8a1:21a6:e040 with SMTP id af79cd13be357-8c38941bd7cmr1913436085a.77.1768132964647;
        Sun, 11 Jan 2026 04:02:44 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907728565dsm111522526d6.56.2026.01.11.04.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:44 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 95DCDF40068;
	Sun, 11 Jan 2026 07:02:43 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 11 Jan 2026 07:02:43 -0500
X-ME-Sender: <xms:Y5FjaX9KyULFs0EGAKcgasU9LcbtK3mAjNDdgKok3XVOP0NezcZgyw>
    <xme:Y5FjaeHm6546vXXfL95deeooRPhQC9PRGrwYPfuiwLF4HJnsB73HgeOdeK_aaSXg2
    ELGRBSI1x2MlrSo0MBqB42_TCBbAqymu1CAo6KqXlAuiwozKAmKRw>
X-ME-Received: <xmr:Y5FjabITEj5NM-7sW44LiqKh7GepNQejm1QR9dgQYCEFMmzQdeNw_wcC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepud
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
X-ME-Proxy: <xmx:Y5Fjaely40p-1eR445Fe3evTGKJKQlR_u0BxLGFl4pv2r4a6PBVZnw>
    <xmx:Y5FjaUxIDM0ejdxaXsYMkkpLyK2cfCcvZK4gjvgE4jsGy7bLAVG_eQ>
    <xmx:Y5FjaYuD6Rj7E0u1qLmAFecqUEI8T0s5oqYj7wnDJTZSNlgn0jRtCw>
    <xmx:Y5FjaWFUo5bbjx8Pt2rtj8HMBUQyFaH92o8GfoQXMBX5O9rR7V-RAQ>
    <xmx:Y5Fjae7iVx-oTBSx4TQqsImLKImRe50F0o1iezng4w-4fsW-Awt-95w7>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:43 -0500 (EST)
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
Subject: [PATCH 12/36] rust: helpers: Add i8/i16 atomic try_cmpxchg_acquire helpers
Date: Sun, 11 Jan 2026 20:01:45 +0800
Message-ID: <20260111120209.6133-10-boqun.feng@gmail.com>
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

Add i8/i16 atomic try_cmpxchg_acquire helpers that call
try_cmpxchg_acquire() macro implementing atomic try_cmpxchg_acquire
using architecture-specific instructions.

[boqun: Use try_cmpxchg_acquire() instead of raw_try_cmpxchg_acquire()]

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251227115951.1424458-3-fujita.tomonori@gmail.com
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 5ee127f1cc80..b6efec14e5b3 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -107,3 +107,13 @@ __rust_helper bool rust_helper_atomic_i16_try_cmpxchg(s16 *ptr, s16 *old, s16 ne
 {
 	return try_cmpxchg(ptr, old, new);
 }
+
+__rust_helper bool rust_helper_atomic_i8_try_cmpxchg_acquire(s8 *ptr, s8 *old, s8 new)
+{
+	return try_cmpxchg_acquire(ptr, old, new);
+}
+
+__rust_helper bool rust_helper_atomic_i16_try_cmpxchg_acquire(s16 *ptr, s16 *old, s16 new)
+{
+	return try_cmpxchg_acquire(ptr, old, new);
+}
-- 
2.51.0

