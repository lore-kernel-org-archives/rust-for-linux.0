Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A655C76195
	for <rust-for-linux@archiver.kernel.org>; Fri, 17 Mar 2023 12:13:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbjCQMNk (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 17 Mar 2023 08:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbjCQMNf (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 17 Mar 2023 08:13:35 -0400
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2131BC97D9
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Mar 2023 05:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=wxlvNLGKgBNmusrXwv5nJvC1jT8zNLs4o63V3Oq55OI=; b=D8fYSVFHxRxkWM8ooaCtJrSslk
        iYawuRl6Efmm9iNfhGGKGnjSWBepYC0agou6YKRqLPTqodLqxjyH42HfNTn2QKLZbzQheCuIiZqpo
        uFGU1Zu6mWfGfFxXCogN1Rcs+SjFe7u35jS02p1WHa5NSIBFFHvflP6N1HXi7GpS4Qs8lnZWq5bKS
        n045cp1UUxElZqZdHAePrQhYAJSHSEfKDtOUo0EBiqOkIxqB3vHov1SKbn8IUDCrTSUQBD8UJym3y
        vqrsjn8+TqetKivDqwQ9i93DRneKt1yA7Rtu1Wcac8fQ29/MTIKPXF+tcEccLbLZz6gyy8qLR4jOJ
        Sn4pX8xg==;
Received: from [177.34.168.16] (helo=bowie..)
        by fanzine2.igalia.com with esmtpsa 
        (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
        id 1pd8xS-00FrGz-J4; Fri, 17 Mar 2023 13:13:19 +0100
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
Subject: [RFC PATCH 4/9] rust: dma_fence: expose the fence's seqno publically
Date:   Fri, 17 Mar 2023 09:12:08 -0300
Message-Id: <20230317121213.93991-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317121213.93991-1-mcanal@igalia.com>
References: <20230317121213.93991-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Each fence has a linear increasing sequence number inside the execution
context, that can be used to decide which fence would be signaled later.
So, expose this attribute to the Rust drivers through a method.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 rust/kernel/dma_fence.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/dma_fence.rs b/rust/kernel/dma_fence.rs
index 176e6d250e6c..94fead520274 100644
--- a/rust/kernel/dma_fence.rs
+++ b/rust/kernel/dma_fence.rs
@@ -60,6 +60,13 @@ pub trait RawDmaFence: crate::private::Sealed {
         }
     }
 
+    /// Return the seqno from this fence
+    fn seqno(&self) -> u64 {
+        // SAFETY: We hold a reference to a dma_fence and every dma_fence holds
+        // a seqno.
+        unsafe { (*self.raw()).seqno }
+    }
+
     /// Signal completion of this fence
     fn signal(&self) -> Result {
         to_result(unsafe { bindings::dma_fence_signal(self.raw()) })
-- 
2.39.2

