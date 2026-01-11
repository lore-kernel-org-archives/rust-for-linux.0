Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB8250095C
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132973; cv=none; b=mawzx10akiJ0muS3ZrTLtWBuT6qC7pSsMrnXBHlDLXOv02LQcAktcqB05CvkmeTOmjRSCo3/cNBFyaYzGoAJzVVj+e9ckwlnh8lefLCxJt1YtB6fJk6xVAP9iCtqcKs8X0HwPRWH1IFh2PRcq3IRrbzzw2TBJweT0wZM8aDC+fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132973; c=relaxed/simple;
	bh=zyIBfViB/5YwR+KKSCNfY2Y0Z/qpDWb3l9I3zJ0wNQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YnfohFRR+BEpaYDq99D2RvtMIZqxfc2pQ6Ygd/3XZrG1iz5hzIwSabSht3F0jf6mzGI/GUdv09dQop+Kq876n++hANTqW6NgjHuITebLS2noG81XrBWSghilzHrx01zfnwlDO7vytNDJUxsp6SIxWXn6EDZOqMyDZBBCg6flyzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/SJ112s; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/SJ112s"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4fb68720518so58582171cf.2
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132962; x=1768737762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9TMRcrT/d7xLGRqtcJVqQJ/IXIBMGpYHk4MlJkyC9Eo=;
        b=k/SJ112sLxgqC/Rgge9x2YrOFGZwZF42YxsTv77FUoOCaQmlNnE6ePL3W849hTOuQB
         3LBcJig+Vn9FT4gxmDucL2I/uQebyR38T3/BWPhcqVroBfScvjUrWnOpaYlghmA+YrkP
         KuuSzJzC1G7XzvsBQbhPcnKp1QHpH83Ad8rsPxjP1SoMe51anmWcvxBCjIqE3qDfi0Sb
         xFZd1dsyRz964t6QzuxMKXUMRzcSa3V1d1j1kWs77ut/MrRENMol87SdmpzH3yw9CGJK
         P+JUN5cy4EsqNrs9Puyl3nFYAbm7O9fQGcstOp6wppY8OjtaniC8Ps6Lu2R1HjTf2zgF
         j0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132962; x=1768737762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9TMRcrT/d7xLGRqtcJVqQJ/IXIBMGpYHk4MlJkyC9Eo=;
        b=CuQy8DGPz2JaW+W+LBGANMmYOD14hmxetq9YUtTB4fovCxe/fKhvUWzktW/eJRkZ4j
         SwmUICE7cauIhgIcD1jO+MAv5d5wiQRjrEuAEeR2oh3uYCxoVAiyfwJ949XqTldmOkXN
         i4V0jSWwaveJPNHkRoKqt5jZcilIMaUizHs37ZMF5zsNKWgAyEMGApMvcWaYJHI2Tqe1
         +2WI4hVHvzuw5UjAn1e4xHqVraOC8rEu7/mRFI2tywW5hdXHhg2vewCpARsj89eWyogo
         vf9k3sg7faokP7QMS4ALgGPtplX9bzQQyJojy/ufuJjnGLri1dhSzeVoVkH5q9Itt6u1
         CUTQ==
X-Gm-Message-State: AOJu0YzBYp2YdQR9sbSHEwGqASxY0K8AzM05ZXqGqEKHTWJBSKJtw6iG
	ViVTj/LUH8kr6bYaiL8AN3qkDqYyzpGa32hmxhu9PcaQbx00VmnFrMV2
X-Gm-Gg: AY/fxX7rSrXgiz37075j7ev7SH3Cszv0ThHJApJT3WvtRpyQbtX8OpHYKMMmDWDS2cw
	K8JBKYk7s+wpqEPsTDEaLhxzrDyHQrrYN0m+iL0N31ftnqmq5J+L0nHEuHx/WDNE02dzNENYVhp
	lMRkzewFDWIgNVAi7DYSm346bQdlmoAjrmjABRsBtRVhSKOWv+xgnAUflu+DSNUWeTLH6zS0eDm
	2kQwP2S8UHOx0ob78GTUzHmCzQWjt9gPNVM+gnHRAd1XMf+OLklWOGiB50PQ6q/CuYaJajRA6bB
	SXNk/EiRS0ptuR4Zy8ao7lWctolNYIBOVkuyAUb6D/jWgnCvrkVITTxQ4HVpCt+rCvpqXcJzFsb
	SVTqxT30deKL12DU75/1xzEhhedGHh1B8iQtut+BekDYAglIWUACYT39Ama4VyPtA1ghjUPeAwk
	Zl2IVBvb2kn1fB/vxVx6yksCZ9v+Jn+SmPJ4aGMQsIc53xhyMBklV499Cg6SlB2R1fHRAFLrDqT
	a6Jph6f+upu5ww=
