Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6504435DA76
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 22:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216271; cv=none; b=ka/qAoMxEL2XmP6eNRDN8t++yw7sOm9rc+3U9HhnzvSNikJD+Sha0I24sPRD71xneYscj5FtvZPkm6L4wzVLkWzkVFDjOZzHsRQNapHbEsaEKrGPsA83QXU89iRGlxTH/xdultUKum/BVvV24h7lvsCmVEYoExkxA+H515e/NrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216271; c=relaxed/simple;
	bh=GXST9+qaLqvKuvrCkRKeBSa0wUCsepCT9+RExmFeJvc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VcBqydl+h3jJSRlvH/XIV6XOp4jHjmRj9MXA2ABdiPQlrQQhYY3VaOcC72X1gxWVA9juHLOZlvJGgDNDwMeWln4zTkwq1DwY8E5ytN1Bb4k+MLN+9wtNUUyHgYN7AeIkccorbVSQ5UMPPQ324LfR9Dg/CqYQlNsNh+t9uij+wes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RuN9tJoQ; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RuN9tJoQ"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-304e7fc90b1so446772eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 15:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781216269; x=1781821069; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QhNQ1we6NOoqH0cCFXtN3A1WKb9ns/XyXQCVsvCLAxo=;
        b=RuN9tJoQI82hcuhpy2jGnfnocECfHHyB3tdesHPBmjSWdxnE01lGsh4gYrheJNpaRs
         mVo/WteW6oPjXRL0blRAF6FGUw3prU/ntlexfH4LTuQbXCrVAZ9VLxUzpf4e32mlJw1F
         x+gHNxqGrUykAZRI2FpEOTSE/TS1YVqBG2K8nSIXlxgsFYr32zyATXD57pimW9+CNBHM
         e8yjWEz/FU2vvsjojDdvMXS/IvjBdv40iHjaeNKjd5e7t937mb3ziHjKVTQ8g+RKjyDh
         iX16JL28puiEtaqJc6lgO7JrAxCaUOEVBkqCcFpII4vAG4z7kwbCthteocxwYHf/MLT/
         EVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781216269; x=1781821069;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhNQ1we6NOoqH0cCFXtN3A1WKb9ns/XyXQCVsvCLAxo=;
        b=Hba0VnKRLP7+40/HeTfBj+78b3DOvCMNXPNeZ4MZckJGMqa3rGYEu8pqYJYYSNa+x9
         O66iWyZi2RaRM1lLpwmNPCEQkbAnVAl7coAQMI+zVmFouq+K0bhZ0v9QSsIwmtgoYqbZ
         rpEXKmkFzaJLBFQ4qH/HVZRpMqVe9NcHu4qOAC3s7ptkKd2tlgW6oqw3L5TGHvRjhE5w
         ATtOa0bSarbUthabqK9SQxoVFijTCnB/zEpmHB2GQFHdv1fS9mW4xE0t9a8QK+IH1y10
         YsTBHwmU47jZff9u0lFTktR4IMajWeHR+uKlVXZyuLzWu6Wpz0Kt4bN4r8/xN5b4BnSp
         DEGA==
X-Forwarded-Encrypted: i=1; AFNElJ/UiO1jqxglrVcHYNobcdbJnqsOJALN3z09ArfN/mtismYFadZp/J7v3q900Uo6spKNXE01YChmStEU7c2MXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmk13vmaTUH2K+G4OaVMmF2fvRdqZlJhyHZFoMtPL3DEn6lDb0
	OHoD1VzhuheBvgWiSgQNOTannKXnF4wIMVPhbbc0CV8dA18PVND51EzCvICjgfYRuVmMfztp+MK
	DwDjMPtVSp/iWo6jD4/Q1lBJhVTMPcw==
X-Received: from dybbs28.prod.google.com ([2002:a05:7300:a21c:b0:307:bbdd:4346])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:3d19:b0:304:c651:bdea with SMTP id 5a478bee46e88-308200897c1mr113782eec.21.1781216268962;
 Thu, 11 Jun 2026 15:17:48 -0700 (PDT)
