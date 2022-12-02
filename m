Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593E0C4321E
	for <rust-for-linux@archiver.kernel.org>; Fri,  2 Dec 2022 16:17:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233935AbiLBQRW (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 2 Dec 2022 11:17:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233728AbiLBQQx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 2 Dec 2022 11:16:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1BDBF672;
        Fri,  2 Dec 2022 08:16:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F1B4262333;
        Fri,  2 Dec 2022 16:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68981C43470;
        Fri,  2 Dec 2022 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669997790;
        bh=PSDlDgg7arSCRfOwK63AE+RLja44ZMgKq2KzkCToYdA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NYvNrJtWUxlmlj2bF+g+67oP10HdYPd3vqoltQvQaziRXrHKkVy2tkS6KJZgGVRmu
         Kta1SMRVQjrauuhHyZUGsfZ+gFeo/9OUqHhhFhW4aZouyYM2BWGdG4FbZTH2aBa601
         FA24RpWeUlmG/uGJYFgattK88Bs7+wkWpY01RzG2UTKVIVPK0svLEiOagWpFns2qIQ
         vys8Mt8rXbOr2+yK8inBGfFjgQ3XoQIwW9/qVNbVBD/sA9dfZNdc4vyGSE2WZUlr25
         8p4XtNdivPdFdHb8BgDoe0ylmCJ69ZCruINqgFBuqFc/RLCbv4+Wsk/ebd6wOCAFjh
         d97wO5cO2KqBw==
From:   ojeda@kernel.org
To:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>
Cc:     rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev
Subject: [PATCH v2 22/28] rust: str: add `fmt!` macro
Date:   Fri,  2 Dec 2022 17:14:53 +0100
Message-Id: <20221202161502.385525-23-ojeda@kernel.org>
In-Reply-To: <20221202161502.385525-1-ojeda@kernel.org>
References: <20221202161502.385525-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: Wedson Almeida Filho <wedsonaf@gmail.com>

Add the `fmt!` macro, which is a convenience alias for the Rust
`core::format_args!` macro.

For instance, it may be used to create a `CString`:

    CString::try_from_fmt(fmt!("{}{}", "abc", 42))?

Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
[Reworded, adapted for upstream and applied latest changes]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/str.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 17dc8d273302..b771310fa4a4 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -583,3 +583,9 @@ impl Deref for CString {
         unsafe { CStr::from_bytes_with_nul_unchecked(self.buf.as_slice()) }
     }
 }
+
+/// A convenience alias for [`core::format_args`].
+#[macro_export]
+macro_rules! fmt {
+    ($($f:tt)*) => ( core::format_args!($($f)*) )
+}
-- 
2.38.1