X-Google-Smtp-Source: AGHT+IElJIDGhN5reS5J46lr0xViveGkHU5fgQwzaxUgWmU5p6tAQkZvB2xMS+MAYQAWCw6c9qf9iA==
X-Received: by 2002:a05:622a:5a95:b0:4e8:aee7:c55a with SMTP id d75a77b69052e-4ffb48a8649mr194407581cf.26.1768132961780;
        Sun, 11 Jan 2026 04:02:41 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a7962sm1243709185a.11.2026.01.11.04.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:41 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id D0986F40068;
	Sun, 11 Jan 2026 07:02:40 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 11 Jan 2026 07:02:40 -0500
X-ME-Sender: <xms:YJFjadd-GvOc-fk7ZgRjCz--J68B-X1Lo0W8C_c6xFl1lRezftqhOw>
    <xme:YJFjaVlApje0mlq4lZb427Bzo-YxS13cGEkUhDSQooBevLSKZ7RKS_rCldNVgW0lc
    CY42psaaaOMvYPHZ0JQvzEnaKKX6CZXgwCVrS6w28YQ3MZZFsj6>
X-ME-Received: <xmr:YJFjacr7azzFnl09sdIbNFtUDqeTr77WTu3MGn0WhygaIZkp60hhRXzY>
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
X-ME-Proxy: <xmx:YJFjaSHV0CP87wdpzps3alJJT9_kzzLtyZAXiqAzWm2JvjV3Zx1DQQ>
    <xmx:YJFjaSRq_Yvrz9tsrD1B52GGqJXhVsBcrQpj2YRxN25nnfNoHK_Bxw>
    <xmx:YJFjaYP8HI3Ry4aEN1y18HjSLdXmKCOW_lB9ufxqGFXpLix7e2vtRQ>
    <xmx:YJFjafml3OOaIn-kAfsqTVyBEaB5sMo4mzoYb0wPTvMGS-jqMrUTvw>
    <xmx:YJFjaaYwLogxKMuU9LTej9nzFNxGK6CwQniWnLK-HPx2c35hP8Hr2UZx>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:40 -0500 (EST)
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
Subject: [PATCH 11/36] rust: helpers: Add i8/i16 atomic try_cmpxchg helpers
Date: Sun, 11 Jan 2026 20:01:44 +0800
Message-ID: <20260111120209.6133-9-boqun.feng@gmail.com>
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

Add i8/i16 atomic try_cmpxchg helpers that call try_cmpxchg() macro
implementing atomic try_cmpxchg using architecture-specific
instructions.

[boqun: Add comments explaining CONFIG_ARCH_SUPPORTS_ATOMIC_RMW and use
try_cmpxchg() instead of raw_try_cmpxchg()]

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251227115951.1424458-2-fujita.tomonori@gmail.com
---
 rust/helpers/atomic_ext.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 76e392c39c7b..5ee127f1cc80 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -90,3 +90,20 @@ __rust_helper s16 rust_helper_atomic_i16_xchg_relaxed(s16 *ptr, s16 new)
 {
 	return xchg_relaxed(ptr, new);
 }
+
+/*
+ * try_cmpxchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
+ * architecture provding try_cmpxchg() support for i8 and i16.
+ *
+ * The architectures that currently support Rust (x86_64, armv7,
+ * arm64, riscv, and loongarch) satisfy these requirements.
+ */
+__rust_helper bool rust_helper_atomic_i8_try_cmpxchg(s8 *ptr, s8 *old, s8 new)
+{
+	return try_cmpxchg(ptr, old, new);
+}
+
+__rust_helper bool rust_helper_atomic_i16_try_cmpxchg(s16 *ptr, s16 *old, s16 new)
+{
+	return try_cmpxchg(ptr, old, new);
+}
-- 
2.51.0

