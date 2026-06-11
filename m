Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBD8380FD4
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 22:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216273; cv=none; b=B1xIExZtufv7CXBmoTJ9aLTNkBH3+rsFboZhlp3xyjRYUgJHAbVkfiRh08oT9BN+3Z/g8kDwk4Fdmf75K+zQnBDRAN0UDImZ3tz29zrzYlhJEBz+DCNBT83AwecG5aDW53s5zu3vdXIDd6ZxzKUa+vK8763KZgavDjd1vAvutEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216273; c=relaxed/simple;
	bh=aIlZgMUNKNufC7lHnIBNKRRC1i9doObz8JqJqJCXUFM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uFZSH6vS7RKH8hz+cZl3nVxoXrAXHFa6br1/Gg5Y+3rNUtBsuD/O5mNzn5MJRS7Jp6Lvm8ikWbC6dQtwhAbdnlYcffEWy3mAU7IvchFsDKui0v9NccywJz9jV8B92l3mHj00tROiLpLXYNE3aW6MUgGv/1c9+1Neox77D4kyRhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wnm6YNqn; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wnm6YNqn"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-138404c4b85so48245c88.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 15:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781216271; x=1781821071; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qbvuNTpE/5/jucgEEn1bO0TMcbBFU2GHmZcATaLZr0I=;
        b=Wnm6YNqnXNpKcIcRy2c0VQHAjUkCIqpR1J2VxSdMzrKnZa4Mg30aCJgcOcaCxr2TT0
         jnw8gf/QjTl5+xpq1zRQZqmuh5jaEGANGEhmuA7sku2MZVcA7TLdvVwjdly69nHYtgne
         xAx/3PrVOov3nm463bK5xeT2BLU7jShOr7dRoCoRQ1lNvkxiEH+WcYAgcJueo2MGxAUa
         CvalH2Fo6IKZ01/5/5jl0S5Q4QV1oVE/SSJccw0Wq8Lw/Xx3PvAl7Q36gxP7e40yaFRd
         GxRs60Rm22zh/dstiRGHtm0O4jkNyq46Alcq4hGYy31OwGWy30JSAfeh/Z7pk0WtwMlf
         oPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781216271; x=1781821071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbvuNTpE/5/jucgEEn1bO0TMcbBFU2GHmZcATaLZr0I=;
        b=cB2TKX0wsYkoAWMUFmP23KKZaU7zcHDEsOfhZycm9nQzT10eq+CrFeb2sxbuFeoiVK
         c2hGkM1IiBNRF+9CAAyDRwUQz7d2jpv+eyzx2aaelrWqlWOmOXFjA7BJfm+WqNMTiFyV
         8M6oSnfn6hwEDBRR8+pCeLdzSwmQyOAo8Aziu/LZ9ZJaarmJKg/gvcaz8ri56M44tLgn
         z63lFThok44gqfZxEXdUXHzhO6FXVLq8zZX5QgAvWHJlfk+HejtX9J7WGp3B6BWzOH2E
         dUg4F1Sz6bq6wcxwczSBRlsm9W/cUclRKrtVgrwJBv42hqLV+MRlEVg5JvjLVKZf0fj9
         4pXA==
X-Forwarded-Encrypted: i=1; AFNElJ+nF1UwrtwCQ/ZDqvErRvdZElxW1RGfH+Uv59GWxdZBjlDhD5/i57sSsFCPi9CAJsN33YVqLxO1AMCGGsnb8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhHFOUPls7WtmThfnsjPEOtSpGRVA8Ji/2Pk+FLWe4e1cO+UEB
	1/cEkIdfiHBeQKLkd1a48mK0ThV/FwSqnJl7lcHfwIwTc933L8xfuSXOfKrD4i3VVv3dBhhrs8Q
	cbzXj034Zz+JDIFab6RVBYhZ4x36UhA==
X-Received: from dlbrh10.prod.google.com ([2002:a05:7022:f30a:b0:137:f748:fdbf])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7023:b86:b0:136:b67e:93e6 with SMTP id a92af1059eb24-1384bbae290mr82798c88.37.1781216270647;
 Thu, 11 Jun 2026 15:17:50 -0700 (PDT)
