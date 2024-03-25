Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B5D3EA95
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 17:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388987; cv=none; b=MoN1foNAde+8lrpHoKpR5czI67o+gW/MbBGu8yvFO8ULPC7kznTkd6gMBhn9udmjRTIG1662G+cipuNV30TrpwCAVgULUzCU3r3LBKk39VWrDt5iFLcL+Hu6B7T/7kPu+bAlSeHIPPxe8sIjNecdmhCqKWTCosQL23W4A961kb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388987; c=relaxed/simple;
	bh=wNoFpHcJ9xnFT//7j52Ngde3+PZ/Vk8AV9IcXNQKfsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXHTMXRvTsaRlbVFj02iIeVgghHBbN63++OrC3H6EL3wnMylPTnf7EGZPSkq4h/esSdYsfV85gAd6AgwnFtl2InyX0exx9M6Lal1ODGAJvCenGdnf2526i94fWCRO3fhrvx4gJPlQrboRBvPXW9HPdYXYMH/fTtcH3D+zmUDASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YvVCe6wg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YvVCe6wg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711388984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZ5iOLMHj1OGs3ods3llUt9j8yU58nEfTZVhefaAA6M=;
	b=YvVCe6wgyj022Sh6b46ysS3HsAA3o8/5wqDVeizPqTWtYpHy2kc7BBIHVXU0qLmN4m9+uQ
	P/wxvS3x7fSn7Y5e1DlCi/krZwgyG1F1OUix8OkWUeoWR4xFjUwGvOKuj1E0qDKO8W8tja
	lY+vKxDaMaqVTTfsBvmw/vekDxnlFIc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-0-HzRX9QMESt3Pnf17DhVA-1; Mon, 25 Mar 2024 13:49:43 -0400
X-MC-Unique: 0-HzRX9QMESt3Pnf17DhVA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-34172041676so2591561f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711388982; x=1711993782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZ5iOLMHj1OGs3ods3llUt9j8yU58nEfTZVhefaAA6M=;
        b=e8vN93D7Chee1fBOihhS9t8yL/a+Cd2gT8NlKGNr+VlPATJBhJ0ZiRwWMNDZhKYBKu
         QL7PJzDcp55jMxzsNBgDsbwQoqihEcSF2lHwL1L2WHbhr+TKTy8Qr1xngdKjFYvTpyBN
         ZD6+1ceqZHHqPtcdIOQFxOjm6GGCTPhVjSmAXPyROlwA7lwVZ9qjdg8ISZ4Z0yTHsoU5
         FbmT625SJcmwi3oRadI73nKboQJD9YRzb8ogvjz8jiNVhlmgsKtOyF/Haj473ec8zTZO
         GdGvKc6IYeVWUyp2AHvs14kBxJ6nmQcpL3Y6GDNhFeVtMz7tbsmiMnglI+nTa3JUPHc0
         E0hQ==
X-Gm-Message-State: AOJu0Yw7celAK9wWbd62+AZy+l6yKOdlaEOBf3SyU3i4jvgipI1Zq/5G
	e1owqpfX50kAUZWDgc6dYUdkSc0vtyuzo8fIvA768A6phw6gw5wTVyfOO1CB0vCVbZDgqm2s4ZG
	ZA3A1MdsYPL0U4G6wqezJHpk8O99ViDymsGjG3K1Ur8Xyjb8cSkRjtI1Ducl64wA3
X-Received: by 2002:a05:6000:174a:b0:341:c53b:edb4 with SMTP id m10-20020a056000174a00b00341c53bedb4mr5492156wrf.8.1711388982070;
        Mon, 25 Mar 2024 10:49:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0Id+Gg3MzVkfYhmlbua0v/VKlbDPTL4r9ESydakIMHCmwfrVT37bwucg3OVN9lflIyiPyqg==
X-Received: by 2002:a05:6000:174a:b0:341:c53b:edb4 with SMTP id m10-20020a056000174a00b00341c53bedb4mr5492136wrf.8.1711388981829;
        Mon, 25 Mar 2024 10:49:41 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id fa7-20020a056000258700b00341c563aacbsm6172756wrb.1.2024.03.25.10.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:49:41 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: rust-for-linux@vger.kernel.org,
	x86@kernel.org,
	lyude@redhat.com,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	airlied@redhat.com,
	Asahi Lina <lina@asahilina.net>,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 3/8] rust: device: Add a stub abstraction for devices
