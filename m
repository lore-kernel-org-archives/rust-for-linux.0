Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5669AC38142
	for <rust-for-linux@archiver.kernel.org>; Tue, 31 Jan 2023 13:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbjAaNI5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 31 Jan 2023 08:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbjAaNI4 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 31 Jan 2023 08:08:56 -0500
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962138A73;
        Tue, 31 Jan 2023 05:08:49 -0800 (PST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-142b72a728fso19195859fac.9;
        Tue, 31 Jan 2023 05:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5vxGDcuE5ADlwFzUbFDPZd16x22UTWZptpHGJiMgcac=;
        b=GGhSlkCqG9nBEEeAex6K3a7EAFyUp4RwNFkYdvohfBEglz0IMFuA4wsRJ0mgiXIQcV
         nE24AmBFn71YXufi6C16QS4Fws0FKEFNvxKK7H/xJjUXfhA5epOfsPPY2MBMDLbmVkq8
         5lmgHx35n38FeiPAxo4UC1aGpqbSjZk36hJrx7gt01BY0vizqG4ypXEDGQO22QFSGpD1
         35M/onbqoNIzo5ipXjeiwJby4xL1+wXcD75KhybgVIGHu2YPYlaHSKamlCejqKZvF5F3
         HVYupofiLDWB77fbQ1Z3K7scA6ArjCaheCTYgxZmiZK6q4qiPo3fyZEaSaEaGRMx/Fhz
         A87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vxGDcuE5ADlwFzUbFDPZd16x22UTWZptpHGJiMgcac=;
        b=xhaxseqJWL9soWKpfAVXc4fOfbw9sDwR/X8xms1MZzFbtz4jU+Ie4ijttsU6deUjn5
         5m94XI1HOHnJVXz/n6y9mXXgecnjnIzyiIp9jp6XNVBMTiqStI/ihmHt3m+cAEtcMGAC
         HDZ7P9ebKUcaoLb4XnPPj3txv0OC0V/LAPOIh0XPub5aU0OxwwMjDMqodQ6jspgJSRgw
         Il9GwLz4pziFc1VtdgzfktnzE2idiXe7uvPC27hfCREOPj7kkjl94SPgz/npBvXOtaof
         BZ95temojfStVvHAYcLFcYmM00adI/00uQTXiDNL95ZXXXKeOcZDMMbm+3cwccO2D9IK
         VKbg==
X-Gm-Message-State: AO0yUKW05+xLEcSqoTSNOofgjVTyFMD4+0K0DGSMkjv2388FVkRJohv5
        fYeUSZm0zIFbsTf1w3GpXGuZ504/NuM=
X-Google-Smtp-Source: AK7set8egRtFUH7sPqUKaEkP2rN5ZYWl9H1RBSq/E0qGXFBh0wqAsX6aPQ8HP0nDnDgrWUlpSv1HAw==
X-Received: by 2002:a05:6870:6593:b0:163:4004:c7de with SMTP id fp19-20020a056870659300b001634004c7demr12835858oab.36.1675170528642;
        Tue, 31 Jan 2023 05:08:48 -0800 (PST)
Received: from tx3000mach.io (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id g5-20020a05687054c500b0014866eb34cesm6441483oan.48.2023.01.31.05.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 05:08:48 -0800 (PST)
From:   Martin Rodriguez Reboredo <yakoyoku@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>
Subject: [PATCH] rust: add this_module macro
Date:   Tue, 31 Jan 2023 10:08:41 -0300
Message-Id: <20230131130841.318301-1-yakoyoku@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Adds a Rust equivalent to the handy THIS_MODULE macro from C.

Signed-off-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
---
 rust/kernel/lib.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e0b0e953907d..afb6b0390426 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -80,6 +80,18 @@ impl ThisModule {
     }
 }
 
+/// Returns the current module.
+#[macro_export]
+macro_rules! this_module {
+    () => {
+        if cfg!(MODULE) {
+            Some(unsafe { $crate::ThisModule::from_ptr(&mut $crate::bindings::__this_module) })
+        } else {
+            None
+        }
+    };
+}
+
 #[cfg(not(any(testlib, test)))]
 #[panic_handler]
 fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
-- 
2.39.1

