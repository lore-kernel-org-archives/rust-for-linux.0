Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A720DC6FD1D
	for <rust-for-linux@archiver.kernel.org>; Fri, 17 Mar 2023 12:13:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbjCQMN6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 17 Mar 2023 08:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbjCQMN5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 17 Mar 2023 08:13:57 -0400
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36625521E3
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Mar 2023 05:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=YVEnRR/qQQunfEktPJrIHOIoV5MpZURwVPi1B2rMWCI=; b=OPvgHMMGoOZU3zXOpaM4pBey5G
        lS1U4yJN8OV/Lq66djgyDIp4Lkv8Znz98tj0VywYzEv8cU4RyFS/MW1AcRMuQrF8OlrnvOse4pldd
        o/YBs7Yh2HR/Ms2H5X4+OJSplA1MGwBD3lfKeo0sDZKJv4RbetINeL1RWYYbbmaU645frSoNVtS0f
        4lLRn91LffP/PWa4pFx+prp6DVAHflGevnAC9FXcmdUIpE1JeVTT5yku/ImTE38/fhTNN75QYKPNs
        /3I4jXkh8YBX+BoVM1bcdVl/tLB5sqkXTynA9/P3/nySvwqOAJ3GLpn5DcKr9d5CMESy04whhvk7A
        a091Rouw==;
Received: from [177.34.168.16] (helo=bowie..)
        by fanzine2.igalia.com with esmtpsa 
        (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
        id 1pd8xq-00FrGz-Mz; Fri, 17 Mar 2023 13:13:43 +0100
From:   =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        Asahi Lina <lina@asahilina.net>,
        Faith Ekstrand <faith.ekstrand@collabora.com>
Cc:     rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Melissa Wen <mwen@igalia.com>,
        =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [RFC PATCH 8/9] drm/rustgem: implement timeout to prevent hangs
Date:   Fri, 17 Mar 2023 09:12:12 -0300
Message-Id: <20230317121213.93991-9-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317121213.93991-1-mcanal@igalia.com>
References: <20230317121213.93991-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

In order to prevent possible hangs, if the fence is not signaled for
more than 10 seconds, force the fence to expire by being signaled.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/rustgem/fence.rs | 31 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/rustgem/file.rs  |  7 +++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rustgem/fence.rs b/drivers/gpu/drm/rustgem/fence.rs
index 9ef1399548e2..eb1d7faa7e8e 100644
--- a/drivers/gpu/drm/rustgem/fence.rs
+++ b/drivers/gpu/drm/rustgem/fence.rs
@@ -2,10 +2,13 @@
 
 use core::fmt::Write;
 use core::ops::Deref;
-use kernel::c_str;
+use core::time::Duration;
 use kernel::dma_fence::*;
 use kernel::prelude::*;
 use kernel::sync::Arc;
+use kernel::time::timer::*;
+use kernel::time::*;
+use kernel::{bindings, c_str, timer_init};
 
 static QUEUE_NAME: &CStr = c_str!("vgem_fence");
 static QUEUE_CLASS_KEY: kernel::sync::LockClassKey = kernel::sync::LockClassKey::new();
@@ -36,6 +39,7 @@ impl FenceOps for Fence {
 
 pub(crate) struct VgemFence {
     fence: Arc<UniqueFence<Fence>>,
+    _timer: Box<FnTimer<Box<dyn FnMut() -> Result<Next> + Sync>>>,
 }
 
 impl VgemFence {
@@ -43,7 +47,30 @@ impl VgemFence {
         let fence_ctx = FenceContexts::new(1, QUEUE_NAME, &QUEUE_CLASS_KEY)?;
         let fence = Arc::try_new(fence_ctx.new_fence(0, Fence {})?)?;
 
-        Ok(Self { fence })
+        // SAFETY: The caller calls [`FnTimer::init_timer`] before using the timer.
+        let t = Box::try_new(unsafe {
+            FnTimer::new(Box::try_new({
+                let fence = fence.clone();
+                move || {
+                    let _ = fence.signal();
+                    Ok(Next::Done)
+                }
+            })? as Box<_>)
+        })?;
+
+        // SAFETY: As FnTimer is inside a Box, it won't be moved.
+        let ptr = unsafe { core::pin::Pin::new_unchecked(&*t) };
+
+        timer_init!(ptr, 0, "vgem_timer");
+
+        // SAFETY: Duration.as_millis() returns a valid total number of whole milliseconds.
+        let timeout =
+            unsafe { bindings::msecs_to_jiffies(Duration::from_secs(10).as_millis().try_into()?) };
+
+        // We force the fence to expire within 10s to prevent driver hangs
+        ptr.raw_timer().schedule_at(jiffies_later(timeout));
+
+        Ok(Self { fence, _timer: t })
     }
 }
 
diff --git a/drivers/gpu/drm/rustgem/file.rs b/drivers/gpu/drm/rustgem/file.rs
index 2552c7892b0e..a3714e8ca206 100644
--- a/drivers/gpu/drm/rustgem/file.rs
+++ b/drivers/gpu/drm/rustgem/file.rs
@@ -33,6 +33,10 @@ impl File {
     /// via the dma-buf reservation object and visible to consumers of the exported
     /// dma-buf.
     ///
+    /// This returns the handle for the new fence that must be signaled within 10
+    /// seconds (or otherwise it will automatically expire). See
+    /// signal (DRM_IOCTL_VGEM_FENCE_SIGNAL).
+    ///
     /// If the vGEM handle does not exist, attach returns -ENOENT.
     ///
     pub(crate) fn attach(
@@ -84,6 +88,9 @@ impl File {
     /// Signal and consume a fence earlier attached to a vGEM handle using
     /// attach (DRM_IOCTL_VGEM_FENCE_ATTACH).
     ///
+    /// All fences must be signaled within 10s of attachment or otherwise they
+    /// will automatically expire (and signal returns -ETIMEDOUT).
+    ///
     /// Signaling a fence indicates to all consumers of the dma-buf that the
     /// client has completed the operation associated with the fence, and that the
     /// buffer is then ready for consumption.
-- 
2.39.2

