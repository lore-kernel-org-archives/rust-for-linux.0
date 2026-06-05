Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61CB32B99E
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 22:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698324; cv=none; b=UEl9fP5AHpBkZaXHNmaK/idrhUtx1c0kcH4Sz5CPfZ+t6w8PaaqPhqq4dTY554XKyuvobzDwr/JQ1uO0fZGb0+s9/utF4i7XjFgUibGStC2BcuoMYGpENfNJxW38l6sIuRXI1lhdb1dhObBM27f7VUwnnfkpW2T89RbRXFvvqLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698324; c=relaxed/simple;
	bh=juvCzx+9b+PGWwUmEGsN7DzOR8HGiGuIxADYptuBz70=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bTvmnIpreRAavKDeTVDN2BJrpRDIwqIvr7lOp2MnEts8HOqxwCPGJO0ttxOcbUfRTU64Sbx9YT8L4Sv8z/8YcOVVuge5qLvMisCqsY1D6KSzjOdh0ZrUZ9tikKE115JlYv4KvywkCpQkPnsyEO38qpnOAlOAJknpJRwGElSbRHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dknYRUvA; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dknYRUvA"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-30762d67a64so3515238eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 15:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780698322; x=1781303122; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hDhseaqiPSLPqHYwXpS4zasRBSNprmSrggrhgGRfur0=;
        b=dknYRUvAmiokmwYug8IpxC8V2sNme75dZnmTtBElC9djIJc2wIGsag/lIiE76jw37E
         Nt5aQXMSrh7GBZyP9vh7Ou25+UZ893pZeymJT1xg32zu7HN8QHdMat6LZviHwfGrcM8j
         YwehkAnTPU29grgm2qYRWYiZ5p+AGuFFHW8GzMpwBPtbI6Cs0VF8iGtT1RSwwGxbpjQp
         OAe8GlfibaLyDP8rP6ZBLw0K7pZjOVYXPc6/XjbJTjdHQw21eFATMaIQIkdTdueKP+NY
         VBiGg7YedkKVzaI9BYZ9j7W1VYIYo8yLsX7f96owbQBXGdCN1nb2wMyNf5sYalR78iZr
         WI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698322; x=1781303122;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDhseaqiPSLPqHYwXpS4zasRBSNprmSrggrhgGRfur0=;
        b=fGCd7oTtT4xj8lHDWexA98VOxHOkz0qT8O0IAYWclLSt2OKtTpVN8mpF/C7cyu3N1v
         zwVzP8M6iO1Klbgg/xJY72+6aFQl4GdYxV4kvms/wN54dukU0WKH96KM1MxCdQTQb08U
         yIi/ygT+YTuV/mNHpTtUZWbg9eQCUteYbnqXVSyPxQ4OQHc9CR6Mahq9HkrxPlz0yrdG
         9SCKmselRZQcJDADMwC8S8CKfZb0XtzXUUHMbEQrBIQmU+Mqr/5su60BVkzixKELzje2
         MWj/ZDd6FOc9mZZZEP2oFkFmQpq43g9goHeXQj/E7L1mY/gZXZdSw1+4eP0cuAxwVkpv
         u40Q==
X-Forwarded-Encrypted: i=1; AFNElJ8usF+QHhhBgk/l00xUm1Qld2Kmk0WRBcQgfwCxHx9FasNWdtroPCUurBI2cIRbqVoNUWTnYTxNmHYgfzImuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIf1LzylspHk2GI9VQCL2DU47aC6BtjZb14G3O3pTV1LpDMU0V
	JnnfhOJlyjEeLZzDdTUGWmk0SAuJE/vPTd6SmBXY68WTlQa4oZnnSf/SY0nL7i9/ln+JhCdE5r/
	EDFmeOMz5Iu82RqzvoB1G16p3QSCYQA==
X-Received: from dld33.prod.google.com ([2002:a05:7022:321:b0:138:50e:5095])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:204:b0:137:edc4:a5e6 with SMTP id a92af1059eb24-138066fa2ddmr2765989c88.29.1780698321542;
 Fri, 05 Jun 2026 15:25:21 -0700 (PDT)
