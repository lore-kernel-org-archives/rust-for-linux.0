Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D89C76188
	for <rust-for-linux@archiver.kernel.org>; Mon,  3 Apr 2023 15:46:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233033AbjDCPqC (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 3 Apr 2023 11:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232808AbjDCPpr (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 3 Apr 2023 11:45:47 -0400
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A758240F6
        for <rust-for-linux@vger.kernel.org>; Mon,  3 Apr 2023 08:45:28 -0700 (PDT)
Date:   Mon, 03 Apr 2023 15:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1680536726; x=1680795926;
        bh=7rH6H6G+ATzJ5NdhnHFFoHIa5Qvd43Dus1uGWQ71zqY=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=rOhPrLQYAcKOWJDIU61GZz6rq/yIy1wLIxWh57OGv3fmXFw7r5v7+S03zLG3pXTxm
         8nanqh+YIm0CVcVeWxA1NvyBMnNg+1KR1C5MdWqvKMcHcctsH6sVnXR96dCM7Zihpm
         DLhpujgwjcrNizjgXs4mWNPd4cqXkbn/8X8rdPrrfci8ZBu6gJD4BxeE8v5n2tTuDh
         lLpGrC4ZyfcgVztNhTa4kLwP+vC+Yf3vrDPp8BaLSuwlcelXcoxshPx/qdhWhfgMWz
         mlLUw/OcRT+SwGY6gT2fmmvFLlN1hTRyTKlZKvskGX1ID2zx3wHxUBk6ekkTfjsTnx
         Veh8ArMiQoonA==
To:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Alice Ryhl <alice@ryhl.io>
From:   Benno Lossin <y86-dev@protonmail.com>
Cc:     rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Benno Lossin <y86-dev@protonmail.com>,
        Andreas Hindborg <a.hindborg@samsung.com>,
        Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH v5 05/15] rust: types: add `Opaque::raw_get`
Message-ID: <20230403154422.168633-6-y86-dev@protonmail.com>
In-Reply-To: <20230403154422.168633-1-y86-dev@protonmail.com>
References: <20230403154422.168633-1-y86-dev@protonmail.com>
Feedback-ID: 40624463:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This function mirrors `UnsafeCell::raw_get`. It avoids creating a
reference and allows solely using raw pointers.
The `pin-init` API will be using this, since uninitialized memory
requires raw pointers.

Signed-off-by: Benno Lossin <y86-dev@protonmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/types.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 9d0fdbc55843..ff2b2fac951d 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -238,6 +238,14 @@ impl<T> Opaque<T> {
     pub fn get(&self) -> *mut T {
         UnsafeCell::raw_get(self.0.as_ptr())
     }
+
+    /// Gets the value behind `this`.
+    ///
+    /// This function is useful to get access to the value without creatin=
g intermediate
+    /// references.
+    pub const fn raw_get(this: *const Self) -> *mut T {
+        UnsafeCell::raw_get(this.cast::<UnsafeCell<T>>())
+    }
 }

 /// A sum type that always holds either a value of type `L` or `R`.
--
2.39.2