Date: Mon, 25 Mar 2024 18:49:07 +0100
Message-ID: <20240325174924.95899-4-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325174924.95899-1-dakr@redhat.com>
References: <20240325174924.95899-1-dakr@redhat.com>
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

From: Wedson Almeida Filho <wedsonaf@gmail.com>

Add a Device type which represents an owned reference to a generic
struct device. This minimal implementation just handles reference
counting and allows the user to get the device name.

Also, implement the rust_helper_dev_get_drvdata helper.

Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Co-developed-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/helpers.c        | 13 ++++++++
 rust/kernel/device.rs | 76 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/rust/helpers.c b/rust/helpers.c
index 70e59efd92bc..1e40661a33d1 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -23,6 +23,7 @@
 #include <kunit/test-bug.h>
 #include <linux/bug.h>
 #include <linux/build_bug.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errname.h>
 #include <linux/mutex.h>
@@ -157,6 +158,18 @@ void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
 }
 EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
 
+void *rust_helper_dev_get_drvdata(struct device *dev)
+{
+	return dev_get_drvdata(dev);
+}
+EXPORT_SYMBOL_GPL(rust_helper_dev_get_drvdata);
+
+const char *rust_helper_dev_name(const struct device *dev)
+{
+	return dev_name(dev);
+}
+EXPORT_SYMBOL_GPL(rust_helper_dev_name);
+
 /*
  * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
  * use it in contexts where Rust expects a `usize` like slice (array) indices.
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 9be021e393ca..7309a236f512 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
 
-use crate::bindings;
+use crate::{bindings, str::CStr};
 
 /// A raw device.
 ///
@@ -20,4 +20,78 @@
 pub unsafe trait RawDevice {
     /// Returns the raw `struct device` related to `self`.
     fn raw_device(&self) -> *mut bindings::device;
+
+    /// Returns the name of the device.
+    fn name(&self) -> &CStr {
+        let ptr = self.raw_device();
+
+        // SAFETY: `ptr` is valid because `self` keeps it alive.
+        let name = unsafe { bindings::dev_name(ptr) };
+
+        // SAFETY: The name of the device remains valid while it is alive (because the device is
+        // never renamed, per the safety requirement of this trait). This is guaranteed to be the
+        // case because the reference to `self` outlives the one of the returned `CStr` (enforced
+        // by the compiler because of their lifetimes).
+        unsafe { CStr::from_char_ptr(name) }
+    }
+}
+
+/// A ref-counted device.
+///
+/// # Invariants
+///
+/// `ptr` is valid, non-null, and has a non-zero reference count. One of the references is owned by
+/// `self`, and will be decremented when `self` is dropped.
+pub struct Device {
+    pub(crate) ptr: *mut bindings::device,
+}
+
+// SAFETY: `Device` only holds a pointer to a C device, which is safe to be used from any thread.
+unsafe impl Send for Device {}
+
+// SAFETY: `Device` only holds a pointer to a C device, references to which are safe to be used
+// from any thread.
+unsafe impl Sync for Device {}
+
+impl Device {
+    /// Creates a new device instance.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.
+    pub unsafe fn new(ptr: *mut bindings::device) -> Self {
+        // SAFETY: By the safety requirements, ptr is valid and its refcounted will be incremented.
+        unsafe { bindings::get_device(ptr) };
+        // INVARIANT: The safety requirements satisfy all but one invariant, which is that `self`
+        // owns a reference. This is satisfied by the call to `get_device` above.
+        Self { ptr }
+    }
+
+    /// Creates a new device instance from an existing [`RawDevice`] instance.
+    pub fn from_dev(dev: &dyn RawDevice) -> Self {
+        // SAFETY: The requirements are satisfied by the existence of `RawDevice` and its safety
+        // requirements.
+        unsafe { Self::new(dev.raw_device()) }
+    }
+}
+
+// SAFETY: The device returned by `raw_device` is the one for which we hold a reference.
+unsafe impl RawDevice for Device {
+    fn raw_device(&self) -> *mut bindings::device {
+        self.ptr
+    }
+}
+
+impl Drop for Device {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // relinquish it now.
+        unsafe { bindings::put_device(self.ptr) };
+    }
+}
+
+impl Clone for Device {
+    fn clone(&self) -> Self {
+        Self::from_dev(self)
+    }
 }
-- 
2.44.0