Date: Thu, 11 Jun 2026 22:17:22 +0000
In-Reply-To: <20260611-gpuvm-sync-send-v4-0-6c7f4ab2778a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260611-gpuvm-sync-send-v4-0-6c7f4ab2778a@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2570; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=aIlZgMUNKNufC7lHnIBNKRRC1i9doObz8JqJqJCXUFM=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnaxl93/9u237n8FQfTprXa9wpn6mo8mpt7svblCRW+/
 OI22YjdHaUsDGJcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAid44zMjySvLxORzDi6A62
 7Eu2HMY71h2b+pzntl2vyI3nDRc3/JvPyNA4LThjyyG5m6ttN6b869104bJV3dcLU63W3J5vdOj grQ88AA==
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260611-gpuvm-sync-send-v4-2-6c7f4ab2778a@google.com>
Subject: [PATCH v4 2/2] rust: drm: gpuvm: implement Send and Sync for
 GpuVaAlloc and GpuVmBo
From: Sami Tolvanen <samitolvanen@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, Sami Tolvanen <samitolvanen@google.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Moving a GpuVaAlloc or GpuVmBo between threads currently forces drivers
to write their own unsafe Send and Sync impls. Provide the markers in
the abstraction instead.

GpuVaAlloc wraps only uninitialised memory and exposes none of it.
GpuVmBo hands out the driver data and GEM object by shared reference and
drops them in its deferred put; the DriverGpuVm trait already guarantees
both are Send + Sync, so both impls are unconditional.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 rust/kernel/drm/gpuvm/va.rs    | 8 ++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/rust/kernel/drm/gpuvm/va.rs b/rust/kernel/drm/gpuvm/va.rs
index 0b09fe44ab39..b108ec7aa1bc 100644
--- a/rust/kernel/drm/gpuvm/va.rs
+++ b/rust/kernel/drm/gpuvm/va.rs
@@ -104,6 +104,14 @@ pub fn vm_bo(&self) -> &GpuVmBo<T> {
 /// The memory is zeroed.
 pub struct GpuVaAlloc<T: DriverGpuVm>(KBox<MaybeUninit<GpuVa<T>>>);
 
+// SAFETY: A `GpuVaAlloc` is an owned, uninitialised allocation with no live `T::VaData` and no
+// thread-bound state.
+unsafe impl<T: DriverGpuVm> Send for GpuVaAlloc<T> {}
+
+// SAFETY: A `GpuVaAlloc` has no `&self` method that reaches its contents, so a shared
+// `&GpuVaAlloc` cannot access the allocation.
+unsafe impl<T: DriverGpuVm> Sync for GpuVaAlloc<T> {}
+
 impl<T: DriverGpuVm> GpuVaAlloc<T> {
     /// Pre-allocate a [`GpuVa`] object.
     pub fn new(flags: AllocFlags) -> Result<GpuVaAlloc<T>, AllocError> {
diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs b/rust/kernel/drm/gpuvm/vm_bo.rs
index c064ac63897b..a30f838c11b8 100644
--- a/rust/kernel/drm/gpuvm/vm_bo.rs
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -19,6 +19,15 @@ pub struct GpuVmBo<T: DriverGpuVm> {
     data: T::VmBoData,
 }
 
+// SAFETY: It is safe to send a `GpuVmBo<T>` to another thread: dropping it there drops
+// `T::VmBoData` and the GEM `T::Object`, both `Send` by the `DriverGpuVm` bounds.
+unsafe impl<T: DriverGpuVm> Send for GpuVmBo<T> {}
+
+// SAFETY: It is safe to share a `&GpuVmBo<T>` between threads: it effectively shares
+// `&T::VmBoData` and the GEM `&T::Object` (both `Sync`), and any thread may upgrade to an
+// `ARef` and ultimately drop them (both `Send`), per the `DriverGpuVm` bounds.
+unsafe impl<T: DriverGpuVm> Sync for GpuVmBo<T> {}
+
 // SAFETY: By type invariants, the allocation is managed by the refcount in `self.inner`.
 unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVmBo<T> {
     fn inc_ref(&self) {

-- 
2.54.0.1136.gdb2ca164c4-goog
