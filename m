Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A1B23EAA0
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132959; cv=none; b=jM5ObLqBffh60VmsING3oOzpWvqZeXHcvO1AKRY6L1LXJ4hEXJDkhMf+RaNOBob+ARls59lJeFqD/rj5JPPc/gAXn7wSQD9PBQ0Qc7SmVwcCtHZK4thKsnxnPW7s3B9EgReVGClcO4DmxGjR46jWvCp0YzrlGYTBIS4yxcHoxUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132959; c=relaxed/simple;
	bh=wzXx3j80SxnUGJ5n+pOc/aAdCQAxQDLXptEGRVxqLTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJsVaoyrM5LbXqVGeTLM5D7XavQsY5vPLxgO+CWLNYGYkKkYppOl6KJHDV7BwejrhlnWR8FNOz5leKo+oUFOELddvHFxXT/qP4zJOL2xfPW5txAq5EoMTw7AZYJDN0wyn138iFMKrWHKw9lrBbox4uFhR8EZ+9V8m/P9kaAhE18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkcirFF/; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkcirFF/"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88a2e3bd3cdso43507916d6.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132954; x=1768737754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zbrnY0xwJY05ac146IMSqhVGEEtaO3ITEJgrCAWvgCs=;
        b=GkcirFF/xefgtyeA9OvjugYHsDD6x7OzVcI/PkCBP0WwCC292zdmCcSw/mm6pwwXz2
         AGr8clDXCAg+JrDNG/mPSMfV70pobk7KMcnknXYT4q8nBQcQYl5NSgmjkV0m6yHwk2Tr
         264/dQcOwjmWNNFspI6O+PgSIudHt6U88azTuRvOI6xrwKdjAC5uPtnW6Z3ao6QYbuIp
         cd1Ofr1esPu9fBFqHWy7F+6TFFWI2hZ83HOf2vdwpZBj38ii1wYpjW+/aIvmZp6nEcnh
         u/0o9cLC0c/xRyyNDz/s4W8PEtoq9cdXZ47fyySjRXjhYdaGY4lJmLGgpmm6wO50SAOj
         mX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132954; x=1768737754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zbrnY0xwJY05ac146IMSqhVGEEtaO3ITEJgrCAWvgCs=;
        b=d6lkVK3NZ0zyyJrXhhpz769C6z1DFpH/mr2geeSs19DPim1Upl9St5pvblismATBYT
         NGmuqWOq2stAR5CwBVCAWQZKsVoIico4TIy1DZSDlqH4FZf8NXadHCwgfMAGZkO1Ree+
         /k55/2/J7andCwrtRv2qvDxGt7l11AOOg3gQJqAXx+kZBELRU8hIkGX0SODQAH6ib9/a
         cU6WMWIqyExY1mqUy0JL9h5jDw9Hmj4fyYr8/b2CCdqO62yQ2H0ZfAZIIrMs34gAwJOb
         sferSLf5VraxKUXVcxdUcUxbBemA4hy/r4s56PIgNNi7k21ZZek786QRwgHVO+vHKrpU
         tRzA==
X-Gm-Message-State: AOJu0YzZTWnfvMpgnGGwI5pa/FbkzAwk8q5cwFRlyOQldsKZ92YG/pLp
	avWnrtJ/IXcdgenz6aBwXerSGtsLrS2NbDu+Qd06PSomsPomvcA7PPIG
