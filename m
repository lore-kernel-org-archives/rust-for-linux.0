Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644FBC77B7A
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 07:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjFJHYG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 03:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjFJHYE (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 03:24:04 -0400
X-Greylist: delayed 229 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 10 Jun 2023 00:24:03 PDT
Received: from a27-52.smtp-out.us-west-2.amazonses.com (a27-52.smtp-out.us-west-2.amazonses.com [54.240.27.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982853AA5
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 00:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686381614;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=YKgL81osK0mkclXyE7nwlEs8QZYNIMsrldlrWM9SvOI=;
        b=QpYbWPMPpwSvrS/4tx16KEf0QBnSXy5HRdcesj8TgKfyHVuJzjvWQoCwYQN1MUQ0
        GFwH2mSlVMnbKknT6wit97kdLdVwi0ZWRb/CRyiNjhIozI84SfksZPrBCorzLvNaGqD
        yqGp9isUuNr1/IuqLqd8YDCzXsAgGoCSw870aLo4AMQMQ210yHHZZNgapVY0GgAOFia
        O47baCgih5UnBCpXnB96pPn6Gfxtag1T+sbLTb5IaAJFMHFe34b15bEcPHtf7EwnceK
        aZ+5T4vWScvq0luCGZzAW0fdMG0PzbV5taCbmKmsseJYmi3PjIqlCVLWzbS0Ybz8McE
        +ZD+JZ5Buw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686381614;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=YKgL81osK0mkclXyE7nwlEs8QZYNIMsrldlrWM9SvOI=;
        b=nXIj0u5RpwODZhcr+W4PfdGVeDBIGLTLgCum/mnELB7XGWg88wXhIKJhtPRgTlkS
        cgORD/FHOW8cpffnVVM3MCxAEBkBcgb7qREBgUfh7UGUQbtrRTsuN7lfZLUZtxO7Z7Z
        NR7R9ShRnOpE5d7i5AbBf3K2RNDxcmbNcxPm0ScE=
From:   FUJITA Tomonori <tomo@exabit.dev>
To:     rust-for-linux@vger.kernel.org
Cc:     aliceryhl@google.com, andrew@lunn.ch,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v2 2/5] rust: add support for ethernet operations
Date:   Sat, 10 Jun 2023 07:20:14 +0000
Message-ID: <01010188a42d53e0-2d47cf6b-9c3a-4e94-9322-0935d0e5dcd4-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230610071848.3722492-1-tomo@exabit.dev>
References: <20230610071848.3722492-1-tomo@exabit.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.10-54.240.27.52
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
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/net/dev.rs          | 90 +++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

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
index 407d7d5bff2c..278171c0026e 100644
--- a/rust/kernel/net/dev.rs
+++ b/rust/kernel/net/dev.rs
@@ -129,6 +129,19 @@ pub fn register(&mut self) -> Result {
         }
     }
 
+    /// Sets `ethtool_ops` of `net_device`.
+    pub fn set_ether_operations<U>(&mut self) -> Result
+    where
+        U: EtherOperations<D>,
+    {
+        if self.is_registered {
+            Err(code::EINVAL)
+        } else {
+            EtherOperationsAdapter::<U, D>::new().set_ether_ops(&mut self.dev);
+            Ok(())
+        }
+    }
+
     const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
         ndo_init: if <T>::HAS_INIT {
             Some(Self::init_callback)
@@ -290,3 +303,80 @@ fn drop(&mut self) {
         }
     }
 }
+
+/// Builds the kernel's `struct ethtool_ops`.
+struct EtherOperationsAdapter<D, T> {
+    _p: PhantomData<(D, T)>,
+}
+
+impl<D, T> EtherOperationsAdapter<T, D>
+where
+    D: DriverData,
+    T: EtherOperations<D>,
+{
+    /// Creates a new instance.
+    fn new() -> Self {
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
+        get_ts_info: if <T>::HAS_GET_TS_INFO {
+            Some(Self::get_ts_info_callback)
+        } else {
+            None
+        },
+        ..unsafe { core::mem::MaybeUninit::<bindings::ethtool_ops>::zeroed().assume_init() }
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

