Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AEAC7EE2E
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 07:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjFJHWz (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 03:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjFJHWy (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 03:22:54 -0400
X-Greylist: delayed 158 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 10 Jun 2023 00:22:52 PDT
Received: from a27-42.smtp-out.us-west-2.amazonses.com (a27-42.smtp-out.us-west-2.amazonses.com [54.240.27.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A58FD3AA4
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 00:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686381614;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=IZzTUEgUhgRzD1gGAH1ZGaKE6W2za/HtxaY4p0chn1Y=;
        b=b4fENgTsd8/VIpcrx5IwRCyututo/V5cOwvKan8MK2b5DdNblQHq1EDIlj1U9rPk
        2I6KlKoE01SP0BjEzMob/YK38a7sftqqucxo/EUOXt+Sy4EZplxaZJVBasXJJaWxmHp
        8iaTKZ+Lfucdp0WGTD+7/3dAiB7d8khREvkpU7802w1J5dUmSh/EwC376H5uSh6d8tk
        WUOgvzkQeAW6iobtZDwM6/CsAj6DK8cNRpJi1Lp2FCoBOa9m+VERabPmDBmnOIGm4kM
        +7C5alyBAQqcSSneU3Q5pLc52HL+XAxlWKiCojsLexY+x4KTIezRHDCSb5+hyMqvErW
        5VX48Xn7tA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686381614;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=IZzTUEgUhgRzD1gGAH1ZGaKE6W2za/HtxaY4p0chn1Y=;
        b=byty2TqFKPL7NCNEsrsTNQqkaPzAZ8/bmt+8ZivYziejHdfvla/3PHPssvKg8lqd
        fBNXYN4kY9mipSky7nTyW7ijfRZdyJZSxtYZBCJmnyptppP9ZbwtBbTyv8XjI8Rts7E
        4uoEmsu5Pb5W/1jK289lnTQSgSQGPCkiSTixOVaI=
From:   FUJITA Tomonori <tomo@exabit.dev>
To:     rust-for-linux@vger.kernel.org
Cc:     aliceryhl@google.com, andrew@lunn.ch,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v2 1/5] rust: core abstractions for network device drivers
Date:   Sat, 10 Jun 2023 07:20:13 +0000
Message-ID: <01010188a42d5319-9cd7b5ec-5b06-4d08-88cb-c2a82a8e3a0d-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230610071848.3722492-1-tomo@exabit.dev>
References: <20230610071848.3722492-1-tomo@exabit.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.10-54.240.27.42
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

This patch adds very basic abstractions to implement network device
drivers, corresponds to the kernel's net_device and net_device_ops
structs with support for register_netdev/unregister_netdev functions.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/bindings/bindings_helper.h |   2 +
 rust/helpers.c                  |  16 ++
 rust/kernel/lib.rs              |   3 +
 rust/kernel/net.rs              |   5 +
 rust/kernel/net/dev.rs          | 292 ++++++++++++++++++++++++++++++++
 5 files changed, 318 insertions(+)
 create mode 100644 rust/kernel/net.rs
 create mode 100644 rust/kernel/net/dev.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 50e7a76d5455..e3ebaaf9ab4f 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,6 +6,8 @@
  * Sorted alphabetically.
  */
 
+#include <linux/etherdevice.h>
+#include <linux/netdevice.h>
 #include <linux/slab.h>
 #include <linux/refcount.h>
 #include <linux/wait.h>
diff --git a/rust/helpers.c b/rust/helpers.c
index 81e80261d597..a91d2a99035b 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -23,10 +23,26 @@
 #include <linux/err.h>
 #include <linux/refcount.h>
 #include <linux/mutex.h>
+#include <linux/netdevice.h>
+#include <linux/skbuff.h>
 #include <linux/spinlock.h>
 #include <linux/sched/signal.h>
 #include <linux/wait.h>
 
+#ifdef CONFIG_NET
+void *rust_helper_netdev_priv(const struct net_device *dev)
+{
+	return netdev_priv(dev);
+}
+EXPORT_SYMBOL_GPL(rust_helper_netdev_priv);
+
+void rust_helper_skb_tx_timestamp(struct sk_buff *skb)
+{
+	skb_tx_timestamp(skb);
+}
+EXPORT_SYMBOL_GPL(rust_helper_skb_tx_timestamp);
+#endif
+
 __noreturn void rust_helper_BUG(void)
 {
 	BUG();
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 85b261209977..fc7d048d359d 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -13,6 +13,7 @@
 
 #![no_std]
 #![feature(allocator_api)]
+#![feature(const_maybe_uninit_zeroed)]
 #![feature(coerce_unsized)]
 #![feature(dispatch_from_dyn)]
 #![feature(new_uninit)]
@@ -34,6 +35,8 @@
 pub mod error;
 pub mod init;
 pub mod ioctl;
+#[cfg(CONFIG_NET)]
+pub mod net;
 pub mod prelude;
 pub mod print;
 mod static_assert;
diff --git a/rust/kernel/net.rs b/rust/kernel/net.rs
new file mode 100644
index 000000000000..28fe8f398463
--- /dev/null
+++ b/rust/kernel/net.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Networking core.
+
+pub mod dev;
diff --git a/rust/kernel/net/dev.rs b/rust/kernel/net/dev.rs
new file mode 100644
index 000000000000..407d7d5bff2c
--- /dev/null
+++ b/rust/kernel/net/dev.rs
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Network device.
+//!
+//! C headers: [`include/linux/etherdevice.h`](../../../../include/linux/etherdevice.h),
+//! [`include/linux/ethtool.h`](../../../../include/linux/ethtool.h),
+//! [`include/linux/netdevice.h`](../../../../include/linux/netdevice.h),
+//! [`include/linux/skbuff.h`](../../../../include/linux/skbuff.h),
+//! [`include/uapi/linux/if_link.h`](../../../../include/uapi/linux/if_link.h).
+
+use crate::{bindings, error::*, prelude::vtable, types::ForeignOwnable};
+use {core::ffi::c_void, core::marker::PhantomData};
+
+/// Corresponds to the kernel's `struct net_device`.
+///
+/// # Safety
+///
+/// The kernel uses a `net_device` object with various functions like `struct net_device_ops`.
+/// This object is passed to Rust callbacks while these functions are running.
+/// The C API guarantees that `net_device` isn't released while this function is running.
+pub struct Device(*mut bindings::net_device);
+
+impl Device {
+    /// Gets a pointer to network device private data.
+    ///
+    /// A driver in C uses contiguous memory `struct net_device` and its private data.
+    /// A driver in Rust contiguous memory `struct net_device` and a pointer to its private data.
+    /// So a driver in Rust pays extra cost to access to its private data.
+    /// A device driver passes an properly initialized private data and the kernel saves its pointer.
+    fn priv_data_ptr(netdev: *mut bindings::net_device) -> *const c_void {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe { core::ptr::read(bindings::netdev_priv(&mut *netdev) as *const *const c_void) }
+    }
+}
+
+// SAFETY: `Device` exposes the state, `D::Data` object across threads
+// but that type is required to be Send and Sync.
+unsafe impl Send for Device {}
+unsafe impl Sync for Device {}
+
+/// Trait for device driver specific information.
+///
+/// This data structure is passed to a driver with the operations for `struct net_device`
+/// like `struct net_device_ops`, `struct ethtool_ops`, `struct rtnl_link_ops`, etc.
+pub trait DriverData {
+    /// The object are stored in C object, `struct net_device`.
+    type Data: ForeignOwnable + Send + Sync;
+}
+
+/// Registration structure for a network device driver.
+///
+/// This allocates and owns a `struct net_device` object.
+/// Once the `net_device` object is registered via `register_netdev` function,
+/// the kernel calls various functions such as `struct net_device_ops` operations with
+/// the `net_device` object.
+///
+/// A driver must implement `struct net_device_ops` so the trait for it is tied.
+/// Other operations like `struct ethtool_ops` are optional.
+///
+/// # Safety
+///
+/// The pointer to the `net_device` object is guaranteed to be valid until
+/// the registration object is dropped.
+pub struct Registration<T: DeviceOperations<D>, D: DriverData> {
+    dev: Device,
+    is_registered: bool,
+    _p: PhantomData<(D, T)>,
+}
+
+impl<D: DriverData, T: DeviceOperations<D>> Drop for Registration<T, D> {
+    fn drop(&mut self) {
+        // SAFETY: `dev` was allocated during initialization and guaranteed to be valid.
+        unsafe {
+            if self.is_registered {
+                bindings::unregister_netdev(self.dev.0);
+            }
+            let _ = D::Data::from_foreign(Device::priv_data_ptr(self.dev.0));
+            bindings::free_netdev(self.dev.0);
+        }
+    }
+}
+
+impl<D: DriverData, T: DeviceOperations<D>> Registration<T, D> {
+    /// Creates new instance of registration.
+    pub fn try_new(tx_queue_size: u32, rx_queue_size: u32, data: D::Data) -> Result<Self> {
+        // SAFETY: FFI call.
+        let ptr = from_err_ptr(unsafe {
+            bindings::alloc_etherdev_mqs(
+                core::mem::size_of::<*const c_void>() as i32,
+                tx_queue_size,
+                rx_queue_size,
+            )
+        })?;
+
+        // SAFETY: the kernel allocated the space for a pointer.
+        unsafe {
+            let priv_ptr = bindings::netdev_priv(ptr) as *mut *const c_void;
+            core::ptr::write(priv_ptr, data.into_foreign());
+        }
+        Ok(Registration {
+            dev: Device(ptr),
+            is_registered: false,
+            _p: PhantomData,
+        })
+    }
+
+    /// Returns a network device.
+    ///
+    /// A device driver normally configures the device before registration.
+    pub fn dev_get(&mut self) -> &mut Device {
+        &mut self.dev
+    }
+
+    /// Registers a network device.
+    pub fn register(&mut self) -> Result {
+        if self.is_registered {
+            return Err(code::EINVAL);
+        }
+        // SAFETY: `dev` was allocated during initialization and is guaranteed to be valid.
+        let ret = unsafe {
+            (*self.dev.0).netdev_ops = Self::build_device_ops();
+            bindings::register_netdev(self.dev.0)
+        };
+        if ret != 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            self.is_registered = true;
+            Ok(())
+        }
+    }
+
+    const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
+        ndo_init: if <T>::HAS_INIT {
+            Some(Self::init_callback)
+        } else {
+            None
+        },
+        ndo_uninit: if <T>::HAS_UNINIT {
+            Some(Self::uninit_callback)
+        } else {
+            None
+        },
+        ndo_open: if <T>::HAS_OPEN {
+            Some(Self::open_callback)
+        } else {
+            None
+        },
+        ndo_stop: if <T>::HAS_STOP {
+            Some(Self::stop_callback)
+        } else {
+            None
+        },
+        ndo_start_xmit: if <T>::HAS_START_XMIT {
+            Some(Self::start_xmit_callback)
+        } else {
+            None
+        },
+        ..unsafe { core::mem::MaybeUninit::<bindings::net_device_ops>::zeroed().assume_init() }
+    };
+
+    const fn build_device_ops() -> &'static bindings::net_device_ops {
+        &Self::DEVICE_OPS
+    }
+
+    unsafe extern "C" fn init_callback(netdev: *mut bindings::net_device) -> core::ffi::c_int {
+        from_result(|| {
+            // SAFETY: The C API guarantees that `net_device` isn't released while this function is running.
+            let data = unsafe { D::Data::borrow(Device::priv_data_ptr(netdev)) };
+            let mut dev = Device(netdev);
+            T::init(&mut dev, data)?;
+            Ok(0)
+        })
+    }
+
+    unsafe extern "C" fn uninit_callback(netdev: *mut bindings::net_device) {
+        // SAFETY: The C API guarantees that `net_device` isn't released while this function is running.
+        let data = unsafe { D::Data::borrow(Device::priv_data_ptr(netdev)) };
+        let mut dev = Device(netdev);
+        T::uninit(&mut dev, data);
+    }
+
+    unsafe extern "C" fn open_callback(netdev: *mut bindings::net_device) -> core::ffi::c_int {
+        from_result(|| {
+            // SAFETY: The C API guarantees that `net_device` isn't released while this function is running.
+            let data = unsafe { D::Data::borrow(Device::priv_data_ptr(netdev)) };
+            let mut dev = Device(netdev);
+            T::open(&mut dev, data)?;
+            Ok(0)
+        })
+    }
+
+    unsafe extern "C" fn stop_callback(netdev: *mut bindings::net_device) -> core::ffi::c_int {
+        from_result(|| {
+            // SAFETY: The C API guarantees that `net_device` isn't released while this function is running.
+            let data = unsafe { D::Data::borrow(Device::priv_data_ptr(netdev)) };
+            let mut dev = Device(netdev);
+            T::stop(&mut dev, data)?;
+            Ok(0)
+        })
+    }
+
+    unsafe extern "C" fn start_xmit_callback(
+        skb: *mut bindings::sk_buff,
+        netdev: *mut bindings::net_device,
+    ) -> bindings::netdev_tx_t {
+        // SAFETY: The C API guarantees that `net_device` isn't released while this function is running.
+        let mut dev = Device(netdev);
+        let data = unsafe { D::Data::borrow(Device::priv_data_ptr(netdev)) };
+        // SAFETY: The C API guarantees that `sk_buff` isn't released while this function is running.
+        let skb = SkBuff(skb);
+        T::start_xmit(&mut dev, data, skb) as bindings::netdev_tx_t
+    }
+}
+
+// SAFETY: `Registration` exposes its state, `D::Data` object across threads
+// but that type is required to be Send and Sync.
+unsafe impl<D: DriverData, T: DeviceOperations<D>> Send for Registration<T, D> {}
+unsafe impl<D: DriverData, T: DeviceOperations<D>> Sync for Registration<T, D> {}
+
+/// Corresponds to the kernel's `enum netdev_tx`.
+#[repr(i32)]
+pub enum TxCode {
+    /// Driver took care of packet.
+    Ok = bindings::netdev_tx_NETDEV_TX_OK,
+    /// Driver tx path was busy.
+    Busy = bindings::netdev_tx_NETDEV_TX_BUSY,
+}
+
+/// Corresponds to the kernel's `struct net_device_ops`.
+///
+/// A device driver must implement this. Only very basic operations are supported for now.
+#[vtable]
+pub trait DeviceOperations<D: DriverData> {
+    /// Corresponds to `ndo_init` in `struct net_device_ops`.
+    fn init(_dev: &mut Device, _data: <D::Data as ForeignOwnable>::Borrowed<'_>) -> Result {
+        Ok(())
+    }
+
+    /// Corresponds to `ndo_uninit` in `struct net_device_ops`.
+    fn uninit(_dev: &mut Device, _data: <D::Data as ForeignOwnable>::Borrowed<'_>) {}
+
+    /// Corresponds to `ndo_open` in `struct net_device_ops`.
+    fn open(_dev: &mut Device, _data: <D::Data as ForeignOwnable>::Borrowed<'_>) -> Result {
+        Ok(())
+    }
+
+    /// Corresponds to `ndo_stop` in `struct net_device_ops`.
+    fn stop(_dev: &mut Device, _data: <D::Data as ForeignOwnable>::Borrowed<'_>) -> Result {
+        Ok(())
+    }
+
+    /// Corresponds to `ndo_start_xmit` in `struct net_device_ops`.
+    fn start_xmit(
+        _dev: &mut Device,
+        _data: <D::Data as ForeignOwnable>::Borrowed<'_>,
+        _skb: SkBuff,
+    ) -> TxCode {
+        TxCode::Busy
+    }
+}
+
+/// Corresponds to the kernel's `struct sk_buff`.
+///
+/// A driver manages `struct sk_buff` in two ways. In both ways, the ownership is transferred
+/// between C and Rust. The allocation and release are done asymmetrically.
+///
+/// On the tx side (`ndo_start_xmit` operation in `struct net_device_ops`), the kernel allocates
+/// a `sk_buff' object and passes it to the driver. The driver is responsible for the release after transmission.
+/// On the rx side, the driver allocates a `sk_buff` object then passes it to the kernel after receiving data.
+pub struct SkBuff(*mut bindings::sk_buff);
+
+impl SkBuff {
+    /// Provides a time stamp.
+    pub fn tx_timestamp(&mut self) {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe {
+            bindings::skb_tx_timestamp(self.0);
+        }
+    }
+}
+
+impl Drop for SkBuff {
+    fn drop(&mut self) {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe {
+            bindings::kfree_skb_reason(
+                self.0,
+                bindings::skb_drop_reason_SKB_DROP_REASON_NOT_SPECIFIED,
+            )
+        }
+    }
+}
-- 
2.34.1

