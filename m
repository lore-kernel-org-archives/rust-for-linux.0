Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4368AEB64D7
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Jun 2023 17:44:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjFTRoy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 20 Jun 2023 13:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbjFTRon (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 20 Jun 2023 13:44:43 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC7B1737;
        Tue, 20 Jun 2023 10:44:39 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-786e637f06dso1744859241.2;
        Tue, 20 Jun 2023 10:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687283079; x=1689875079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jd3EwbpprDKXYac/KHjQEMgyNmjIJh2PJ3crLjzLGg=;
        b=T2ZgQDpby1b+/nclwql9GMs1vg2EY5W0tQsJ18LXUax/5FhVSJLLnSW5m++eL4WbPw
         P78N3YN5ubQqmebAEnAvjz7WBmVXLkzVYZvmyGd48jwmGPMWyDTr3M60kXIXhwT6DNe+
         J0OcnUQVLtipkaTXPeehjTAq+xWQalaxgYYV/nZLnKVqLwF34J2tVPNUDrGQEU4OuF0S
         SQIgyc1tX42dmTwk/NNok1SdPXncyCrX7c5Nc9uqCsjMu2VuWem8Xpm0dXD0TbKuijOC
         BiiRkQlCd8ksoGZRMcTDm4X77osyBq88eqBxPeOANUe/591sSZZkFRSYXjUGyvCiwsJr
         kNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687283079; x=1689875079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jd3EwbpprDKXYac/KHjQEMgyNmjIJh2PJ3crLjzLGg=;
        b=HYsSH7zWH1BwKYzv0MH4Z4sAK78orfynBW+zSxOtdgP5ZTx2OrtBIaMtLnUawv5FGC
         ZldhS/m9rBVSwvcfakg5lB9uZsk0F7VCey5jfX9T3eHisQg5qsq6sxJm2SIILFlpbwXg
         zIbOy1Y1W6bLER+TM0FxlCMJDqIrEx+UbGcwcMO3s18H0VG2MywF45o3YnEkqjENq8Fz
         jgHfMfyGqcEraFm4apgSBCniBFmTSNUNICHz/vAiyuZZ6Pcc76pVxAhVc9tr7qEf9qSi
         ApyTQczwfGaoX2XbWzUrvcW4DGbZeyXR65e8RxrMxPgSwBU3DHk9emKiiVFt3YyTREHO
         hwXA==
X-Gm-Message-State: AC+VfDwhUV8fPn6wSNvdgqzBgaav5A8MqaWRm9LF0fmjXkaEFOxwE0lB
        zuKZCemw1uhET1MgPcq9B64AiCkTHdbkN8d4otc=
X-Google-Smtp-Source: ACHHUZ4T3yRHoY3skFc1bV1ccKnL/j8GvfemTJdeLQoIqRtZx8xAjn4UYK9TN4zK4SHJVWf5aPSLI/stf3/DXr/pu+4=
X-Received: by 2002:a05:6102:3a50:b0:440:6529:6466 with SMTP id
 c16-20020a0561023a5000b0044065296466mr3373452vsu.24.1687283078639; Tue, 20
 Jun 2023 10:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230614230128.199724bd@kernel.org> <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
 <20230615190252.4e010230@kernel.org> <20230616.220220.1985070935510060172.ubuntu@gmail.com>
 <20230616114006.3a2a09e5@kernel.org> <66dcc87e-e03f-1043-c91d-25d6fa7130a1@ryhl.io>
 <20230616121041.4010f51b@kernel.org> <053cb4c3-aab1-23b3-56e3-4f1741e69404@ryhl.io>
 <7dbf3c85-02ca-4c9b-b40d-adcdb85305dd@lunn.ch> <c1b23f21-d161-6241-26fb-7a2cbc4c059c@ryhl.io>
 <20230620084749.597f10b3@kernel.org> <809bb749-365f-af06-c575-0c4b1a219035@ryhl.io>
In-Reply-To: <809bb749-365f-af06-c575-0c4b1a219035@ryhl.io>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 20 Jun 2023 19:44:27 +0200
Message-ID: <CANiq72n91z7heDU5MDk_=jYY8h8VJsfboevmFS0vrD-zQCKq5Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
To:     Alice Ryhl <alice@ryhl.io>, Gary Guo <gary@garyguo.net>
Cc:     Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        FUJITA Tomonori <fujita.tomonori@gmail.com>,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Jun 20, 2023 at 6:55=E2=80=AFPM Alice Ryhl <alice@ryhl.io> wrote:
>
> We could probably have the destructor call some method that the linker
> wont be able to find, then mark the destructor with #[inline] so that
> dead-code elimination removes it if unused.
>
> (At least, in godbolt the inline marker was necessary for the destructor
> to get removed when not used.)

Yeah, and we could use `build_assert!(false);` to ensure we don't ever
call it (by users, or by the the custom destructor methods) -- it
seems to work [1], but I am Cc'ing Gary in case he has some concerns
(IIRC we discussed this in the past; I may be forgetting an issue with
this).

Cheers,
Miguel

[1]

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index c20b37e88ab2..7c313c75ff14 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -261,3 +261,28 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
     // instead of `!`. See
<https://github.com/rust-lang/rust-bindgen/issues/2094>.
     loop {}
 }
+
+/// Custom destructor example.
+pub struct S;
+
+impl S {
+    /// Custom destructor 1.
+    pub fn close1(self) {
+        pr_info!("close1");
+        core::mem::forget(self); // If commented out, it is a build error.
+    }
+
+    /// Custom destructor 2.
+    pub fn close2(self) {
+        pr_info!("close2");
+        core::mem::forget(self); // If commented out, it is a build error.
+    }
+}
+
+impl Drop for S {
+    #[inline(always)]
+    fn drop(&mut self) {
+        // This should never be called.
+        build_assert!(false);
+    }
+}
diff --git a/samples/rust/rust_minimal.rs b/samples/rust/rust_minimal.rs
index 54de32b78cec..f07064ff6341 100644
--- a/samples/rust/rust_minimal.rs
+++ b/samples/rust/rust_minimal.rs
@@ -3,6 +3,7 @@
 //! Rust minimal sample.

 use kernel::prelude::*;
+use kernel::S;

 module! {
     type: RustMinimal,
@@ -26,6 +27,12 @@ impl kernel::Module for RustMinimal {
         numbers.try_push(108)?;
         numbers.try_push(200)?;

+        let _s =3D S;
+        _s.close1(); // If commented out, it is a build error.
+
+        let _s =3D S;
+        _s.close2(); // If commented out, it is a build error.
+
         Ok(RustMinimal { numbers })
     }
 }
