Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558FF1DCB24
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 00:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780965187; cv=none; b=rlBbyF3KdGPS9+V0pvze5xRsKB46W4YlHLaVYnAkGfxxSQY6xR5BJ7BVWrPf+mLL+DQNl9R6Q2cHQ/X6PnoyXxfofRVbBQcEEtWeha5p4zTnhMVfNNj7kcEsC+y/m/o4OSXrvM94zFBdsxYv6sTi9MS4nPNUr1WIvsLl9Bv4k00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780965187; c=relaxed/simple;
	bh=/3G9s6EsR953QarWQ4gV7h6JpniJsvtQoDHD7H7aFZQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QqMbe8L9xO1VJ4tg0uosvZQeKdWN4P9PHfdBVBB38uhxafVzPrYDKIQh98oqVH7ve12szkMHqFDYV0FS4hKHHzjY393EC3E54Wd+X43VrEpNAD8ZWG/ZmHaQ3/JtnkvbHU224A8xBhsOYsqK8D2QufdPkAO1fz4kGpCgrCSrY0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qy15Uqwx; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qy15Uqwx"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-137f3465368so6426901c88.1
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 17:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780965185; x=1781569985; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lyc7dOjOxSnLkSSxtBX+U+kb5dWselTPkf54g63ocWU=;
        b=qy15UqwxYIaVFVlT1Em4cBBsUgqVewLdOwwZV/veb2ZQdrzUIW7p337aekYJvYzLH3
         C6QSfJTP9IZ4wn+81YchcTfeHF+VynsrjqbBD1cyOrfEg6apesa8NAig5HRIY5e4gAaY
         w0HVlZ+ZC+umor/JjSAl0NfHA0s7MBA7+Y2jhPcV83oBGDwa46/tcnxHJrOIPRvo63Wt
         t4yi9P7KQlQGRJR5c1kxFlZL3jfYjZZLPLaYrU7SZda31QkcZQ9Pl5n8Ee9kRsn0cNu9
         t9SRWAwU26lxn/WHiiUThqKnJVXmD306lDo+0XwyVvPyNyfw/8jyHQIijej3IFIfK22E
         9nGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780965185; x=1781569985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lyc7dOjOxSnLkSSxtBX+U+kb5dWselTPkf54g63ocWU=;
        b=BTJa5b/svnbligLJ4JAnPO8pXPYe2k1vOT4/fw6ZZZB9qkIAnsBhHUP/eXHt3KJ4gC
         VsJFdcTttxR3euOi/cT48xgwfGRbJErSLY4eYaXIwQTVUeUFhJyU/2+F4g4z7XA0Wv+/
         TVaInlhLJ2OPfpeBxl6XHkvIypckwsZxIIfE+lMW4VgvBssYgcK3cw2dX4zzV5PSv9Zr
         /w/9LpJ+BGGMrT0agzs1Ty5Sv4s2+Oc/EpKNqlMX2B2FKwyKKn8IHh8q+oywGJpK2s1D
         SniwZRzatUXDV6R7WTN6DhWrmHwqv9bSS/JGWvHYz631D/5xbDH0myeDa1jqyyDR7qej
         zQVw==
X-Forwarded-Encrypted: i=1; AFNElJ8WH50MRULZfwUV1fAG64UF4+eLtfMw221iteS6EgEa+JhWTKTf8eGmfBdv8cMnUeqeeqNNFk3hKTXa4A4Vyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp1d6hD5sfpJnj+Sw+SxnDHPV3dAITXwhL9OrfsKSpV/GxShs7
	XV2va2KiiyKombuN+6OJJ2HRre178emP8k7lXolUWrUX9XeYE4GlsS5+LphAiUW0jFl1hpfur0w
	LMeBJHxxYY5bE/ij000Viay5CtQtYQA==
X-Received: from dlea1-n1.prod.google.com ([2002:a05:701b:4201:10b0:138:62a:280c])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2213:b0:137:ec47:8fef with SMTP id a92af1059eb24-138066a55ecmr4620265c88.14.1780965185131;
 Mon, 08 Jun 2026 17:33:05 -0700 (PDT)
Date: Tue,  9 Jun 2026 00:32:59 +0000
In-Reply-To: <20260609003256.1829625-4-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260609003256.1829625-4-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2174; i=samitolvanen@google.com;
 h=from:subject; bh=/3G9s6EsR953QarWQ4gV7h6JpniJsvtQoDHD7H7aFZQ=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnq8db/190/2uMtcSN4NUdsy5mvxctmHa7sCxU1SAwsy
 dgvckepo5SFQYyLQVZMkaXl6+qtu787pb76XCQBM4eVCWQIAxenAExkUg0jw1Gp5xGLXeoKl7Vt
 M2Fjn/qk2DvqhZpNlpqkfbbzB92Si4wMTVtWXuH9v7jIbsWO+VaaJpNKTxq8vXnU1vLgvLuZa7e 6MwEA
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260609003256.1829625-6-samitolvanen@google.com>
Subject: [PATCH v3 2/2] rust: drm: gpuvm: require Send and Sync for GpuVm's
 shared data
From: Sami Tolvanen <samitolvanen@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Asahi Lina <lina+kernel@asahilina.net>
Cc: Sami Tolvanen <samitolvanen@google.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

GpuVm implements Send and Sync unconditionally, but it shares and drops
T::VmBoData and T::Object across threads: obtain() can return ARefs to
the same bo on several threads, and deferred_cleanup() drops them on
whichever thread calls it. This is unsound unless both are Send + Sync,
so bound both impls accordingly.

Fixes: 82b78182eacf ("rust: drm: add base GPUVM immediate mode abstraction")
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 rust/kernel/drm/gpuvm/mod.rs | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index ae58f6f667c1..398068f2eb4f 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -74,9 +74,25 @@ pub struct GpuVm<T: DriverGpuVm> {
 
 // SAFETY: The GPUVM api does not assume that it is tied to a specific thread. The destructor will
 // drop the `data` field, which is okay because it is guaranteed `Send` by the `DriverGpuVm` trait.
-unsafe impl<T: DriverGpuVm> Send for GpuVm<T> {}
-// SAFETY: The GPUVM api is designed to allow &self methods to be called in parallel.
-unsafe impl<T: DriverGpuVm> Sync for GpuVm<T> {}
+// `obtain()` called from several threads can return `ARef`s to the same bo, aliasing `T::VmBoData`
+// and `T::Object`, and `deferred_cleanup()` can drop them from any thread, so both must be
+// `Send + Sync`.
+unsafe impl<T: DriverGpuVm> Send for GpuVm<T>
+where
+    T::VmBoData: Send + Sync,
+    T::Object: Send + Sync,
+{
+}
+// SAFETY: The GPUVM api is designed to allow &self methods to be called in parallel. `obtain()`
+// called from several threads can return `ARef`s to the same bo, aliasing `T::VmBoData` and
+// `T::Object`, and `deferred_cleanup()` can drop them from any thread, so both must be
+// `Send + Sync`.
+unsafe impl<T: DriverGpuVm> Sync for GpuVm<T>
+where
+    T::VmBoData: Send + Sync,
+    T::Object: Send + Sync,
+{
+}
 
 // SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
 unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVm<T> {
-- 
2.54.0.1099.g489fc7bff1-goog

