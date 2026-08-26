Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF54570CD
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761883; cv=none; b=a7a1LN7ePwqMtC8+91KmaeoJJil2j/QwS4PhiMdBMIMZQF2LT3nFUDi36NrbTs2cW3ocnOeyrOUlibN5N0lexg6Piowq32g3X02BTELd9M8ElN/rLzsysiBMEzY4zA1U0HNBqhWQvNzQO++3n5dJdGyn/U/qSTyQeD6bgOQS/Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761883; c=relaxed/simple;
	bh=lqOD75jmwnosQHHZMY8gb9j4okBbgh5+8cXCjjRb50M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqfmzlRHJ40ODwAdz553TBQ9EZCY1XeLhROe90hn0hstUp9kXga16DXHyBzWDoN4cXqzyeJNkoTr0lZKhJ5HEIBNrO8ikM+BPRlOjv7dPUj842y8Xs6cVmA2jwbn4Dzxtn46hQozbQZbeCDl1A46MXrD0poPFnB7kTvbuv1C13M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=xKFOnogu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="xKFOnogu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso7238615e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761879; x=1788366679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COtW25Zm5Xxmq90NlVmSKm44EywadnaOHv5QTCsJYbo=;
        b=xKFOnogugCqs27FwD3anKhVrmsxIoYt584KQpSchbtRzi2imv4S0wr/gdEX2pJ3U3S
         cbC87tDtg6YGZ/JgHxsLU1EcPOEy5DlTSTB/vIDwsjkRELQEm6Wr0Zna0TsRz5oDR5WN
         6gpyj02AlDdov0j/4Tpa+ZLB5o6Sm2nu+d/Zj97gUtu9G/dM9F1Aq3fYF1LpkSP0DYtJ
         6sXB5zUEQYvdOAKoXgvTFWQP9OFxaQAEmZmuQt0R1o9DWVY3vDWYNJWNhr+dQgqhAf9y
         v+V5gerplEGzW2Ylgx0GKLL4lGxyrtAu0X4gPKgMpgJIj5+BmVM0vklaehcjdZPKhX2m
         k1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761879; x=1788366679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=COtW25Zm5Xxmq90NlVmSKm44EywadnaOHv5QTCsJYbo=;
        b=NeLIK5+36iDv1UYGWddv9sTx4L/mjVYcLd7jOz/HYSO8XIh76JuPdVKPpYBYC+h63K
         c3QhbZxzHqVaZBTj9UuljwGM7R8gOtzZ0J0uiJfgebAgNIH+tlIXefK9y1fE4wg8IWC3
         HaxUKe4d/T/Q70sDyLPfUFELN48ucARG5EQCo8x0nZ91l1fJ+8jRpC6BGUOBN24E5aN0
         aFX1BSBXu4q5HofF7DfbU8C+/Cp0qtXHfxdlpxApycQscl8HrdBb7BOXf/SA81GnxcHf
         xdZ5BIvXFgJcpTyVQzq9pQWyJjQ9m76KjNrrAIwy15GKMVR8b0T0qdbmu9gndV7kPCkq
         8o4w==
X-Forwarded-Encrypted: i=1; AHgh+RptXA+VMwSK24TJzsiDTNi+BS7gteOeQds5E59W71nY4TpK4mfqpPy/UuC4k2Bx4pSGjB8OJ5XRn6GxKhsE7A==@vger.kernel.org
X-Gm-Message-State: AFuF++kYAjZ48TJz1sCd2FH7YZ/9sIc6eSYN38uOUbTuG13LDwI/DdO+
	xu/QxJ1pxqyZJCh9WpWEw+ogTak5WqcoA49ZS+/l8kdihNFRmQCwMIGyOXS8Ll2IHQ==
X-Gm-Gg: AR+sD133VYQK7JqD6O+FC1Vanlv0bbwbIyuHhC8jwe1I43oFufgS3/cw1KJ6JxWBbd+
	av2QAp95A5zyPn7hsLfdTGUuicnTmLFt2sVdWsZjWWbxI+nve1iiJqiPMb3V/jIKCR9RAsxOx/n
	2MPvYOMVfMKPtvF/Zv4Upr6tdVtCl1VVc8Emuo+/OCDtn54S9CcUsJQTWRooBv+h07qTopwg+Hy
	rWHXxGOmZEdYswF+IF7hOTGG9MyoTYF2Yv1OjtfJAaBvhTeLIjORCsiSeBoYYfH60Xa8no2e9fm
	lykDTgb6czm93sPlF0sJw2fIXAknQeL3TAjsVLfvhrcOXtR7OgQkIYrAoGYuRNyO+bNau5kqnFK
	YF2cF4Gr3WsGR7XL0ajU3MalZTPsIHHeCAblpzo7Vx87yEo9YfZPW2BLp8nikuFk/Lnn35iJZvH
	jRF3yhsjqPiyVX+6leM5dyeB8eRQ6L03jtyImWDdy/Zd+Z5UjGp60TnGuyyELlTIoBU5yIjaPjc
	zLg4d7f2BYDcEmtkNN9gUfMyTvPZiR7YL4r2w==
X-Received: by 2002:a05:600c:5309:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-499dc702b09mr83444455e9.7.1787761878825;
        Wed, 26 Aug 2026 09:31:18 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc9b83aesm31202705e9.12.2026.08.26.09.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:31:16 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-usb@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Braun <colinbrauncl@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] rust: usb: add revocable typed interface I/O
Date: Wed, 26 Aug 2026 17:30:37 +0100
Message-ID: <20260826163101.4168-2-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163101.4168-1-mike@fireburn.co.uk>
References: <20260826163101.4168-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the USB driver adapter own its bound data and a per-interface
I/O window. Close the window around disconnect, suspend, and reset
callbacks, wait for outstanding users, and release bound data after
driver teardown.

