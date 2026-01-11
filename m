Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A5E221F03
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132970; cv=none; b=Rwux1BxW9ps9ZNmtBLkC0Dssh+hkWlc1LTupi5ibz+YMFW7pA0fph6CHdaKFl8yRFt4R4FL/WF2HRB+C+Zn5JaeUnouAifR03AnSbuDeajEoYZbo2LYP/Kqwm0NggedOObqr/H2oF52zrY9rXx0WOTjeTVseUWPO+N/mpn/IB3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132970; c=relaxed/simple;
	bh=RqirGSw/VLxCbkJqTs6A4kGnhuzc53fQcuFK1fOOHrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PA2YJmD4/nG+joTEYznCB/5vcB3DecD+D1Ldeca4S6sLskSnOk2qWXxliuGzgk/9vLUqaXy2lka51Cm+/xm7VLpWHuxA04u3taUIDkJxmT479IF93nY99A2xEnefgJrKfi2OGbI29bvIk3SVoyeurz+rV9/OijAxlgm6qFRhhsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6Tp/voK; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6Tp/voK"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88a37cb5afdso53474306d6.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132967; x=1768737767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g0reihZMgQMHywishv+ycStyxPwpAgBwNR+f0ZFpTrY=;
        b=c6Tp/voKzHwicDYFT3UJAFwtYCv2t7Ah0f8uhhzNKLHqlSqomse6qAWKAPKO2GLqvz
         7kK1IWflMGhSGibvlh24pcyzJuvcnsLsQ/P9gEWx4EkFmLhpV1FnIufPz4l4m4GygDDU
         hLPC4wKHBYcIEBTOmRp34443i2dQzLrseo77LxXNIK2JuqIaEjZWgHW8bw2FFXmLjZOK
         ZLskbJMimXgRhoWM3/z+/cDYWpnwgdVQM9170tkYhdEiMaXqsM6TMDlnnaYJQzcbRWJP
         0f/Yu/68VjLLvDifEKSYYJf36+Wmh2Sj+4bcBjz3HqZ7QJe5i5+lXzb39iyreNwyC2KV
         e5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132967; x=1768737767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0reihZMgQMHywishv+ycStyxPwpAgBwNR+f0ZFpTrY=;
        b=J+5Iiu9Ueu112rb5Eyc/Fny1QUfJyHIzlGEPB0OeUqkACEoAzDaFPgZcB+6wACoRtv
         3dbsK8qmn2Y8REUSA6CVUqCKxVzA2VhRaOlP9sDWNVpiQxICKphkE76ZHr11iheR2vZy
         UEpr+ksYxAFm/hEJ0qDI7pkqXCCW560bjB1qvFyyd2Otbn2W086tFg5AYw8G4cMWtTBy
         3SkbzimwS5n4s5rafS3Ped8gKlrV45tzBjuMN1kd550dc/dvbVXQ2xaIxq1FAlI5eXn1
         5Ux/0l1piaNmOhZ7efF8aUeXHK5KEyVZtFOUrfDktAkFEH5rvbGGLMU36uGdnHZQ2rqN
         L+oA==
X-Gm-Message-State: AOJu0Yys2BXlrEgLHaYrdtsfJqLLB2QGJjae6dGDznXv3umKVVVmn8vn
	4xktKN79iB9zT9OVjzG7+GpxLGjtFle+uk8J0f8lPDDXHNDvfQVrvyW6pMpnBIqz
X-Gm-Gg: AY/fxX4ZTM9OY19KMj3JeEMhaCCBuzg6/RTQAt1lXW11lziQIx/A/u4WhmDERIpaT1+
	KZc9u9ww+j7b/oFmjPDLAJkp8uJgskqdhJlv/gTtw6SdF8q0VwmwtL5z3Dcw67/4xEX8UBwcAzY
	O3k3RD9O5dhJeZpYIBtRrs9OAjLAwixeEpZVuDuhNPjLR/usTUR7+13eFatWo3Z3rxNBqLLBbIp
	UYSs/kPU1PuTcHhUPGRZDOnaHm5JJMPZYprxfQJ4DmzJPbPCGcPWA9qdseG7XYREhUzk19EhNei
	5K8gjc2Inh56S3UyLXn19Y/hVesETBWB/juK7d7xLGQd4jQ09sKZhbTN2pd+zOKaooHRBcIQ9ks
	gsNhWdcSLeh5FQ1mBFu+9MGX8Qe4hGZE7oMdGJs9Wa7Ga2ph5XfOV/u+Wz/roQzpTZfAHHZGHBw
	HDaEp5/vzo3SWMMlgZ2FsRYTQrQpmkGfpYu649AMNDP7tVyKBFphd9RtsPEGrRXgTrW2gBfg53A
	ExSYOOpVgrYGXM=
