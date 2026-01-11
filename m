Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BBE331211
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132960; cv=none; b=TM9XEgtmBDHZwODsfE/KbWrlFvKauPjtbXqg8XVUjJ2dpwbnrfosKSuLQ433TWSFSGEJcHjaPs7lY6iKmNB8ldabBenWxZGVZvQJukR9mNwzNrmNei199x8nd7UVyVr3rxzZNXn3at4udLuTbCalvO9MF2XcQLFvP0nfP2qPDsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132960; c=relaxed/simple;
	bh=pBgDlAOsGrzI3Re6SaL//+qFBEUcrGUHfG4Pbeg88CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GurcWpTU8PPaD//wAcNeeluHi231LcZpubCqn8anh+1nzhzQRh1rweKj+VTbMbxsx+zz0KKtTNIuWqFN7h5edh62SRt+/X4YonCYV9tu2EzFXXPk5XX4iLigv4ka2CHlju/oBDebK190URv+kDMHxypLriMvEVTcykPwpJJo9dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHfvdv68; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHfvdv68"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4f1b147eaa9so47168241cf.3
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132951; x=1768737751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B/bejPLe7xYmbBbJHynANAMI1H7QA7zM0cLAIcFauC0=;
        b=LHfvdv68e8fLErpSIK0nNAEfa8WK1bSsQSrnEr82Opf87mtQ8cIaN9EoclR0qkJJTk
         n/qgU/eFkspTFujnBty0upyzDm3RMYu5yhk4s5i3ZhCk/ysxfOft8w/0LUAkxPOrSCj6
         5NRdZZTQa2KqH2bYgVPNeCOGVnxl2eXRpwFhVr2R30dUZLAjtpFHeFvJNaPHnypDMZeH
         LA8xZCSO5JTlHsWxBvq06bLotvOs8nWkkRc7x9Q3ld0tML973HprWWhvjmvO98KoONZo
         vtl3ZqoTWFG1qPEI3LvkrvZR3C6PURBpyH4Yw5I9FcNkC25ffqxDKYKGS5ocOwMpc2xt
         ghqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132951; x=1768737751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/bejPLe7xYmbBbJHynANAMI1H7QA7zM0cLAIcFauC0=;
        b=ZxvRQf7d2DbopfZwemnHKZvZ9V+kumr1fhdk9gVe8aoo6DgOQe4V0qZ70AtwhXunNp
         P4EqRw1XNghLq2FLnrQQuODQjdxBLAjPNjAodeoqkrJGjgJWGKpmnjQqxdwytuTP2d85
         YOot5KYkRr1YNVopbYUTSi4fHiRDn0HO/kEcD8YR/uN/+Z3n3+e9XdLOaWSo+khNB3ca
         FP5hhneksqRZWHkp0H1jvEp0Z9t0f4x/hB1f85YItqkQTjGcomBAyId4eHAjDEEDPBCR
         n8uKiAVcL1mI49JOU7XNtojZPeHUh63N8L2htQ/BRCqOR4wPHx1gfDv0pmZB4UxhN+dC
         5KkQ==
X-Gm-Message-State: AOJu0Yz+WY/LeCF7Z2NirzTuoGtVJf4j93f+oGJJuZqCgUoOBWtGVu7q
	Z9hMpNMC9+JiDWpm6Eyao0GudQLKwCA4JCUlMjtf0//eDt6JCfAlahk+
X-Gm-Gg: AY/fxX4QuDtWpi2sJQ+QLnuiLo4EG0ULnIN7Wb2uiCTOLko2PCDHhgeir9//ua3etOf
	6m+L2q5znw6j3PFK+JSJIzqxcItSJDH6DM5SXMRt8xlQUGF1QAxqcGgIP5ISZ+YghQ91wrvxF/a
	sOpnNCdp2Kw+fOEe9MjYUGiEeIEPiQwbYZDPFGTi0mLg/9FpF6fztdaj1yv9M+zqeBfAK3zIzfu
	spIvn6AfNzoH1X5F6kqFrgEJsxw6HuWOw5DU9l6TPfZHi8vBiEVLB1/VaMqhG6LglpgKI9R0R7O
	PM3p05ltfIgX50I0BFOCx8eHiXfa+PMj1LyiF9HQRoMTYAJ+EmxGoJoRQmTuPGlsoFXBb23dJ4r
	hdNaAbFNkkPFbvGT9X5veEhdpwDsoTsgR2veANFLFepac33vDLyAqDcIqtAJjHPsT9ffgVr3W+V
	7rESmRVRTZV8k0IoYZTCyEQgsrpS+em49m8bVt2ZnqaFJc4qyE8AwO8ssdwe7SrsXuaiTCQwre8
	+07XJI0nQYTa/k=
