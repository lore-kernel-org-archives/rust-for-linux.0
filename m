Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3455535AC01
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201220; cv=none; b=nHmfGsVbTgosG7KmwWIETs/+HAfnYvun+6Pf12kuPdwqwz2hsVcEkRyHqUkeiIbWTb7PpCBfqiQkyynQDcg+Af2FWoeRiraq8Bv0ddAL3YEgnDpAyzKEJgfwFs+icUVj7dovNQRL75kHTk9okkTW1SC1d6vlLPXWGUiHaj3xqDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201220; c=relaxed/simple;
	bh=btkQtdgQ0/faA3G8fQ7vJ2dLzybospS9rvLC2N23AHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bp5dp2AZdaquJH0RYYpHo+sz+gI0Bx1v1p3hHcqG0q9VipzKD8mlpR6Ee39rUN9h4McoSHBTyxO6aCkCd1VlxvxF1gjPwg+nyOtoF0Fmix4tKxG0mL+wNZnqpBFksW7WTGnJEkO2aAGcYtofBSyOsnvDclsHUgFHorjqYNgUyI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijOPenyA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijOPenyA"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b24fede2acso60766405ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777201217; x=1777806017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XNHcqPiS87Phn06IpxO8T5jrJVeHx6CGab+nQaKnDs=;
        b=ijOPenyADDxyQKTMNlXJhlyPso1afqQItvwL0SCOhnW8W1V3+bMgVLIn9uS0bL1TwI
         UbQdmRBcqSnlJM8CN25W2nantgNLLk3obvPlh029gG2BuP+DCLOwPxd7jjsenFN+BnRe
         PRzmLEXI5d2Wvxr1H9raZeNykZms7F6zPEfxq7mp/TrlHClx6+X9XVNmhom+iJLTopOG
         IE7WOsBKnGFH6GcBb7HEpg8HNcnQ8Ue9BQmAJVIeVvdiRpdp7t0LDKwyPiygHaji5ET7
         JkHlXJ2SnDVnAkhx4hVYTLlOa0K2q53BmV39BSVdrDEEjmc8hxXEp+HuAjVcXPbH6oc+
         +xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201217; x=1777806017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3XNHcqPiS87Phn06IpxO8T5jrJVeHx6CGab+nQaKnDs=;
        b=XzoGB0mptx+iyPPlIeVPHssqHAYfx28QhZtODlw9QIJx1cFuh3B6Ph1lgFXy38avUq
         BcvOBRc9qyBVR4g3ni9x91PyNgHk0a+R3vBQPB3St3+8NvTs9UPXYyHEm6sYODun7aQy
         RuzGz7VbdZUJhtOyhPcWxO9v+GaFi0TtQkrNGbkCrBgF0h81ihHirD+O9vhLz93TWbFH
         flr7XwlMzI8cHcKI/4v9f91c5KDUGrpXpyC8Jq9z8AqCoCZVaX8/CMZoTvmfuoo3WeBt
         LMmUlQxGL3gzFjoQ9yENQnBY1XPm9Z5PClrsEybgt78UmTVfKcf6RfXInX6aoEMg5fdl
         L+4A==
X-Forwarded-Encrypted: i=1; AFNElJ9fA8pygEjQlkuZEBI7kUnH4nfmOUVTFdSaD5YPBXw7C7cj5iR0SYLY2yo92CF5TAhO9VqtlWfc8PPCKklYvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMMwWKaX+XGAHaMggLSoPhl/0l4SAseG+ShNnkdjCalSUsk6jh
	BNXT3yn3Mv5PYKvv+o6m2yP9UA4i71/7p0gU6wCf5vkO8KMb8Qe6/KmL
X-Gm-Gg: AeBDietLU2BVcdN5yIxn1rS7vUqXquUd1HSNrncbXgQ0zfp5F/eJ2odxzMBp+/0QBPV
	UInZySlBy/MT3AByW3x34bcSWMQH+MTrMGO2DSlR9U1pi6LWmmspRpyheJH0+uDufCkAVLNFIwY
	7w9ghgU+2C3g/LYrrqMNm2oKXLaSpEEM5A/TQWEvIC1XZwZCWIOrADO49Zs8YEuxkjAgMyWyPSH
	E+i8HaHLK/RlzMDCtyTe8Iibll1bOc3RGhrS8fWrf9GHXGB1EUMA7ZwBE+BTByoH0Mh+wSF6GWr
	RtR/HJy6T+09joY9hOQh0BZ1/TydkTiT1MUAv2IlyRQvwXrt3ty5aAd0C0vFYQMS1ubp8dk+NEo
	8me+OVTCAn3VIDIDSYMxU3BaPP7Gpdu+/v8XsQJfpoXU5WhL/07Lx48juhpRsef9fgRRHzMboHG
	ORJW+OP8nL0at08yrLby0bQDDXUp+8fH8ZoPdHSeW05x2cM+BbOT5clhHG3SVgfZlOVIegr9EOI
	Nx4pKUxqYs2zMo=
X-Received: by 2002:a17:903:2acc:b0:2b2:497e:3f6d with SMTP id d9443c01a7336-2b5f9e8cdb3mr378037025ad.8.1777201214089;
        Sun, 26 Apr 2026 04:00:14 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm256667235ad.29.2026.04.26.04.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:00:13 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mark.rutland@arm.com,
	mkchauras@gmail.com,
	lyude@redhat.com,
	lina+kernel@asahilina.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH V15 2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
Date: Sun, 26 Apr 2026 16:29:27 +0530
Message-ID: <20260426105932.2270364-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426105932.2270364-1-mkchauras@gmail.com>
References: <20260426105932.2270364-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building with LLVM=1 for architectures like powerpc where
CONFIG_DMA_SHARED_BUFFER is not enabled, the build fails with:

  ld.lld: error: undefined symbol: dma_resv_reset_max_fences
  >>> referenced by helpers.c
  >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock)

The issue occurs because:
1. CONFIG_DEBUG_MUTEXES=y is enabled
2. CONFIG_DMA_SHARED_BUFFER is not enabled
3. dma_resv_reset_max_fences() is declared in the header when
   CONFIG_DEBUG_MUTEXES is set
4. But the function is only compiled in drivers/dma-buf/dma-resv.c,
   which is only built when CONFIG_DMA_SHARED_BUFFER is enabled
5. Rust helpers call dma_resv_unlock() which calls
   dma_resv_reset_max_fences(), causing an undefined symbol

Fix this by compiling `dma-resv.c` file only when CONFIG_DMA_SHARED_BUFFER
is enabled.

Fixes: 9b836641d3bf ("rust: helpers: Add bindings/wrappers for dma_resv_lock")
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/helpers/helpers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 625921e27dfb..09ee5cac600d 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -57,7 +57,9 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#ifdef CONFIG_DMA_SHARED_BUFFER
 #include "dma-resv.c"
+#endif
 #include "drm.c"
 #include "err.c"
 #include "irq.c"
-- 
2.53.0