Date: Fri,  5 Jun 2026 22:25:16 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2979; i=samitolvanen@google.com;
 h=from:subject; bh=juvCzx+9b+PGWwUmEGsN7DzOR8HGiGuIxADYptuBz70=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnKPmecKlLkM7SP6/yoqTW79djb0/zolau+05P0V4Uc+
 /TmxpX3HaUsDGJcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAiX2MYGU4JWCy8o7mz7Ow7
 +/wN4ZNnC/RsLTtzQUNP8u+jT4WJsq8ZGa7MKfR7PdPj7MJfcubTJX93rmrZM21b3+QbmsduPVq X1s4FAA==
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260605222516.3138740-2-samitolvanen@google.com>
Subject: [PATCH] rust: drm: gpuvm: implement Send and Sync for GpuVaAlloc and GpuVmBo
From: Sami Tolvanen <samitolvanen@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: Sami Tolvanen <samitolvanen@google.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A GpuVaAlloc holds only uninitialised memory with no live VaData and
hands out no reference to its contents, so it is Send and Sync
unconditionally. A GpuVmBo is refcounted atomically and its deferred put
is sound from any thread.

Implement the markers in the abstraction so drivers can move these
objects between threads without an unsafe impl of their own. Send for
GpuVmBo requires VmBoData: Send because the data is dropped during
deferred cleanup, on whichever thread drains the queue. Sync requires
both VmBoData: Sync and Object: Sync because the &self data() and obj()
accessors hand out &VmBoData and &Object.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 rust/kernel/drm/gpuvm/va.rs    |  8 ++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs | 15 +++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/rust/kernel/drm/gpuvm/va.rs b/rust/kernel/drm/gpuvm/va.rs
index 0b09fe44ab39..dcb2dec4fbdf 100644
--- a/rust/kernel/drm/gpuvm/va.rs
+++ b/rust/kernel/drm/gpuvm/va.rs
@@ -104,6 +104,14 @@ pub fn vm_bo(&self) -> &GpuVmBo<T> {
 /// The memory is zeroed.
 pub struct GpuVaAlloc<T: DriverGpuVm>(KBox<MaybeUninit<GpuVa<T>>>);
 
+// SAFETY: A [`GpuVaAlloc`] is an owned, uninitialised allocation with no live `T::VaData` and no
+// thread-bound state.
+unsafe impl<T: DriverGpuVm> Send for GpuVaAlloc<T> {}
+
+// SAFETY: A [`GpuVaAlloc`] has no `&self` method that reaches its contents, so a shared
+// `&GpuVaAlloc` cannot access the allocation.
+unsafe impl<T: DriverGpuVm> Sync for GpuVaAlloc<T> {}
+
 impl<T: DriverGpuVm> GpuVaAlloc<T> {
     /// Pre-allocate a [`GpuVa`] object.
     pub fn new(flags: AllocFlags) -> Result<GpuVaAlloc<T>, AllocError> {
diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs b/rust/kernel/drm/gpuvm/vm_bo.rs
index c064ac63897b..016b10e3305b 100644
--- a/rust/kernel/drm/gpuvm/vm_bo.rs
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -19,6 +19,21 @@ pub struct GpuVmBo<T: DriverGpuVm> {
     data: T::VmBoData,
 }
 
+// SAFETY: The refcount in `self.inner` is atomic, so `dec_ref`'s deferred put is sound from any
+// thread. `data` is dropped later by `drm_gpuvm_bo_deferred_cleanup`, on whichever thread drains
+// the queue, hence the `T::VmBoData: Send` bound.
+unsafe impl<T: DriverGpuVm> Send for GpuVmBo<T> where T::VmBoData: Send {}
+
+// SAFETY: The fields of `inner` read by shared-reference methods are immutable after construction.
+// [`Self::data`] hands out `&T::VmBoData` and [`Self::obj`] hands out `&T::Object`, so sharing
+// `&Self` across threads requires both to be `Sync`.
+unsafe impl<T: DriverGpuVm> Sync for GpuVmBo<T>
+where
+    T::VmBoData: Sync,
+    T::Object: Sync,
+{
+}
+
 // SAFETY: By type invariants, the allocation is managed by the refcount in `self.inner`.
 unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVmBo<T> {
     fn inc_ref(&self) {

base-commit: fea3a2dd7d3fc1936211ced5f84420e610435730
-- 
2.54.0.1032.g2f8565e1d1-goog

