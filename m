Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BA0C6FA99
	for <rust-for-linux@archiver.kernel.org>; Fri, 24 Feb 2023 09:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjBXJMG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 24 Feb 2023 04:12:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjBXJMF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 24 Feb 2023 04:12:05 -0500
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAA05D460;
        Fri, 24 Feb 2023 01:12:04 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: linasend@asahilina.net)
        by mail.marcansoft.com (Postfix) with ESMTPSA id C82703FB17;
        Fri, 24 Feb 2023 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
        s=default; t=1677229923;
        bh=wkplfyZ81CMYGIVsW/sksaSI2sUSjgdmqyg/orT1EzU=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc;
        b=sSC0VSiw/DFJcOw0MluWtnpjsgxnaq5CRtv7bT0CgvUiR3KLVKidiViSTDTIrv9Y4
         A7SYMnJsBK19GyYUUOxTtR1+UEwroRWOqFfiWQ19NETTJEJSGos1xZwqygD7mF0j8C
         jyLEuKh4WJMXMQh6IPFGkChcOoF+PTmb9cVE5vqvqj9rtaDLnPS3UbiHHntG0q9Vpr
         oPJWSuhzluFMHv0Wz4+3R4lYTYv/dTifwgoxPPukgEYRwziQqn0aUgGO+KwGtUWFT1
         up4AmdxFwYePNonwk1gUiSUGcjRfPrKH89FZermEbHlCFIcaJifuvnam0UQFY5jj9f
         QivRoXWGRXZ3A==
From:   Asahi Lina <lina@asahilina.net>
Date:   Fri, 24 Feb 2023 18:11:47 +0900
Subject: [PATCH 1/4] rust: Import upstream `alloc::vec::set_len_on_drop`
 module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-rust-vec-v1-1-733b5b5a57c5@asahilina.net>
References: <20230224-rust-vec-v1-0-733b5b5a57c5@asahilina.net>
In-Reply-To: <20230224-rust-vec-v1-0-733b5b5a57c5@asahilina.net>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc:     linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
        asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677229917; l=1615;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=wkplfyZ81CMYGIVsW/sksaSI2sUSjgdmqyg/orT1EzU=;
 b=dpihB9SPTYWGtGlJDBu1TR+XXTZHd3dUY5XNgEcfL9XzxZo4G8htddwW/e3Rk+nV1QD7x8SyI
 47RrcxWK6GnBI/z/4z6xeqIM19pQDYRDiG1WxZRMFh7rPO8plJONNEB
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This is a subset of the Rust standard library `alloc` crate,
version 1.66.0, licensed under "Apache-2.0 OR MIT", from:

    https://github.com/rust-lang/rust/tree/1.66.0/library/alloc/src

The file is copied as-is, with no modifications whatsoever
(not even adding the SPDX identifiers).

For copyright details, please see:

    https://github.com/rust-lang/rust/blob/1.66.0/COPYRIGHT

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/alloc/vec/set_len_on_drop.rs | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/rust/alloc/vec/set_len_on_drop.rs b/rust/alloc/vec/set_len_on_drop.rs
new file mode 100644
index 000000000000..8b66bc812129
--- /dev/null
+++ b/rust/alloc/vec/set_len_on_drop.rs
@@ -0,0 +1,28 @@
+// Set the length of the vec when the `SetLenOnDrop` value goes out of scope.
+//
+// The idea is: The length field in SetLenOnDrop is a local variable
+// that the optimizer will see does not alias with any stores through the Vec's data
+// pointer. This is a workaround for alias analysis issue #32155
+pub(super) struct SetLenOnDrop<'a> {
+    len: &'a mut usize,
+    local_len: usize,
+}
+
+impl<'a> SetLenOnDrop<'a> {
+    #[inline]
+    pub(super) fn new(len: &'a mut usize) -> Self {
+        SetLenOnDrop { local_len: *len, len }
+    }
+
+    #[inline]
+    pub(super) fn increment_len(&mut self, increment: usize) {
+        self.local_len += increment;
+    }
+}
+
+impl Drop for SetLenOnDrop<'_> {
+    #[inline]
+    fn drop(&mut self) {
+        *self.len = self.local_len;
+    }
+}

-- 
2.35.1

