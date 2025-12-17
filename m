Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582CB3A1E84
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 21:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766007884; cv=none; b=T3FO+TaJnb6fXWh+aIXlZG9Yl1cMhWS/AQMlpem1scdu0Z18ek+z923t3tJ8pj+fQoCa8YAYGmT2ufu1m0Vc1IsnYE6ff/oehdd8erC2ukbFKuAJ+mahZaMvh/H5ZIu1v7QDnwF5EP9oDyksvv5WbKpN1uUXiyDwFFSa3wmyVVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766007884; c=relaxed/simple;
	bh=eS9xPz961QZBhucvhegj8nFc3C5/99zrHjVx1pDvSJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qf9ytTlA4vya0IPxAajzjAWkERy0/PPFDEPu/CvkAsxLOfawg+02jzUC78LpStMvk3qqFPfns6TKm/7cL77HLJ1xob+zLbY1h9LM58yKZYt19Eq8iSH3dvOtm6hDexhTegUaUpTPr/SjV6mOGrl5rp9KPrhw4mGbevIP4wbvKtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I03K2arQ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I03K2arQ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a12ed4d205so26914915ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 13:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766007882; x=1766612682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlhLFaDHH0VPGQ88i6AUMjQQF6nXemCRvtZp89RfNkw=;
        b=I03K2arQ9On5zJlb0fMpOvZNFA3sgcu+nBoQbhLuEUuJ9FuUhCs0xYwHqIRwpzbbDr
         UusDjMPPmmQOvN2IWXA1HYC5RFWn1U4htih7b1e1tCNZiLQPg7HPI6ayHnD6Ct9zr1nJ
         IJi+bRkq0iu0ICW0eJWdM8UpANlROZQwGyHfD8Rta3hlo2p/SSwfOvDC2yLW5qAnJCgS
         svdkAPPqC+RntyIg0MGljmZ/QNy9r2hVllD2ZrfBDz2xDMBMrNb7sUhEOX84QEaooiZi
         xPQ+V69RRXVKeIemyuxWe5cDt6NTI1ldk+B2s5nf5P4azRH5pvatS4kiPDUXFPgi6MHN
         LSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766007882; x=1766612682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jlhLFaDHH0VPGQ88i6AUMjQQF6nXemCRvtZp89RfNkw=;
        b=sPMrld36lb0B/Ll3Sc5IgxGKc/jLQASGjhEg00+gHPyMXu+Dy9Gy9pSvP9JCX7aq1j
         Nc11yT4oLEDuZaT0VDXKeBFhg+QmLJwxliFrxtsXsJoNrsgHBxglzhou5/S+5c/+qnlC
         USQ1qtu6kgjrdf1kfjLHeUGePvmbahWmB/W7K9thq9p2SdCVJlQXvuMEDEA3OINQepSt
         QsFLPQAPCbvRlXvqwy8kcluuokKf+Y6V/reuyi99hu25P6s7orf5fIiuLIDqOq4LDsN3
         qJF30XXraZefSYn1ptFAfuLUH/0r/hcIYXPtGJxvzIDdq0hSk82LvQEkub82/HeTy+Gc
         Rt4A==
X-Forwarded-Encrypted: i=1; AJvYcCXGnBBo5xgBBlkAlttmbjlxeApPhYZz7h3R7Kl1dDwGaha0M1/aq1hvciRgIKBNBSNX4GpfodJZKmXDUe8Nww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPBvBhgXylj4LgjbO8ctJXh+6arrLX0OxgNpUxwUcMI9FLiWYi
	NZylPLYClWKl6LxeVGIwRHQxERA7RreqwrQy3C3c+Ifj2DvTYcztqA75
X-Gm-Gg: AY/fxX6iGFzFs0cT54tZpvLfc811T6/PsVbK7LADhhNYmikLPzTutpNaBQkjCPBw3oV
	UtVBk8EzLnjblJsSXND+SweuI+PZoq07baCF3mxKsI/HgPc8cG+QnQ2kbPjRq2QSEG/Xi5RnO9S
	/Kx1RQf5IzNAkfk63g3ByK9SqR9pjvepYZJoAyrloI1WfDu/4XIideDoNSYYFIQQepSo5IJi5sK
	SPg+2ZEgjXQOdKl0tTACqh2jaPi09LTLtxhafHz3O58xz5ZIhnVKk4dOTfXpQXDS8px85CT/PQP
	EC8QOnZjVXXo1y+DapNazYCKcy9Tj5mWI0+9kLnDzvaBfx+/pnCbIfvRCEVWaYC+AawAX7CEdT+
	p6F9+0OVCygzq6Nc7mBurF73ey2Y9rDn28BWGQAZl0RbeR/mLBzeiH2TQDeDJTLVIKiUKT84mPZ
	/EzLtWljlHLEV3hmoJNh7TywthJdsPk16hI8aC01Wq8XP/XfKGwfgn6qTm/8jiWM64ezHu0kms
X-Google-Smtp-Source: AGHT+IF3dNn7hu3fjs2UQACMgR+dk/dCYz0CfaVcEmTYYjZrlNbWtSFt1Yzt4yzdPqscSrvoY5coZQ==
X-Received: by 2002:a17:903:3d10:b0:2a0:bae5:b580 with SMTP id d9443c01a7336-2a0bae5b6famr124359345ad.3.1766007882457;
        Wed, 17 Dec 2025 13:44:42 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d0888fc8sm3050905ad.26.2025.12.17.13.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 13:44:42 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: acourbot@nvidia.com,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 1/4] rust: helpers: Add i8/i16 atomic xchg helpers
Date: Thu, 18 Dec 2025 06:37:39 +0900
Message-ID: <20251217213742.639812-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217213742.639812-1-fujita.tomonori@gmail.com>
References: <20251217213742.639812-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i8/i16 atomic xchg helpers that call raw_xchg() macro implementing
atomic xchg using architecture-specific instructions.

x86_64, loongarch, arm64, and riscv implement xchg with full ordering.

arm v7 only supports relaxed-ordering xchg; __atomic_op_fence() macro
is used to add barriers before and after the relaxed xchg.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index fedf808383e0..66b74111d798 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -2,6 +2,7 @@
 
 #include <asm/barrier.h>
 #include <asm/rwonce.h>
+#include <linux/atomic.h>
 
 __rust_helper s8 rust_helper_atomic_i8_load(s8 *ptr)
 {
@@ -42,3 +43,13 @@ __rust_helper void rust_helper_atomic_i16_store_release(s16 *ptr, s16 val)
 {
 	smp_store_release(ptr, val);
 }
+
+__rust_helper s8 rust_helper_atomic_i8_xchg(s8 *ptr, s8 new)
+{
+	return raw_xchg(ptr, new);
+}
+
+__rust_helper s16 rust_helper_atomic_i16_xchg(s16 *ptr, s16 new)
+{
+	return raw_xchg(ptr, new);
+}
-- 
2.43.0

