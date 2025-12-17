Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355682C0F8F
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 21:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766007894; cv=none; b=hSAq/OxmoGNMREXAFdIYT6WpFuFLbmayQHoauDPG7jt/d+lwf76miFnWPot0aFVEw7Is5AAyQoaHsCenY4W9twIIUTAtZ3fO2wb0f6n8T2mNMGcGSGWzXEluei0JJhFSzyYInEXCBf430xLnmwzlbJFZoly2MukmNInZt8w3S4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766007894; c=relaxed/simple;
	bh=lceIE1F6qI1dmKW8+IkblLdNnXDn8bvsrlBPfjAIpgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Br4MMzJOSY4D+Gdjzzdq+uSnlDxiY/IPM16EqxANKWgazlIo3XFhh4Hjti9R7xeAspKbF/rT2MZGANeD4gUR2nkDCw59y2DbT7D4b7pizaQQgSdsoaQI/dB6saharCQ2BWFDVlYLf1AH8vhoWglioiaovUpSK1kmgcfFkAVrF7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmZ0HT0R; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmZ0HT0R"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0bae9aca3so56650735ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 13:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766007892; x=1766612692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi4VtNswfYgI0LC15nM4RND64Bg6aXM75M6lneCHO0U=;
        b=fmZ0HT0RXtK0rXlQyLADUFoEGxbtrBFdnn2k1kKtf3c4atBjwxaEaJ2L7zpk7Fdk/x
         4eTfO5PtyP1P8HbEXlRy+jWbzuQAAexJ8C8M0l6CPS2iu2JWVQY+FkDaIkZ5tHehFW1g
         l3LWWGU1uHQcQUEChurFoeUYB7NBOtkNN6ibmW1mk/ABFUc9f54VuLP+ssUfm3rT/DYf
         a55uxCqZ/diHgYm6KJSZYx3dwxCYHmfVxlrRwAkGVhogYXF1HXB9C+VKzVhn0AXuSkX6
         CcM/5+v2diGxU8H6FU0Ecf1+mpiSH1u/7O9PQkxWuKIbjP3kFHblqPvndoEwF8ZXuNkv
         vm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766007892; x=1766612692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wi4VtNswfYgI0LC15nM4RND64Bg6aXM75M6lneCHO0U=;
        b=pjTME7+/pmgWR72p1ymZ7yHHZnS1Hz4MyM+I93eSd9tkRfm1SVor+x2WzF94XKGidV
         nN5XclkiPlGfhtSqkFzmLdqhjhfMxPYu2Z1ycFwseSsHGuLO5tJhOrCFicezFaZ4Cwpg
         K7rRMcP+3B3lhmF/7t8boKaZvtBgqyfsyaWbiG8/fHiA0cV9ifsPze89eHNQl44Upj5I
         spMPgFqZWGTPCGzZaGsiJ3ki43HNAA1kMId3TbLlrVHlz1rOFDXxGOtaRMVcaGsYRIIm
         LL3J4tF7AWqzkTw7m0agH75OqyHjRw8rfpK4BtCWCsPn4fqCgGLQF8dhV43LzNUET1k9
         fETQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9wFlDL0FPWH2EM8gAEdOgPs9BxqPMbdmwJtEVPebAUd0TOVYod8v+9IttVr92TYrARjTUPvEqaewhAGeFqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZAYglv26g6mrhN0wrTK11c1ua/PvjZERjMdz+pdoTBbQZOh2G
	11o6J8smsn/VpTzt6+3vIXC5cCo6LC1WL/0D3RG4z6HNEPxmoD9hv6pw
X-Gm-Gg: AY/fxX6yDUG+f0yj7xY6nYrRfgEDllIy/ntmqIdgEzL7Kvsqutkkb9XjoC5jiBZIWCz
	pUuNDCSyzNRIhQmQgmHlK1bbvouM9rpUtccVvRub5IntxLrw5kJTtxl8HYhFLeQ5g67WAsRS0pf
	NuFbU4zNza5/QI2XQ2ryHqxia7I//DdQnxLst3z3RWTGDm3k4onS+ztQIumiPqHYiO/pgers2XX
	q/dd9/cz1VbJe8iQ9IuP+cNqyr2p4uwTXfaST72Ls1IN0FQhLLXswamRmWiFimZLz/IrFulG5EQ
	iPmMzgsjzaCZE4eekdSOiXPLxgPvHhDrKwa+BT1o3S2L15efPjpvroaJRxOdAr7eoWi0J9t6TaA
	ZxmWeCSQGj/g5Tmd4AhaXalhANFGWMduc/XNKNwY3UkDfu37Ot5K+3WjcyMA9FqRO+2zrsHRgep
	v4yrb/ycXbazKQgBzjFe+uHDNKoo4T0geLgOrQ9OBGIESg/zl70RghwBJTSCw5pQ==
X-Google-Smtp-Source: AGHT+IG9CCfbhxUU3xWaRRCduAh7tFTLN8ZaXUO5xTSI+5uu/mOZCTiUjQsnw9OO/PU9ced5/KUrsg==
X-Received: by 2002:a17:903:22c4:b0:295:290d:4afa with SMTP id d9443c01a7336-29f26d12fe5mr174263405ad.23.1766007892286;
        Wed, 17 Dec 2025 13:44:52 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d0888fc8sm3050905ad.26.2025.12.17.13.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 13:44:52 -0800 (PST)
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
Subject: [PATCH v1 4/4] rust: helpers: Add i8/i16 atomic xchg_relaxed helpers
Date: Thu, 18 Dec 2025 06:37:42 +0900
Message-ID: <20251217213742.639812-5-fujita.tomonori@gmail.com>
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

Add i8/i16 atomic xchg_relaxed helpers that call raw_xchg_relaxed()
macro implementing atomic xchg_relaxed using architecture-specific
instructions.

x86_64 and loongarch use full-ordering xchg.

arm64, riscv, and arm v7 implement relaxed-ordering xchg.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index dcd115091c91..669f4832eb54 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -73,3 +73,13 @@ __rust_helper s16 rust_helper_atomic_i16_xchg_release(s16 *ptr, s16 new)
 {
 	return raw_xchg_release(ptr, new);
 }
+
+__rust_helper s8 rust_helper_atomic_i8_xchg_relaxed(s8 *ptr, s8 new)
+{
+	return raw_xchg_relaxed(ptr, new);
+}
+
+__rust_helper s16 rust_helper_atomic_i16_xchg_relaxed(s16 *ptr, s16 new)
+{
+	return raw_xchg_relaxed(ptr, new);
+}
-- 
2.43.0

