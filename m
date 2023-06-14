Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF766EB64DA
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Jun 2023 11:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243660AbjFNLxn (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 14 Jun 2023 07:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbjFNLxm (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 14 Jun 2023 07:53:42 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477A41BEF
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jun 2023 04:53:37 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-57000a7480bso8960807b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jun 2023 04:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686743616; x=1689335616;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iQcKjMXMsnWztaoMR9yA4alqbcESKo/Ty0nyLCc3lHY=;
        b=P/0dT32mEmx5CRm6KyIkY8XYLtJCudbxoZS8fwkFdmZ7FMZ4gNRw1+wgP465gUIN42
         LdIpWmYzaXg3CI1XlaE4maNokY3KosI1rhodoBW1i9esHOuyKU6hAdVgZxmvkeK5ZDe9
         aLJ9E7GES+I4AlHLDcNtJNj4K0AllRunwIQ9tqSlsSCb8yOCdqpgZgtpSsfxZURxkCOW
         +tQPNlr1bkJ2jdG3tZqf0IWPKabg/xWJ0mH6IspxYJyWXft9mOT1ou3m9ewsZ3VAUNwC
         Exrhm9dNNTMrUzhFcy0uEdc+f9CEHHQo3at96Cp0neLyBwDwfv6PJsN0aOxfCVncW+0k
         acsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686743616; x=1689335616;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQcKjMXMsnWztaoMR9yA4alqbcESKo/Ty0nyLCc3lHY=;
        b=JHSmOxyDMRP6CWh0XiVFZjMCt2ALsQnL/jMtm9WyN5bX1hfDblRJIIZGeTS/mFvcmf
         egdd7H1/kdBqAE6hWiJY4SNzk6bNbNHQTywbQ2bcwEX7FxK4Q/EKsrTt23l5Xyqe48JK
         eH/nNZwnJzIID8I0ftkkD3IFCXwBYoXEnd0dAWYp/PcY/J/FKkJCl2h23sLIwWv2Ad0U
         8ShyfNgJM5hvhhiiIhtFYt/9mqss7WwdmNgw7syKmAVD3q+1pc+7bqMKvYhfFwoty84S
         d0+TcPSEGhTDYKUX37i4w7U4ka4rLFL+SE/KowW4s9DF0PkRkQokCJ+rHzaheTpW4zz7
         VjUw==
X-Gm-Message-State: AC+VfDyTiD/g2CEbKsT5C9b+dJczfA22bi55ryDAd3gpCg2acbeccaPb
        OsmaKj5+BtLjEAK2sWo+jUDey27iZM9RiFBS4g2U0U7KimZRLnR/NfepEiVIuDH8LQcjVDuWhv+
        alLvGu+/0heMC8RhfSFHMU70ITvwLtQzM45O36jaMsoEuccwjXtXPoI4rCPq7iAe5cys2uFxxnp
        z+GViq
X-Google-Smtp-Source: ACHHUZ5vDFW8adN4U6HOdgFt8IGTY+hbYJ1tu0Qnb7sRlz1iIvi7knGe30Ax5P9nmQuCndSXtfKh6M7RkJo74RQ=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:d854:0:b0:bc4:8939:e1f5 with SMTP id
 p81-20020a25d854000000b00bc48939e1f5mr909934ybg.4.1686743616324; Wed, 14 Jun
 2023 04:53:36 -0700 (PDT)
Date:   Wed, 14 Jun 2023 11:53:28 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230614115328.2825961-1-aliceryhl@google.com>
Subject: [PATCH] rust: make `UnsafeCell` the outer type in `Opaque`
From:   Alice Ryhl <aliceryhl@google.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Alice Ryhl <aliceryhl@google.com>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

When combining `UnsafeCell` with `MaybeUninit`, it is idiomatic to use
`UnsafeCell` as the outer type. Intuitively, this is because a
`MaybeUninit<T>` might not contain a `T`, but we always want the effect
of the `UnsafeCell`, even if the inner value is uninitialized.

Now, strictly speaking, this doesn't really make a difference. The
compiler will always apply the `UnsafeCell` effect even if the inner
value is uninitialized. But I think we should follow the convention
here.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/types.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 1e5380b16ed5..fb41635f1e1f 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -224,17 +224,17 @@ fn drop(&mut self) {
 ///
 /// This is meant to be used with FFI objects that are never interpreted by Rust code.
 #[repr(transparent)]
-pub struct Opaque<T>(MaybeUninit<UnsafeCell<T>>);
+pub struct Opaque<T>(UnsafeCell<MaybeUninit<T>>);
 
 impl<T> Opaque<T> {
     /// Creates a new opaque value.
     pub const fn new(value: T) -> Self {
-        Self(MaybeUninit::new(UnsafeCell::new(value)))
+        Self(UnsafeCell::new(MaybeUninit::new(value)))
     }
 
     /// Creates an uninitialised value.
     pub const fn uninit() -> Self {
-        Self(MaybeUninit::uninit())
+        Self(UnsafeCell::new(MaybeUninit::uninit()))
     }
 
     /// Creates a pin-initializer from the given initializer closure.
@@ -258,7 +258,7 @@ pub fn ffi_init(init_func: impl FnOnce(*mut T)) -> impl PinInit<Self> {
 
     /// Returns a raw pointer to the opaque data.
     pub fn get(&self) -> *mut T {
-        UnsafeCell::raw_get(self.0.as_ptr())
+        UnsafeCell::get(&self.0).cast::<T>()
     }
 
     /// Gets the value behind `this`.
@@ -266,7 +266,7 @@ pub fn get(&self) -> *mut T {
     /// This function is useful to get access to the value without creating intermediate
     /// references.
     pub const fn raw_get(this: *const Self) -> *mut T {
-        UnsafeCell::raw_get(this.cast::<UnsafeCell<T>>())
+        UnsafeCell::raw_get(this.cast::<UnsafeCell<MaybeUninit<T>>>()).cast::<T>()
     }
 }
 

base-commit: d2e3115d717197cb2bc020dd1f06b06538474ac3
-- 
2.41.0.162.gfafddb0af9-goog

