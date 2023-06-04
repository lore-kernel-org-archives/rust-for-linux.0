Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D31C77B7A
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jun 2023 02:25:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjFDCZV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 3 Jun 2023 22:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjFDCZU (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 3 Jun 2023 22:25:20 -0400
X-Greylist: delayed 446 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 03 Jun 2023 19:25:19 PDT
Received: from a27-24.smtp-out.us-west-2.amazonses.com (a27-24.smtp-out.us-west-2.amazonses.com [54.240.27.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE318E1
        for <rust-for-linux@vger.kernel.org>; Sat,  3 Jun 2023 19:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1685845073;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=s+VB5Zu5c56lSMnimf2bAqeY3kXJ/gYt4/wJFtJFY+Y=;
        b=QFkzLl4xNIZWnq1hAE034A9w3Jgp/gwKfj9Sj156Iof/sSmDQLxaJM4G/Y/O7nR+
        sAxNmYGmp7jpko4r51WfrVI+NrdPBQMzbjUoSxZBPtL5MRxJmMQ7F9tz5kyK1/EOTCA
        9bC9ovG7V63GktzbAme8VkpocjrXVoodIfbsqWXeRee9TOFw2xhFx/AU0J78MbaKF8d
        18QVR7KicnYrEqvDsaoshPVPRIbZ7pESQfmSgms8uAB293ZOdgcHSAxEbppAdy5JeU0
        2yFrqv3+pLuITa9i8QV+elZP/7WVu+tr0zKJQKKLx18cqwBHnCDKNEoqmTu7BZHv1TD
        FhtXY7E1hg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685845073;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=s+VB5Zu5c56lSMnimf2bAqeY3kXJ/gYt4/wJFtJFY+Y=;
        b=rFhU9cAKyyrs7/kiq+OWDy74QTLBytwFuK6zwQPq/2APFJ0/iqbNLHLJbKRDbgQp
        UjkhQquZnuE6+rYDhE73BDBTriJvJjAowJMEMR1I2C3LyJI2mwW/pWs2qPGdZG1W0/W
        4QuuyYsZefC8i4rcOPt6Ses4c/PsHpEzD+U0yGLg=
From:   FUJITA Tomonori <tomo@exabit.dev>
To:     rust-for-linux@vger.kernel.org
Cc:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 4/5] rust: add methods for configure net_device
Date:   Sun, 4 Jun 2023 02:17:52 +0000
Message-ID: <0101018884325bd2-663fb619-646c-46f6-96d8-769e87a469cf-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604021736.3392963-1-tomo@exabit.dev>
References: <20230604021736.3392963-1-tomo@exabit.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.04-54.240.27.24
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

adds methods to net::Device for the basic configurations of
net_device.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers.c         |  7 ++++
 rust/kernel/net/dev.rs | 77 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/rust/helpers.c b/rust/helpers.c
index a91d2a99035b..7c280c552d64 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -21,6 +21,7 @@
 #include <linux/bug.h>
 #include <linux/build_bug.h>
 #include <linux/err.h>
+#include <linux/etherdevice.h>
 #include <linux/refcount.h>
 #include <linux/mutex.h>
 #include <linux/netdevice.h>
@@ -30,6 +31,12 @@
 #include <linux/wait.h>
 
 #ifdef CONFIG_NET
+void rust_helper_eth_hw_addr_random(struct net_device *dev)
+{
+	eth_hw_addr_random(dev);
+}
+EXPORT_SYMBOL_GPL(rust_helper_eth_hw_addr_random);
+
 void *rust_helper_netdev_priv(const struct net_device *dev)
 {
 	return netdev_priv(dev);
diff --git a/rust/kernel/net/dev.rs b/rust/kernel/net/dev.rs
index 7681de529682..4fafd7e73112 100644
--- a/rust/kernel/net/dev.rs
+++ b/rust/kernel/net/dev.rs
@@ -8,7 +8,7 @@
 //! [`include/linux/skbuff.h`](../../../../include/linux/skbuff.h),
 //! [`include/uapi/linux/if_link.h`](../../../../include/uapi/linux/if_link.h).
 
-use crate::{bindings, error::*, prelude::vtable, types::ForeignOwnable};
+use crate::{bindings, error::*, prelude::vtable, str::CStr, types::ForeignOwnable};
 use core::marker::PhantomData;
 
 /// Corresponds to the kernel's `struct net_device`.
@@ -31,6 +31,81 @@ fn priv_data_ptr(netdev: *mut bindings::net_device) -> *const core::ffi::c_void
         // SAFETY: The safety requirement ensures that the pointer is valid.
         unsafe { *(bindings::netdev_priv(&mut *netdev) as *const usize) as _ }
     }
+
+    /// Sets the name of a device.
+    pub fn set_name(&mut self, name: &'static CStr) -> Result {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe {
+            if name.len() > (*self.0).name.len() {
+                return Err(code::EINVAL);
+            }
+            for i in 0..name.len() {
+                (*self.0).name[i] = name[i] as i8;
+            }
+        }
+        Ok(())
+    }
+
+    /// Sets carrier.
+    pub fn netif_carrier_on(&mut self) {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe { bindings::netif_carrier_on(self.0) }
+    }
+
+    /// Clears carrier.
+    pub fn netif_carrier_off(&mut self) {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe { bindings::netif_carrier_off(self.0) }
+    }
+
+    /// Sets the max mtu of the device.
+    pub fn set_max_mtu(&mut self, max_mtu: u32) {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe {
+            (*self.0).max_mtu = max_mtu;
+        }
+    }
+
+    /// Sets the minimum mtu of the device.
+    pub fn set_min_mtu(&mut self, min_mtu: u32) {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe {
+            (*self.0).min_mtu = min_mtu;
+        }
+    }
+
+    /// Returns the flags of the device.
+    pub fn get_flags(&self) -> u32 {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe { (*self.0).flags }
+    }
+
+    /// Sets the flags of the device.
+    pub fn set_flags(&mut self, flags: u32) {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe {
+            (*self.0).flags = flags;
+        }
+    }
+
+    /// Returns the priv_flags of the device.
+    pub fn get_priv_flags(&self) -> u64 {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe { (*self.0).priv_flags }
+    }
+
+    /// Sets the priv_flags of the device.
+    pub fn set_priv_flags(&mut self, flags: u64) {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe { (*self.0).priv_flags = flags }
+    }
+
+    /// Generate a random Ethernet address (MAC) to be used by a net device
+    /// and set addr_assign_type.
+    pub fn set_random_eth_hw_addr(&mut self) {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe { bindings::eth_hw_addr_random(self.0) }
+    }
 }
 
 /// Trait for device driver specific information.
-- 
2.34.1

