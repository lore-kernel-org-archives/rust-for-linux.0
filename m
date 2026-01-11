Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EB233BBDF
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768133004; cv=none; b=KHBKSi3XZ6/3dm0pORg3PVFQncp+eObJERsB4Pa5s55YpxKwN2shH1eVN9GsOgPMqNn8YQASCxmSX8B0cUxW4XgiOpymOzvVh+UkGrP7JJR6hnfcr5DEDSHnPDo0dS3jCm4mZcxaEemJ0KYkoitNVN14k3GVLZHTYhS2V/qKLnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768133004; c=relaxed/simple;
	bh=NTvoEVcgawgbSB+kxmka0nKgKC1k2lvwU8QMi4YHbpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EDN07V5ke641cPEvT49kOQAolNQDYrrU9X8xuy5XVxxkBBwIE3mKnvyjPPLABhtY5ocofyOT0CNwrTmf8RO5IjBv3gzbdXpRg5TNVsLi/9W2ZU+p26p6QxkQAqH7GXakR7VDvBkAhgfI3OclJWMig8oYMzjZnznl7XqIKt0xR50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ausn9tvd; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ausn9tvd"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8908f5ed4aeso41190986d6.3
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132999; x=1768737799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=urkFFYsCz2rb5aOmbVq04aXcSjpmb5+rg4Bs3IdGz4k=;
        b=ausn9tvdAkcDtikF211H0uZHWIQSjAB29Tg1tHUKILD4wxv/FXtASGXrsxMAk4IIHs
         wTN4QmzdwPd/PPaPZZFq4Yagg1Wy48O0M9CnAudv9dK2zEvgda3+79x7hTQ2jem7NtGY
         VRncojLWTburJqmnbAv74NPt+aWTZE6HQUexaLPiMHbTh+xMKRP8y7rzzleMXwxbXlIl
         3cqdeqWR2QFU1BIG7603AoczdwyVL6JHuNuOhFIawBhg7braNVTNkVFFBgnMj1KEuoSr
         EZuTmn3BSl2kU+eDkh0iDa4Nw6O9TMbud0JiFG0SnTNUM7Bcw5oDOla3Iz5x5HuvOJE0
         mpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132999; x=1768737799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urkFFYsCz2rb5aOmbVq04aXcSjpmb5+rg4Bs3IdGz4k=;
        b=WzLA23jbbU9QlbK/bQ6cO2NfGaXtZRL1Uqe11522NKTYhP6E/89mprNxTmrT47RD4W
         ahpQaQkRTMiYA4kPJYSbPXZ9s7IZFkifVeifI5t7vYkjdlEYQae1fL1eV45y2cB1OgUi
         diDRi0nY1flcf47l9C4HRDontt2ruNK69RFLKY7jDMKm8YBdCf7LeZlH6/LWOXW41pkU
         k+wm2YQghd308JaBuvo9JM2h3o6OOIx49iR1jbYSIh2xVUHzfyDEYYSiEd1ylsgEGdDX
         GAGe3Q1l3dH/PCAaj9phS+UeWBBspX2RBvu7ho21g2cIDXLB7WI24l9hYUMvjuphQ7v+
         Fkig==
X-Gm-Message-State: AOJu0YzWeKc8Ym35FL9nrBhO0g9jsatejB/3RKXZ+66wsuIYYjz1fuYZ
	+giT2XlDD8da3uA3/nnu1X31OILDJdTJeoYSc9SebYcappw05um+Bhhk
