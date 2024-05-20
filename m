Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E18C13A415
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716226050; cv=none; b=dFYgrSwfs8ZhPeUthdAtpb9yyKMiMTaWfczVkO86yV4t9Yudn5hjRxGjdDS9giYYfIrO/5LQNieXLzHFVmuZ2/G0qWNDq9kRUYGSmRBbA2cXA2Xd9bLuFhObeoxQ9HqgllbAwpmH7s9vrQbUJqJ+HRjGG2BD2ff03rTQ4lSmEaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716226050; c=relaxed/simple;
	bh=Pf+OOnuHz5mcZsGqaVhIEIMHurAZcjaBobj/NJHA3CI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TTT1d1R674lKiHRqQDY1CBGmunR91aMJpJEwOUBg9wzfoqXhBBou/74jpEEtxFoRNeSOrEfxBt/1fO2Uwk61UFOpXYfU82q7GgL7fpEUB5uMdr/ELGXv8WZhDBG2tFLeUIHp3ZhcP501uARotGaxl6zgbnX30AuhIeXnQO3HtcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ExE5BtHl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ExE5BtHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716226048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1CsnJXGBZcLyYjfrlAMv2FyBTh8bc+Mt3a3EbW5Rnks=;
	b=ExE5BtHleDoyXqrEfK5QsAJTi8PrZ9h/iZ6pR/utbZc6PmifZJ2Qlt7JBpYyxgfqmj7Stm
	IF2WqlnEXK1pVqXPlnfF12WVwPPKayMr+fX3WhvXEzE4Rwng5yfCIlwScpmIF8JQuviO31
	s7V9taxbwrXFMUkl0yHK9ZBHLxpMi9I=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-sOakeINRPiikriTyTkQStg-1; Mon, 20 May 2024 13:27:26 -0400
X-MC-Unique: sOakeINRPiikriTyTkQStg-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2e3208c29abso103894121fa.2
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 10:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716226045; x=1716830845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CsnJXGBZcLyYjfrlAMv2FyBTh8bc+Mt3a3EbW5Rnks=;
        b=K3Nny2y8qpOnP3nDqTP1Oyieo5h2Ovc9ep1I5jxFaeqid6pUKHxeuHDqCrS9fXP5pL
         6v7jeIY24xhv6X1EK8UPzjyAhKsI++6WNGX6h3x2CybUOKxJqRqed8KUJbeDdea4rosL
         wWnTuBrtSoNMKyD/dxCY5dti+PzI7zJEjWInE4pviXYkyGq6maorO2Q3ZxSEzll1gQSI
         O212/o1cAG+s8Rc7bnNx4Om0DuxPXAPNHWJYGFuqsVovrek831UcU/w34RIirH3Bqkuz
         bHrQm5xhiAKiLPXuXUfX3MScqlbOHogm4vQvS4+RXUbwaPxDaTI+VhZVkvRlVPr+Kt6B
         frjQ==
X-Gm-Message-State: AOJu0YwZidtNrBQeDr0hc3PZAqS+TWy2wElVwujQaOVlcHhBxWp1pKKx
	D/J+LzO2hH3TqWTtE9hwZpcgOMCLUwaygqG8Z7YfUxcJr3Fh0URkaOo2R30n3RsmE9sNC+/j6B4
	ZupctP/yQ/4TFsmJE4VNL5TruieJ9iQkQdIWgDXkQ4qWUIRsWimIADsNOCUtrGAsc
X-Received: by 2002:a2e:be9f:0:b0:2e3:ba0e:de12 with SMTP id 38308e7fff4ca-2e51ff5cf48mr319538871fa.22.1716226045285;
        Mon, 20 May 2024 10:27:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbLE5+nNhphlxlGh18a3Zy/HbW451IH7B3zyMvPHBImYdCotrNMydqRvyk8NUf6/7klPUZ8Q==
X-Received: by 2002:a2e:be9f:0:b0:2e3:ba0e:de12 with SMTP id 38308e7fff4ca-2e51ff5cf48mr319538611fa.22.1716226044936;
        Mon, 20 May 2024 10:27:24 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42009eda143sm363816305e9.14.2024.05.20.10.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 10:27:24 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	bhelgaas@google.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	fujita.tomonori@gmail.com,
	lina@asahilina.net,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 08/11] rust: add devres abstraction
Date: Mon, 20 May 2024 19:25:45 +0200
Message-ID: <20240520172554.182094-9-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520172554.182094-1-dakr@redhat.com>
References: <20240520172554.182094-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add a Rust abstraction for the kernel's devres (device resource
management) implementation.

The Devres type acts as a container to manage the lifetime and
accessibility of device bound resources. Therefore it registers a
devres callback and revokes access to the resource on invocation.

Users of the Devres abstraction can simply free the corresponding
resources in their Drop implementation, which is invoked when either the
Devres instance goes out of scope or the devres callback leads to the
resource being revoked, which implies a call to drop_in_place().

Co-developed-by: Philipp Stanner <pstanner@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/helpers.c        |   5 ++
 rust/kernel/devres.rs | 151 ++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs    |   1 +
 3 files changed, 157 insertions(+)
 create mode 100644 rust/kernel/devres.rs

diff --git a/rust/helpers.c b/rust/helpers.c
index 1d3e800140fc..34061eca05a0 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -173,6 +173,11 @@ void rust_helper_rcu_read_unlock(void)
 EXPORT_SYMBOL_GPL(rust_helper_rcu_read_unlock);
 /* end rcu */
 
