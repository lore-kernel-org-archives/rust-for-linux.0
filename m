Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B53733AD9E
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132968; cv=none; b=itrm/FqkzMrvVx8JSzfEzEp5ZXfcEzyn1cL9orhzq4IyOqgH8tzHFaEUmCbOo/5jWsPCIhpb5M8n2xpFY55KGV7F2VcP1hzaa8279cJ78keaautJoX+Z4czy6Cf4hVyu3w5+nr5MAUHgDqRvbQKTs98o+A5mRuRtxs/d1EwqBVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132968; c=relaxed/simple;
	bh=jqb3I6lNaLK4EeehM7HfOsBVUx0PtCdHDFSu2t4LdqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwCUo23g+j0oe0Nja47ZioKcyoWzUBl6IR6tDMWoOu8UMLVYDrFPDmCKWmb4A+k2mdR47SQdplcoPQrN+J/2AucGfXkf4782dzer40q2kPsHhkWjRoIpziuuo/SupCeyU9yySeYIU61Jp25+TTzo2OQXIoNYfHPl0j3gVnsHn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THhO4L02; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THhO4L02"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88fdac49a85so60227926d6.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132959; x=1768737759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TtNCyi+Yngvi7pN52RiT/bjuTg3yLQWDtYc5FwEM2pU=;
        b=THhO4L02PV39pYR1BwiKuvmwXHSsbqtmvD2lqChoBzjoY3tBUFtYHc17/X8zZhjmab
         4zDXZH3lx+2WU6dUUwFV8IqWEPv4LjJ0MIHEg8PZv01hui/qhuSshKSY3o4RDb6qJEZm
         TFJUsJz4yVDtMIKP6olvNo40dtSSGTqwSnJBMHt+1ktY0Iwxdh/YahrPS0gLBdYVJYmP
         CliJ4TkHZJBj34j3v3h9aJs0XIVm7rbiB6NKSZGxnZH10MHTfpbzO9exMN5f9UJPUcsL
         naD9N2QQzg6/8PvBq/jNuPzIuLBM5sE0nOl82RVLTwBqnhJcF7MhFvP17uAb/ICEwhfL
         CBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132959; x=1768737759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TtNCyi+Yngvi7pN52RiT/bjuTg3yLQWDtYc5FwEM2pU=;
        b=Ps36PEqPsbb0IUEwDkFTEO0PvAstjUeHu6zF2X2BbTGXtdmHX25XYC0xl4tVdPlD4P
         wer3oqYo0a94wkFr8MHhFBl1WIr6ru2v/CpBD7xZXBpJDC9KG7yYl+I3OvqCkDGPF+W3
         YtkYeGKcc32FZCHuoIVcYrSVhEwjo5FEbn4ZzxSalmv2NNhQSYVz7h5tJyntwNMBQbAD
         SYr5c4NzmNiEl3pVzXnnH5vZgUV5WIBWjr96YeLs1m8VtKNWiUVRlHeYdf2dhI71cLC9
         Ip2i6idOY6MO5uxRAJfqqVMLa7Fh2FnEUV0DdR+CIkfYWze50PjYf1c2qZrdZ+kutWte
         WUDg==
X-Gm-Message-State: AOJu0YzT9DOp7ZwOa4nXDsoHw9YP5YQXAiJd7peMyRyC9IoB0J+SncTh
	VDd/HEY7kismv9GW6E/2vfDwhrwlV2kBan/ZqYfwzbdRRBeV9OIAUDKj