Represent endpoint direction and transfer type in sealed marker types
validated from the active interface descriptor. Issue bulk, interrupt,
and control transfers through a borrowed I/O token, use DMA-capable
bounce buffers where required, and prevent a driver from retargeting
a sibling interface.

Add the standard power-management callbacks to the Rust USB driver trait
and update the sample driver for the I/O capability passed at probe.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/helpers/usb.c              |  18 +
 rust/kernel/usb.rs              | 767 +++++++++++++++++++++++++++++++-
 samples/rust/rust_driver_usb.rs |   6 +-
 3 files changed, 772 insertions(+), 19 deletions(-)

diff --git a/rust/helpers/usb.c b/rust/helpers/usb.c
index eff1cf7be3c2..ac7b30334882 100644
--- a/rust/helpers/usb.c
+++ b/rust/helpers/usb.c
@@ -7,3 +7,21 @@ rust_helper_interface_to_usbdev(struct usb_interface *intf)
 {
 	return interface_to_usbdev(intf);
 }
+
+__rust_helper unsigned int
+rust_helper_usb_sndbulkpipe(struct usb_device *dev, unsigned int endpoint)
+{
+	return usb_sndbulkpipe(dev, endpoint);
+}
+
+__rust_helper unsigned int
+rust_helper_usb_rcvbulkpipe(struct usb_device *dev, unsigned int endpoint)
+{
+	return usb_rcvbulkpipe(dev, endpoint);
+}
+
+__rust_helper unsigned int
+rust_helper_usb_rcvintpipe(struct usb_device *dev, unsigned int endpoint)
+{
+	return usb_rcvintpipe(dev, endpoint);
+}
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index f4a3d7c0ef6c..c3d0cc36d425 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -6,6 +6,7 @@
 //! C header: [`include/linux/usb.h`](srctree/include/linux/usb.h)
 
 use crate::{
+    alloc::Flags,
     bindings,
     device,
     device_id::{
@@ -19,9 +20,16 @@
     },
     prelude::*,
     sync::{
-        aref::AlwaysRefCounted,
+        aref::{
+            ARef,
+            AlwaysRefCounted, //
+        },
+        new_condvar,
+        new_mutex,
         Arc,
-        ArcBorrow, //
+        ArcBorrow,
+        CondVar,
+        Mutex, //
     },
     time::Delta,
     types::Opaque,
@@ -53,14 +61,29 @@
 /// An adapter for the registration of USB drivers.
 pub struct Adapter<T: Driver>(T);
 
+#[pin_data]
+#[doc(hidden)]
+pub struct BoundData<'bound, T: Driver> {
+    #[pin]
+    driver_data: T::Data<'bound>,
+    io: Arc<IoWindow>,
+}
+
+impl<'bound, T: Driver> BoundData<'bound, T> {
+    fn driver_data<'a>(self: Pin<&'a Self>) -> Pin<&'a T::Data<'bound>> {
+        // SAFETY: `driver_data` is structurally pinned with `Self`.
+        unsafe { self.map_unchecked(|this| &this.driver_data) }
+    }
+}
+
 // SAFETY:
 // - `bindings::usb_driver` is a C type declared as `repr(C)`.
-// - `T::Data` is the type of the driver's device private data.
+// - `BoundData<T>` is the type of the driver's device private data.
 // - `struct usb_driver` embeds a `struct device_driver`.
 // - `DEVICE_DRIVER_OFFSET` is the correct byte offset to the embedded `struct device_driver`.
 unsafe impl<T: Driver> driver::DriverLayout for Adapter<T> {
     type DriverType = bindings::usb_driver;
-    type DriverData<'bound> = T::Data<'bound>;
+    type DriverData<'bound> = BoundData<'bound, T>;
     const DEVICE_DRIVER_OFFSET: usize = core::mem::offset_of!(Self::DriverType, driver);
 }
 
@@ -77,6 +100,11 @@ unsafe fn register(
             (*udrv.get()).name = name.as_char_ptr();
             (*udrv.get()).probe = Some(Self::probe_callback);
             (*udrv.get()).disconnect = Some(Self::disconnect_callback);
+            (*udrv.get()).suspend = Some(Self::suspend_callback);
+            (*udrv.get()).resume = Some(Self::resume_callback);
+            (*udrv.get()).reset_resume = Some(Self::reset_resume_callback);
+            (*udrv.get()).pre_reset = Some(Self::pre_reset_callback);
+            (*udrv.get()).post_reset = Some(Self::post_reset_callback);
             (*udrv.get()).id_table = T::ID_TABLE.as_ptr();
         }
 