+int rust_helper_devm_add_action(struct device *dev, void (*action)(void *), void *data)
+{
+	return devm_add_action(dev, action, data);
+}
+
 /*
  * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
  * use it in contexts where Rust expects a `usize` like slice (array) indices.
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
new file mode 100644
index 000000000000..bf7bd304cd9b
--- /dev/null
+++ b/rust/kernel/devres.rs
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Devres abstraction
+//!
+//! [`Devres`] represents an abstraction for the kernel devres (device resource management)
+//! implementation.
+
+use crate::{
+    alloc::Flags,
+    bindings,
+    device::Device,
+    error::{Error, Result},
+    prelude::*,
+    revocable::Revocable,
+    types::ARef,
+};
+
+use core::ffi::c_void;
+use core::ops::Deref;
+
+#[pin_data]
+struct DevresInner<T> {
+    dev: ARef<Device>,
+    #[pin]
+    data: Revocable<T>,
+}
+
+/// This abstraction is meant to be used by subsystems to containerize [`Device`] bound resources to
+/// manage their lifetime.
+///
+/// [`Device`] bound resources should be freed when either the resource goes out of scope or the
+/// [`Device`] is unbound respectively, depending on what happens first.
+///
+/// To achieve that [`Devres`] registers a devres callback on creation, which is called once the
+/// [`Device`] is unbound, revoking access to the encapsulated resource (see also [`Revocable`]).
+///
+/// After the [`Devres`] has been unbound it is not possible to access the encapsulated resource
+/// anymore.
+///
+/// [`Devres`] users should make sure to simply free the corresponding backing resource in `T`'s
+/// [`Drop`] implementation.
+///
+/// # Example
+///
+/// ```
+/// use kernel::devres::Devres;
+///
+/// // See also [`pci::Bar`] for a real example.
+/// struct IoRemap(IoMem);
+///
+/// impl IoRemap {
+///     fn new(usize paddr, usize len) -> Result<Self>{
+///         // assert success
+///         let addr = unsafe { bindings::ioremap(paddr as _); };
+///         let iomem = IoMem::new(addr, len)?;
+///
+///         Ok(IoRemap(iomem))
+///     }
+/// }
+///
+/// impl Drop for IoRemap {
+///     fn drop(&mut self) {
+///         unsafe { bindings::iounmap(self.0.ioptr as _); };
+///     }
+/// }
+///
+/// impl Deref for IoRemap {
+///    type Target = IoMem;
+///
+///    fn deref(&self) -> &Self::Target {
+///        &self.0
+///    }
+/// }
+///
+/// let devres = Devres::new(dev, IoRemap::new(0xBAAAAAAD, 0x4)?, GFP_KERNEL)?;
+///
+/// let res = devres.try_access().ok_or(ENXIO)?;
+/// res.writel(0xBAD);
+/// ```
+///
+pub struct Devres<T> {
+    inner: Pin<Box<DevresInner<T>>>,
+    callback: unsafe extern "C" fn(*mut c_void),
+}
+
+impl<T> DevresInner<T> {
+    fn as_ptr(&self) -> *const DevresInner<T> {
+        self as *const DevresInner<T>
+    }
+
+    fn as_cptr(&self) -> *mut c_void {
+        self.as_ptr() as *mut c_void
+    }
+}
+
+unsafe extern "C" fn devres_callback<T>(inner: *mut c_void) {
+    let inner = inner as *const DevresInner<T>;
+    let inner = unsafe { &*inner };
+
+    inner.data.revoke();
+}
+
+impl<T> Devres<T> {
+    /// Creates a new [`Devres`] instance of the give data.
+    pub fn new(dev: ARef<Device>, data: T, flags: Flags) -> Result<Self> {
+        let callback = devres_callback::<T>;
+
+        let inner = Box::pin_init(
+            pin_init!( DevresInner {
+                dev: dev,
+                data <- Revocable::new(data),
+            }),
+            flags,
+        )?;
+
+        let ret = unsafe {
+            bindings::devm_add_action(inner.dev.as_raw(), Some(callback), inner.as_cptr())
+        };
+
+        if ret != 0 {
+            return Err(Error::from_errno(ret));
+        }
+
+        // We have to store the exact callback function pointer used with
+        // `bindings::devm_add_action` for `bindings::devm_remove_action`. There compiler might put
+        // multiple definitions of `devres_callback<T>` for the same `T` in both the kernel itself
+        // and modules. Hence, we might see different pointer values depending on whether we look
+        // at `devres_callback<T>`'s address from `Devres::new` or `Devres::drop`.
+        Ok(Devres { inner, callback })
+    }
+}
+
+impl<T> Deref for Devres<T> {
+    type Target = Revocable<T>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.inner.data
+    }
+}
+
+impl<T> Drop for Devres<T> {
+    fn drop(&mut self) {
+        unsafe {
+            bindings::devm_remove_action(
+                self.inner.dev.as_raw(),
+                Some(self.callback),
+                self.inner.as_cptr(),
+            )
+        }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index d7d415429517..11645060b444 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -30,6 +30,7 @@
 pub mod alloc;
 mod build_assert;
 pub mod device;
+pub mod devres;
 pub mod driver;
 pub mod error;
 pub mod init;
-- 
2.45.1

