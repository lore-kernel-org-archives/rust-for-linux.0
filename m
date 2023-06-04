Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B58C77B73
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jun 2023 02:25:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjFDCZG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 3 Jun 2023 22:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjFDCZF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 3 Jun 2023 22:25:05 -0400
X-Greylist: delayed 430 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 03 Jun 2023 19:25:04 PDT
Received: from a27-52.smtp-out.us-west-2.amazonses.com (a27-52.smtp-out.us-west-2.amazonses.com [54.240.27.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A919DF
        for <rust-for-linux@vger.kernel.org>; Sat,  3 Jun 2023 19:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1685845072;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=KPLUw5TMfdAD9YUCvYslvfi+ekQGKptNkkbJdL4/iXk=;
        b=kNnW667Gx36qnbu90tArDyMEDp2T1FkZLaxU2kx+9dKE5UGDWokpK+Z1wPR8+by9
        Jccy08HZhNbin1Tr2TP71USl1GC8UTPydhbBJSwEx02NalhylVNgBg1KevUSPwZXhnT
        Y3nVfKwgAJnkaOlJHC1mFY5XSfGriqYesinSzXtIUE3VslsP4sTlO0wNR1jMPMotVoL
        68N0JxdDlErXccRe6S3Y/7N5tpErIk/cJdPvjoNI+j1OejjtxsRz3mz4xQ7oOrearkR
        iQDwBx0DQw/eHQO5ZOzo4bsvx47/D5sG4AI0/XP2JBUoAEAQENjM9EuWYwM1kyuAXF6
        S/w/K9Megg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685845072;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=KPLUw5TMfdAD9YUCvYslvfi+ekQGKptNkkbJdL4/iXk=;
        b=Fds3Xc6OCnBxp1kIlXzm8mfh7omvW/axYRSqZGSe1iuWiI9o3CBmEw9zBt0tqF7s
        bFGcPlDBSZmouROymAGG+pGxYIZ3I/manWBZM52FlUxd1tK6MgxzudSBUmA6dSEEPjz
        IRukj7hye/3H/WBbR6qE/r/7KsVuYkD2GAu2rZis=
From:   FUJITA Tomonori <tomo@exabit.dev>
To:     rust-for-linux@vger.kernel.org
Cc:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 2/5] rust: add support for ethernet operations
Date:   Sun, 4 Jun 2023 02:17:52 +0000
Message-ID: <0101018884325a5f-da4bd02e-aab8-40f5-8812-3fce5cff34ae-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604021736.3392963-1-tomo@exabit.dev>
References: <20230604021736.3392963-1-tomo@exabit.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.04-54.240.27.52
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

This improves abstractions for network device drivers to implement
struct ethtool_ops, the majority of ethernet device drivers need to
do.

struct ethtool_ops also needs to access to device private data like
struct net_devicve_ops.

Currently, only get_ts_info operation is supported. The following
patch adds the Rust version of the dummy network driver thats uses the
feature.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/net/dev.rs          | 163 ++++++++++++++++++++++++++++++++
 2 files changed, 164 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index e3ebaaf9ab4f..71db7ab4d92d 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -7,6 +7,7 @@
  */
 
 #include <linux/etherdevice.h>
+#include <linux/ethtool.h>
 #include <linux/netdevice.h>
 #include <linux/slab.h>
 #include <linux/refcount.h>
diff --git a/rust/kernel/net/dev.rs b/rust/kernel/net/dev.rs
index 0ef8a78ad0bf..535b0e6f6424 100644
--- a/rust/kernel/net/dev.rs
+++ b/rust/kernel/net/dev.rs
@@ -124,6 +124,19 @@ pub fn register(&mut self) -> Result {
         }
     }
 
+    /// Sets `ethtool_ops` of `net_device`.
+    pub fn set_ether_operations<U>(&mut self, adapter: EtherOperationsAdapter<U, D>) -> Result
+    where
+        U: EtherOperations<D>,
+    {
+        if self.is_registered {
+            Err(code::EINVAL)
+        } else {
+            adapter.set_ether_ops(&mut self.dev);
+            Ok(())
+        }
+    }
+
     const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
         ndo_init: if <T>::HAS_INIT {
             Some(Self::init_callback)
@@ -378,3 +391,153 @@ fn drop(&mut self) {
         }
     }
 }
