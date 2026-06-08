Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8603DA5BD
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 15:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931376; cv=none; b=cXzwtpx2uibrQ3ZhZz4nJRsTwFuzTXHzLIiSrLhPdO2S1fZtiA0dTyp6dsN3WNW/Rpo0im7XKLTWdTm5cLK7ZLewxEh1dwD99kuTes47bTNxxI1oynXE2sIENW2Xr/+w87n+HP/9asbFwnMs3S2LbjJPXQgcYrsQJ9kaERjyS3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931376; c=relaxed/simple;
	bh=y42Ay00B2+j5wggV7SYlJuqrvsTXuZL1/72NkndXCOY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=u3xAD/hCH6IUpAeOqPVvdRVe1C7nyPHjQNjXT5+km+vywdzd9VBND0wCI4ggInR8bpsXJP0/mNCwkISeGDwoqpkUm8lQiXNqQ5QciL1tGDkwVpxcG/6l/00ZeJkJL1NQr+NbLaiViUQJSfzd1POSAx+XUF8ZDr6s6+wcxUIw7T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p71z3Oz7; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p71z3Oz7"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-30762d67a64so6245810eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 08:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780931374; x=1781536174; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/tNv8jqkNUUf3JceaHwSaBzHJupOjs95cWpd7WmLwOI=;
        b=p71z3Oz7jNcZ648F5bDHsuvNtUhNw51+J2C7mcpmpZWQtUo/EqGDZ06i0t3bko4I0V
         4yhXpW7q7gNq4ofoJsvdBKc25q1qwn5WcaPCf04jxjsBCtD4H0RbjfblJBApNwd+La0y
         xRvmzHOXVe70g3W5Cl2Cvo2una2M0DjFfHlpC2pXtJmSEwxvjLTm2ohwTe5pF9W0ssBJ
         xV3GG/HI40avkTJhEnQzdHsZRbP0H8wV4O6SnkUVLCvoiMPeCdXY5vVlgOWokgE6Akr6
         VfO+9Gh5ZISqta2Mg49ekoX//0BaaaLRLZvKrHi08yREGMjQJglOqoJME1EfM7E0tVN9
         apsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780931374; x=1781536174;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/tNv8jqkNUUf3JceaHwSaBzHJupOjs95cWpd7WmLwOI=;
        b=kkyCT9ThSCLQtAAxa4WjDf25yekM5I8AFsKciunsAxpK8HEYcdm4qZrXTJJB0IW8NF
         YmgB3g8Jn0S7FkvYQkwCyMSZzo1uzJc5VB71YKuzqcPUzDZALM8cdVa1CXGVYG5a/i1A
         KlDazlb3V9AD+IR4Er3RqDkwg8voxJFwgA5lVKe5DYp7h8hUcYoATsqqj+IRZVp7YHhb
         RJKmudNPflZr4D3pr2kHUh8QaDV3Wo51iVrUycArSEz+J/mkH58N6aG2Xgn8AE1129FO
         ffgjAookEEFZeVxhYj7y4G5iRCfQQtz8ciOUr+tbkOyq87svtLlCUUp+cKGly+6JqHoR
         yPgw==
X-Forwarded-Encrypted: i=1; AFNElJ/JKF90xxtXNoMwphJpRyE3ZKTt0QFLAiadLt/BgNbVzi2C/TjEbLexSjHuSfXKBBZxDKv8Vm09EvQkKk1qkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLWoMRbqiW94T1SdqT/zqVQ26xt6zPTlNSHL1s9kpmBTMrHisD
	bGnHhMfwMNKnZC1XQpozm+xoUBM/KFETjgnIZA1P+9O4xyR2VclMXJ4wiJFajAgnQ1NhmUfu4/X
	kh2W1ljnYAQUvh/WQ4yxHXYEq8xUNAQ==
X-Received: from dybb4.prod.google.com ([2002:a05:693c:6084:b0:2f9:af7:5041])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:5713:b0:304:d788:ac5 with SMTP id 5a478bee46e88-3077b7efba5mr9343499eec.35.1780931373632;
 Mon, 08 Jun 2026 08:09:33 -0700 (PDT)
Date: Mon,  8 Jun 2026 15:09:30 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3142; i=samitolvanen@google.com;
 h=from:subject; bh=y42Ay00B2+j5wggV7SYlJuqrvsTXuZL1/72NkndXCOY=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFlqtzXv71mktXpS/oGui2YS//oVvrzmc2+bpnByW2ZBy
 OutZfyPO0pZGMS4GGTFFFlavq7euvu7U+qrz0USMHNYmUCGMHBxCsBE1uxhZFhw/ZKaoR5Pe07R
 onlRzJNrVk0IVp5x+tmiGo9Oe+HnEq6MDBd9bJs+MFr/z+/uX8w8m1XnuHji9MMfwrs0uFa57p3 VzAMA
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260608150929.1327394-2-samitolvanen@google.com>
Subject: [PATCH v2] rust: drm: gpuvm: implement Send and Sync for GpuVaAlloc
 and GpuVmBo
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

Moving a GpuVaAlloc or GpuVmBo between threads currently forces drivers
to write their own unsafe Send and Sync impls. Provide the markers in
the abstraction instead.

GpuVaAlloc wraps only uninitialised memory and exposes none of it, so it
is unconditionally Send and Sync. GpuVmBo is an atomically refcounted
handle whose accessors hand out the driver data and GEM object by shared
reference and whose deferred put drops them, so its Send and Sync impls
are bounded on T::VmBoData and T::Object.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
Changes in v2:
- Added a missing T::Object: Send + Sync bound pointed out by Sashiko.

---
 rust/kernel/drm/gpuvm/va.rs    |  8 ++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs | 21 +++++++++++++++++++++
 2 files changed, 29 insertions(+)

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
index c064ac63897b..fa183f6306ff 100644
--- a/rust/kernel/drm/gpuvm/vm_bo.rs
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -19,6 +19,27 @@ pub struct GpuVmBo<T: DriverGpuVm> {
     data: T::VmBoData,
 }
 
+// SAFETY: The refcount in `self.inner` is atomic, so `dec_ref`'s deferred put is sound from any
+// thread. `drm_gpuvm_bo_deferred_cleanup` drops `data` and the last GEM-object reference on
+// whichever thread drains the queue, hence the `T::VmBoData: Send` and `T::Object: Send` bounds.
+// [`Self::obj`] hands out `&T::Object` for a shared object, so the move needs `T::Object: Sync`.
+unsafe impl<T: DriverGpuVm> Send for GpuVmBo<T>
+where
+    T::VmBoData: Send,
+    T::Object: Send + Sync,
+{
+}
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

