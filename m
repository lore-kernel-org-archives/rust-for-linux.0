Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F15C761AF
	for <rust-for-linux@archiver.kernel.org>; Wed,  5 Apr 2023 19:35:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232560AbjDETfn (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 5 Apr 2023 15:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDETfm (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 5 Apr 2023 15:35:42 -0400
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C497C5B9D
        for <rust-for-linux@vger.kernel.org>; Wed,  5 Apr 2023 12:35:40 -0700 (PDT)
Date:   Wed, 05 Apr 2023 19:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1680723338; x=1680982538;
        bh=0fJvllTidlaCaBo/L7PXilYIMiZzcU0zSrjFdHjiHhM=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=Fxif8rejuKpk/l/W8YF7xN4PsUldUMWaYkCeF0cSmqf39ZQBQAPT5/VvAEaVQP8Qk
         yWOQtoDd/RLcY3hDXIzSMOmwV+u+0kinLF+jUrj+fnHm8Kg5kuPBw5HBWe632wBKq8
         i/dd8/kUGR9Azl39wvXs4SQHkhpQAAiJMukJzAZL2N92z6sfN/DdPOjAK0bOEPoEOn
         BIkqCMFzyzoAMIU9h8mphq2nADjSG5xWg9QPGrZVsozZQW9ZnrJns6aABSXvTt+fyu
         /ec5bW+UPS+YPcZ/DkQ6UOi1YJIBMak2teChMLfbuaxC6xvCzzm02fSubkcN7kEsw/
         2Dxu1z2R2Q/3g==
To:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Alice Ryhl <alice@ryhl.io>, Andreas Hindborg <nmi@metaspace.dk>
From:   Benno Lossin <y86-dev@protonmail.com>
Cc:     rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Benno Lossin <y86-dev@protonmail.com>,
        Alice Ryhl <aliceryhl@google.com>,
        Andreas Hindborg <a.hindborg@samsung.com>
Subject: [PATCH v6 01/15] rust: enable the `pin_macro` feature
Message-ID: <20230405193445.745024-2-y86-dev@protonmail.com>
In-Reply-To: <20230405193445.745024-1-y86-dev@protonmail.com>
References: <20230405193445.745024-1-y86-dev@protonmail.com>
Feedback-ID: 40624463:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This feature enables the use of the `pin!` macro for the `stack_pin_init!`
macro. This feature is already stabilized in Rust version 1.68.

Signed-off-by: Benno Lossin <y86-dev@protonmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Acked-by: Boqun Feng <boqun.feng@gmail.com>
Cc: Andreas Hindborg <a.hindborg@samsung.com>
---
 rust/kernel/lib.rs     | 1 +
 scripts/Makefile.build | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 223564f9f0cc..4317b6d5f50b 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -17,6 +17,7 @@
 #![feature(core_ffi_c)]
 #![feature(dispatch_from_dyn)]
 #![feature(generic_associated_types)]
+#![feature(pin_macro)]
 #![feature(receiver_trait)]
 #![feature(unsize)]

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 76323201232a..ba4102b9d94d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -277,7 +277,7 @@ $(obj)/%.lst: $(src)/%.c FORCE
 # Compile Rust sources (.rs)
 # ------------------------------------------------------------------------=
---

-rust_allowed_features :=3D core_ffi_c
+rust_allowed_features :=3D core_ffi_c,pin_macro

 rust_common_cmd =3D \
 =09RUST_MODFILE=3D$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \
--
2.39.2


