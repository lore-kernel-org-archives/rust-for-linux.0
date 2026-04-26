Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44162FFF99
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193888; cv=none; b=XXQRbZ2LpCHj8DbfbnDsJvJIwIIH1hU7PchOQDKPVVzyzXLIthBfBwp0bQedZpkFP+XK9TKI46xk5kFOAyNzQOfk+ZsQTUHNaWFtJ0Gl5pCrmO80eHnwMb6oYDLxf5GSCUTvl0ImGe52PXFST5wx3UXYsYQ/h4fJS+BAhpxLoX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193888; c=relaxed/simple;
	bh=btkQtdgQ0/faA3G8fQ7vJ2dLzybospS9rvLC2N23AHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EBKsOUWfB05ZLC325dylLIwbzq6X1rAdMiZkU2ts7kc1tcAJd81bh5y1C8ju/+xi4Eh6+dQJmx1ZmDQNPjkyC+chfPLz8o6cUkIVcmyWcbb3NfbSfjDcOkgNIE4G10dDmiJdIIWh0rX4sasTnqEt9dOmnemxqMWibTgFvgdWpFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvUCcEk6; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvUCcEk6"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d90833cacso5755153a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 01:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777193887; x=1777798687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XNHcqPiS87Phn06IpxO8T5jrJVeHx6CGab+nQaKnDs=;
        b=lvUCcEk609rQbH73Fpd88AkVvk5DSEu3bTyGphCzbdCl8d4cJ9m4MbiZbzBlTsdcyi
         GrnGyMqdVCaoicGqZL3YUTziqV1XNHJD10BDE+v/zn9Oc774qyOxO6/VfCtlbggE7cNe
         JvhPRdabyz2M4qkIou54kGo4guPiIam9yNTf5Ud8UhXvuhqmO8D4YMxpjCdKmbBuYBct
         vnoKeP747AhsghKi9Mux6GpOxNhmhs2slz76wjfA24LjYe/7TBbEkP+OSFWatRiIQ0kK
         ueL3grXuFhtulV+y1rxJ4/eH9R1qNnbpsjAcMt+z/SqbhGLJ/ADZ7A9WxM+jNUF96Fdb
         LmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777193887; x=1777798687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3XNHcqPiS87Phn06IpxO8T5jrJVeHx6CGab+nQaKnDs=;
        b=XpOKbbnkHS1caXsPfpmE1FvQsNST7pa2wo8Xl+XNl7wnxOZbEKTgrqUVzhPemlGXW5
         dz+JdBWYN8jDPzPToc8VCumTg5p8fib/1G88MT5iqQhhqphqXLun9PjSxDlagyJVUqIO
         8PELrcMlWF+QhSu/INM+W/u/tn39eCO1bVdcL8Z0IZM+KHQDay2w0LBbsWcXOe4MN7vv
         sngSsONf1nn1VKiAZl9Zm8/XHt96JgEXQOI0DhoMmyvvMK0WpzbAewzk8jHek+Bq/swK
         mU5GzOLAyWN8KL1psL1CQNVuK+DL6T4Tes3Q9+SwlC3ffPJKqemllnBXNcwdx8IXD4ob
         Vyiw==
X-Forwarded-Encrypted: i=1; AFNElJ/W7TkfNVgOvvbeevho9MedIoS35bM6d4xW/rXNYRQqAsbGx/wal60kQvU+k5TJEOK5z89/tnY+RhmYZe7szw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLpysS2xII+z0TA/7X+bqbJkIeZ0Q75VU0xpR8UADXXGk8+9CS
	g223v8d9ByPmYhjV3/o68mT+YgpPWbynLcHRAdQvUUtk/y1al6JVBHLq
X-Gm-Gg: AeBDiesd3CTdJAZUyObP1i+fAX1ged30kGdyXEf7iqbVQRHus8Ms5sAsEbpb8pi/QHk
	B13NHLf+U2IDRwjZepTFE4+O5g8WQtezv80EEuqevkvOnXj3NLCThEu8i5UQ7b28A9twNfsLfYw
	xMCO/583+lMY3XuPgDaJ1oj+BSZXA+pP0PtlzsYGhtS9MRBVElQYuTfFLzIo+kG7T8yIog9PaWp
	TaSsi3/7PvrEHjjtrvrFc6BCejtr2xv17hmO0+6zVVuBqNjU6tAMF17D8J5IjqYRwkhcpZg0p+P
	8rOcLylniKffTNSaHYO3xC09RDNluXC+VDsbkDrBq1IaLn5zPjSkKXDwm8Qz2d54kdI4eMLBdbK
	AvV9PMAOIyWWL9DACU9tcAIfJ8atEAzkg1tWECFS8R2LyRqiOXsnEAa/xlqortyVl116lRFWsJF
	63tErysu5ICZdB8C27e8EZNF7AyXYz7DgGCK5ACxINgBTY6vrgBN9JbWOBhEDj9PjsoNpbusK6w
	BmRWfidXXLI8Ck=
X-Received: by 2002:a17:90b:4ccf:b0:35f:b647:d973 with SMTP id 98e67ed59e1d1-36140229b13mr38654992a91.0.1777193887102;
        Sun, 26 Apr 2026 01:58:07 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm27718937a91.3.2026.04.26.01.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:58:06 -0700 (PDT)
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
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH V14 2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
Date: Sun, 26 Apr 2026 14:27:20 +0530
Message-ID: <20260426085725.2090827-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426085725.2090827-1-mkchauras@gmail.com>
References: <20260426085725.2090827-1-mkchauras@gmail.com>
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

