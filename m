Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCA2C0015E
	for <rust-for-linux@archiver.kernel.org>; Mon, 10 Jul 2023 07:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbjGJHjP (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 10 Jul 2023 03:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231435AbjGJHjI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 10 Jul 2023 03:39:08 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB1FE5D;
        Mon, 10 Jul 2023 00:38:54 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-682ae5d4184so902931b3a.1;
        Mon, 10 Jul 2023 00:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688974733; x=1691566733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRvsjomO7b3OWqiYBdrZZKEA2t4LQKVW3Z+rDt4uBL4=;
        b=pU9OZRaou+Rt68Z+fZ/Dz9N/ylGc9a7wpRjRYNEs6STo+2uh3XrriCh2g71hW5mkKi
         w9omeoDS9U4VzweocjDCNtA3LQpSmuAcOFDDnCpUC5vQ+6U/+YzetTQrkl8KMhiZWpIT
         6ArhBbE0a0pSWEeEyKNZHFxyeA9CVfLsWhlh8I342XtmtSUVRt9uUEp3ufxbKRMlLqu+
         4iPozXT6plxZPztYWOdf+SBSPCkOWDJyJf+lQhOxzvZcW22/qQQlYd+5zDx3yQHfzYzt
         Wx6JYxuBmuV8Iem90CaXt2yGN1ucSabuTbFRXvzvTksvRAquyrz7cVhla25UZqKidPKq
         yKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688974733; x=1691566733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRvsjomO7b3OWqiYBdrZZKEA2t4LQKVW3Z+rDt4uBL4=;
        b=Y8YtiR5dTu9oGH18TqZYXMSYuS1B0ZFLCSf//cz5XzQNKTqrSeWjyM59sSJQcir9Fu
         XhF9O9FYJSh/x5klszkhxbMH6n90mYQNpbd7c19K1/fGWTvYIXRxIyj+pxr803olTONU
         vQRjo4fRBCQULzgHnDXQ1J4WDn3mykVf+9H8oiXH2MubpwBsrfLJLUypvMXiyAHo+ize
         aL6FREGtV4XgeZiMH5EhQ38zJ+LQQtOI2MaRglycuc2H+d+5pWVB37zCL07SKLCkAMFU
         bJ/Dk+tCP4++zyx+4dYUNX1kf4mZo3iYdH8d61NojSZtRPABFIm8J/3/PHHZ31l8Otbw
         3hfQ==
X-Gm-Message-State: ABy/qLbUBBstgAcPOhUxOD1hQHBlmOkVDIqUXVeuzPsqfZG+JV4nxGQM
        UT7vro47+gKvWbq6QI3mq772tRMXWtJv4A==
X-Google-Smtp-Source: APBJJlFHR34vYwdl3x1qhId87A9s3hXR+3Q3CZ7Ju6HeoN/EdSI4n8uJvRIED4bS1RHsHXsBGF8Kkg==
X-Received: by 2002:a05:6a00:2daa:b0:66f:3fc5:6167 with SMTP id fb42-20020a056a002daa00b0066f3fc56167mr14274134pfb.1.1688974733050;
        Mon, 10 Jul 2023 00:38:53 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id r20-20020a62e414000000b0063f2a5a59d1sm6514483pfh.190.2023.07.10.00.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 00:38:52 -0700 (PDT)
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
To:     rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Cc:     kuba@kernel.org, andrew@lunn.ch, aliceryhl@google.com,
        miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Subject: [PATCH v2 2/5] rust: add support for ethernet operations
Date:   Mon, 10 Jul 2023 16:37:00 +0900
Message-Id: <20230710073703.147351-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710073703.147351-1-fujita.tomonori@gmail.com>
References: <20230710073703.147351-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This improves abstractions for network device drivers to implement
struct ethtool_ops, the majority of ethernet device drivers need to
do.

struct ethtool_ops also needs to access to device private data like
struct net_device_ops.

Currently, only get_ts_info operation is supported. The following
patch adds the Rust version of the dummy network driver, which uses
the operation.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/net/dev.rs          | 87 ++++++++++++++++++++++++++++++++-
 2 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 468bf606f174..6446ff764980 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -8,6 +8,7 @@
 
 #include <linux/errname.h>
 #include <linux/etherdevice.h>
+#include <linux/ethtool.h>
 #include <linux/netdevice.h>
 #include <linux/slab.h>
 #include <linux/refcount.h>
diff --git a/rust/kernel/net/dev.rs b/rust/kernel/net/dev.rs
index fe20616668a9..ff00616e4fef 100644
--- a/rust/kernel/net/dev.rs
+++ b/rust/kernel/net/dev.rs
@@ -142,7 +142,7 @@ pub fn register(&mut self) -> Result {
         if self.is_registered {
             return Err(code::EINVAL);
         }
-        // SAFETY: The type invariants guarantee that `self.dev.ptr` is valid.
+        // SAFETY: The type invariants of `Device` guarantee that `self.dev.ptr` is valid.
         let ret = unsafe {
             (*self.dev.ptr).netdev_ops = &Self::DEVICE_OPS;
             bindings::register_netdev(self.dev.ptr)
@@ -155,6 +155,18 @@ pub fn register(&mut self) -> Result {
         }
     }
 
+    /// Sets `ethtool_ops` of `net_device`.
+    pub fn set_ether_operations<E: EtherOperations>(&mut self) -> Result {
+        if self.is_registered {
+            return Err(code::EINVAL);
+        }
+        // SAFETY: The type invariants of `Device` guarantee that `self.dev.ptr` is valid.
+        unsafe {
+            (*(self.dev.ptr)).ethtool_ops = &EtherOperationsAdapter::<E>::ETHER_OPS;
+        }
+        Ok(())
+    }
+
     const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
         ndo_init: if <T>::HAS_INIT {
             Some(Self::init_callback)
@@ -328,3 +340,76 @@ fn drop(&mut self) {
         build_error!("skb must be released explicitly");
     }
 }
+
+/// Builds the kernel's `struct ethtool_ops`.
+struct EtherOperationsAdapter<E: EtherOperations> {
+    _p: PhantomData<E>,
+}
+
+impl<E: EtherOperations> EtherOperationsAdapter<E> {
+    unsafe extern "C" fn get_ts_info_callback(
+        netdev: *mut bindings::net_device,
+        info: *mut bindings::ethtool_ts_info,
+    ) -> core::ffi::c_int {
+        from_result(|| {
+            // SAFETY: The C API guarantees that `netdev` is valid while this function is running.
+            let dev = unsafe { Device::from_ptr(netdev) };
+            // SAFETY: The C API guarantees that `info` is valid while this function is running.
+            let info = unsafe { EthtoolTsInfo::from_ptr(info) };
+            E::get_ts_info(dev, info)?;
+            Ok(0)
+        })
+    }
+
+    const ETHER_OPS: bindings::ethtool_ops = bindings::ethtool_ops {
+        get_ts_info: if <E>::HAS_GET_TS_INFO {
+            Some(Self::get_ts_info_callback)
+        } else {
+            None
+        },
+        // SAFETY: The rest is zeroed out to initialize `struct ethtool_ops`,
+        // set `Option<&F>` to be `None`.
+        ..unsafe { core::mem::MaybeUninit::<bindings::ethtool_ops>::zeroed().assume_init() }
+    };
+}
+
+/// Corresponds to the kernel's `struct ethtool_ops`.
+#[vtable]
+pub trait EtherOperations: ForeignOwnable + Send + Sync {
+    /// Corresponds to `get_ts_info` in `struct ethtool_ops`.
+    fn get_ts_info(_dev: Device<Self>, _info: EthtoolTsInfo) -> Result {
+        Err(Error::from_errno(bindings::EOPNOTSUPP as i32))
+    }
+}
+
+/// Corresponds to the kernel's `struct ethtool_ts_info`.
+///
+/// # Invariants
+///
+/// The pointer is valid.
+pub struct EthtoolTsInfo(*mut bindings::ethtool_ts_info);
+
+impl EthtoolTsInfo {
+    /// Creates a new `EthtoolTsInfo' instance.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `ptr` must be valid.
+    unsafe fn from_ptr(ptr: *mut bindings::ethtool_ts_info) -> Self {
+        // INVARIANT: The safety requirements ensure the invariant.
+        Self(ptr)
+    }
+
+    /// Sets up the info for software timestamping.
+    pub fn ethtool_op_get_ts_info<D: ForeignOwnable + Send + Sync>(
+        dev: &Device<D>,
+        info: &mut EthtoolTsInfo,
+    ) -> Result {
+        // SAFETY: The type invariants of `Device` guarantee that `dev.ptr` are valid.
+        // The type invariants guarantee that `info.0` are valid.
+        unsafe {
+            bindings::ethtool_op_get_ts_info(dev.ptr, info.0);
+        }
+        Ok(())
+    }
+}
-- 
2.34.1

