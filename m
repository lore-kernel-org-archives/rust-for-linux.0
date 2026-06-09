Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD630246783
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 00:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780965186; cv=none; b=Rcv/QwrkCJTR9MQPYOQQXxLC9oYjYhf6NDkZefiA5+s6YLxBlnQBCgwM3j+rGmp+BKC3O2FakKxG9g4ip4fcEOUZWyobDPph8hFa72ZAQFhswBk6qE7bJ+Zh+RRRd1vlfLOW/YjUCohjX1ePFOs/MXUmLrw0ZCuGFDvbv7AweRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780965186; c=relaxed/simple;
	bh=B4OjrrcnDYmB2A/CCa8JFe9KRhC+GkfGzpAW5HRDuY0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B5+eZGCbJhnrtvGsGN1aEpuRn3g69bdgRmGOncuOCcQxszCGQnu67ZUBox3BNg2lyRpvODTr/U6aw5/RduN8oyL7jq45wYWcjlMV/Qqg1H+y2YWOutjRy7DNUGM9XP5z4XXxBOyFf1CQH3Z+ugLo91tmV3wKQlkkfoPGWSo3ZyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EmyzB6Ax; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EmyzB6Ax"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-304e4636205so12200181eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 17:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780965184; x=1781569984; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3NwTNRDsniHBH4tORYSdA8veyCw89xtbdOmrzMR2cyk=;
        b=EmyzB6Ax3MjNMUzYQvsVo41F/jOZR5tDIStl1LjO40ZN7Q0x5Qo31YyDc3BiMs6Tp8
         +7vsmqeeOXwk9yZM4UDscOjyEvQmd7HNlI1907z9tez6fy22OoaI0fEbbsplTFrW3OJf
         n/8R84AsCAPpz7yHOP1HPNXHvy6YVFgbkH+yYOblOgbZ5hu8J0GM20hPfNLGbefuhHkL
         H1UlhBrRsCj2Hmui6WZWDyyzkc54KZ5jory1qHfe7GgUGEVHVkpcvNUKZXNrNSUKuEFw
         8cBGxgJJ9Vr9kSLqOuBUybMSXDpZbns/ZUFvNg3BghWcTrMXXp1tbjoY/snZMfZ0k/53
         r+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780965184; x=1781569984;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3NwTNRDsniHBH4tORYSdA8veyCw89xtbdOmrzMR2cyk=;
        b=ApHhKchxdwz5LfPnz2crJlDTPyOokg+UeLq8TQDQL8PHH9wno9pkeozMYsMebDWdQy
         G/fL0UU8/DqVoC8KrlL0OaHt4BUMbWeN4ablB/yTUSpEpm7xluc0Y4N4Gf9oX/KxacwB
         O2Hh2i2UZm+jPYvhE0EWivcauhsb4yJWeCbqjlBmcsXwu/9fP+K1SlYydhu117cIRnfI
         K44jjVoEs1sxxyMApXorQn6Cih9KcnypyzRcKyzr0viAvpemoaKGNN30ej/9rL1my/cK
         L61BQS/rZxAqwFzqqDHHfvjLRcDpZIcatXKnTtFpSJvppgktJAoLfN0SFEoq//m6y/l3
         gkwA==
X-Forwarded-Encrypted: i=1; AFNElJ8Wkkd9pLCS9DQXpfcnCiDrC6NAGlVasa21ewdOxuez8P52o/0KXDIO2D96zQvPrviJ31kcxxQdXkErxIZRaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6XO+QymbvNpvh7/oOd8mgyuiQxODdjBoUVBRhs3bKNvD1C/w8
	sbShrcNUNIhyU7jZ2JA/GVxAtD0DCZVi/Ba1XMTORAXfwUAdJDMUEGF7NUXzbzznjDn1vf+o+Rg
	rGS54DPBHqk//WVYtQ2H91afQxQUxcg==
X-Received: from dyrv26.prod.google.com ([2002:a05:7300:8a9a:b0:304:dc2f:9939])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:2d82:b0:304:e865:f7d1 with SMTP id 5a478bee46e88-3077b2641bcmr8410594eec.25.1780965183480;
 Mon, 08 Jun 2026 17:33:03 -0700 (PDT)
Date: Tue,  9 Jun 2026 00:32:58 +0000
In-Reply-To: <20260609003256.1829625-4-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260609003256.1829625-4-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3070; i=samitolvanen@google.com;
 h=from:subject; bh=B4OjrrcnDYmB2A/CCa8JFe9KRhC+GkfGzpAW5HRDuY0=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnq8VbXBNmSevwPL7FX+BrxRIplLee0NUUzXjBu9zr3X
 0SJb2lcRykLgxgXg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZjIinaGv0JCKu/uyHQnHTp9
 zVGbc1ryN+2M2XpHljBrLOp+85VLzo2RYfGxh1F3t9zZduenT8nEyXvOZuoGPwsXsZ1Z07llYeB +VkYA
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260609003256.1829625-5-samitolvanen@google.com>
Subject: [PATCH v3 1/2] rust: drm: gpuvm: implement Send and Sync for
 GpuVaAlloc and GpuVmBo
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
 rust/kernel/drm/gpuvm/va.rs    |  8 ++++++++
 rust/kernel/drm/gpuvm/vm_bo.rs | 22 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)

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
index c064ac63897b..c5e3bb44a2ee 100644
--- a/rust/kernel/drm/gpuvm/vm_bo.rs
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -19,6 +19,28 @@ pub struct GpuVmBo<T: DriverGpuVm> {
     data: T::VmBoData,
 }
 
+// SAFETY: It is safe to send a `GpuVmBo<T>` to another thread when `T::VmBoData` and `T::Object`
+// are `Sync` because `data()` and `obj()` share `&T::VmBoData` and `&T::Object`; they must also be
+// `Send` because the last reference drop runs their destructors on whichever thread drains the
+// deferred-cleanup queue.
+unsafe impl<T: DriverGpuVm> Send for GpuVmBo<T>
+where
+    T::VmBoData: Send + Sync,
+    T::Object: Send + Sync,
+{
+}
+
+// SAFETY: It is safe to send `&GpuVmBo<T>` to another thread when `T::VmBoData` and `T::Object` are
+// `Sync` because `data()` and `obj()` share `&T::VmBoData` and `&T::Object`; they must also be
+// `Send` because any thread with a `&GpuVmBo<T>` can clone it via `ARef::from`, whose last drop
+// runs their destructors on whichever thread drains the deferred-cleanup queue.
+unsafe impl<T: DriverGpuVm> Sync for GpuVmBo<T>
+where
+    T::VmBoData: Send + Sync,
+    T::Object: Send + Sync,
+{
+}
+
 // SAFETY: By type invariants, the allocation is managed by the refcount in `self.inner`.
 unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVmBo<T> {
     fn inc_ref(&self) {
-- 
2.54.0.1099.g489fc7bff1-goog

