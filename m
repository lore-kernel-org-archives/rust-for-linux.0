Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9265E318BAB
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132959; cv=none; b=kfr7AL+9L9a22SElyN/1ecswTFJueMDsGlSI4+ns6KLhctq5CkRynLxJ3y/iLgrHJQNqb/tUTl/OvWPPUz1t+Vr1nOP3IpusZz+VRCpBOvp3H6h5yWaP033s8OPY+MMoW9KxfTT1P0KpK2M/08VKv3oT8IX8LvTD5TnpYzVvjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132959; c=relaxed/simple;
	bh=ADgAWXBNQrR6xstXqyb2dogn9BYOZTjvarvLcWSaQ9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KD5cD/4SmBDkt4NqWBP9xDq2tYKBRD3h3FrK5UYMmjYwOaQaEKjMeyMdi+ntan97HtgqcPLqd21465HFveWNKe5sydIEPZbOrN+aKU714x5nkC1Tff27KQslq1z78Fpr7gz80xNGq8YLN8ymAW2TiVeDtMs2Ee+HZ71lKOkgj8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8gAX28m; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8gAX28m"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ffbc2b861eso46641631cf.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132956; x=1768737756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kepbmbzgnhlCuVsncj/cE6YeF6NNCF3uy5a/64b27fk=;
        b=e8gAX28mAReKQrSu5m9wd0RVWq1lUJKkFn7J1ZdR7FdBw4hrkjTlyMtvxnHqfa89NT
         Rk+p9qZToEEMeS5szB1GBjWHSPSNKFeUJ4FDJ55+8DjT55UTU6ldpC8h8ZoMQ/CbSMUs
         i+YvEv5AYy89z1DdhiVPE1m8PwWVJDHGB0gAHlba9EjAkI8oxIo1UOfPOyazi7wCwSzU
         oG8qocgcojin8HYOYvbpd9LEM2V7dp9dHnMBToNCE3j4qwqCDTCFxzmCJDQQF5FdosWO
         eTNGiN7091dhrknXgwd3w+zx2xzytVF7YxRQHxQ2kQd4jo7ebOXymYmYvZg56KTfkSkw
         hUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132956; x=1768737756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kepbmbzgnhlCuVsncj/cE6YeF6NNCF3uy5a/64b27fk=;
        b=W3uL1eCxl2RewRrsxWqnDYF+iIz6z/cEnznKW62t1KZKtEdJl1BvSGzlJI3D7tq+Kh
         yVr5+Fi8MHXTZ+ia7OzgLGhB5vZFECxPQu3SFjs8V0MaBQDmET+t/VOe4tuCMWL3BBBW
         NJ1NtPg2UkjUUqpm9EtfE6sTw8prU64ZNgjUGiDraqQovIBocJvkasksTXlAqk8HH1dd
         GnqpqPS1dXjC4XbP3IhFtxI1dQXgYnJIoezQC1QwLzO6J50H/dikIzUQS6Y33FKe9YhG
         qpcsGs6RxopgdsMxkwuF/yAi8Ljln2WaZwRocbHGdkUO7sXIvYJM3nAWnmtJ+csD5Ckm
         TW/g==
X-Gm-Message-State: AOJu0YxKA+yzW7DJ24+zBF1E8FjzQK57DzzczXRFhUCpcFfqxX2bkwz0
	dh9NQR2L1xyO+JDbdhlESSO4yvhggNkhWZ/SmVty25cznnBWNT9GAAmV
