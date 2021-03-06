Return-Path: <SRS0=ZQ81=IE=vger.kernel.org=rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCB6C433E0
	for <rust-for-linux@archiver.kernel.org>; Sat,  6 Mar 2021 09:24:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C29165012
	for <rust-for-linux@archiver.kernel.org>; Sat,  6 Mar 2021 09:24:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhCFJX1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 6 Mar 2021 04:23:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbhCFJXY (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 6 Mar 2021 04:23:24 -0500
Received: from gimli.kloenk.dev (gimli.kloenk.dev [IPv6:2a0f:4ac0:0:1::cb2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3CDC06175F
        for <rust-for-linux@vger.kernel.org>; Sat,  6 Mar 2021 01:23:24 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kloenk.dev; s=mail;
        t=1615022595; bh=D+uNtR9e4GTt0s8q4Jf0VMEoOBJxy8NUqlbjbdp+JHw=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To;
        b=FtOgkbdeaR1jHiGTdCyAgE2S7AYsIdPvgT5GjW8XP5cRp2d6KF4J04GdV2e7WC0tt
         VR5LgrhZ8FBgtCWFPiUMCJ24DjLnhOlkGgIvYy2xebdQXBxprVgoH2hY28D/9VRt+m
         ze0neqdM9G9ryVk4VT3XYsnImMBWkmrK/ce/2nx4=
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.32\))
Subject: Re: [Rust for Linux] Poll for call
From:   Finn Behrens <finn@kloenk.dev>
In-Reply-To: <CANiq72kPTw_TE9Yy26xwdn0h94QV85C+rNBqsh6uS2tt6FgQhA@mail.gmail.com>
Date:   Sat, 6 Mar 2021 10:23:14 +0100
Cc:     rust-for-linux@vger.kernel.org, milan@petabyte.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <BEF50476-4600-472A-B2BA-FCDB370A0509@kloenk.dev>
References: <CANiq72njjy7sJ=_mgjKNzaHcwRgoWkQmgSN2Fq6gdCYoeD1WZg@mail.gmail.com>
 <B1F9C55A-AA3D-418C-8C2C-BB1EE794D5D1@kloenk.dev>
 <CANiq72kPTw_TE9Yy26xwdn0h94QV85C+rNBqsh6uS2tt6FgQhA@mail.gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

I would prefer Saturday 18:00 UTC.
I als got my schedule a bit cleaned up, so not a problem anymore.

Cheers,
Finn

> On 6. Mar 2021, at 10:15, Miguel Ojeda =
<miguel.ojeda.sandonis@gmail.com> wrote:
>=20
> Hi all,
>=20
> It looks like everyone that replied can do it both days, with Finn
> having some time constraints.
>=20
> Finn, how is your weekend shaping up? Would picking one of the two
> days help you a bit with your schedule?
>=20
> Cheers,
> Miguel
>=20
>=20
>=20
> On Thu, Mar 4, 2021 at 7:40 AM Finn Behrens <finn@kloenk.dev> wrote:
>>=20
>> Hi Miguel,
>>=20
>> I would prefer the following weekend (13th, 14th), as this weekend is =
rather full at my end. But if needed, I could probably also manage this =
weekend.
>> 18:00 UTC sounds like a good time for me.
>>=20
>> CU,
>> Finn