@@ -109,7 +137,12 @@ extern "C" fn probe_callback(
             let id = unsafe { &*id.cast::<DeviceId>() };
 
             let info = T::ID_TABLE.info(id.index());
-            let data = T::probe(intf, id, info);
+            let interface: ARef<Interface> = intf.into();
+            let io = Arc::pin_init(IoWindow::new(interface), GFP_KERNEL)?;
+            let data = try_pin_init!(BoundData::<T> {
+                driver_data <- T::probe(intf, id, info, io.clone()),
+                io,
+            });
 
             let dev: &device::Device<device::CoreInternal<'_>> = intf.as_ref();
             dev.set_drvdata(data)?;
@@ -126,12 +159,94 @@ extern "C" fn disconnect_callback(intf: *mut bindings::usb_interface) {
 
         let dev: &device::Device<device::CoreInternal<'_>> = intf.as_ref();
 
+        // Take ownership of the driver data here rather than leaving it to the driver core's
+        // generic post-unbind teardown: `usb_unbind_interface()` calls `usb_set_intfdata(intf,
+        // NULL)` as soon as this callback returns, which is *before* `device_unbind_cleanup()`
+        // runs `post_unbind_rust`. The generic `drvdata_obtain()` therefore always finds NULL for
+        // USB and the driver data -- with everything it owns, such as a `drm::Registration` -- is
+        // leaked on every unbind.
+        //
         // SAFETY: `disconnect_callback` is only ever called after a successful call to
         // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
-        // and stored a `Pin<KBox<T::Data<'_>>>`.
-        let data = unsafe { dev.drvdata_borrow::<T::Data<'_>>() };
+        // and stored a `Pin<KBox<BoundData<'_, T>>>`.
+        let data = unsafe { dev.drvdata_obtain::<BoundData<'_, T>>() };
+
+        if let Some(data) = data {
+            T::quiesce(intf, data.as_ref().driver_data());
+            data.io.close();
+            T::disconnect(intf, data.as_ref().driver_data());
+
+            // Dropped only after `T::disconnect()` has returned, so a driver can rely on its
+            // owned resources still being alive for the whole of its disconnect handling.
+            drop(data);
+        }
+    }
+
+    /// Recovers the typed interface and driver data shared by every power-management and reset
+    /// callback, then dispatches to `f`.
+    ///
+    /// `f` is spelled as an explicitly higher-ranked `fn` pointer because the interface and the
+    /// driver data share the `'bound` lifetime; an `impl FnOnce` bound loses that relationship and
+    /// the trait methods no longer satisfy it.
+    fn pm_dispatch(
+        intf: *mut bindings::usb_interface,
+        f: for<'bound, 'a, 'b> fn(
+            &'bound Interface<device::Core<'a>>,
+            Pin<&'b T::Data<'bound>>,
+        ) -> Result,
+        resume: bool,
+    ) -> kernel::ffi::c_int {
+        // SAFETY: The USB core only ever calls these with a valid `struct usb_interface`.
+        //
+        // INVARIANT: `intf` is valid for the duration of the callback.
+        let intf = unsafe { &*intf.cast::<Interface<device::CoreInternal<'_>>>() };
+
+        let dev: &device::Device<device::CoreInternal<'_>> = intf.as_ref();
+
+        // SAFETY: These callbacks only ever run between a successful `probe_callback()` and
+        // `disconnect_callback()`, so the driver data is present.
+        let data = unsafe { dev.drvdata_borrow::<BoundData<'_, T>>() };
 
-        T::disconnect(intf, data);
+        from_result(|| {
+            if resume {
+                data.io.reopen();
+            }
+
+            if let Err(e) = f(intf, data.driver_data()) {
+                if resume {
+                    data.io.close();
+                }
+                return Err(e);
+            }
+
+            if !resume {
+                data.io.close();
+            }
+            Ok(0)
+        })
+    }
+
+    extern "C" fn suspend_callback(
+        intf: *mut bindings::usb_interface,
+        _message: bindings::pm_message_t,
+    ) -> kernel::ffi::c_int {
+        Self::pm_dispatch(intf, T::suspend, false)
+    }
+
+    extern "C" fn resume_callback(intf: *mut bindings::usb_interface) -> kernel::ffi::c_int {
+        Self::pm_dispatch(intf, T::resume, true)
+    }
+
+    extern "C" fn reset_resume_callback(intf: *mut bindings::usb_interface) -> kernel::ffi::c_int {
+        Self::pm_dispatch(intf, T::reset_resume, true)
+    }
+
+    extern "C" fn pre_reset_callback(intf: *mut bindings::usb_interface) -> kernel::ffi::c_int {
+        Self::pm_dispatch(intf, T::pre_reset, false)
+    }
+
+    extern "C" fn post_reset_callback(intf: *mut bindings::usb_interface) -> kernel::ffi::c_int {
+        Self::pm_dispatch(intf, T::post_reset, true)
     }
 }
 
@@ -289,7 +404,7 @@ macro_rules! usb_device_table {
 /// # Examples
 ///
 ///```
-/// # use kernel::{bindings, device::Core, usb};
+/// # use kernel::{bindings, device::Core, sync::Arc, usb};
 /// use kernel::prelude::*;
 ///
 /// struct MyDriver;
@@ -313,6 +428,7 @@ macro_rules! usb_device_table {
 ///         _interface: &'bound usb::Interface<Core<'_>>,
 ///         _id: &usb::DeviceId,
 ///         _info: &'bound Self::IdInfo,
+///         _io: Arc<usb::IoWindow>,
 ///     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
 ///         Err(ENODEV)
 ///     }
@@ -342,15 +458,77 @@ fn probe<'bound>(
         interface: &'bound Interface<device::Core<'_>>,
         id: &DeviceId,
         id_info: &'bound Self::IdInfo,
+        io: Arc<IoWindow>,
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound;
 
+    /// Quiesces a USB driver before disconnect.
+    ///
+    /// The implementation must stop work which could start new transfers. Once this returns, the
+    /// adapter closes the interface's [`IoWindow`].
+    fn quiesce<'bound>(
+        _interface: &'bound Interface<device::Core<'_>>,
+        _data: Pin<&Self::Data<'bound>>,
+    ) {
+    }
+
     /// USB driver disconnect.
     ///
-    /// Called when the USB interface is about to be unbound from this driver.
+    /// Called after the interface's [`IoWindow`] has been closed and all I/O has completed. The
+    /// bound data is dropped after this returns.
     fn disconnect<'bound>(
         interface: &'bound Interface<device::Core<'_>>,
         data: Pin<&Self::Data<'bound>>,
     );
+
+    /// The interface is being suspended.
+    ///
+    /// The implementation must stop work which could start new transfers. If it returns success,
+    /// the adapter closes the interface's [`IoWindow`] before returning to the USB core. Returning
+    /// an error aborts the suspend and leaves the window open.
+    fn suspend<'bound>(
+        _interface: &'bound Interface<device::Core<'_>>,
+        _data: Pin<&Self::Data<'bound>>,
+    ) -> Result {
+        Ok(())
+    }
+
+    /// The interface has been resumed. The adapter reopens its [`IoWindow`] before this is called.
+    fn resume<'bound>(
+        _interface: &'bound Interface<device::Core<'_>>,
+        _data: Pin<&Self::Data<'bound>>,
+    ) -> Result {
+        Ok(())
+    }
+
+    /// The interface has been resumed after its device was reset while suspended.
+    ///
+    /// I/O is permitted again, but the device has lost the state configured before the suspend.
+    /// Defaults to [`resume`](Driver::resume).
+    fn reset_resume<'bound>(
+        interface: &'bound Interface<device::Core<'_>>,
+        data: Pin<&Self::Data<'bound>>,
+    ) -> Result {
+        Self::resume(interface, data)
+    }
+
+    /// The device is about to be reset.
+    ///
+    /// As for [`suspend`](Driver::suspend), the driver must stop work which could start new
+    /// transfers. The adapter closes the [`IoWindow`] after a successful return.
+    fn pre_reset<'bound>(
+        _interface: &'bound Interface<device::Core<'_>>,
+        _data: Pin<&Self::Data<'bound>>,
+    ) -> Result {
+        Ok(())
+    }
+
+    /// The device has been reset. The adapter reopens its [`IoWindow`] before this is called.
+    fn post_reset<'bound>(
+        _interface: &'bound Interface<device::Core<'_>>,
+        _data: Pin<&Self::Data<'bound>>,
+    ) -> Result {
+        Ok(())
+    }
 }
 
 /// A USB interface.
