Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979F642DA3F
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786441370; cv=none; b=N0RBU2ODZjv4+gyg8IrxAVWJsyWf7hyCL6+9ZK9ch/uhFhvzfCURx/JH7PSGfd+s/M7w+tOOcyhCHi4M1/1V+Kx8ds8yrciH9eGQdwXGrMZa5S1Y5IX5dQJEx5iP0ihivftN+ekt+RT4uio4ZlnuPBmgt5UapqaP/ZYZ3MF63SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786441370; c=relaxed/simple;
	bh=8zshD9o1aEgDQAPfsQQefG9ZjD9sl+/fnH6CGT3YDTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SQj57XLPz2DP1GtE1RnRY76TS1HjAQHw4yfCmm47426tlEnzWfbmeQyo2Mssd2EDLdH6uW3bjUOLOQEwc4Wy9VOjueAA/qAhrRZYTFaKMcxPxCPMxUGF+x7v57eZFvNFE7wgTe1+8w8hexsk8aSDS3PPRQP7kLoI/oooLxu71Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=KXO4NWum; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="KXO4NWum"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-476a130c138so2695035f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1786441367; x=1787046167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXGxdGnTIFSXmiJ8Kpd6ItKriKpKtoQz+U+0jIIi7d8=;
        b=KXO4NWum5kQi9baOQ3AemgdXjMuQgSiGQ7BnKC3YGMzVQBBjfuWeHpXbh2eqRAVH6z
         fpa5FsTmt01ptmDQ9MK7toCrT2kLZRDDilQih2bSuro9vB4xQiDyC1yIs4nIMZtwRl8Z
         Ab3IMLVitTRzfI8dZOgSqLMM70EOgCzCk+4bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786441367; x=1787046167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXGxdGnTIFSXmiJ8Kpd6ItKriKpKtoQz+U+0jIIi7d8=;
        b=VJCoNbovZlRiFUmvVAOH5qVQNLAd+Br2ml0OxI0ZDEWIqm4UDpUz1RZBDKWD4kkBQs
         NWMhIMlrEynLfKTmMkRFn66yUk4z8IIfP4QcQ+Whj+bA18WHtSWfXCYl9udx+PAmHisN
         THUjyZQ9zFieSJ3T5DTalqy25e1mgj2cr/9frhGYXdPJsjj/Mx74c9bs/6xsiZ2Pdp03
         V+BaJX93yR+U9Fk3S8pN49I93/sveVoGzPgQOHXNV+cWWLNwpEULTiBeWhiddAaRHtKd
         49m+TB2xU4/T5jgWN/9bpwZYFFkqFEoFgaLIRWw8Nd8c+qs+r5hz2ryLJ9UcMPw5FIEf
         BMTA==
X-Forwarded-Encrypted: i=1; AHgh+RqGrk4KaJ06eJkIo7+kxs3+jV1d/xYgD3FrZ7nUUesGnsYEl7nDFii2vdirf1UuxgCw3tGusCRvNwUHazJCgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdMpUipJ8i0NsNXA/n8H1YssZ2UELJR2st40n+Bt3MrLHgr0C5
	EOxWbN0Pg2qjPuTZj5pXP1ysoODRCXeLQvo06rCOLbgNl+39E0qz7suIGlPNZsSy+g8=
X-Gm-Gg: AR+sD10av8IEnsm7DbzN6xJpqzejMbC+2zKFrk7pOZnZG4ZHLBagie1riDK3hj04paq
	Sm/6syDWw6U3mPyOIepM2SUBrZ4617gB9+gIqiDL/FRmjnpDCEXMCXSvWj+SP4hjNGPdyEsxW+r
	gqwVBQeIs/e13mWwxSHju01uu+REVTRahWhjEcG6gszOVqTlbxCHafoF4RitoQwNqM//2nmMBSz
	ivz7TXMarEhJdVwrNllIF+MHKDtDKD8gUyo7eCJ/x4+CPiCqsFhRj5XuDp5WuNhiEH5+KIHpS6W
	Eec4m/hG0YmvAtBcsxbujP+divKgtiy1rUej7qxLYR+Nm3I7fD+4INkUlnQasF2ckYkTAI+mtpp
	Zp+dwzP+0qkdRfdttkao9OrjgXcew370nGg6NwfkSzntR+Q+SuzxmgGRca9Dfi72G8dL0zv/IxH
	QjvNiSGAYZIQOw1GcH3mYDx8vPUN/QYEz2iN0eq6/ucvtrQhH/vfQkdcOn+Pqz8vkICkkTb1g7P
	a9ib/FmdgWFgPXPrxrujQ4x6tnr2/EMwWJ4TQ==
