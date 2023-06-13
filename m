Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C29C7EE29
	for <rust-for-linux@archiver.kernel.org>; Tue, 13 Jun 2023 04:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234485AbjFMExm (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 13 Jun 2023 00:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239550AbjFMExl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 13 Jun 2023 00:53:41 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745211BC;
        Mon, 12 Jun 2023 21:53:33 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b3df438cf1so1760735ad.1;
        Mon, 12 Jun 2023 21:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686632012; x=1689224012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WLrWgTq3lGZWH7CAbwlMcBDXHc2js7ZTMM+S02Ruag=;
        b=m3N/cOnIaiwJ7cbH0olTlh0AF9FTdYhTV7bHJ7fH/JLKfcY7J0ZioI95mnImUSiIz/
         9BB6qmlLckpYYiTs3/6uJghouLnJAq8ssaE+TuBUNhA4Gf03SPKSFPKd8CkG+0Unczus
         Ny0ttRzdmu7mCngyuEvTKHZiSI37y8LM68MxI48VtPrTYBTDQ5PI5XJ0WWwdii6XNbam
         qizPV7+YrGU07MBLoeMqzk4GcfdNPO3/l+HAUDF7Ue1rA9dptPEw7e+1gMpYmG9GJDNb
         NVOfw/J3N7WOgucz1iXiWKrB+wKtTnlZKu6tGW/y8Cl1IhHQnMiq671234udZw7J2tMt
         Vj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686632012; x=1689224012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WLrWgTq3lGZWH7CAbwlMcBDXHc2js7ZTMM+S02Ruag=;
        b=MaNkcuT4Bxn4B/5feCQWM4qoBoS0Nk4tYuiKu1vCr0S7vo4DGaURT6VUYd/68umJle
         zV9aFlMluWRBnch8DgajBMiKfVbwKn9TJ0gPLGoWDXh+defauE0Jrb4gr0OQot+JuXns
         9bXld7qcboYavhtJlqXpEiVUuf7fKavsoddaJ7uvWeI8hpUWzCNdAdYtqi1fAi69OnmX
         bzKMKGiDUSeefifNnqNEX8AVdSPHpSTgPUlf735rS96R3KwkRPIj/4q1LbWCx89AXXHJ
         Csy6Sm3TbIfrY8He+mEHLrGm/fgg4zonpJOLf44dOVdVp8k+UCgoKmallqxCqYwC5h/q
         zTSg==
X-Gm-Message-State: AC+VfDzXAplD6DTVe/b8drooM1Cy4oc8+LuEotw6YHXt0Og35ZdzGvpz
        t5QGY3oHXSCZMg3UVubdXAnC/lcS8UVFSPQ6
X-Google-Smtp-Source: ACHHUZ64rKFdC/O48vXNxgWgRahU9tU3oUYK32DI4dByxrLFNr0Bs71bIHEs8XwPLGUBHUtr6g3JxQ==
X-Received: by 2002:a17:902:da8b:b0:1b0:3d54:358f with SMTP id j11-20020a170902da8b00b001b03d54358fmr12528132plx.0.1686632012572;
        Mon, 12 Jun 2023 21:53:32 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902c1c500b001b027221393sm9095249plc.43.2023.06.12.21.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 21:53:32 -0700 (PDT)
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
To:     netdev@vger.kernel.org
Cc:     rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        andrew@lunn.ch, miguel.ojeda.sandonis@gmail.com
Subject: [PATCH 2/5] rust: add support for ethernet operations
Date:   Tue, 13 Jun 2023 13:53:23 +0900
Message-Id: <20230613045326.3938283-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230613045326.3938283-1-fujita.tomonori@gmail.com>
References: <20230613045326.3938283-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This improves abstractions for network device drivers to implement
struct ethtool_ops, the majority of ethernet device drivers need to
do.

struct ethtool_ops also needs to access to device private data like
struct net_devicve_ops.

Currently, only get_ts_info operation is supported. The following
patch adds the Rust version of the dummy network driver, which uses
the operation.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/net/dev.rs          | 108 ++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

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
index d072c81f99ce..d6012b2eea33 100644
--- a/rust/kernel/net/dev.rs
+++ b/rust/kernel/net/dev.rs
@@ -141,6 +141,18 @@ pub fn register(&mut self) -> Result {
         }
     }
 
+    /// Sets `ethtool_ops` of `net_device`.
+    pub fn set_ether_operations<U>(&mut self) -> Result
+    where
+        U: EtherOperations<D>,
+    {
+        if self.is_registered {
+            return Err(code::EINVAL);
+        }
+        EtherOperationsAdapter::<U, D>::new().set_ether_ops(&mut self.dev);
+        Ok(())
+    }
+
     const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
         ndo_init: if <T>::HAS_INIT {
             Some(Self::init_callback)
@@ -342,3 +354,99 @@ fn drop(&mut self) {
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
+            // SAFETY: The C API guarantees that `netdev` is valid while this function is running.
+            let mut dev = unsafe { Device::from_ptr(netdev) };
+            // SAFETY: The returned pointer was initialized by `D::Data::into_foreign` when
+            // `Registration` object was created.
+            // `D::Data::from_foreign` is only called by the object was released.
+            // So we know `data` is valid while this function is running.
+            let data = unsafe { D::Data::borrow(dev.priv_data_ptr()) };
+            // SAFETY: The C API guarantees that `info` is valid while this function is running.
+            let mut info = unsafe { EthtoolTsInfo::from_ptr(info) };
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
+        // SAFETY: The type invariants guarantee that `dev.0` is valid.
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
+}
+
+/// Sets up the info for software timestamping.
+pub fn ethtool_op_get_ts_info(dev: &mut Device, info: &mut EthtoolTsInfo) -> Result {
+    // SAFETY: The type invariants guarantee that `dev.0` and `info.0` are valid.
+    unsafe {
+        bindings::ethtool_op_get_ts_info(dev.0, info.0);
+    }
+    Ok(())
+}
-- 
2.34.1

