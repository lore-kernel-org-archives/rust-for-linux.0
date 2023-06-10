Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC63C77B7A
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 19:15:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbjFJTO7 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 15:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjFJTOw (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 15:14:52 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096D51FE9
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 12:14:49 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-bc4114d44a8so834971276.2
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 12:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686424488; x=1689016488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nE3aWUZY1ezJM8rxFLQRCmTLp1Pf2OsKUvn0glu9Og=;
        b=clTzWfq9H1PWUEEJfWmu2VTws0XbNj2jt7/nnwio7Y9HL4pkMwxSbTK7iGzmI1j4vK
         QZPjWmVnJ8r7dDuNEIf/+jO9z1fNfT2Y6CDVRMr+Vd6InQQNF0vSl+OL3C9B7JrVhasa
         BCkkoxnw5lMIobXVGaozn16oFZeGmGcp97syuFLMl02dkz8aH0t64/2+3I7iJOhi0QAs
         TeOLpd2ZY+QYbU0C7WOKP2F74wlaSzg7KKn0XvwPNV8gOdq1hqLlE9VOWvAE9ARGkN03
         3wYRR7sRHVNusmkZvkO30q1unbCuI3612PHmNB8sXEJKjGJ3ql5tT+rrWzLN/rTarUK8
         rD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686424488; x=1689016488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nE3aWUZY1ezJM8rxFLQRCmTLp1Pf2OsKUvn0glu9Og=;
        b=OwKv5X3LMQIyJMYN9EPzTlIYxyc/dkt32LrQ7UMAX5as9782G5s9fQx1eMAmwVKLkC
         VkerKLqHfeFj0O7TupdYO6ef9WYFikbAyysn2zO98SwlG/T/VswOpk12CBwcd7h04IFr
         vnIwCqQECGUoE0Hg3yDytpo8F/KyJIr0WRcnziq0XzmITIm3VMVtpcM8yTkIL/bP/nuI
         dhBFH3cFv7g4tGi3u2C7oAyp1+JHa/fF0E9BJq82UTyJMPeA1nTeQ8n8/7nD5VOe06Mt
         939BTLxYRTNdiOJo+xltxzHpWE+jmtr+9mIG8rfgPKIdLCgOnWv1/ygX3DglPC6A6el7
         8krw==
X-Gm-Message-State: AC+VfDwRA7KkI0e29x+KonX5IrJG5L9FYI4LahZ3QbTShuAc8ziBTP/E
        6n6Ug1ydRHqxKiIAVuQK+oQycf3EuGjzb0I+Yigmfxpq
X-Google-Smtp-Source: ACHHUZ4yRCpp2T6OjcBc5F25/xtKXJsdf5ngcKVCobwXusLojFKeoh6AbGLaQ+uUJgQtJry6pStMKdchG9Nm8f5RChA=
X-Received: by 2002:a81:fd08:0:b0:568:d63e:dd2c with SMTP id
 g8-20020a81fd08000000b00568d63edd2cmr5270372ywn.11.1686424487944; Sat, 10 Jun
 2023 12:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230610071848.3722492-1-tomo@exabit.dev> <01010188a42d53e0-2d47cf6b-9c3a-4e94-9322-0935d0e5dcd4-000000@us-west-2.amazonses.com>
In-Reply-To: <01010188a42d53e0-2d47cf6b-9c3a-4e94-9322-0935d0e5dcd4-000000@us-west-2.amazonses.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 10 Jun 2023 21:14:37 +0200
Message-ID: <CANiq72n6yQa9nff+zdWizvjB4Z=Z1qjw9a2ZMny1E1uSA2A=qA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: add support for ethernet operations
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        andrew@lunn.ch, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 9:27=E2=80=AFAM FUJITA Tomonori <tomo@exabit.dev> w=
rote:
>
> +    /// Sets `ethtool_ops` of `net_device`.
> +    pub fn set_ether_operations<U>(&mut self) -> Result
> +    where
> +        U: EtherOperations<D>,
> +    {
> +        if self.is_registered {
> +            Err(code::EINVAL)
> +        } else {
> +            EtherOperationsAdapter::<U, D>::new().set_ether_ops(&mut sel=
f.dev);
> +            Ok(())
> +        }

You may want to use early return style, like in C, i.e. `return Err(...);`.

> +            T::get_ts_info(&mut dev, data, &mut info)?;
> +            Ok(0)

Can this be simplified to:

    T::get_ts_info(&mut dev, data, &mut info)

?

> +    fn set_ether_ops(&self, dev: &mut Device) {
> +        // SAFETY: The safety requirement ensures that the pointer is va=
lid.
> +        unsafe {
> +            (*dev.0).ethtool_ops =3D Self::build_ether_ops();
> +        }
> +    }

Which safety requirement? Normally when we say "safety requirement",
we are referring to the `# Safety` section on the current function
(i.e. which would be `unsafe`). But this one is a safe function.

If you are referring to `Device`'s, then that is a `struct`, so it
would have invariants, not safety requirements (I will leave a quick
note there too).

> +/// Sets up the info for software timestamping.
> +///
> +/// This can be [`Device`] method, but there are non ethernet devices.
> +pub fn ethtool_op_get_ts_info(dev: &mut Device, info: &mut EthtoolTsInfo=
) -> Result {
> +    // SAFETY: The safety requirement ensures that the pointer is valid.
> +    unsafe {
> +        bindings::ethtool_op_get_ts_info(dev.0, info.0);
> +    }

Ditto here: there are no safety requirements in this function.

Cheers,
Miguel
