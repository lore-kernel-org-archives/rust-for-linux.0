Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC8B137923
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499143; cv=none; b=II0i/iWpN9twYBMr0gc6Bj6etDfKkNxT2DIgnQnJZzFGEqE1M0aRvLI40ScCyxle+vbahzGknN5ZaeqtPaaoGgX98rsDO4mhZqDtwgZYX8zU+DYRDGfTTZ6t4RYwFPZYHrbzty1mQ09qO022THVmfvMdnWlDmdUQqMytCVm6C0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499143; c=relaxed/simple;
	bh=fXIh5PA7kbCyYYosmW/TTl0n7NYNoz+MhA4tzXltjEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JGibg+JVcEza+tYLSTFslbffazCCTXa7IjPLUUjoPutUkC1zJVJVP6JYXImcvGqGUK5r3raqPOmwSbRAmgwPTqJuX8NLokOrqdhH+Wv77uV9uSMOZmWI7nHWNA4vjUvnQ413a8B16/PmobwnnW4jgvhOB/0ipfZcG8wFbrtTkdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3uBpc/k; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3uBpc/k"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381216921aaso438103a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 01:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499136; x=1784103936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9e/NFLIY5ko2z4Ua5YIOk54c8MAKLBSvbGyu1AtkwQs=;
        b=F3uBpc/kwroajlaG0pSbo6SS9JKsTy70Z5+N6BFxbK5KSVzZt6ujMtAdNzfe3oofWB
         K6lxRMXuJ5FwSlsBeaIX+tgZPoY8kk04c7vDj0ndvmjxjPKZRf5Ryck4Pad5DK3zgM7Y
         BrvdBYIA/TFC7ozZdqConYpJIkw4HtfxKHyKSrPxLd7HMu2ZfXVcVsFqamUFD4mTGKRy
         GoJjlhnxaQ5opCB+CZ8WqrexhWT9smWWO7j/52RcoEgxtihVJCITGinhY62zYjAcVZft
         0+pz3qxRDSa8YGEkUoBVzKhzkmQ7zLWCre+YWHZiGooySjWCAxxtfhZxlEwpdLiE1EOa
         KWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499136; x=1784103936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9e/NFLIY5ko2z4Ua5YIOk54c8MAKLBSvbGyu1AtkwQs=;
        b=n7Lk50hMolVJ/yWiOhELVPj8nTK59Zr0fdiGNudp1i+ZLE3j5aB+MEnXZwGqghQb2q
         MMFzVt5I/sCC38ChzGtT6sh2ymTs0jh5T14DNEwVKlWpj3RiPnM5RJFj29CyoDrTYjFM
         tKInav/50erQboJk0Ho2e+2+ZQr1H2lbNEIZPjPwDr7QSSemyhiLn2hDG2Gzwiii5cir
         McDQLFvdARkmmuAc1kdVfHYSuZz1eLrX/STJyP0JqP53mRqIZ7dgd0NDVz23vZStbxFh
         y1Pod2l3LNbJ7sqi5aVotyLCs4RB0g40GXRSqhpwscq0+zWn5sHbKF9pdVIZXjQEWXHT
         0oqg==
X-Forwarded-Encrypted: i=1; AHgh+RqbXJbVGS2NlIvV0v6mMIwkgF2k4eR5AfyQ+/rNu8RsxtR8XXdg4oGJ8Lq/YIk+rDKuOzTcejrOfbjP/vVrYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOxVpYN6MfFTdbWXFnxi4Ofy1IntIpcJNkZNgIOjgv7B8Rl0CW
	LmbLjGY7l7FJmrdvbo+dt1Cz+sBYriNM8rRaQrTt3FEw8BN+zB4nO21l
X-Gm-Gg: AfdE7cmqSLElGl3uveVpTC6dQ5HVhiUeI8Yc2P29RnnGY938de2gXr08+s14BZPofkg
	A93sLYVeoT1/ybbtpJmANwu5z5L1sEQqt3+FCPJjBRg9oRpVf4HIVEB951j8MstqcdPu1Nit+tV
	4pzKc+9sriv8glak6qGx3uf6HMgGAkKh8Pyj+DKJF6yW27e1vJx5vfqBoFvL3k4xVm6XPEQZMqB
	mmCwcrTWuUDuYG1o3o77HGZBCubli+4jyIwHsTJHTZ/QecBaTzQyxayV5vWndmKEPR30YTZCg/u
	tKptFUR8uO3aRX+6UgxJ7yUDvB4m41L7RvtbZXW8OnAWrQMPBt5lXMxQJrkpeR8vr8ihSIm5dwk
	9RJ15RV2z1E5Zd+PP062+KL6tZ7SpP74T90WEagImCv3El80HiXXeO2Iw2B16RDCmp0yuLjVOSw
	3MdYz4LHHjRw1t+ylKf/DUcXm9lJjVk4l62yVMCgsUDA0zxHmz6HNGGTQ0nCEiYWiljA==
X-Received: by 2002:a05:6a21:6e8f:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c0bcea2f17mr1778731637.44.1783499135994;
        Wed, 08 Jul 2026 01:25:35 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm19975117eec.0.2026.07.08.01.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:25:35 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	nsc@kernel.org,
	japo@linux.ibm.com,
	mkchauras@gmail.com,
	lina+kernel@asahilina.net,
	j@jannau.net,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH V17 2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
Date: Wed,  8 Jul 2026 13:54:49 +0530
Message-ID: <20260708082454.1254320-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708082454.1254320-1-mkchauras@gmail.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
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
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/helpers/helpers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 998e31052e66..4b90a1390ad5 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -58,7 +58,9 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#ifdef CONFIG_DMA_SHARED_BUFFER
 #include "dma-resv.c"
+#endif
 #include "drm.c"
 #include "drm_gpuvm.c"
 #include "err.c"
-- 
2.55.0

