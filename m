Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3D5C43611
	for <rust-for-linux@archiver.kernel.org>; Mon, 10 May 2021 14:08:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7384E610FA
	for <rust-for-linux@archiver.kernel.org>; Mon, 10 May 2021 14:08:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhEJOKA (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 10 May 2021 10:10:00 -0400
Received: from gimli.kloenk.dev ([195.39.247.182]:58350 "EHLO gimli.kloenk.dev"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244999AbhEJOGO (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 10 May 2021 10:06:14 -0400
X-Greylist: delayed 99589 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 May 2021 10:06:13 EDT
Content-Type: text/plain;
        charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kloenk.de; s=mail;
        t=1620655496; bh=/B6Ksxz5qWzbsILI4BtO20lYysw50qwPgUvaP37pH6w=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To;
        b=vTA8FrT3DyOu4Oi5Q/xkNpULWXTps3tnhkCnxzxdKoRPDK9M3vPCoK4c7Q6BLT3t0
         trOUu6plKK+W/Tk2at1kbqZsb8WHNL9Nosxxkd/H28tjLSabVrILN2La1cwBUIr48/
         8FlmamJgjEA9WXs+Xecpz4nv/WGoGV1BhcZoT2EY=
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: PointerWrapper Trait vs croe::ops::Deref
From:   Finn Behrens <me@kloenk.de>
In-Reply-To: <CANiq72=8M3ALxrmdYvHNfDVX9F4Se0=a-EbzrZPgVv1xsh932Q@mail.gmail.com>
Date:   Mon, 10 May 2021 16:04:54 +0200
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F0569E2-F09D-4D58-99D9-B338DE6D1A15@kloenk.de>
References: <97E4F6F4-2391-4053-89FC-BB00F9184340@kloenk.de>
 <CANiq72=8M3ALxrmdYvHNfDVX9F4Se0=a-EbzrZPgVv1xsh932Q@mail.gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Howdy,

> On 9. May 2021, at 16:21, Miguel Ojeda =
<miguel.ojeda.sandonis@gmail.com> wrote:
>=20
> On Sun, May 9, 2021 at 12:25 PM Finn Behrens <me@kloenk.de> wrote:
>>=20
>> Maybe we could also remove the result, as it would possible be an =
invariant, and never happen as the pointer should already be valid.
>=20
> If it can fail, we cannot use `Deref` to begin with. So yeah, to make
> the examples equivalent, the first one should not return a `Result`.
>=20
> Now, assuming it cannot fail, what I mentioned in the meeting is that
> with `Deref` all this compiles:
>=20
> wrapper.deref().number
> (*wrapper).number
> wrapper.number
>=20
> The question boils down to: do we want this shortcut or not?

I would not like to decide that on my own :-).
After thinking about it I think we don=E2=80=99t want that shortcut, as =
the other way give the same behaviour, but it is explicit.

> Having said that, I am not sure I understand the traits shown here.
> Isn't `PointerWrapper` meant only to save a `Box<T>` and similar types
> (which already implement `Deref` themselves etc.) as a pointer in a C
> data structure? (which is why `into_pointer()` consumes the object).
>=20

All Pointers I=E2=80=99m wrapping are got from the C side. Either =
because there is a special malloc flag and some initialisation to the C =
struct, or as this is in a function call, and therefor the object is =
constructed out of my reach.
I usually do not consume the pointer, as I have to give the pointer to =
multiple function on the C side.

> In the examples shown, the new `get_pointer()` does not consume
> `self`; and `main()` creates a `Wrapper` using `from_pointer()`. But
> the idea is that you already have an object (constructed via other
> means), transform it into a raw pointer, and then later on
> re-construct the original object back from that pointer.
>=20
> So `PointerWrapper` trait is like a `SavedAsPointer` trait, if you =
will.

Renaming to `SavedAsPointer` sounds great.

>=20
> Cheers,
> Miguel

CU,
Finn

