Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D170BC7EE23
	for <rust-for-linux@archiver.kernel.org>; Mon, 12 Jun 2023 13:26:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbjFLN0m (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 12 Jun 2023 09:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236284AbjFLN0l (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 12 Jun 2023 09:26:41 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668CAAC
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jun 2023 06:26:37 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-55b21c3f359so2890506eaf.0
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jun 2023 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686576396; x=1689168396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iVFFMalOkynK5fXojtuLwTer+snOYDqHHGAoW1U1GU=;
        b=AI2QeurH8ta/AIIBqn1r7ta+zhNnoIZDADkGw3vmVDoKXuDJE0pDDHpp9xG8ngLjce
         SE9dWzIpYSG6zWcU/cQ65LqqABF01IqD8mek0WRZRWRyf3xxSWucZJtQNNaxQkW/JgYM
         DvdPd5mzl68GfdEkDHVZRUqjsMyqOo2a7RXxFv6vIS3cjshgsfg9DGZ2pB3ctgkTR7GY
         sHkB5KeiZqcBirIbrdBk0q/JZQwAuL2znHQuLDZ09D/Ea1Ta8+9wgf14OqqEEzWOapZ5
         1Ef3CW8nP8XxKMdfSZcF0VwUslpL9xrMNwQsF3hMUYY18JowyH3Nw3jgoWcfSKRCq22n
         BeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686576396; x=1689168396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iVFFMalOkynK5fXojtuLwTer+snOYDqHHGAoW1U1GU=;
        b=KKWElIsO9Vgro2BdZPmYz/qNDCZB058lbUjAA2+xKblm2MobXdyQpfxubE2PPK2sVe
         zzRfbkheX2+SVkwAaTuQBY/jIK+P+F31cygO4d25hgf3aWXcKdztSBJtGVPO0050DeP4
         cila23Mu5JFyanwhdo/LC/uWSbP1C+vDm0pxi7aplm65Yi65CtVIqYVEa1HJ7yutMoy9
         q3m6Wee5hMA3oAdGlU5Na7R8ieU3ppvZ/owcKqqSK/DGG61dF/aHmXpKOiSmj0VWZPAs
         N7wcEU8st8xr94vaw+/AfdQy8K0niXwi+fHD/idAVaSRjxyWMhZmfJWnzl5zQe0B9vVx
         O6Ww==
X-Gm-Message-State: AC+VfDx/9C5dyZRen7CAJrGb0HjI+YJVqHEsNJ2qPlioGwCMrVgcfUUq
        Zf8isOBoBVsmtozYzDJo0XqNyZdgNqll6RJgYXI=
X-Google-Smtp-Source: ACHHUZ6jjrsXuUOsvM0xafbzYxQw6V29B6CbYZlAT+odPVKZzCtuM1z99nBQqxCAkbOM+py1q/huQdNogWzRn42SCjE=
X-Received: by 2002:a05:6358:a55:b0:123:1d38:db05 with SMTP id
 21-20020a0563580a5500b001231d38db05mr3322925rwb.6.1686576395844; Mon, 12 Jun
 2023 06:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230610071848.3722492-1-tomo@exabit.dev> <01010188a42d5319-9cd7b5ec-5b06-4d08-88cb-c2a82a8e3a0d-000000@us-west-2.amazonses.com>
 <CANiq72ki5CEY4QpOW63YTAU8_2OB8rS0FEuY-qXyncahkNUMFg@mail.gmail.com> <01010188adfdd516-4ddbccb3-ec96-4a6d-b3eb-976adc591ba3-000000@us-west-2.amazonses.com>
In-Reply-To: <01010188adfdd516-4ddbccb3-ec96-4a6d-b3eb-976adc591ba3-000000@us-west-2.amazonses.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 12 Jun 2023 15:26:24 +0200
Message-ID: <CANiq72nW4+dL-7516ARPg371rmOejSZaa6veQrUG77una7xBig@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] rust: core abstractions for network device drivers
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        andrew@lunn.ch, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Jun 12, 2023 at 7:04=E2=80=AFAM FUJITA Tomonori <tomo@exabit.dev> w=
rote:
>
> Sorry, obviously, I didn't understand comments about safety. Aded `#
> Invariants` section to both structures.
>
> I've updated the comments and put the fixed version at the end. Can
> you check again? If it looks fine, I'll update the comments in the
> rest of patches.

Looks better now (without having checked if they are correct w.r.t.
what the C side guarantees) -- thanks! A couple comments below.

> +    /// Gets a pointer to network device private data.
> +    ///
> +    /// A driver in C uses contiguous memory `struct net_device` and its=
 private data.
> +    /// A driver in Rust contiguous memory `struct net_device` and a poi=
nter to its private data.
> +    /// So a driver in Rust pays extra cost to access to its private dat=
a.
> +    /// A device driver passes an properly initialized private data and =
the kernel saves
> +    /// its pointer.
> +    fn priv_data_ptr(&self) -> *const c_void {
> +        // SAFETY: The type invariants guarantee that `self.0` is valid.
> +        unsafe { core::ptr::read(bindings::netdev_priv(self.0) as *const=
 *const c_void) }
> +    }

Part of the docs of this function should probably be moved to the
`SAFETY` comment, since it is needed to justify the `ptr::read` (and
it is an implementation detail): `self.0` is valid here, but we need
to justify why reading from the returned pointer from `netdev_priv` is
OK, and for that one needs to know the layout explained in the docs
above.

Also, in general, please always aim to minimize what `unsafe` blocks
cover. For instance, here there should be two blocks: one for the FFI
call, and the other for the pointer read. Splitting such blocks makes
it very clear that there are two different proofs needed here.

> +        // SAFETY: `ptr` is valid and non-null since `alloc_etherdev_mqs=
()`
> +        // returned a valid pointer which was null-checked.
> +        let dev =3D unsafe {
> +            let priv_ptr =3D bindings::netdev_priv(ptr) as *mut *const c=
_void;
> +            core::ptr::write(priv_ptr, data.into_foreign());
> +            Device::from_ptr(ptr)
> +        };

Similarly here, i.e. the `SAFETY` comment does not mention why is
`priv_ptr` valid for the `ptr::write`.

Cheers,
Miguel
