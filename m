Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C9AC77B7A
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 07:25:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbjFJHZS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 03:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjFJHZR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 03:25:17 -0400
X-Greylist: delayed 300 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 10 Jun 2023 00:25:15 PDT
Received: from a27-50.smtp-out.us-west-2.amazonses.com (a27-50.smtp-out.us-west-2.amazonses.com [54.240.27.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8123AA5
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 00:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686381614;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=p08keVcFO3OU2rtHDgnlVTZzpXyiJDBINla+WM6/91Q=;
        b=eE3WYzZhfnCIoaQqNYXdCAJJs/gbr48fO5w3k2nxZ3l3V9rpdCAU8lBIx6TTNsgG
        Jp7bELTP2UR/gYZS+0cEdCHIMo1+hiz8s1mGucMyFel3HiatARfnGy/jsiwo15ThYuh
        yqeuk0UsXW7XoYMN2ylMlfUw95pMVm3twVWCzEPzGc+bngXQt4W/eaVYoG2fYJaf4oN
        /w6uxnpuZi1M29/ooLIseME5fcBludxipoOMQkBuXyXzQ0YuI7jFV0SOBBZ4bkfB791
        r/FSI6p+I7tViklY7HGGg4ODUYTb5AZ3/qYSE+hO7Dw9RqmI+ZOag9+w78FXRFYxGAC
        Rd5g0KHPlA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686381614;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=p08keVcFO3OU2rtHDgnlVTZzpXyiJDBINla+WM6/91Q=;
        b=VCHFmfQQpB+TVS5mGHFHNt9d6Pg4cRuK7uzkx4+DgFQnvu4y6RXMOVdgKFXJ2mHO
        8oq8vr+zYNOHi1g7HG719qpkIy3i4fDyN/vrvuCa7TKaqeUJqMa04MCDZ2ayaLULcPR
        OW/pbN2tGm4sjq9LxXwujxFOLFdZi585UCxYqmc8=
From:   FUJITA Tomonori <tomo@exabit.dev>
To:     rust-for-linux@vger.kernel.org
Cc:     aliceryhl@google.com, andrew@lunn.ch,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v2 4/5] rust: add methods for configure net_device
Date:   Sat, 10 Jun 2023 07:20:14 +0000
Message-ID: <01010188a42d5551-e2dac4ea-6a27-43a4-9846-30e3ae620bc3-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230610071848.3722492-1-tomo@exabit.dev>
References: <20230610071848.3722492-1-tomo@exabit.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.10-54.240.27.50
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

adds methods to net::Device for the basic configurations of
net_device.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers.c         |  7 ++++
 rust/kernel/net/dev.rs | 76 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

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
index 4217051e70dc..a4628d270fe5 100644
--- a/rust/kernel/net/dev.rs
+++ b/rust/kernel/net/dev.rs
@@ -12,6 +12,7 @@
     bindings,
     error::*,
     prelude::vtable,
+    str::CStr,
     types::{ForeignOwnable, Opaque},
 };
 use {core::ffi::c_void, core::marker::PhantomData};
@@ -36,6 +37,81 @@ fn priv_data_ptr(netdev: *mut bindings::net_device) -> *const c_void {
         // SAFETY: The safety requirement ensures that the pointer is valid.
         unsafe { core::ptr::read(bindings::netdev_priv(&mut *netdev) as *const *const c_void) }
     }
+
+    /// Sets the name of a device.
+    pub fn set_name(&mut self, name: &CStr) -> Result {
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
 
 // SAFETY: `Device` exposes the state, `D::Data` object across threads
-- 
2.34.1

