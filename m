Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86973C7EE29
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 19:50:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjFJTuE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 15:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjFJTuD (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 15:50:03 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B49430ED
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 12:50:02 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-bb3a77abd7bso3056978276.0
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 12:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686426602; x=1689018602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqHKZjBd5k6OAWfvRZG0evE65WcCRM9zw16VIQMSwv0=;
        b=Ui/pDzsnYqWhaQ3Ox2AaxdKrdzK8i3CkOxldksB+0FhwPhGCy98nUp8hvG1RXTdMQa
         upWU+CGa8O9xf9ICKkn9V0xNww3elok8XoyeMww+IF1RHZohrIw3/6xrbTzD8r4Vt072
         v+poXutOr/B0bpXR7+B0yJ+f8LZ/r1xyqAbz7ipCK+J09lW8cOGtMIuv3KcUabSg/w8S
         YzLJ6FR9xGmwZJFXI5qG6yo5CCEKZ4MkyTbk79zHy/9+1DcZYjTUyIIi8zTKDi75ghxx
         DWAPjHHZE3kLjA8D755u3FyHa9xv7YKA8GN2frxp8M4iOeOuUZNT2cXT6eM1blIXp1R7
         fnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686426602; x=1689018602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqHKZjBd5k6OAWfvRZG0evE65WcCRM9zw16VIQMSwv0=;
        b=a3E78N0sE1UMfjCGuPrwdHv3Tgv74h/YDFzqTsGnl95NDUJE7Hu8P9NtnbelDcL+P8
         R2+lThXE/uinGWsANnjiDFZXXMhhAxkYy6hVaZttBis46T0icB9vbfCindY19la23dIx
         pJiLrsa85umD3T4pgGM5wqQtlNzgqeipuhjSdhrgFn8Mn631BiNGMgQ6fGkq+dcDVAuK
         5jU4nftWt5r6yT5PNTJrlV3H6tda+KDOV10OfMCpWg0FRgGaCPq5K1KJ8oXL6fdsm4ej
         oqmm4sbz8TaeFcKu0RO79Sz6XxZw9mcB/9tvHIW+VSB5XI1ieyNl1akPWtSk2A71/7Ow
         T2xA==
X-Gm-Message-State: AC+VfDxSZJi+yoDkE/M/ZCgqnBFSLW3XkhVDGEH8nnL4HJO4hDrFo2Ds
        jxLI24T3Uamw+94J5Rytqh/VE7NzhnGT74ZfnTM=
X-Google-Smtp-Source: ACHHUZ4jNtpBZqMo1S+2WHl45WUinpQaN12gVAsnyk9dDQkTtq7vk3y8NQqmkZ5cH4tvY/GcV0HdHUSy1MonzunnV0o=
X-Received: by 2002:a25:6cc1:0:b0:ba7:a909:a98b with SMTP id
 h184-20020a256cc1000000b00ba7a909a98bmr4467309ybc.61.1686426601631; Sat, 10
 Jun 2023 12:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230610071848.3722492-1-tomo@exabit.dev> <01010188a42d5319-9cd7b5ec-5b06-4d08-88cb-c2a82a8e3a0d-000000@us-west-2.amazonses.com>
In-Reply-To: <01010188a42d5319-9cd7b5ec-5b06-4d08-88cb-c2a82a8e3a0d-000000@us-west-2.amazonses.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 10 Jun 2023 21:49:50 +0200
Message-ID: <CANiq72ki5CEY4QpOW63YTAU8_2OB8rS0FEuY-qXyncahkNUMFg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] rust: core abstractions for network device drivers
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        andrew@lunn.ch, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 9:35=E2=80=AFAM FUJITA Tomonori <tomo@exabit.dev> w=
rote:
>
> +/// Corresponds to the kernel's `struct net_device`.
> +///
> +/// # Safety
> +///
> +/// The kernel uses a `net_device` object with various functions like `s=
truct net_device_ops`.
> +/// This object is passed to Rust callbacks while these functions are ru=
nning.
> +/// The C API guarantees that `net_device` isn't released while this fun=
ction is running.
> +pub struct Device(*mut bindings::net_device);

This is not a function :) So "while this function is running" does not
make too much sense here.

Also, this is a `struct`, so we do not use `# Safety` sections.
Instead, you may want to give this struct a  `# Invariants` section,
and explain what is guaranteed by this type.

Similarly for `SkBuff` below.

> +    fn priv_data_ptr(netdev: *mut bindings::net_device) -> *const c_void=
 {
> +        // SAFETY: The safety requirement ensures that the pointer is va=
lid.
> +        unsafe { core::ptr::read(bindings::netdev_priv(&mut *netdev) as =
*const *const c_void) }
> +    }

Like in the other patch, there is no safety requirement in this
function, so you can't use that to justify it.

Even if this is a private function, it would be best if this is
`unsafe`, then you can require callers to pass you a valid pointer --
you already have a `SAFETY` comment in the callers anyway, and those
are the ones that can actually claim that the pointer is valid.

> +// SAFETY: `Device` exposes the state, `D::Data` object across threads
> +// but that type is required to be Send and Sync.
> +unsafe impl Send for Device {}
> +unsafe impl Sync for Device {}

Please provide a `SAFETY` comment for each. See e.g. the ones we have
for `ARef`.

In addition, what is `D::Data` here? I guess you are referring to
`DriverData::Data` somehow, but it is unclear what is `D` here.

Also, please use Markdown in comments, not just documentation, to be
consistent, e.g.

    ... to be `Send` and `Sync`.

> +/// # Safety
> +///
> +/// The pointer to the `net_device` object is guaranteed to be valid unt=
il
> +/// the registration object is dropped.
> +pub struct Registration<T: DeviceOperations<D>, D: DriverData> {
> +    dev: Device,
> +    is_registered: bool,
> +    _p: PhantomData<(D, T)>,
> +}

Ditto about this being a `struct` and `# Safety`.

Also, if it is valid until dropped, then it is "always" valid (as far
as someone having such an object is concerned), so there is no need to
say so.

> +    fn drop(&mut self) {
> +        // SAFETY: `dev` was allocated during initialization and guarant=
eed to be valid.

Do you mean `dev.0`?

> +        // SAFETY: the kernel allocated the space for a pointer.

Please capitalize to be consistent.

> +        unsafe {
> +            let priv_ptr =3D bindings::netdev_priv(ptr) as *mut *const c=
_void;
> +            core::ptr::write(priv_ptr, data.into_foreign());
> +        }

> +        ..unsafe { core::mem::MaybeUninit::<bindings::net_device_ops>::z=
eroed().assume_init() }

A comment on this would be nice. Also, missing `SAFETY` comment, even
if it is a `const`.

Thanks!

Cheers,
Miguel