X-Received: by 2002:a05:6000:4802:b0:473:6e8d:7f3 with SMTP id ffacd0b85a97d-4814ad77f51mr3692843f8f.1.1786441366646;
        Tue, 11 Aug 2026 02:42:46 -0700 (PDT)
Received: from [10.0.36.57] ([217.73.170.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a709624sm3388917f8f.22.2026.08.11.02.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:42:46 -0700 (PDT)
From: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Date: Tue, 11 Aug 2026 12:42:31 +0300
Subject: [PATCH RFC v2 4/4] rust: usb: allow drivers to expose sysfs
 attributes
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-rust-usb_control_msg-v2-4-ef79c92bd898@wyliodrin.com>
References: <20260811-rust-usb_control_msg-v2-0-ef79c92bd898@wyliodrin.com>
In-Reply-To: <20260811-rust-usb_control_msg-v2-0-ef79c92bd898@wyliodrin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
 Alexandru Radovici <alexandru.radovici@wyliodrin.com>
X-Mailer: b4 0.14.3

Add an optional DEVICE_GROUPS constant to the USB driver trait and pass
it to struct usb_driver::dev_groups, so that a driver can expose sysfs
files on every interface it binds to. Drivers that leave it unset keep
the current behaviour, as the field stays NULL.

usbcore forwards dev_groups to the embedded struct device_driver, so the
files are created only after probe() has returned successfully and are
removed before disconnect() runs. An attribute callback therefore always
finds the private data that probe() stored.

The constant is typed AttributeGroups<Self::Data<'static>> because a
'static reference cannot name the 'bound lifetime that probe() works
with, while the value handed to a callback is a Self::Data<'bound>. A
driver whose private data borrows from 'bound must not set this
constant; only types that are the same for every instantiation are
sound here.

Signed-off-by: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
---
 rust/kernel/usb.rs              | 100 ++++++++++++++++++++++++++++++++++++++--
 samples/rust/rust_driver_usb.rs |  14 ++++++
 2 files changed, 111 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 6670fa2ff377..27fc5e28b45a 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -19,6 +19,7 @@
     },
     prelude::*,
     sync::aref::AlwaysRefCounted,
+    sysfs::AttributeGroups,
     types::Opaque,
     usb::endpoint::HostEndpoint,
     ThisModule, //
@@ -26,10 +27,13 @@
 use core::{
     marker::PhantomData,
     mem::{
-        offset_of,
-        MaybeUninit, //
+        offset_of, //
+        MaybeUninit,
+    },
+    ptr::{
+        self,
+        NonNull, //
     },
-    ptr::NonNull,
     slice, //
 };
 
@@ -64,6 +68,11 @@ unsafe fn register(
             (*udrv.get()).probe = Some(Self::probe_callback);
             (*udrv.get()).disconnect = Some(Self::disconnect_callback);
             (*udrv.get()).id_table = T::ID_TABLE.as_ptr();
+            (*udrv.get()).dev_groups = if let Some(dev_group) = T::DEVICE_GROUPS {
+                dev_group.as_ptr()
+            } else {
+                ptr::null_mut()
+            };
         }
 
         // SAFETY: `udrv` is guaranteed to be a valid `DriverType`.
@@ -320,6 +329,91 @@ pub trait Driver {
     /// The table of device ids supported by the driver.
     const ID_TABLE: IdTable<Self::IdInfo>;
 
+    /// The sysfs attribute groups to create for interfaces bound to this driver.
+    ///
+    /// Defaults to `None`, i.e. the driver exposes no attributes of its own.
+    /// Build the value with [`attribute_list!`](crate::attribute_list), which
+    /// declares the necessary `static`s and evaluates to a
+    /// `&'static AttributeGroups`. Only a single group is supported.
+    ///
+    /// The files appear in the sysfs directory of each bound USB *interface*, not
+    /// of the USB device, for instance `/sys/bus/usb/devices/1-1:1.0/`. Because
+    /// `dev_groups` belongs to the driver rather than to one device, every
+    /// interface this driver binds to gets the same set of files, and there is no
+    /// way to hide an individual attribute for some interfaces.
+    ///
+    /// # Registration window
+    ///
+    /// The array is stored in `struct usb_driver::dev_groups`, which usbcore
+    /// forwards to the embedded `struct device_driver`. The driver core creates
+    /// the files only after [`Driver::probe`] has returned successfully and
+    /// removes them before [`Driver::disconnect`] runs, so an attribute callback
+    /// always finds live private data on the interface. That is what makes it
+    /// sound for the callbacks to recover it at all. Groups installed anywhere
+    /// that is populated earlier, such as a `device_type`, would expose the files
+    /// from `device_add` onwards, before `probe` had stored anything.
+    ///
+    /// # `Sync`
+    ///
+    /// Attribute callbacks receive a shared reference to the private data, and
+    /// two readers on separate file descriptors can be inside a `show` for the
+    /// same interface at once, so [`Self::Data`] has to be `Sync` for a driver
+    /// that sets this to `Some`. The bound is deliberately not stated here: it
+    /// comes from `AttributeOperations::Data`, so it is checked at the
+    /// `attribute_list!` call site rather than being imposed on every driver,
+    /// including the ones that leave this as `None`.
+    ///
+    /// # The `'static` in `Self::Data<'static>`
+    ///
+    /// The reference is `'static`, so `'static` is the only lifetime this type
+    /// can name. The value a callback is handed at runtime is the
+    /// `Self::Data<'bound>` that [`Driver::probe`] returned for the current
+    /// binding, so the tag names a different instantiation of the GAT than the
+    /// one that exists, and the attribute code reads the private data as a
+    /// `Self::Data<'static>`. Variance turns `'static` into `'bound`, not the
+    /// reverse, so nothing recovers the difference.
+    ///
+    /// Only set this to `Some` when [`Self::Data`] does not borrow from `'bound`,
+    /// i.e. when every instantiation is the same owning type. A `Data` holding
+    /// `&'bound` references can leak them out of an attribute callback with a
+    /// longer lifetime than they have, and nothing here catches it.
+    ///
+    /// # Examples
+    ///
+    /// ```ignore
+    /// const BLINK: u64 = 0;
+    ///
+    /// // No `'bound` borrows, so `Data<'static>` is the type that exists.
+    /// struct MyData { blinking: AtomicBool }
+    ///
+    /// impl usb::Driver for MyDriver {
+    ///     type Data<'bound> = MyData;
+    ///
+    ///     const DEVICE_GROUPS: Option<&'static AttributeGroups<Self::Data<'static>>> =
+    ///         Some(kernel::attribute_list!(
+    ///             data: MyData,
+    ///             ops: MyDriver,
+    ///             attributes: BLINK,
+    ///         ));
+    ///
+    ///     // ... ID_TABLE, probe, disconnect
+    /// }
+    ///
+    /// impl kernel::sysfs::AttributeOperations<BLINK> for MyDriver {
+    ///     type Data = MyData;
+    ///
+    ///     fn show(
+    ///         data: Pin<&MyData>,
+    ///         _dev: &Device<Bound>,
+    ///         buf: &mut [u8; PAGE_SIZE],
+    ///     ) -> Result<usize> {
+    ///         // Format into `buf` and return the byte count.
+    ///         Ok(0)
+    ///     }
+    /// }
+    /// ```
+    const DEVICE_GROUPS: Option<&'static AttributeGroups<Self::Data<'static>>> = None;
+
     /// USB driver probe.
     ///
     /// Called when a new USB interface is bound to this driver.
diff --git a/samples/rust/rust_driver_usb.rs b/samples/rust/rust_driver_usb.rs
index 02bd5085f9bc..055c46faf144 100644
--- a/samples/rust/rust_driver_usb.rs
+++ b/samples/rust/rust_driver_usb.rs
@@ -3,6 +3,9 @@
 
 //! Rust USB driver sample.
 
+const ATTR1: u64 = 0;
+const ATTR2: u64 = 1;
+
 use kernel::{
     device::{
         self,
@@ -10,6 +13,7 @@
     },
     prelude::*,
     sync::aref::ARef,
+    sysfs::AttributeOperations,
     usb, //
 };
 
@@ -17,6 +21,16 @@ struct SampleDriver {
     _intf: ARef<usb::Interface>,
 }
 
+#[vtable]
+impl AttributeOperations<ATTR1> for SampleDriver {
+    type Data = Self;
+}
+
+#[vtable]
+impl AttributeOperations<ATTR2> for SampleDriver {
+    type Data = Self;
+}
+
 kernel::usb_device_table!(
     USB_TABLE,
     MODULE_USB_TABLE,

-- 
2.55.0

