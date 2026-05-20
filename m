Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B2B3603E0
	for <rust-for-linux@vger.kernel.org>; Wed, 20 May 2026 06:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259635; cv=none; b=l7WUdi9bcFf1y5/S9F2kbOwiU6KTKkkB5o3iv87cxU9rsCECIiR7NG4Wx6RTD2TDcIFfVhDKWDGeqL+c5U0RG+d7PCz26YI7hNg/1RvVSZnMY9pQz5WXRkQP98pihGxMB5keAbxfmc66/z8mQQB8an/HPcTLNQkvQTsMVPnzvyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259635; c=relaxed/simple;
	bh=QR4QWT8k+mmoz6qnrdIi5qqyh1l+8z06HXGD6HWzkqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BrN5kHXqWTglH2PVt2V1r/abvqdHsHmAZJsFBZHSzJV23i2o7EGyiia1tVfpsV6hJWxcWp8q4O7t32Ol+IYqmBglxJKG2DirPXdaJEiwBhEDOI9uK0xoTZ/5UXyFAENdgNr5SqGmGAAOLZ/UcuBFkk2MX7t55boF3vxNoh3ULXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSI1s9+z; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSI1s9+z"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3660daea6a5so2364876a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 23:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779259634; x=1779864434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwRmNG2JwhRhCrdTLWtC2EcRcfoo02ZJ1Bao6+rpdQ0=;
        b=aSI1s9+zXms8ieHFF6aq9I59wHKSa1oQNsvu1Sa2/OgDzM50Xd4CkwG9flgYJF4NOx
         h90E2uFb847AuM0zxSPSodxytHfXdDUgRyXZ/HN//QMHoVuUUjlXqO1GObx7dya1f+kY
         KqvhkptZ4lMHvedQefPp8LVxtV3zZgzbUGjEWulgCBMpQHTSqz2yNeAhTl1dJpCszfzz
         SRNVh0q+rYgz6PLEjaQpg/xO6wCqNRJUO9Dhvh9/eSiHTGSq3MrTfavRa8BoaidGwQF1
         qHiaLGJYchTPLrgmKYp6qHtRDFwoKCyZDDFRJbamU6rYOEZKi0rIqKpbt/AEqjMAqCrj
         32Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259634; x=1779864434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gwRmNG2JwhRhCrdTLWtC2EcRcfoo02ZJ1Bao6+rpdQ0=;
        b=iZ9XbqYXBn5vP/TppaQoVLolCcNstykmekHk2d+AsCAMsi+23gSEBV8ixlclXrJeBy
         Wim4GluusG5lwke3ahCra9BS3XEImjNmvFl2FuBj4k64Tr9Uy5rCXdW8jvjs6ayImwQ/
         VHyXSfzL3hyPhI1qdlUUOpSvAAEUNIY2qWmc4FICW3LMNiKgr4Sd5Wxi7hFtCiTDEUJO
         krLaG3nZe3FAEyA9FA5zXHbhWZn7HnYI4SNG0v9pFI8WPfLIRboWhkwJ+3ID3pCtKp0e
         oINVTInIInsRysg3ybRGqegsuheKnrHIgSkbjrNRZq9Hp3uK5fd3EBeDQVDmJCLx12fD
         JV5g==
X-Forwarded-Encrypted: i=1; AFNElJ/zTCgcklFd3qSXtZqjrKSk4EuepEudjZyJV9NPDWM4l4K/dv9mMU5jPSxjGu6H3GVW4K3MuFIknuFwE+YNDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV2+ebwuAF9yxU2fBYtU//nXcSxU0+o3FohvLivjLvg+O6Fsgt
	cmzaD6m8hmODb9bdZsTv8zKze+Xi+kIpbkxFGojyJuSnP3EcBEAsePZJ
X-Gm-Gg: Acq92OF6oCnW2YUKy5kcKc6kTe5Sfwy7HaIhYUYcHYb9JA6xZqnvHmrKNzz6AuJZw3a
	I2Xt24KVh6Z9klyxDpuDX1qTQeqKhMppD7fyzgMzGgs2qmQh31D+It/+aZFQ49dLxBJlEjobAwk
	yV63TW8OS6wy/OY5cwbGJlHdCDImcIZrfb13lzhE9srypvtzpjbdav6BxVaFco/tbFl86qJBzIq
	8E+9rS8XlgyRN3PiK6I+3LW/WmGwruRtn0UyLeS71L50oHnsOTvszHuNSh28ZkeLMJeMAHPbRcy
	rNbZsWrAIGdEzp0GvmjKWB95E5zDmleTlzQXPnbAhNiTb23ydQCLwYG/I8j8qddBnQTwZaovLz1
	x1jqCa85YL5ZmLbkwtulVK+8+wL6PeuyhaKpKcuKK/j/3/WNL99CsHjkgxvf/aMgKaRno2HxKms
	aCMgt4s6278s5wlkxcaShWBOV+4nDqhpPi+MQpZG/4TA2m/6DLivBwFdByjbvZ6ru+IHGMOJJNw
	Gh/VraL59wM2Nc=
X-Received: by 2002:a17:90b:4a03:b0:369:7003:4e30 with SMTP id 98e67ed59e1d1-36970035860mr17374050a91.15.1779259633583;
        Tue, 19 May 2026 23:47:13 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0e93e0sm6069970a91.10.2026.05.19.23.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:47:13 -0700 (PDT)
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
	acourbot@nvidia.com,
	fujita.tomonori@gmail.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	tamird@kernel.org,
	kees@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH V16 2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
Date: Wed, 20 May 2026 12:16:24 +0530
Message-ID: <20260520064630.1785283-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520064630.1785283-1-mkchauras@gmail.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
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
2.54.0