X-Google-Smtp-Source: AGHT+IF/rPtAHMUkKIbKSBvghtzXJiq6dqaQSOzc0+qRNcjI46lB4kY8s1d4Aw5kIQAJ3d9ULt3l/A==
X-Received: by 2002:a05:6214:4281:b0:888:5a84:b5e3 with SMTP id 6a1803df08f44-89083c493b3mr227403686d6.8.1768132967298;
        Sun, 11 Jan 2026 04:02:47 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e20bcsm116852996d6.15.2026.01.11.04.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:46 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 59E9EF40068;
	Sun, 11 Jan 2026 07:02:46 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 11 Jan 2026 07:02:46 -0500
X-ME-Sender: <xms:ZpFjacv1agYgUY4ZxDIaTDYMNX3kq7-oWGCDJ1SJoE-enbaA5zf1Sw>
    <xme:ZpFjaT0euPx296dnE4PDImYDfYBXXCC_0KRislBJmtYv7VAIFVkvqvpEOAHxpWL3U
    BPOGE-xbmgh3P3ngg5OSXRaTYXpuxzhf5M7RX3-wEe9mmW83Q17XA>
X-ME-Received: <xmr:ZpFjad5NknjFmSk_kIPJ--9fJP70Z-wZSJGW2wtLiN_MR-6cfL_DWS94>
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
X-ME-Proxy: <xmx:ZpFjaaW_TzBlmId9UPKqYCpmahpvMY3Jm_vVtdm4nwbn--V3mD4iqQ>
    <xmx:ZpFjaVjcaY43CFNJqMTW-lPr0MS1Mpxi23HFuEuSfOo6bQDSG8ikZg>
    <xmx:ZpFjaadU1GPT5vAqpnfrRohKjhnXVEf6JXoPU9_0FLVGTUO2kfzbXQ>
    <xmx:ZpFjaU2FTYKG6vHKrc8TDx8XU8CfIWXB3hm0ewp9lMu5AI6rPWl5Fg>
    <xmx:ZpFjaWq_UiBZ0tl3Z-iOMu6RBPF86XRUQXSOOynmz1WbMmetRWq1hG_K>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:45 -0500 (EST)
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
Subject: [PATCH 13/36] rust: helpers: Add i8/i16 atomic try_cmpxchg_release helpers
Date: Sun, 11 Jan 2026 20:01:46 +0800
Message-ID: <20260111120209.6133-11-boqun.feng@gmail.com>
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

Add i8/i16 atomic try_cmpxchg_release helpers that call
try_cmpxchg_release() macro implementing atomic try_cmpxchg_release
using architecture-specific instructions.

[boqun: Use try_cmpxchg_release() instead of raw_try_cmpxchg_release()]

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251227115951.1424458-4-fujita.tomonori@gmail.com
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index b6efec14e5b3..962ea05dfb9c 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -117,3 +117,13 @@ __rust_helper bool rust_helper_atomic_i16_try_cmpxchg_acquire(s16 *ptr, s16 *old
 {
 	return try_cmpxchg_acquire(ptr, old, new);
 }
+
+__rust_helper bool rust_helper_atomic_i8_try_cmpxchg_release(s8 *ptr, s8 *old, s8 new)
+{
+	return try_cmpxchg_release(ptr, old, new);
+}
+
+__rust_helper bool rust_helper_atomic_i16_try_cmpxchg_release(s16 *ptr, s16 *old, s16 new)
+{
+	return try_cmpxchg_release(ptr, old, new);
+}
-- 
2.51.0