X-Gm-Gg: AY/fxX501BagqJZKL6HvEZ7oYRM3PKHL1VunLhEDUbJUTtxuwNpdt4xqe/avsXOY7Dr
	0dNIEHLz0k6chcdc7h5Qwbwutn9WB4kA+y3i8WUtiAr+4vLqlwi2l8ep34k+X9Dn8X3vIqz2kKj
	qJYC0JE6dIV6ADvTA1j2qaZnoWLwT5+CZskvu8ZOS/j8/p373Dk/V/ld7DZSeOcoiOeYbGepvRM
	xV01YrrX+8T9igEL9fd/U1Kof8IkVCN7fwGHZYb1AI24NdYkCfbfaPScNMHd9or1EjpWeY+XLLY
	AkA6aI2b0dPBzjodI5kGffu7DaADtrALejJ+uZjiGi6Zx5+X8n+8CG6KYh4dnPOppcEX0n7qivf
	zFNvugHf1+km8gi2HCnBTXljSgS48NWNssU0hWxE19I+zGfNbBXPxJAK0fz1zknNxwF36PAh7Si
	Cj0CPOvLkoWSDA16T1SfQrs3UDFo5V7SjBSbo4XkC/CDbMtLk+kOz7ct72HdqbuyR2V6iPMXHgD
	5Qi7tb7B9tWBKM=
X-Google-Smtp-Source: AGHT+IE8a6w15Xr/Y4McY2OK1eOas2/wU+fv0s8vG8ZEshrqaCT3h299WwGpGZog+raakzcIy+SN3w==
X-Received: by 2002:a05:6214:4a03:b0:87c:108f:676c with SMTP id 6a1803df08f44-890841c9b0dmr213086426d6.25.1768132959080;
        Sun, 11 Jan 2026 04:02:39 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc6edsm115618226d6.4.2026.01.11.04.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:38 -0800 (PST)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3AE51F40068;
	Sun, 11 Jan 2026 07:02:38 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sun, 11 Jan 2026 07:02:38 -0500
X-ME-Sender: <xms:XpFjadQ_aqHliuRWeiV5Fcz4mmiNpjouEBNOW7kyJ-FsaqBfrhbcXg>
    <xme:XpFjaRK6OmYu67huTWaxlV7hhzMFJVQeR7xk0dNb5xD-bzuqFC48CLzR-5t1LUACH
    nEZZHrSakhfYwg4vjUVFnGxma_YKuDAJqxjj-jkht80Bp-BeOBq21w>
X-ME-Received: <xmr:XpFjaY8FjBvTyz-3MMp-sQmqPeMvBw_Gsuj-MbC7SVjUiICiaGr9MKjr>
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
X-ME-Proxy: <xmx:XpFjaQL818RZvVx-YCMrQsz1DboRrRhtAGX-ti5ZZCSgEGNwvas67w>
    <xmx:XpFjafEdY35UBpkLfvYUZyR70KfFPc9x-CAmZVM8zMCmVlZExcd0KA>
    <xmx:XpFjacy48KibYl9efDmZTqTuhhXYwKzXF15Som4Evnhky6YO2xOxgQ>
    <xmx:XpFjaQ5nedkPd6Smk646YYk72Q8vkVlWqvoexZUY4tj_yhPrk6QoPQ>
    <xmx:XpFjaZdEwSYlk_S14Bm52MWBnSI46A7NI5X0NAhkZkvX9h2P1XlBz7Rh>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:37 -0500 (EST)
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
Subject: [PATCH 10/36] rust: helpers: Add i8/i16 atomic xchg_relaxed helpers
Date: Sun, 11 Jan 2026 20:01:43 +0800
Message-ID: <20260111120209.6133-8-boqun.feng@gmail.com>
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

Add i8/i16 atomic xchg_relaxed helpers that call xchg_relaxed() macro
implementing atomic xchg_relaxed using architecture-specific
instructions.

[boqun: Use xchg_relaxed() instead of raw_xchg_relaxed()]

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251223062140.938325-5-fujita.tomonori@gmail.com
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 2b976a7ad3d7..76e392c39c7b 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -80,3 +80,13 @@ __rust_helper s16 rust_helper_atomic_i16_xchg_release(s16 *ptr, s16 new)
 {
 	return xchg_release(ptr, new);
 }
+
+__rust_helper s8 rust_helper_atomic_i8_xchg_relaxed(s8 *ptr, s8 new)
+{
+	return xchg_relaxed(ptr, new);
+}
+
+__rust_helper s16 rust_helper_atomic_i16_xchg_relaxed(s16 *ptr, s16 new)
+{
+	return xchg_relaxed(ptr, new);
+}
-- 
2.51.0

