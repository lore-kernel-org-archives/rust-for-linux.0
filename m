Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEBFC77B7A
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 07:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233683AbjFJH1A (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 03:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbjFJH07 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 03:26:59 -0400
X-Greylist: delayed 402 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 10 Jun 2023 00:26:58 PDT
Received: from a27-22.smtp-out.us-west-2.amazonses.com (a27-22.smtp-out.us-west-2.amazonses.com [54.240.27.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E26030E3
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 00:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686381614;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=DchbD68PYrzucuz/UnXLI3asegnWpDhE2jvzEsybalg=;
        b=DTmLvFTbAF/mIFUCq61aBD6iZ1WMyIXkx2H8h3xrC5/T/CotnKZ6H5RKPOBGU8lZ
        XXLlpUJZUA8wZDXMETpoXzhKr8qtL33F4GHUcJF3epLwcTs5f8rB1upa5LBJN7/Xx0Q
        r9tkslKGY7YoXTvdmHId6YqkDpYYy2phOV5APM4GQBAf4F9IWO8TppJm30Wcd/RSqcE
        2qdVQ7CHHIiZu9WNVE90FYRvVXiBAGI7wF5uu0d35IivHcv4+5bOcFex5YL1ZxcdAzO
        vXu4UBvrXYMOCZd7Ai85pqAFFxaLua1P4JbIcVP6v0tAukt/mcw2L/GNy/QLh8CltC1
        kmvAr5vNiA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686381614;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=DchbD68PYrzucuz/UnXLI3asegnWpDhE2jvzEsybalg=;
        b=nlaGVxWMr9goM4VFgSdbOZzz70PFtvsB5u+ohDp3Arjz0bfnzFiYXnaImCwqXXb3
        h6FN7FimuprUk8zbCIPQwTKw+IhxzisvRmsN3KsrZWxg+gZJt3FfMuaBfcNRFnHqpdN
        XFtJgdhmcZYvL6Atxif0a/QwtC64yRT89cMlWXFU=
From:   FUJITA Tomonori <tomo@exabit.dev>
To:     rust-for-linux@vger.kernel.org
Cc:     aliceryhl@google.com, andrew@lunn.ch,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v2 3/5] rust: add support for get_stats64 in struct net_device_ops
Date:   Sat, 10 Jun 2023 07:20:14 +0000
Message-ID: <01010188a42d54a7-22736273-ac89-44a3-a613-6d4b5a626069-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230610071848.3722492-1-tomo@exabit.dev>
References: <20230610071848.3722492-1-tomo@exabit.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.10-54.240.27.22
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

get_stats64() is used to return the stats for user-space like the
number of packets, which network device drivers are supposed to
support.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/net/dev.rs | 58 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/net/dev.rs b/rust/kernel/net/dev.rs
index 278171c0026e..4217051e70dc 100644
--- a/rust/kernel/net/dev.rs
+++ b/rust/kernel/net/dev.rs
@@ -8,7 +8,12 @@
 //! [`include/linux/skbuff.h`](../../../../include/linux/skbuff.h),
 //! [`include/uapi/linux/if_link.h`](../../../../include/uapi/linux/if_link.h).
 
-use crate::{bindings, error::*, prelude::vtable, types::ForeignOwnable};
+use crate::{
+    bindings,
+    error::*,
+    prelude::vtable,
+    types::{ForeignOwnable, Opaque},
+};
 use {core::ffi::c_void, core::marker::PhantomData};
 
 /// Corresponds to the kernel's `struct net_device`.
@@ -168,6 +173,11 @@ pub fn set_ether_operations<U>(&mut self) -> Result
         } else {
             None
         },
+        ndo_get_stats64: if <T>::HAS_GET_STATS64 {
+            Some(Self::get_stats64_callback)
+        } else {
+            None
+        },
         ..unsafe { core::mem::MaybeUninit::<bindings::net_device_ops>::zeroed().assume_init() }
     };
 
@@ -223,6 +233,18 @@ const fn build_device_ops() -> &'static bindings::net_device_ops {
         let skb = SkBuff(skb);
         T::start_xmit(&mut dev, data, skb) as bindings::netdev_tx_t
     }
+
+    unsafe extern "C" fn get_stats64_callback(
+        netdev: *mut bindings::net_device,
+        stats: *mut bindings::rtnl_link_stats64,
+    ) {
+        // SAFETY: The C API guarantees that `net_device` isn't released while this function is running.
+        let data = unsafe { D::Data::borrow(Device::priv_data_ptr(netdev)) };
+        let mut dev = Device(netdev);
+        // SAFETY: for writing and nobody else will read or write to it.
+        let stats = unsafe { RtnlLinkStats64::from_raw(stats) };
+        T::get_stats64(&mut dev, data, stats);
+    }
 }
 
 // SAFETY: `Registration` exposes its state, `D::Data` object across threads
@@ -270,6 +292,14 @@ fn start_xmit(
     ) -> TxCode {
         TxCode::Busy
     }
+
+    /// Corresponds to `ndo_get_stats64` in `struct net_device_ops`.
+    fn get_stats64(
+        _dev: &mut Device,
+        _data: <D::Data as ForeignOwnable>::Borrowed<'_>,
+        _stats: &mut RtnlLinkStats64,
+    ) {
+    }
 }
 
 /// Corresponds to the kernel's `struct sk_buff`.
@@ -304,6 +334,32 @@ fn drop(&mut self) {
     }
 }
 
+/// Corresponds to the kernel's `struct rtnl_link_stats64`.
+#[repr(transparent)]
+pub struct RtnlLinkStats64(Opaque<bindings::rtnl_link_stats64>);
+
+impl RtnlLinkStats64 {
+    /// # Safety
+    ///
+    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
+    /// may read or write to the `rtnl_link_stats64` object.
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::rtnl_link_stats64) -> &'a mut Self {
+        unsafe { &mut *(ptr as *mut Self) }
+    }
+
+    /// Updates TX stats.
+    pub fn set_tx_stats(&mut self, packets: u64, bytes: u64, errors: u64, dropped: u64) {
+        // SAFETY: We have exclusive access to the `rtnl_link_stats64`, so writing to it is okay.
+        unsafe {
+            let inner = Opaque::get(&self.0);
+            (*inner).tx_packets = packets;
+            (*inner).tx_bytes = bytes;
+            (*inner).tx_errors = errors;
+            (*inner).tx_dropped = dropped;
+        }
+    }
+}
+
 /// Builds the kernel's `struct ethtool_ops`.
 struct EtherOperationsAdapter<D, T> {
     _p: PhantomData<(D, T)>,
-- 
2.34.1

