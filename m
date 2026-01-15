Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28911A9FA8
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 02:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768443194; cv=none; b=WJ5OFAxy+ujWHRyj9/e74Ec9G9c0bqBSQblerEjc3lfm+dUSVAIL0RCmKeu1BzKaymJGhvRIAACJB2ssEflddiSRBfLzkgUzJe/64XGUZkQ8DNaJxzidkjMC2K161L+Tl/ibAa9i1uRUvo5tPJnU7MYUpOzTeU/OV20uOmEfqwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768443194; c=relaxed/simple;
	bh=Yv/1w5+ylB+QBA7ZyW21vL8S8B8W5tQUcemxYXbGD6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjlnqFhNwhMpwBSZOEAZvvtx1o5sRtAdG/FQstdSrdKZSK14yy2elkLEM8U7ldtLNK6DTwUP3Vt8qTgc026d6Q+kygC2K8jnXgv8EiRQJfEw1sqrm572lDX4xxYbxWL4UpbfH0bD4tvqrj+A4vhl3oqyNfB6xBOvVv7W9UBRWco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciqIHWZh; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciqIHWZh"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34c3cb504efso224413a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 18:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768443188; x=1769047988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Plx5td881NEoeeeXTfLpuZpsN1LGFqkiV5KA4fJnHU=;
        b=ciqIHWZhnvtrhGl6fmeEUTSMQ3CUE9F0wAs+1hJVvbqy2BUsW1noDVD9COqGGcJOl+
         HCmNES/fV/Bi4x9HBDNCOroJqdkcsIkRxoxQDgKedapBdLD59FzQO0mDdGt0BzuXmfis
         UZQQhUWPILQiynQO1BFYxop3OHXSP3yNmzOXBiBWT1FHqjus9UmvrZt5g/EA54HaPr6a
         6wzFyJ5qp2iUTWkulCGbOAa+yt7I4+rnrFU2HeUMusWRKtkQdDN2acDoXV1fdOm6+oZX
         JbCjeoOotSD59FhjjzEqbZ3nMEuRAfdUO/dZQrLI/CSLv92UO+rISU3cp00B/HM9pUO2
         Z5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768443188; x=1769047988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Plx5td881NEoeeeXTfLpuZpsN1LGFqkiV5KA4fJnHU=;
        b=Qoj0XBfUp9fXM9qbC5CRSyRLbzM3hpA82kDh8eOT5wsxv1bC1dTFnNBbK3MQQ9DDjt
         O15ULHwtgdU/dldP9pPFCxHakSysqnIw7mcbf/Ehf5cEtUgwuBnhxdpZBS4iNg6PQO4o
         6LBCTJf809lV13R/A+2eD2BBOgCi/uLzGKANMSDzYNFWS0ZE2zQZBNtGZznNQOeTJKu1
         UUWRE742YmwQa32Pomdrsz8g/gxdQDyPmtr+4Yy0lr74auMD+NVEwLoIeMMo9dGe6pCe
         k2rQ/L+k37EnR3oFPd4nBi6jcRJrgmSr1hbDR9U0FTUWanVfvylFBPf7nZoOttFW7UGC
         IxQw==
X-Forwarded-Encrypted: i=1; AJvYcCUp7xNcoF6MiCcJkv2HxcyyVUOgoKJeR2zi9ca5boZ0iqXo4/ex2EKON5wt+Nx7TcLpri/K4dJs6bbjhwGRTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxawDn80HTos5r8XDw+jWw47koae/rJF9iPWQafcRmDTe5fhqle
	ICiQxwdm9YzhaJFYqAAcqNBnbxtLtjalSZvhSldwJt9iXGIWs6ev8FeYTsitVw==
X-Gm-Gg: AY/fxX5Bfe+07v99ZVoNkElgkG16r8se0961BOpU+YqV32ItjhS9OIpaUb8bKdyMrOa
	aGMnk+iav94a+ecl0f/gXx85dq9BsguNDCuu2pvZSxfrW/QPTptOszBQ4U08XpsgrRbJ4/D5g3q
	+vrYMV8JafWrqFbBVX4m4v7Ll99ZJPMEwnA2zeOtLlfYtTdYA1vjD9+VcJpeib6k7vBSasACY7q
	fxjfECUvy3QRMHOLVAEwf3CkbgcSpqhJ9D/ppZaVSu9W7EvryWIf0yO202wm052g5T9XVBMNj1q
	IiUhlWxjzgoK3nsDhJxovDaSg7gaETBeSwUtKRzv2HJgC2gv68MkT1sDZbZa8VZQyJyHlC2MaDb
	Fo/htrB4nUs/gl+hiC6eHgkvfFQuHXjzyIJJ7VVlq067Xk55Ry71MEtymFjFXpN/EGcqDcjdnmI
	TSYZZRjBs7a/248FRfv3f4H6vvISR/96zh4YMRcl2bFSpQUD/OEahUvvVBY3k/cg==
X-Received: by 2002:a17:90b:3d50:b0:341:8ac7:39b7 with SMTP id 98e67ed59e1d1-3510913cc0dmr3879613a91.25.1768443187814;
        Wed, 14 Jan 2026 18:13:07 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35106940894sm1868863a91.2.2026.01.14.18.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 18:13:07 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 2/2] rust: sync: atomic: Add AtomicFlag bool wrapper for easier use
Date: Thu, 15 Jan 2026 11:12:30 +0900
Message-ID: <20260115021230.3297420-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115021230.3297420-1-fujita.tomonori@gmail.com>
References: <20260115021230.3297420-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Provide AtomicFlag as a thin wrapper around Atomic<Flag> so users can
work with a simple bool API for load/store/xchg while keeping ordering
controls.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic.rs | 43 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 58f57903460f..720fe2a5fb40 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -637,3 +637,46 @@ fn from(b: bool) -> Self {
         Flag::new(b)
     }
 }
+
+/// A convenience wrapper around [`Atomic<Flag>`] that exposes a [`bool`] API.
+pub struct AtomicFlag(Atomic<Flag>);
+
+impl AtomicFlag {
+    /// Creates a new atomic flag.
+    #[inline(always)]
+    pub const fn new(b: bool) -> Self {
+        AtomicFlag(Atomic::new(Flag::new(b)))
+    }
+
+    /// Loads the value from the atomic flag.
+    #[inline(always)]
+    pub fn load<Ordering: ordering::AcquireOrRelaxed>(&self, o: Ordering) -> bool {
+        self.0.load(o).into()
+    }
+
+    /// Stores a value to the atomic flag.
+    #[inline(always)]
+    pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, b: bool, o: Ordering) {
+        self.0.store(b.into(), o)
+    }
+
+    /// Stores a value to the atomic flag and returns the previous value.
+    #[inline(always)]
+    pub fn xchg<Ordering: ordering::Ordering>(&self, b: bool, o: Ordering) -> bool {
+        self.0.xchg(b.into(), o).into()
+    }
+
+    /// Store a value to the atomic flag if the current value is equal to `old`.
+    #[inline(always)]
+    pub fn cmpxchg<Ordering: ordering::Ordering>(
+        &self,
+        old: bool,
+        new: bool,
+        o: Ordering,
+    ) -> Result<bool, bool> {
+        match self.0.cmpxchg(old.into(), new.into(), o) {
+            Ok(v) => Ok(v.into()),
+            Err(v) => Err(v.into()),
+        }
+    }
+}
-- 
2.43.0

