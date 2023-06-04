Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2745FC77B73
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jun 2023 02:25:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjFDCZD (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 3 Jun 2023 22:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjFDCZC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 3 Jun 2023 22:25:02 -0400
X-Greylist: delayed 427 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 03 Jun 2023 19:25:00 PDT
Received: from a27-27.smtp-out.us-west-2.amazonses.com (a27-27.smtp-out.us-west-2.amazonses.com [54.240.27.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1F6DF
        for <rust-for-linux@vger.kernel.org>; Sat,  3 Jun 2023 19:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1685845072;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=3KLC4LC05J+IY03BlnRPNB9CwkTgFmU7QWsz5XKcqYs=;
        b=VFGHXhwz3CSAtdNn4d4pYUrXPehmBDT80YtYO7Otj3Gr1IBYbZBDr4gkfWUv9Z7k
        LakLU1Rrm11Xkn8QYG03bORmLW5Hsd1+8HxnujcNFXmpGJXN5K/VYFi4ThhzTtt2mBI
        tx7suW+lKFUid2lFEPz89Ym2/DnOgFekfzfBhlJEPU9rml/ruwbdisyO1sO/DQF9mn/
        WXc5/9WoEjc+/jsE+83mDxweYyzlf8oBJ5za637sZg0g417zPfSQ052cmnplkYlIHRu
        VdaR40JL6tPnu900FhWu0NF0Op6xYl/Czemw6DBkTt4BUHugkrBP1U5lUcnrgjYQclK
        hix3oGZokQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685845072;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=3KLC4LC05J+IY03BlnRPNB9CwkTgFmU7QWsz5XKcqYs=;
        b=Q6uV7MxAzfC8hp2a3u9raLHnDTZ5No5J5hyo+4inFXDcm66JKVMYGo8pbXwMzzca
        aRbA60jEOQfGVoZRWbvDxeNl2s2z8I0cVeOMBABaYKEVUqAydlkG/ReZ1SrUoD3Eyma
        bP7xcHO15iczlW9ugX+o0cL3x009L6tYSUhi0WUY=
From:   FUJITA Tomonori <tomo@exabit.dev>
To:     rust-for-linux@vger.kernel.org
Cc:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 3/5] rust: add support for get_stats64 in struct net_device_ops
Date:   Sun, 4 Jun 2023 02:17:52 +0000
Message-ID: <0101018884325b30-c6344630-ec10-470f-b027-514e7a20d5eb-000000@us-west-2.amazonses.com>
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

get_stats64() is used to return the stats for user-space like the
number of packets, which network device drivers are supposed to
support.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/net/dev.rs | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/net/dev.rs b/rust/kernel/net/dev.rs
index 535b0e6f6424..7681de529682 100644
--- a/rust/kernel/net/dev.rs
+++ b/rust/kernel/net/dev.rs
@@ -178,7 +178,11 @@ pub fn set_ether_operations<U>(&mut self, adapter: EtherOperationsAdapter<U, D>)
         ndo_change_mtu: None,
         ndo_neigh_setup: None,
         ndo_tx_timeout: None,
-        ndo_get_stats64: None,
+        ndo_get_stats64: if <T>::HAS_GET_STATS64 {
+            Some(Self::get_stats64_callback)
+        } else {
+            None
+        },
         ndo_has_offload_stats: None,
         ndo_get_offload_stats: None,
         ndo_get_stats: None,
@@ -311,6 +315,16 @@ const fn build_device_ops() -> &'static bindings::net_device_ops {
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
+        T::get_stats64(&mut dev, data, &mut RtnlLinkStats64(stats));
+    }
 }
 
 // SAFETY: `Registration` does not expose any of its state across threads.
@@ -358,6 +372,14 @@ fn start_xmit(
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
@@ -392,6 +414,22 @@ fn drop(&mut self) {
     }
 }
 
+/// Corresponds to the kernel's `struct rtnl_link_stats64`.
+pub struct RtnlLinkStats64(*mut bindings::rtnl_link_stats64);
+
+impl RtnlLinkStats64 {
+    /// Updates TX stats.
+    pub fn set_tx_stats(&mut self, packets: u64, bytes: u64, errors: u64, dropped: u64) {
+        // SAFETY: The safety requirement ensures that the pointer is valid.
+        unsafe {
+            (*self.0).tx_packets = packets;
+            (*self.0).tx_bytes = bytes;
+            (*self.0).tx_errors = errors;
+            (*self.0).tx_dropped = dropped;
+        }
+    }
+}
+
 /// Builds the kernel's `struct ethtool_ops`.
 pub struct EtherOperationsAdapter<D, T> {
     _p: PhantomData<(D, T)>,
-- 
2.34.1

