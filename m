Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8A833ADAD
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 05:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009701; cv=none; b=bN3Lf6ecemtmUfa3LtL10q7Tz+6vfGBAOHfm9lvX5MPi3HnfTnXgW7gYT2p/ftCK8RJ6O1SKpoutn9ekv+CiWNDrl0MIzGtfKIWHPxJY9nADI1KFfL7t8hhPICh6Kg+81rsgJkdE7IYPU4a4IVNy7+uUh+cLS9rN3oNLa/1KHNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009701; c=relaxed/simple;
	bh=5AskzqVicAC9flZ1LjZUxvbxlBf3jPZH4cwWbVOrA3s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QR5bbBKXiF6IwhhDClLloWY02o5GnT5HTTmtSNAAZl1AWrf+ATIhUU7Lkux5jr2ZIHmj4XmHYe+tIvwRX5XCWzG8gK/USzMEtzOTV62gL6m+b9yxEuZX+zCF/oh4CvN/M6dZST9ps0iTUyya5DSN3yRyOnmmI9E6StKXHP58WkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br9qK58S; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Br9qK58S"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b2d3a9e149so39983215ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Apr 2026 22:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009700; x=1777614500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ox8HNk2ehgX4u9MIzrQAUilnp/6GJtQsHeC9tfe3Lv8=;
        b=Br9qK58SWnsBu7BIAJLSRmrjvqPYYW2+OfLYSWVgF99RTfSwF4DoLZ+ApFFJiAJ1Mt
         nZwQXTHywuXUfqybCOdKlJzKcKENPibUt+5edwXlQq3K+754iw1fjRy1cjXqmVUdSAAh
         8t4iRSs2JOPeCMaLG77+KlTUa77ysey9/4O3jJBaaP40pl9HmuGmJ69IK/oytT6ZXulC
         bg9ygfBlPEjj2owRVXFx83Crwf48TnQao7Ai5XEYtIyJS+M00GdVJI8XjLbcbPgqMIEt
         n/RcuwQlIoZ17G4TcK/DqV4m5fponGpSDepTt0c9c7DeV/yrfqNjF5SFKR0ltoJlNWYE
         uPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009700; x=1777614500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ox8HNk2ehgX4u9MIzrQAUilnp/6GJtQsHeC9tfe3Lv8=;
        b=tES/V8zzf69ZzjtsH2ZbQKX0MjJYieFG1/lOcx0lFsqgPPTjujfoaH4KvHjbYDxlIs
         ToG0GOvD8WfoEKeYgigbv/1TKipc54WYVcAFyHWsxrwIfJNuoU17hWaHjczUpDHukEWr
         UpEQZnH/IDgVb4EhhyB5riv9Av8DA8zAwAiwI6XkEu+GhgctxRrHCIYCMFKCNoB+QdvH
         8Llmhqlb3Hk8hJTpVGKEUacBUZABNahQdg5QkYhzhMwtikMS7OQr2LzTqKJss+qQL82A
         Fr0jpJtKrSZUkVSg+dC32Qjk7FBqSsx6WMCrs4QqI0s23SRfFZGYvtLzHYYBa+c0+E/K
         yfFA==
X-Forwarded-Encrypted: i=1; AFNElJ/1CNanseUKej2RIb7Zi/ga5iml9ZQalr9TRpKlxvnBLqRdvclNPHppJ0XpNpgkbPcmcnXGtnwmkROGOf8P7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2xnus97N8rsa+f4Z3M8Ro9y0U1mXc2+ed4Wb1oJm0fJj+Bppd
	WhIsDH4FZevrfcY/Uxlk9xiqWYcGb+WyhazyOFRfIBL8XGDu+IhyGQE/
X-Gm-Gg: AeBDievVwgCnW4ax8Lsa8il45u57W6uynT2a4Atk9Q3x0MMzYEKTc9qsKqxhTAVmN1/
	++P7gIbeeSHeSkn+x/m7JkB0UyyrAVkK61Wff7bBn/2jw4i65vOgt1aey9qcKihos2mpvvLgVIx
	7KeNmvEf3iUrfastGGPBdOC+I/g8Jk8ex2doPwHa9DYh8oB3NUBduF1bcNrpaNtPa50AV7Gis2t
	8scTsYAYLfKuk14UOGlxr0kXPP+hDqWKtaCgLJt+3V7ylADEDiWqfCl+HfhaaamcrwTwR/+8j5R
	7UaHZ3OMS14OqbOgl6vvDQzOq4ekgpTOJHn8IzvEukCOwC6aDdKZaBey9FrrSjnxfEQrs5Gzryn
	16/ABsik0Y4Caa6/U24cELs1Gy0aEgfSb0Otw96QEHRSLgGuHzSsSvKOolBoueTjnNaVFPXE3NC
	1+5NC/+YR/YgceMgeWVhJTuyH3U3QMLXKW8smEXi7raxF/hBe8E+VhBStsjtBRdv6mTF8ZPCLW8
	rhAALJAU3vx9SU=
X-Received: by 2002:a17:902:d591:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2b5f9e18812mr226513645ad.13.1777009699637;
        Thu, 23 Apr 2026 22:48:19 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:19 -0700 (PDT)
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
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
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
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V13 2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
Date: Fri, 24 Apr 2026 11:17:37 +0530
Message-ID: <20260424054742.45832-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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

Fix this by making the function declaration conditional on both
CONFIG_DEBUG_MUTEXES and CONFIG_DMA_SHARED_BUFFER. When either is
disabled, use a static inline stub instead.

Fixes: 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 include/linux/dma-resv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index c5ab6fd9ebe8..23c8db0b5214 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -311,7 +311,7 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
-#ifdef CONFIG_DEBUG_MUTEXES
+#if IS_ENABLED(CONFIG_DEBUG_MUTEXES) && IS_ENABLED(CONFIG_DMA_SHARED_BUFFER)
 void dma_resv_reset_max_fences(struct dma_resv *obj);
 #else
 static inline void dma_resv_reset_max_fences(struct dma_resv *obj) {}
-- 
2.53.0