X-Gm-Gg: AY/fxX6UaRo5dxz+uIOJDm5RcDPMBk/ptdNvkJCCdmvzHyv+23LNZsRC7zMRUOwSZGw
	l21Sj7qyak2hzfvtBccxzk4ZKEz+4iK4fNEjbvEoQFOEYjXKAe+/1NnoaDj6/sDtMbVlIjF0k8V
	EZ1EnGK4Ud1Zznn/Tth7i/05+zNTO3gdDoT2u8LJrOz80NdPqdrxkYyDcmsFc9drXJyiEJLhI8r
	r6wtrFgHMFxdw7iQXaQHWtUse1ACGMrm4hhUhsTISJMGR93x09wjXu+oeZXip0wYCcV/41u2/jJ
	aWhWGf3qIpXgteyI1biTKn4VsZYj2AKZUK0Msflv8+uDP/DwfWJg9ghOr1WNLAmbyoxS3QIOvfH
	takkP0pS9cc5fEZZB4YJ1BRuDN5hWpxu2wTMmlMrGnTWNb2KVSqjEkF//bD5Hpl5tidezDqnkE2
	LHsbuXiuLGGOz41a2kw37ald8MB7P2Y+lKoHqMDkC2IjuE+/ifePld12DLgT7t/uZ8xifBJj8S1
	w7niMcghV6NoI0=
X-Google-Smtp-Source: AGHT+IFU99vFRKNXFRBIPTDnqLIzYQY5QcNBn9n+Vlxef4KIOA+z3T/JDxDH2TtaZWAMHC8V8rC/Sw==
X-Received: by 2002:a0c:f40f:0:b0:882:6d42:53a7 with SMTP id 6a1803df08f44-890842dc0ffmr195773656d6.40.1768132999484;
        Sun, 11 Jan 2026 04:03:19 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907723436fsm133916516d6.34.2026.01.11.04.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:19 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 953CBF40068;
	Sun, 11 Jan 2026 07:03:18 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 11 Jan 2026 07:03:18 -0500
X-ME-Sender: <xms:hpFjaY_T8ocrwJr7ADzEYY_uNpmJhCn13vQWeRmOu8bN_MEPAukPcA>
    <xme:hpFjaV7VykacVo3tFohxlwRXUVJ3cQPgz4NCTUyWC498T_3w0mY61JLN2H1ksvr3y
    2imn-W8W7y1UVAAKzkX88T3ZPEMejceff_75b_1pl5Ki8Vg9QtWeQ>
X-ME-Received: <xmr:hpFjaRbVIbbZ_bxVKkuoCaFPo914bRcR5sppx4NS2pc2ZwyG2E_weW7z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepvd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:hpFjaX-9PxQseXghzfTSasdB-aoERovkDp0dMXf3nTy7P99-yqK_9w>
    <xmx:hpFjaYRc85h19yGZaKyINzVPxVPJJpOgZMdKh5i66CpT0Zz_slA3hg>
    <xmx:hpFjaSJ8Tcd1r4Vp6TSuUXxJ2u53sup4Un8FXJWtTJHW7KRuShWrXQ>
    <xmx:hpFjaaT3l6dfniFkuI3LmGx_1k5qrUt2ulzEvo2Of-v49xRKc0sx9A>
    <xmx:hpFjaaLdlu74hu_fh4Of8JGCTzWqFIy7bPTfBvG1fXJPidhc_HisO7ra>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:18 -0500 (EST)
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
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 25/36] rust: blk: Add __rust_helper to helpers
Date: Sun, 11 Jan 2026 20:01:58 +0800
Message-ID: <20260111120209.6133-23-boqun.feng@gmail.com>
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

From: Alice Ryhl <aliceryhl@google.com>

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260105-define-rust-helper-v2-2-51da5f454a67@google.com
---
 rust/helpers/blk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/helpers/blk.c b/rust/helpers/blk.c
index cc9f4e6a2d23..20c512e46a7a 100644
--- a/rust/helpers/blk.c
+++ b/rust/helpers/blk.c
@@ -3,12 +3,12 @@
 #include <linux/blk-mq.h>
 #include <linux/blkdev.h>
 
-void *rust_helper_blk_mq_rq_to_pdu(struct request *rq)
+__rust_helper void *rust_helper_blk_mq_rq_to_pdu(struct request *rq)
 {
 	return blk_mq_rq_to_pdu(rq);
 }
 
-struct request *rust_helper_blk_mq_rq_from_pdu(void *pdu)
+__rust_helper struct request *rust_helper_blk_mq_rq_from_pdu(void *pdu)
 {
 	return blk_mq_rq_from_pdu(pdu);
 }
-- 
2.51.0