Date: Thu, 11 Jun 2026 22:17:21 +0000
In-Reply-To: <20260611-gpuvm-sync-send-v4-0-6c7f4ab2778a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260611-gpuvm-sync-send-v4-0-6c7f4ab2778a@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3599; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=GXST9+qaLqvKuvrCkRKeBSa0wUCsepCT9+RExmFeJvc=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnaxl+EFM+4Hze3WWenn2Py2/Dqfr6pJyJdjIyML/R1b
 /x5WH9NRykLgxgXg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZgI+zFGhollz66/XhV/yq1O
 Y7lrpZDWBq25y9qs/iWyR0498/TWIh9GhqeL9JKtPv+8s19ofYX3i58i7ne5TW+eOHC4UmTOik4 xGQ4A
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260611-gpuvm-sync-send-v4-1-6c7f4ab2778a@google.com>
Subject: [PATCH v4 1/2] rust: drm: gpuvm: require Send + Sync for the driver's
 associated data
From: Sami Tolvanen <samitolvanen@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Asahi Lina <lina+kernel@asahilina.net>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, Sami Tolvanen <samitolvanen@google.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

DriverGpuVm permitted !Send/!Sync associated data on an abstraction whose
handles are shared and dropped across threads: obtain() runs from many
threads and the VA API performs deferred cross-thread drops. That is
unsound.

Require Send + Sync on the trait and its associated data so the GpuVm and
UniqueRefGpuVm handle impls need no per-impl bounds.

Fixes: 82b78182eacf ("rust: drm: add base GPUVM immediate mode abstraction")
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 rust/kernel/drm/gpuvm/mod.rs | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index a625fcd9b5f2..70cf11346cee 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -72,10 +72,12 @@ pub struct GpuVm<T: DriverGpuVm> {
     data: UnsafeCell<T>,
 }
 
-// SAFETY: The GPUVM api does not assume that it is tied to a specific thread. The destructor will
-// drop the `data` field, which is okay because it is guaranteed `Send` by the `DriverGpuVm` trait.
+// SAFETY: It is safe to send a `GpuVm<T>` to another thread: all data reachable through it
+// (`T`, `T::VmBoData`, and the GEM `T::Object`) is `Send` by the `DriverGpuVm` bounds.
 unsafe impl<T: DriverGpuVm> Send for GpuVm<T> {}
-// SAFETY: The GPUVM api is designed to allow &self methods to be called in parallel.
+// SAFETY: It is safe to share a `&GpuVm<T>` between threads: `&self` methods only alias data
+// that is `Sync` by the `DriverGpuVm` bounds, and any thread may drop that data, or upgrade the
+// reference and ultimately drop `T`, which the same bounds make `Send`.
 unsafe impl<T: DriverGpuVm> Sync for GpuVm<T> {}
 
 // SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
@@ -250,18 +252,22 @@ fn raw_resv(&self) -> *mut bindings::dma_resv {
 }
 
 /// The manager for a GPUVM.
-pub trait DriverGpuVm: Sized + Send {
+pub trait DriverGpuVm: Sized + Send + Sync {
     /// Parent `Driver` for this object.
     type Driver: drm::Driver;
 
     /// The kind of GEM object stored in this GPUVM.
-    type Object: drm::driver::AllocImpl<Driver = Self::Driver>;
+    type Object: drm::driver::AllocImpl<Driver = Self::Driver> + Send + Sync;
 
     /// Data stored with each [`struct drm_gpuva`](struct@GpuVa).
-    type VaData;
+    ///
+    /// Only `Send` is required: the data has a single owner at all times, moving
+    /// between threads by value (handed back as a [`GpuVaRemoved`]) but never
+    /// accessed by two threads concurrently.
+    type VaData: Send;
 
     /// Data stored with each [`struct drm_gpuvm_bo`](struct@GpuVmBo).
-    type VmBoData;
+    type VmBoData: Send + Sync;
 
     /// The private data passed to callbacks.
     type SmContext<'ctx>;
@@ -296,12 +302,10 @@ fn sm_step_remap<'op, 'ctx>(
 /// # Invariants
 ///
 /// Each `GpuVm` instance has at most one `UniqueRefGpuVm` reference.
+// `Send`/`Sync` derive from `ARef<GpuVm<T>>`; the trait bounds make them correct for the unique
+// handle's `&mut T` access.
 pub struct UniqueRefGpuVm<T: DriverGpuVm>(ARef<GpuVm<T>>);
 
-// SAFETY: The GPUVM api is designed to allow &self methods to be called in parallel, and
-// concurrent access to `data` is safe due to the `T: Sync` requirement.
-unsafe impl<T: DriverGpuVm + Sync> Sync for UniqueRefGpuVm<T> {}
-
 impl<T: DriverGpuVm> UniqueRefGpuVm<T> {
     /// Access the data owned by this `UniqueRefGpuVm` immutably.
     #[inline]

-- 
2.54.0.1136.gdb2ca164c4-goog
