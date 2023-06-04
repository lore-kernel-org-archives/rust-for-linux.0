Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B852BC77B73
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jun 2023 02:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjFDCWl (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 3 Jun 2023 22:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjFDCWl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 3 Jun 2023 22:22:41 -0400
X-Greylist: delayed 285 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 03 Jun 2023 19:22:38 PDT
Received: from a27-27.smtp-out.us-west-2.amazonses.com (a27-27.smtp-out.us-west-2.amazonses.com [54.240.27.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2413DD
        for <rust-for-linux@vger.kernel.org>; Sat,  3 Jun 2023 19:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1685845072;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=H+7AimWp3hiwUftZ4hF5S+zVeaVE0m3KTlQhzLFBKvw=;
        b=jTCb9PWAxenS8XaONteztjM+63TSSLFzMUPB51XCMWYwJYPSrgdl0Kp535w8vqks
        eN7GdlwAw5C1uv3NMaf4K5x2UhnoQ3Js4yBMWOEWjB955Os3jBm714HoFrVfbeTKavj
        dL3Q7wwAS88PNxBzHue4+ep/3XFYx1eWtgyfKy6CxbdbEHlZ6yQt/34enoAJ7P5dSND
        d1OI7eY6BnlB30xGfMCTXErNl7JRFDBmVTvQtpu/1g/yW7c8RLP8vrOXOb9CpZSzHeK
        ybsq9rdDN8XzBYswFs3ePZdd3ByLhiwanIqx3y+LvehY47NCxLkBu21LTGGOdCaiFhr
        AXYblCqkMA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685845072;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=H+7AimWp3hiwUftZ4hF5S+zVeaVE0m3KTlQhzLFBKvw=;
        b=CRuODV2NuJCHFIQKwTsFnPzn4ylBPxHI95L/2ykGvjwRyWj2xWhbnI+BSZGa9zLZ
        NHK5NS3dtFyFKUtYDc2/Q7idzQRh/XEwe+SjruyD2KkqLqB2VbuSV/ENYbt7vJw9B3q
        sYWByZ+CvSYPBm7MRo9hgZJnVuYy91bu3U+P0azs=
From:   FUJITA Tomonori <tomo@exabit.dev>
To:     rust-for-linux@vger.kernel.org
Cc:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 1/5] rust: core abstractions for network device drivers
Date:   Sun, 4 Jun 2023 02:17:52 +0000
Message-ID: <01010188843259bd-eaff4dc9-c029-4da4-8c5b-2489fd34ffdf-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604021736.3392963-1-tomo@exabit.dev>
References: <20230604021736.3392963-1-tomo@exabit.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.04-54.240.27.27
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
 rust/kernel/lib.rs              |   2 +
 rust/kernel/net.rs              |   5 +
 rust/kernel/net/dev.rs          | 380 ++++++++++++++++++++++++++++++++
 5 files changed, 405 insertions(+)
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
index 85b261209977..8e6926d965e1 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -34,6 +34,8 @@
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
index 000000000000..0ef8a78ad0bf
--- /dev/null
+++ b/rust/kernel/net/dev.rs
@@ -0,0 +1,380 @@
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
+use core::marker::PhantomData;
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
+    fn priv_data_ptr(netdev: *mut bindings::net_device) -> *const core::ffi::c_void {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe { *(bindings::netdev_priv(&mut *netdev) as *const usize) as _ }
+    }
+}
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
+        match from_err_ptr(unsafe {
+            bindings::alloc_etherdev_mqs(
+                core::mem::size_of::<*const core::ffi::c_void>() as i32,
+                tx_queue_size,
+                rx_queue_size,
+            )
+        }) {
+            Ok(ptr) => {
+                // SAFETY: the kernel allocated the space for a pointer.
+                unsafe {
+                    let priv_ptr = bindings::netdev_priv(ptr) as *mut usize;
+                    core::ptr::write(priv_ptr, data.into_foreign() as usize);
+                }
+                Ok(Registration {
+                    dev: Device(ptr),
+                    is_registered: false,
+                    _p: PhantomData,
+                })
+            }
+            Err(err) => Err(err),
+        }
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
+        ndo_features_check: None,
+        ndo_select_queue: None,
+        ndo_change_rx_flags: None,
+        ndo_set_rx_mode: None,
+        ndo_set_mac_address: None,
+        ndo_validate_addr: None,
+        ndo_do_ioctl: None,
+        ndo_eth_ioctl: None,
+        ndo_siocbond: None,
+        ndo_siocwandev: None,
+        ndo_siocdevprivate: None,
+        ndo_set_config: None,
+        ndo_change_mtu: None,
+        ndo_neigh_setup: None,
+        ndo_tx_timeout: None,
+        ndo_get_stats64: None,
+        ndo_has_offload_stats: None,
+        ndo_get_offload_stats: None,
+        ndo_get_stats: None,
+        ndo_vlan_rx_add_vid: None,
+        ndo_vlan_rx_kill_vid: None,
+        #[cfg(CONFIG_NET_POLL_CONTROLLER)]
+        ndo_poll_controller: None,
+        #[cfg(CONFIG_NET_POLL_CONTROLLER)]
+        ndo_netpoll_setup: None,
+        #[cfg(CONFIG_NET_POLL_CONTROLLER)]
+        ndo_netpoll_cleanup: None,
+        ndo_set_vf_mac: None,
+        ndo_set_vf_vlan: None,
+        ndo_set_vf_rate: None,
+        ndo_set_vf_spoofchk: None,
+        ndo_set_vf_trust: None,
+        ndo_get_vf_config: None,
+        ndo_set_vf_link_state: None,
+        ndo_get_vf_stats: None,
+        ndo_set_vf_port: None,
+        ndo_get_vf_port: None,
+        ndo_get_vf_guid: None,
+        ndo_set_vf_guid: None,
+        ndo_set_vf_rss_query_en: None,
+        ndo_setup_tc: None,
+        #[cfg(CONFIG_FCOE)]
+        ndo_fcoe_enable: None,
+        #[cfg(CONFIG_FCOE)]
+        ndo_fcoe_disable: None,
+        #[cfg(CONFIG_FCOE)]
+        ndo_fcoe_ddp_setup: None,
+        #[cfg(CONFIG_FCOE)]
+        ndo_fcoe_ddp_done: None,
+        #[cfg(CONFIG_FCOE)]
+        ndo_fcoe_ddp_target: None,
+        #[cfg(CONFIG_FCOE)]
+        ndo_fcoe_get_hbainfo: None,
+        #[cfg(CONFIG_FCOE)]
+        ndo_fcoe_get_wwn: None,
+        #[cfg(CONFIG_RFS_ACCEL)]
+        ndo_rx_flow_steer: None,
+        ndo_add_slave: None,
+        ndo_del_slave: None,
+        ndo_get_xmit_slave: None,
+        ndo_sk_get_lower_dev: None,
+        ndo_fix_features: None,
+        ndo_set_features: None,
+        ndo_neigh_construct: None,
+        ndo_neigh_destroy: None,
+        ndo_fdb_add: None,
+        ndo_fdb_del: None,
+        ndo_fdb_del_bulk: None,
+        ndo_fdb_dump: None,
+        ndo_fdb_get: None,
+        ndo_mdb_add: None,
+        ndo_mdb_del: None,
+        ndo_mdb_dump: None,
+        ndo_bridge_setlink: None,
+        ndo_bridge_getlink: None,
+        ndo_bridge_dellink: None,
+        ndo_change_carrier: None,
+        ndo_get_phys_port_id: None,
+        ndo_get_port_parent_id: None,
+        ndo_get_phys_port_name: None,
+        ndo_dfwd_add_station: None,
+        ndo_dfwd_del_station: None,
+        ndo_set_tx_maxrate: None,
+        ndo_get_iflink: None,
+        ndo_fill_metadata_dst: None,
+        ndo_set_rx_headroom: None,
+        ndo_bpf: None,
+        ndo_xdp_xmit: None,
+        ndo_xdp_get_xmit_slave: None,
+        ndo_xsk_wakeup: None,
+        ndo_tunnel_ctl: None,
+        ndo_get_peer_dev: None,
+        ndo_fill_forward_path: None,
+        ndo_get_tstamp: None,
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
+// SAFETY: `Registration` does not expose any of its state across threads.
+unsafe impl<D: DriverData, T: DeviceOperations<D>> Sync for Registration<T, D> {}
+// SAFETY: `Registration` is not restricted to a single thread,
+unsafe impl<D: DriverData, T: DeviceOperations<D>> Send for Registration<T, D> {}
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