@@ -544,6 +722,541 @@ pub fn maxp_mult(&self) -> u16 {
     }
 }
 
+impl<Ctx: device::DeviceContext> Interface<Ctx> {
+    /// Returns this interface's `bInterfaceNumber`, or `None` if it currently has no active
+    /// alternate setting.
+    pub fn number(&self) -> Option<u8> {
+        // SAFETY: `self.as_raw()` is a valid `struct usb_interface` by the type invariant.
+        let alt = unsafe { (*self.as_raw()).cur_altsetting };
+        if alt.is_null() {
+            return None;
+        }
+        // SAFETY: `alt` is a valid `struct usb_host_interface` (checked non-null above).
+        Some(unsafe { (*alt).desc.bInterfaceNumber })
+    }
+
+    /// Asks the driver core to unbind whatever driver is currently bound to this interface.
+    ///
+    /// This is the narrow, reviewed replacement for handing out a raw `struct device` pointer: it
+    /// performs exactly one operation (`device_release_driver()`) on this interface's own device,
+    /// and cannot be used to reach the device-wide state of a composite peer.
+    ///
+    /// It is intended for a driver-provided "release my devices" control (e.g. a sysfs attribute),
+    /// and must not be called from the driver's own `probe()` or `disconnect()` callback: the
+    /// driver core already holds the device lock across those.
+    pub fn release_driver(&self) {
+        // SAFETY: `self.as_raw()` is a valid `struct usb_interface` by the type invariant, so the
+        // address of its embedded `dev` is a valid `struct device`. `device_release_driver()`
+        // takes the device lock itself and tolerates a device with no driver bound.
+        unsafe { bindings::device_release_driver(&raw mut (*self.as_raw()).dev) };
+    }
+
+    /// Asks the USB core to reset the device this interface belongs to, from a work item it owns.
+    ///
+    /// Unlike `usb_reset_device()`, this may be called from any context, including one holding the
+    /// device lock or one running inside a completion handler: the core defers the reset to its
+    /// own workqueue. The reset re-enumerates the device, so every driver bound to it is unbound
+    /// and re-probed; a caller must therefore treat its own state as gone from this point.
+    ///
+    /// A driver whose device has stopped responding uses this to recover in place, instead of
+    /// requiring the user to unplug it.
+    pub fn queue_reset_device(&self) {
+        // SAFETY: `self.as_raw()` is a valid `struct usb_interface` by the type invariant, which
+        // is all `usb_queue_reset_device()` requires; it performs no I/O itself and tolerates
+        // being called when a reset is already pending.
+        unsafe { bindings::usb_queue_reset_device(self.as_raw()) };
+    }
+}
+
+/// The transfer type and direction of a USB endpoint, used to tag an [`Endpoint`] so that a
+/// transfer method cannot be pointed at an endpoint of the wrong kind.
+///
+/// This trait is sealed: the set of endpoint kinds is fixed by this module and matches the USB
+/// endpoint types the abstraction supports.
+pub trait EndpointKind: private::Sealed {
+    /// The `bmAttributes` transfer type (`USB_ENDPOINT_XFER_*`) an endpoint must have.
+    const XFER_TYPE: u8;
+
+    /// Whether the endpoint must be an IN (device-to-host) endpoint.
+    const DIR_IN: bool;
+
+    /// Build the USB pipe corresponding to a validated endpoint.
+    fn pipe<Ctx: device::DeviceContext>(dev: &Device<Ctx>, endpoint: &HostEndpoint) -> Pipe;
+}
+
+mod private {
+    /// Seals [`EndpointKind`](super::EndpointKind) against external implementations.
+    pub trait Sealed {}
+}
+
+/// Marker for a bulk IN (device-to-host) endpoint.
+pub enum BulkIn {}
+/// Marker for a bulk OUT (host-to-device) endpoint.
+pub enum BulkOut {}
+/// Marker for an interrupt IN (device-to-host) endpoint.
+pub enum InterruptIn {}
+
+impl private::Sealed for BulkIn {}
+impl private::Sealed for BulkOut {}
+impl private::Sealed for InterruptIn {}
+
+impl EndpointKind for BulkIn {
+    const XFER_TYPE: u8 = bindings::USB_ENDPOINT_XFER_BULK as u8;
+    const DIR_IN: bool = true;
+
+    fn pipe<Ctx: device::DeviceContext>(dev: &Device<Ctx>, endpoint: &HostEndpoint) -> Pipe {
+        Pipe::new_receive_bulk_pipe(dev, endpoint)
+    }
+}
+
+impl EndpointKind for BulkOut {
+    const XFER_TYPE: u8 = bindings::USB_ENDPOINT_XFER_BULK as u8;
+    const DIR_IN: bool = false;
+
+    fn pipe<Ctx: device::DeviceContext>(dev: &Device<Ctx>, endpoint: &HostEndpoint) -> Pipe {
+        Pipe::new_send_bulk_pipe(dev, endpoint)
+    }
+}
+
+impl EndpointKind for InterruptIn {
+    const XFER_TYPE: u8 = bindings::USB_ENDPOINT_XFER_INT as u8;
+    const DIR_IN: bool = true;
+
+    fn pipe<Ctx: device::DeviceContext>(dev: &Device<Ctx>, endpoint: &HostEndpoint) -> Pipe {
+        Pipe::new_receive_int_pipe(dev, endpoint)
+    }
+}
+
+/// An endpoint of a USB interface, looked up in the interface's active alternate setting and
+/// checked to have the transfer type and direction named by `K`.
+///
+/// Because an [`Endpoint`] can only be produced by [`Interface::endpoint`], which validates it
+/// against the descriptor, a `&Endpoint<BulkOut>` is proof that the address really names a bulk
+/// OUT endpoint of that interface. Transfer methods take the correspondingly-typed endpoint, so
+/// the direction/type confusion possible with a bare `u8` address cannot occur.
+///
+/// # Invariants
+///
+/// `addr` is the `bEndpointAddress` of an endpoint that was present in the interface's active
+/// alternate setting, and whose direction and transfer type match `K`.
+pub struct Endpoint<K: EndpointKind> {
+    addr: u8,
+    max_packet: u16,
+    pipe: Pipe,
+    _kind: PhantomData<K>,
+}
+
+impl<K: EndpointKind> Endpoint<K> {
+    /// The endpoint's `bEndpointAddress`, including the direction bit.
+    pub fn address(&self) -> u8 {
+        self.addr
+    }
+
+    /// The endpoint's `wMaxPacketSize`.
+    pub fn max_packet_size(&self) -> u16 {
+        self.max_packet
+    }
+
+    fn pipe(&self) -> Pipe {
+        self.pipe
+    }
+}
+
+impl<K: EndpointKind> Clone for Endpoint<K> {
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl<K: EndpointKind> Copy for Endpoint<K> {}
+
+impl<Ctx: device::DeviceContext> Interface<Ctx> {
+    /// Looks `addr` up in this interface's active alternate setting and returns it as a typed
+    /// [`Endpoint`], provided its direction and transfer type match `K`.
+    ///
+    /// Returns [`ENODEV`] if the interface has no active alternate setting, [`ENOENT`] if no
+    /// endpoint with that address is present, and [`EINVAL`] if the endpoint exists but is of the
+    /// wrong direction or transfer type.
+    pub fn endpoint<K: EndpointKind>(&self, addr: u8) -> Result<Endpoint<K>> {
+        if self.number().is_none() {
+            return Err(ENODEV);
+        }
+        for endpoint in self.cur_altsetting().endpoints() {
+            let endpoint_addr = endpoint.endpoint_number()
+                | if endpoint.endpoint_dir() == Direction::In {
+                    bindings::USB_DIR_IN as u8
+                } else {
+                    0
+                };
+            if endpoint_addr != addr {
+                continue;
+            }
+
+            let is_in = endpoint.endpoint_dir() == Direction::In;
+            if is_in != K::DIR_IN || endpoint.endpoint_type() as u8 != K::XFER_TYPE {
+                return Err(EINVAL);
+            }
+
+            let dev: &Device<Ctx> = self.as_ref();
+            return Ok(Endpoint {
+                addr,
+                max_packet: endpoint.maxp(),
+                pipe: K::pipe(dev, endpoint),
+                _kind: PhantomData,
+            });
+        }
+
+        Err(ENOENT)
+    }
+}
+
+/// Converts a [`Delta`] into the whole-millisecond timeout the synchronous USB message helpers
+/// expect.
+///
+/// Those helpers treat `0` as "wait forever", so a caller who asks for a short-but-non-zero
+/// timeout must not have it silently truncated into an unbounded wait: any non-zero `timeout`
+/// below a millisecond is rounded *up* to 1 ms. Only an explicitly zero [`Delta`] means "wait
+/// indefinitely".
+fn timeout_millis(timeout: Delta) -> Result<kernel::ffi::c_int> {
+    let ms = timeout.as_millis();
+    if ms == 0 && !timeout.is_zero() {
+        return Ok(1);
+    }
+    Ok(ms.try_into()?)
+}
+
+/// A revocable window during which USB I/O is permitted on an interface.
+///
+/// A driver-`Bound` interface is *not* on its own proof that a transfer may be issued: the USB
+/// core forbids I/O outside the window that opens after a successful `probe()`/resume/reset-resume
+/// and must be closed again before `disconnect()`, `suspend()` or `pre_reset()` returns. This type
+/// represents exactly that narrower state.
+///
+/// The USB adapter owns one `IoWindow` for every successfully bound interface and passes a
+/// reference-counted handle to [`Driver::probe`]. Drivers take an [`Io`] token from it around every
+/// transfer. The adapter revokes the window and blocks until every outstanding token has been
+/// dropped before suspend, reset or disconnect completes.
+///
+/// Because [`Io`] borrows the window, and the transfer methods and queues live on [`Io`], a
+/// transfer cannot outlive the window that permitted it.
+///
+#[pin_data]
+pub struct IoWindow {
+    /// The interface I/O is permitted on. Holding a reference keeps the `struct usb_interface`
+    /// allocated; that it is still *bound* is what the open/closed state tracks.
+    interface: ARef<Interface>,
+    #[pin]
+    state: Mutex<IoState>,
+    #[pin]
+    idle: CondVar,
+}
+
+/// The mutable half of an [`IoWindow`].
+struct IoState {
+    /// Whether new [`Io`] tokens may still be handed out.
+    open: bool,
+    /// How many [`Io`] tokens are currently alive.
+    active: usize,
+}
+
+impl IoWindow {
+    /// Creates the open I/O window owned by the USB adapter.
+    fn new(interface: ARef<Interface>) -> impl PinInit<Self> {
+        pin_init!(Self {
+            interface,
+            state <- new_mutex!(IoState {
+                open: true,
+                active: 0,
+            }),
+            idle <- new_condvar!(),
+        })
+    }
+
+    /// Takes an [`Io`] token, proving that I/O is permitted for as long as the token is held.
+    ///
+    /// Returns [`ENODEV`] once the window has been closed.
+    pub fn enter(&self) -> Result<Io<'_>> {
+        let mut state = self.state.lock();
+        if !state.open {
+            return Err(ENODEV);
+        }
+        state.active = state.active.checked_add(1).ok_or(EOVERFLOW)?;
+        drop(state);
+
+        Ok(Io { window: self })
+    }
+
+    /// The interface this window permits I/O on.
+    pub fn interface(&self) -> &Interface {
+        &self.interface
+    }
+
+    /// Closes the window and waits until no I/O is in flight.
+    ///
+    /// New [`Io`] tokens are refused immediately, then the call blocks until the last outstanding
+    /// token has been dropped.
+    ///
+    /// This is idempotent and sleeps, so the adapter only calls it from process context.
+    fn close(&self) {
+        let mut state = self.state.lock();
+        state.open = false;
+
+        while state.active != 0 {
+            self.idle.wait(&mut state);
+        }
+    }
+
+    /// Reopens a window that was closed by a suspend or pre-reset.
+    ///
+    /// The adapter only calls this after the USB core has re-permitted I/O.
+    fn reopen(&self) {
+        self.state.lock().open = true;
+    }
+}
+
+/// Proof that USB I/O is currently permitted on an interface, and the handle through which every
+/// transfer is issued.
+///
+/// Obtained from [`IoWindow::enter`] and released when dropped; [`IoWindow::close`] blocks until
+/// every outstanding token is gone. Because the token borrows both the window and the interface,
+/// no transfer can outlive either.
+pub struct Io<'a> {
+    window: &'a IoWindow,
+}
+
+impl Drop for Io<'_> {
+    fn drop(&mut self) {
+        let mut state = self.window.state.lock();
+        state.active -= 1;
+        if state.active == 0 {
+            self.window.idle.notify_all();
+        }
+    }
+}
+
+impl<'a> Io<'a> {
+    /// The interface this token permits I/O on.
+    pub fn interface(&self) -> &Interface {
+        self.window.interface()
+    }
+
+    /// The `struct usb_device` that interface belongs to.
+    fn device(&self) -> *mut bindings::usb_device {
+        // SAFETY: the window holds a reference to a valid `struct usb_interface`, and
+        // `interface_to_usbdev()` returns its valid `struct usb_device`.
+        unsafe { bindings::interface_to_usbdev(self.window.interface.as_raw()) }
+    }
+
+    /// Clears a halt/stall on `endpoint`, resetting both the device-side stall and the host-side
+    /// data toggle. Sleeps.
+    pub fn clear_halt<K: EndpointKind>(&self, endpoint: &Endpoint<K>) -> Result {
+        let dev = self.device();
+
+        // SAFETY: `dev` is valid; `usb_clear_halt()` only issues a control request and updates
+        // host-side endpoint state.
+        to_result(unsafe { bindings::usb_clear_halt(dev, endpoint.pipe().0 as kernel::ffi::c_int) })
+    }
+
+    /// Issues a synchronous bulk OUT transfer of `data`, returning the number of bytes
+    /// transferred.
+    ///
+    /// `data` is copied into a kmalloc'd bounce buffer internally, so it need not be DMA-capable.
+    /// `gfp` selects that buffer's allocation flags: pass `GFP_KERNEL` normally, or `GFP_NOIO` on
+    /// a reset/resume or error-handling path. Sleeps.
+    pub fn bulk_send(
+        &self,
+        endpoint: &Endpoint<BulkOut>,
+        data: &[u8],
+        timeout: Delta,
+        gfp: Flags,
+    ) -> Result<usize> {
+        let mut actual: kernel::ffi::c_int = 0;
+        let millis = timeout_millis(timeout)?;
+
+        // `usb_bulk_msg()` DMAs straight from the buffer, and `data` may live on the stack or in
+        // `.rodata`, so bounce it through a kmalloc'd allocation.
+        let mut buf = KVec::with_capacity(data.len(), gfp)?;
+        buf.extend_from_slice(data, gfp)?;
+        let len = buf.len().try_into()?;
+
+        let dev = self.device();
+        // SAFETY: `dev` is valid; `buf` is a kmalloc'd buffer valid for reads of `len` bytes for
+        // the duration of the call; `actual` is a valid out-pointer.
+        to_result(unsafe {
+            bindings::usb_bulk_msg(
+                dev,
+                endpoint.pipe().0,
+                buf.as_mut_ptr().cast::<kernel::ffi::c_void>(),
+                len,
+                &mut actual,
+                millis,
+            )
+        })?;
+
+        Ok(actual as usize)
+    }
+
+    /// Issues a synchronous bulk IN transfer into `data`, returning the number of bytes received.
+    ///
+    /// The data is received into a kmalloc'd bounce buffer and copied out, so `data` need not be
+    /// DMA-capable. Sleeps.
+    pub fn bulk_recv(
+        &self,
+        endpoint: &Endpoint<BulkIn>,
+        data: &mut [u8],
+        timeout: Delta,
+        gfp: Flags,
+    ) -> Result<usize> {
+        let mut actual: kernel::ffi::c_int = 0;
+        let millis = timeout_millis(timeout)?;
+
+        let mut buf = KVec::from_elem(0u8, data.len(), gfp)?;
+        let len = buf.len().try_into()?;
+
+        let dev = self.device();
+        // SAFETY: `dev` is valid; `buf` is a kmalloc'd buffer valid for writes of `len` bytes for
+        // the duration of the call; `actual` is a valid out-pointer.
+        to_result(unsafe {
+            bindings::usb_bulk_msg(
+                dev,
+                endpoint.pipe().0,
+                buf.as_mut_ptr().cast::<kernel::ffi::c_void>(),
+                len,
+                &mut actual,
+                millis,
+            )
+        })?;
+
+        // `usb_bulk_msg()` never reports more than the requested length.
+        let n = (actual as usize).min(data.len());
+        data[..n].copy_from_slice(&buf[..n]);
+        Ok(n)
+    }
+
+    /// Issues a synchronous interrupt IN transfer into `data`, returning the number of bytes
+    /// received.
+    ///
+    /// As for [`bulk_recv`](Self::bulk_recv), the transfer is bounced through a kmalloc'd buffer.
+    /// Sleeps.
+    pub fn interrupt_recv(
+        &self,
+        endpoint: &Endpoint<InterruptIn>,
+        data: &mut [u8],
+        timeout: Delta,
+        gfp: Flags,
+    ) -> Result<usize> {
+        let mut actual: kernel::ffi::c_int = 0;
+        let millis = timeout_millis(timeout)?;
+
+        let mut buf = KVec::from_elem(0u8, data.len(), gfp)?;
+        let len = buf.len().try_into()?;
+
+        let dev = self.device();
+        // SAFETY: `dev` is valid; `buf` is a kmalloc'd buffer valid for writes of `len` bytes for
+        // the duration of the call; `actual` is a valid out-pointer.
+        to_result(unsafe {
+            bindings::usb_interrupt_msg(
+                dev,
+                endpoint.pipe().0,
+                buf.as_mut_ptr().cast::<kernel::ffi::c_void>(),
+                len,
+                &mut actual,
+                millis,
+            )
+        })?;
+
+        let n = (actual as usize).min(data.len());
+        data[..n].copy_from_slice(&buf[..n]);
+        Ok(n)
+    }
+
+    /// Issues a synchronous control OUT transfer on the default control endpoint.
+    ///
+    /// `request`, `request_type`, `value` and `index` are the `bRequest`, `bmRequestType`,
+    /// `wValue` and `wIndex` setup fields. The buffer is copied internally, so `data` need not be
+    /// DMA-capable. Sleeps.
+    pub fn control_send(
+        &self,
+        request: u8,
+        request_type: u8,
+        value: u16,
+        index: u16,
+        data: &[u8],
+        timeout: Delta,
+        gfp: Flags,
+    ) -> Result {
+        let millis = timeout_millis(timeout)?;
+        let len = data.len().try_into()?;
+
+        // SAFETY: `self.device()` is valid; `data` is valid for reads of `len` bytes and
+        // `usb_control_msg_send()` copies out of it before returning.
+        to_result(unsafe {
+            bindings::usb_control_msg_send(
+                self.device(),
+                0,
+                request,
+                request_type,
+                value,
+                index,
+                data.as_ptr().cast::<kernel::ffi::c_void>(),
+                len,
+                millis,
+                gfp.as_raw(),
+            )
+        })
+    }
+
+    /// Issues a synchronous control IN transfer on the default control endpoint, filling `data`
+    /// with exactly `data.len()` bytes.
+    ///
+    /// The transfer fails if the device returns fewer bytes than requested. Sleeps.
+    pub fn control_recv(
+        &self,
+        request: u8,
+        request_type: u8,
+        value: u16,
+        index: u16,
+        data: &mut [u8],
+        timeout: Delta,
+        gfp: Flags,
+    ) -> Result {
+        let millis = timeout_millis(timeout)?;
+        let len = data.len().try_into()?;
+
+        // SAFETY: `self.device()` is valid; `data` is valid for writes of `len` bytes and
+        // `usb_control_msg_recv()` copies into it before returning.
+        to_result(unsafe {
+            bindings::usb_control_msg_recv(
+                self.device(),
+                0,
+                request,
+                request_type,
+                value,
+                index,
+                data.as_mut_ptr().cast::<kernel::ffi::c_void>(),
+                len,
+                millis,
+                gfp.as_raw(),
+            )
+        })
+    }
+
+    /// Selects alternate setting `alternate` of *this* interface (`SET_INTERFACE`).
+    ///
+    /// Unlike a device-wide `set_interface()`, this can only ever retarget the interface the
+    /// driver is bound to: the interface number comes from the bound interface itself, not from
+    /// the caller, so a driver cannot disturb a sibling interface of a composite device. Sleeps.
+    pub fn set_alternate_setting(&self, alternate: u8) -> Result {
+        let number = self.window.interface.number().ok_or(ENODEV)?;
+
+        // SAFETY: `self.device()` is a valid `struct usb_device`, and `number` is the number of
+        // one of its interfaces -- the one this driver is bound to.
+        to_result(unsafe {
+            bindings::usb_set_interface(self.device(), number.into(), alternate.into())
+        })
+    }
+}
+
 // SAFETY: `usb::Interface` is a transparent wrapper of `struct usb_interface`.
 // The offset is guaranteed to point to a valid device field inside `usb::Interface`.
 unsafe impl<Ctx: device::DeviceContext> device::AsBusDevice<Ctx> for Interface<Ctx> {
@@ -634,17 +1347,20 @@ pub enum TransferFlag {
 
 impl Pipe {
     /// Create a host-to-device (OUT) control pipe (endpoint 0).
-    pub fn new_send_control_pipe(dev: &Device) -> Self {
+    pub fn new_send_control_pipe<Ctx: device::DeviceContext>(dev: &Device<Ctx>) -> Self {
         Self(bindings::PIPE_CONTROL << 30 | dev.devnum() << 8)
     }
 
     /// Create a device-to-host (IN) control pipe (endpoint 0).
-    pub fn new_receive_control_pipe(dev: &Device) -> Self {
+    pub fn new_receive_control_pipe<Ctx: device::DeviceContext>(dev: &Device<Ctx>) -> Self {
         Self(bindings::PIPE_CONTROL << 30 | dev.devnum() << 8 | bindings::USB_DIR_IN)
     }
 
     /// Create a device-to-host (IN) isochronous pipe.
-    pub fn new_receive_isoc_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
+    pub fn new_receive_isoc_pipe<Ctx: device::DeviceContext>(
+        dev: &Device<Ctx>,
+        endpoint: &HostEndpoint,
+    ) -> Self {
         Self(
             bindings::PIPE_ISOCHRONOUS << 30
                 | dev.devnum() << 8
@@ -654,7 +1370,10 @@ pub fn new_receive_isoc_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
     }
 
     /// Create a host-to-device (OUT) isochronous pipe.
-    pub fn new_send_isoc_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
+    pub fn new_send_isoc_pipe<Ctx: device::DeviceContext>(
+        dev: &Device<Ctx>,
+        endpoint: &HostEndpoint,
+    ) -> Self {
         Self(
             bindings::PIPE_ISOCHRONOUS << 30
                 | dev.devnum() << 8
@@ -663,7 +1382,10 @@ pub fn new_send_isoc_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
     }
 
     /// Create a host-to-device (OUT) bulk pipe.
-    pub fn new_send_bulk_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
+    pub fn new_send_bulk_pipe<Ctx: device::DeviceContext>(
+        dev: &Device<Ctx>,
+        endpoint: &HostEndpoint,
+    ) -> Self {
         Self(
             bindings::PIPE_BULK << 30
                 | dev.devnum() << 8
@@ -672,7 +1394,10 @@ pub fn new_send_bulk_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
     }
 
     /// Create a device-to-host (IN) bulk pipe.
-    pub fn new_receive_bulk_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
+    pub fn new_receive_bulk_pipe<Ctx: device::DeviceContext>(
+        dev: &Device<Ctx>,
+        endpoint: &HostEndpoint,
+    ) -> Self {
         Self(
             bindings::PIPE_BULK << 30
                 | dev.devnum() << 8
@@ -682,7 +1407,10 @@ pub fn new_receive_bulk_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
     }
 
     /// Create a host-to-device (OUT) interrupt pipe.
-    pub fn new_send_int_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
+    pub fn new_send_int_pipe<Ctx: device::DeviceContext>(
+        dev: &Device<Ctx>,
+        endpoint: &HostEndpoint,
+    ) -> Self {
         Self(
             bindings::PIPE_INTERRUPT << 30
                 | dev.devnum() << 8
@@ -691,7 +1419,10 @@ pub fn new_send_int_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
     }
 
     /// Create a device-to-host (IN) interrupt pipe.
-    pub fn new_receive_int_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
+    pub fn new_receive_int_pipe<Ctx: device::DeviceContext>(
+        dev: &Device<Ctx>,
+        endpoint: &HostEndpoint,
+    ) -> Self {
         Self(
             bindings::PIPE_INTERRUPT << 30
                 | dev.devnum() << 8
diff --git a/samples/rust/rust_driver_usb.rs b/samples/rust/rust_driver_usb.rs
index 02bd5085f9bc..0f5fb8392149 100644
--- a/samples/rust/rust_driver_usb.rs
+++ b/samples/rust/rust_driver_usb.rs
@@ -9,7 +9,10 @@
         Core, //
     },
     prelude::*,
-    sync::aref::ARef,
+    sync::{
+        aref::ARef,
+        Arc, //
+    },
     usb, //
 };
 
@@ -33,6 +36,7 @@ fn probe<'bound>(
         intf: &'bound usb::Interface<Core<'_>>,
         _id: &usb::DeviceId,
         _info: &'bound Self::IdInfo,
+        _io: Arc<usb::IoWindow>,
     ) -> impl PinInit<Self, Error> + 'bound {
         let dev: &device::Device<Core<'_>> = intf.as_ref();
         dev_info!(dev, "Rust USB driver sample probed\n");