+
+/// Builds the kernel's `struct ethtool_ops`.
+pub struct EtherOperationsAdapter<D, T> {
+    _p: PhantomData<(D, T)>,
+}
+
+impl<D, T> EtherOperationsAdapter<T, D>
+where
+    D: DriverData,
+    T: EtherOperations<D>,
+{
+    /// Creates a new instance.
+    pub fn new() -> Self {
+        EtherOperationsAdapter { _p: PhantomData }
+    }
+
+    unsafe extern "C" fn get_ts_info_callback(
+        netdev: *mut bindings::net_device,
+        info: *mut bindings::ethtool_ts_info,
+    ) -> core::ffi::c_int {
+        from_result(|| {
+            // SAFETY: The C API guarantees that `net_device` isn't released while this function is running.
+            let data = unsafe { D::Data::borrow(Device::priv_data_ptr(netdev)) };
+            let mut dev = Device(netdev);
+            let mut info = EthtoolTsInfo(info);
+            T::get_ts_info(&mut dev, data, &mut info)?;
+            Ok(0)
+        })
+    }
+
+    const ETHER_OPS: bindings::ethtool_ops = bindings::ethtool_ops {
+        _bitfield_1: bindings::__BindgenBitfieldUnit::new([0; 1]),
+        supported_coalesce_params: 0,
+        supported_ring_params: 0,
+        get_drvinfo: None,
+        get_regs_len: None,
+        get_regs: None,
+        get_wol: None,
+        set_wol: None,
+        get_msglevel: None,
+        set_msglevel: None,
+        nway_reset: None,
+        get_link: None,
+        get_link_ext_state: None,
+        get_link_ext_stats: None,
+        get_eeprom_len: None,
+        get_eeprom: None,
+        set_eeprom: None,
+        get_coalesce: None,
+        set_coalesce: None,
+        get_ringparam: None,
+        set_ringparam: None,
+        get_pause_stats: None,
+        get_pauseparam: None,
+        set_pauseparam: None,
+        self_test: None,
+        get_strings: None,
+        set_phys_id: None,
+        get_ethtool_stats: None,
+        begin: None,
+        complete: None,
+        get_priv_flags: None,
+        set_priv_flags: None,
+        get_sset_count: None,
+        get_rxnfc: None,
+        set_rxnfc: None,
+        flash_device: None,
+        reset: None,
+        get_rxfh_key_size: None,
+        get_rxfh_indir_size: None,
+        get_rxfh: None,
+        set_rxfh: None,
+        get_rxfh_context: None,
+        set_rxfh_context: None,
+        get_channels: None,
+        set_channels: None,
+        get_dump_flag: None,
+        get_dump_data: None,
+        set_dump: None,
+        get_ts_info: if <T>::HAS_GET_TS_INFO {
+            Some(Self::get_ts_info_callback)
+        } else {
+            None
+        },
+        get_module_info: None,
+        get_module_eeprom: None,
+        get_eee: None,
+        set_eee: None,
+        get_tunable: None,
+        set_tunable: None,
+        get_per_queue_coalesce: None,
+        set_per_queue_coalesce: None,
+        get_link_ksettings: None,
+        set_link_ksettings: None,
+        get_fec_stats: None,
+        get_fecparam: None,
+        set_fecparam: None,
+        get_ethtool_phy_stats: None,
+        get_phy_tunable: None,
+        set_phy_tunable: None,
+        get_module_eeprom_by_page: None,
+        get_eth_phy_stats: None,
+        get_eth_mac_stats: None,
+        get_eth_ctrl_stats: None,
+        get_rmon_stats: None,
+        get_module_power_mode: None,
+        set_module_power_mode: None,
+        get_mm: None,
+        set_mm: None,
+        get_mm_stats: None,
+    };
+
+    const fn build_ether_ops() -> &'static bindings::ethtool_ops {
+        &Self::ETHER_OPS
+    }
+
+    fn set_ether_ops(&self, dev: &mut Device) {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe {
+            (*dev.0).ethtool_ops = Self::build_ether_ops();
+        }
+    }
+}
+
+/// Corresponds to the kernel's `struct ethtool_ops`.
+#[vtable]
+pub trait EtherOperations<D: DriverData> {
+    /// Corresponds to `get_ts_info` in `struct ethtool_ops`.
+    fn get_ts_info(
+        _dev: &mut Device,
+        _data: <D::Data as ForeignOwnable>::Borrowed<'_>,
+        _info: &mut EthtoolTsInfo,
+    ) -> Result {
+        Err(Error::from_errno(bindings::EOPNOTSUPP as i32))
+    }
+}
+
+/// Corresponds to the kernel's `struct ethtool_ts_info`.
+pub struct EthtoolTsInfo(*mut bindings::ethtool_ts_info);
+
+/// Sets up the info for software timestamping.
+///
+/// This can be [`Device`] method, but there are non ethernet devices.
+pub fn ethtool_op_get_ts_info(dev: &mut Device, info: &mut EthtoolTsInfo) -> Result {
+    // SAFETY: The safety requirement ensures that the pointer is valid.
+    unsafe {
+        bindings::ethtool_op_get_ts_info(dev.0, info.0);
+    }
+    Ok(())
+}
-- 
2.34.1