X-Gm-Gg: AY/fxX7H7Y/wrZDGpKdwNTzdUmqiXW1zcdjiTj2c9r2Eu1Q4JcwvypkIwnuL/I7LlCg
	4KN0ZgDMA3iCuf5UegKJX8rp+HHBoxNKrIZLj6loEw0lGTzvqCj9xavuKY+NAbAf1cW5PLPIiDa
	sAwlqM/O0Up4htAN7GfT2c89lEAjWm78eVWCP+P1bHyK9X9HBwtdD18LyJH6fqY0k8uAXzQDO5P
	7zOhXsTqBj6J2MH9iumNjTHaKvia/dYhPtKOofj+vv3yaBDob9ngafWAquOzJAyhTzGxz3Gy3bz
	yu9uJ0O7YfA0Y0C+0Q56vEZ3o89G/32Pq9GaKMJXTBCR15rCYFzEXIApsU7rg2Q4YW+NAwxA3Bo
	pApS9oVnLgeoltMkaE1UV3VP8knNd2XCzXH+jjmz8PiF2+Ju6mVUzNGuNMlDmD/quJe4XXjzoxA
	fzHcTvCysnXSz4HSdXbThjagXbOdIK/iFM+s0xoNXRAT4vg+OurcrkupoZLS5zsNWOYO7NYLoiG
	cAawAwpoz38yx0rGMuciugejg==
X-Google-Smtp-Source: AGHT+IG7D2QgSPdleUDhBwx/0CpGLf/zUVmvO9ZqpkCcsjir3tBaxHgBdVlOmCfjy88a51v+W5939g==
X-Received: by 2002:ac8:7fce:0:b0:4f1:dddb:db6c with SMTP id d75a77b69052e-4ffb48bac03mr173615151cf.17.1768132956409;
        Sun, 11 Jan 2026 04:02:36 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e4e258sm104001961cf.26.2026.01.11.04.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:35 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 738BFF40068;
	Sun, 11 Jan 2026 07:02:35 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 11 Jan 2026 07:02:35 -0500
X-ME-Sender: <xms:W5FjaaZTNGBhQFEUbpIrwnfKqjbEFyLVMf0BMxiCaHowU1jZNsIrkQ>
    <xme:W5FjaXzWq5HFx4t-COuWw5KJ44OFCUto5gaqrSOLigeAEOgl_r0IoWfaze6VJCXus
    I-a7vZfkCPKRyfXzbx8BI9v9s2WMyjw7jJ4uCFts55ZbQhBGR5tAQ>
X-ME-Received: <xmr:W5FjabFa9Fc_3VqFJ7QmqZihMelTJyr928lUhawoIhiJYBe7GxtUt5nS>
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
X-ME-Proxy: <xmx:W5FjaXzHGDFyNFfFeq7wq0vOWfzI5wN05omWjOkGOT2OVY_tEC_ZdA>
    <xmx:W5FjaeNcQS2O8aGRywoCyJi88K3nXOF679mfn3XKSbuBB7VdEKzAmw>
    <xmx:W5FjadbxNq1lKIEikwH6c7L-LxdOICqCG_HJOvVXcc92VBRzun4-0A>
    <xmx:W5FjaVCs1gPEhGHcGfXPS-uY4JHdfRel-Ip7Qw1gpt-jIXgj3SmWwQ>
    <xmx:W5FjabENiRFz5EHG24BIusniB8EwgIi5nlyHcAYOTMt5AmA-0PDtpeXD>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:34 -0500 (EST)
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
Subject: [PATCH 09/36] rust: helpers: Add i8/i16 atomic xchg_release helpers
Date: Sun, 11 Jan 2026 20:01:42 +0800
Message-ID: <20260111120209.6133-7-boqun.feng@gmail.com>
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

Add i8/i16 atomic xchg_release helpers that call xchg_release() macro
implementing atomic xchg_release using architecture-specific
instructions.

[boqun: Use xchg_release() instead of raw_xchg_release()]

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251223062140.938325-4-fujita.tomonori@gmail.com
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 177bb3603e5f..2b976a7ad3d7 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -70,3 +70,13 @@ __rust_helper s16 rust_helper_atomic_i16_xchg_acquire(s16 *ptr, s16 new)
 {
 	return xchg_acquire(ptr, new);
 }
+
+__rust_helper s8 rust_helper_atomic_i8_xchg_release(s8 *ptr, s8 new)
+{
+	return xchg_release(ptr, new);
+}
+
+__rust_helper s16 rust_helper_atomic_i16_xchg_release(s16 *ptr, s16 new)
+{
+	return xchg_release(ptr, new);
+}
-- 
2.51.0

