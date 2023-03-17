Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6BDC6FD1D
	for <rust-for-linux@archiver.kernel.org>; Fri, 17 Mar 2023 12:13:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjCQMNj (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 17 Mar 2023 08:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbjCQMNe (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 17 Mar 2023 08:13:34 -0400
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 128F01CBD8
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Mar 2023 05:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=lzWvFbZbAyZruu9DSeVDnH0iLl0UAkl4YDHSvxPSfQA=; b=nWarxa9qPNcJhFpe1R68L9WvyX
        z09O9hFhl1RqkXSEyeEcXcm2fcXssUvRGIXxAbUu1TPhgZf2JBqB5jXFcHIUpxeF9aK9M8VJjVimL
        bCtULiLc4TpQoCrHQtAI/slfKrViBHe7TZJSnbtVnZPEwE/6Mhd8hp0DnFB38ci9DpVH7YyooIvkc
        Qy201DX93vHqtk6mGg/rqgGioXmHOns4aT1PizTZh0VybaF9lxCiEqblIws+om2g3AR9ncwfkTHpF
        Rp7L4jeWcSEKzH5WE4mfTeoFumYNfM731eHY0WhYK4+Rjiqntzu3PLyM5uPNV+TyZYDgFwXGI+OOh
        8RIqGykg==;
Received: from [177.34.168.16] (helo=bowie..)
        by fanzine2.igalia.com with esmtpsa 
        (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
        id 1pd8xM-00FrGz-EQ; Fri, 17 Mar 2023 13:13:12 +0100
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
Subject: [RFC PATCH 3/9] rust: dma_fence: add method to return an indication if the fence is signaled
Date:   Fri, 17 Mar 2023 09:12:07 -0300
Message-Id: <20230317121213.93991-4-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317121213.93991-1-mcanal@igalia.com>
References: <20230317121213.93991-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

To indicate the current status of the fence, there is a kernel function that
returns an indication if the fence is signaled yet. Therefore, add a method
in the Rust abstraction to return an indication if the fence is signaled.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 rust/helpers.c           | 6 ++++++
 rust/kernel/dma_fence.rs | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/rust/helpers.c b/rust/helpers.c
index 18c0c434ad73..f77bfa10d5f5 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -420,6 +420,12 @@ void rust_helper_dma_fence_put(struct dma_fence *fence)
 }
 EXPORT_SYMBOL_GPL(rust_helper_dma_fence_put);
 
+bool rust_helper_dma_fence_is_signaled(struct dma_fence *fence)
+{
+	return dma_fence_is_signaled(fence);
+}
+EXPORT_SYMBOL_GPL(rust_helper_dma_fence_is_signaled);
+
 struct dma_fence_chain *rust_helper_dma_fence_chain_alloc(void)
 {
 	return dma_fence_chain_alloc();
diff --git a/rust/kernel/dma_fence.rs b/rust/kernel/dma_fence.rs
index ca93380d9da2..176e6d250e6c 100644
--- a/rust/kernel/dma_fence.rs
+++ b/rust/kernel/dma_fence.rs
@@ -65,6 +65,11 @@ pub trait RawDmaFence: crate::private::Sealed {
         to_result(unsafe { bindings::dma_fence_signal(self.raw()) })
     }
 
+    /// Return an indication if the fence is signaled yet.
+    fn is_signaled(&self) -> bool {
+        unsafe { bindings::dma_fence_is_signaled(self.raw()) }
+    }
+
     /// Set the error flag on this fence
     fn set_error(&self, err: Error) {
         unsafe { bindings::dma_fence_set_error(self.raw(), err.to_kernel_errno()) };
-- 
2.39.2