X-Gm-Gg: AY/fxX7V5Ig0K8eAqPCOXtQiR+EJjiUActeL0oIi4CzIKC41WXb4B6jy7jp4bP4VyQ8
	ZX4wzrYO4oE8De/mUM8VOsYORnCiJkdJwgfgnEEnFZZskjZ3aGusGZxUiE7VoF2uoLMkdN7xKlm
	EzemjDl0feoy9aVmE+wtnWNgBxGiQ/eehjC+z/RUuOnRzkpkmGq59psW6+fw4hpgQI+BpGvpNgR
	MTRLrZDQl9BKwVHTw1CmUyMBsPsX9IR8oc8orLlk1246Tod1F84Q1BeaX2rVSRA4XNtUxnHH6Pw
	8DWsDhId5axvgTt4c7H1BBYU6qTj2omheseULD6ezdSvysmvMiIu0F6WeSGdY416szq/pRR00TC
	n/H2ddKqL+xGaxw3fuQznv4U6aijOfre3f0rAjPSF/MLWHj2IWEf8s/r4L6cIwsd9keajwJSFuE
	gpxYtsOHoTvPE9WbYfC/ilMx4gmtxBg2H7vhOQ71y6iSIlCB1pB7eg+h+s+5WPZY3MDF4bfnHeb
	MHBKut3wLlZ+JCzU6A/UJq3hw==
X-Google-Smtp-Source: AGHT+IENQ79J1iNFng6vZ6KRzENBMb5uXD37dh/sgt6T9douKFVcYPVZKJWxc6rVB9IfaSH4fyrNUQ==
X-Received: by 2002:a05:6214:2f88:b0:880:4c2b:1c29 with SMTP id 6a1803df08f44-89083cf505dmr222184926d6.31.1768132953759;
        Sun, 11 Jan 2026 04:02:33 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89076fa0718sm113499856d6.0.2026.01.11.04.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:33 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id DF3FAF40068;
	Sun, 11 Jan 2026 07:02:32 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 11 Jan 2026 07:02:32 -0500
X-ME-Sender: <xms:WJFjaSiZaO1_Qr_cpxq7A8sk7mCjlKySZ_7xhHZV_Bio_VDFQ0aXSQ>
    <xme:WJFjadY6OHcbrBZUByaZbawPpn0v2K3J7sl1yDGNon_3hOsyg-bhYdMUPhrEl5mxo
    TErz1E3ceCDDQcdvG8AMoKtPa2XuOC2fy8UveubQkkZp1I_UQIQrfA>
X-ME-Received: <xmr:WJFjaQPx28WjG9dJIflKHLuOD2h-fN8c6B5kZmWL4-HeuOeCBokHMIwR>
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
    peduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:WJFjaWZ0Wb0ZbiRC5JtI2tYdISbudUc4LGhleorxsxpkdExuQSS-gw>
    <xmx:WJFjaYU43VPKzlJzx5A-MTIreRRdsGtrbFkd9_csd18_xPQJi7_2Eg>
    <xmx:WJFjadABPxp9VhxCIROa1sEeKWHATd-DGb-LjaRPP8tLU4kRu3U-gA>
    <xmx:WJFjacIVGDWCBETMeTdsZmOpaXtvOcAc10DFHye90_cKAVmk9Yf2gA>
    <xmx:WJFjaTtfN-CDME-vNvWbKTqOvx7BO5AlfIdrMsOlbFvo3QiyS-0zRlor>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:32 -0500 (EST)
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
Subject: [PATCH 08/36] rust: helpers: Add i8/i16 atomic xchg_acquire helpers
Date: Sun, 11 Jan 2026 20:01:41 +0800
Message-ID: <20260111120209.6133-6-boqun.feng@gmail.com>
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

Add i8/i16 atomic xchg_acquire helpers that call xchg_acquire() macro
implementing atomic xchg_acquire using architecture-specific
instructions.

[boqun: Use xchg_acquire() instead of raw_xchg_acquire()]

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251223062140.938325-3-fujita.tomonori@gmail.com
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 3136255a84c6..177bb3603e5f 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -60,3 +60,13 @@ __rust_helper s16 rust_helper_atomic_i16_xchg(s16 *ptr, s16 new)
 {
 	return xchg(ptr, new);
 }
+
+__rust_helper s8 rust_helper_atomic_i8_xchg_acquire(s8 *ptr, s8 new)
+{
+	return xchg_acquire(ptr, new);
+}
+
+__rust_helper s16 rust_helper_atomic_i16_xchg_acquire(s16 *ptr, s16 new)
+{
+	return xchg_acquire(ptr, new);
+}
-- 
2.51.0