X-Google-Smtp-Source: AGHT+IFSOjFyCEwBHEJwDCrU5rW5lKDRaDYjzQ8c/6PyMz3dbdKv0kF1iGi2tchWyu44RKkeSzRHtw==
X-Received: by 2002:ac8:6f05:0:b0:4ee:17eb:ece0 with SMTP id d75a77b69052e-4ffb4913cbcmr187856071cf.9.1768132950842;
        Sun, 11 Jan 2026 04:02:30 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa926a9d9sm106445811cf.25.2026.01.11.04.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:30 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id D271BF40068;
	Sun, 11 Jan 2026 07:02:29 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 11 Jan 2026 07:02:29 -0500
X-ME-Sender: <xms:VZFjaYvZYF_FgAar0EksS6lKrMeU65WUO-ijpyIpNg9eNSWp5m1b6Q>
    <xme:VZFjaf2WCD00_AIqNqU8RwPno7csGvyNQVZ2IHHvB0U8hUuP55xZWQTL350_Jmce3
    hXqDpWbbFyRu3bh1aFhFVaYk_mPTapMu4pphkc9-DrIrrxKjgq_rw>
X-ME-Received: <xmr:VZFjaZ43Uvia_Ku5_PkZ2a3hKKlMXQGlQwKMbyxL54osbICWE8kq4MRy>
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
X-ME-Proxy: <xmx:VZFjaWXGCP7DZumxhH6znJXmjkQNKbK2RinBsp6eK3eI3xJRLAcbKQ>
    <xmx:VZFjaRg8QhvZT8tjZL1etsSy05WKFL08XANnWa3O21FQGZezgK0WoQ>
    <xmx:VZFjaWeZ-4Zmy2m2IxOQCAmogcouZqhNbEmF-dsL5cVMZjLwFHW1ew>
    <xmx:VZFjaQ1LyqLDgRuIlUVkOZHeFhGMGf3HLzFYD49WTkbvfFk_nYe11w>
    <xmx:VZFjaSpyHdxEFc98RS1nUGjZ2ofvA3AfFbr-20M_VW00Ad4L7dQEndhG>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:29 -0500 (EST)
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
Subject: [PATCH 07/36] rust: helpers: Add i8/i16 atomic xchg helpers
Date: Sun, 11 Jan 2026 20:01:40 +0800
Message-ID: <20260111120209.6133-5-boqun.feng@gmail.com>
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

Add i8/i16 atomic xchg helpers that call xchg() macro implementing
atomic xchg using architecture-specific instructions.

[boqun: Use xchg() instead of raw_xchg()]

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251223062140.938325-2-fujita.tomonori@gmail.com
---
 rust/helpers/atomic_ext.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 02e05b4246ae..3136255a84c6 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -2,6 +2,7 @@
 
 #include <asm/barrier.h>
 #include <asm/rwonce.h>
+#include <linux/atomic.h>
 
 __rust_helper s8 rust_helper_atomic_i8_read(s8 *ptr)
 {
@@ -42,3 +43,20 @@ __rust_helper void rust_helper_atomic_i16_set_release(s16 *ptr, s16 val)
 {
 	smp_store_release(ptr, val);
 }
+
+/*
+ * xchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
+ * architecture provding xchg() support for i8 and i16.
+ *
+ * The architectures that currently support Rust (x86_64, armv7,
+ * arm64, riscv, and loongarch) satisfy these requirements.
+ */
+__rust_helper s8 rust_helper_atomic_i8_xchg(s8 *ptr, s8 new)
+{
+	return xchg(ptr, new);
+}
+
+__rust_helper s16 rust_helper_atomic_i16_xchg(s16 *ptr, s16 new)
+{
+	return xchg(ptr, new);
+}
-- 
2.51.0

