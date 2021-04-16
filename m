Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA08C433ED
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 13:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 565086115B
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 13:07:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235599AbhDPNIM (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Apr 2021 09:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234291AbhDPNIK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Apr 2021 09:08:10 -0400
Received: from gimli.kloenk.dev (gimli.kloenk.dev [IPv6:2a0f:4ac0:0:1::cb2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E90C061574
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 06:07:46 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kloenk.de; s=mail;
        t=1618578456; bh=h1cWSNjrlK6348kxZri1A85VRnsf6ZIDX6hqHomIN5k=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To;
        b=NSXZ8sCehHUODRTQ3etDUBXq6A8uLWBmJNg8yZOkT6mbIBRYfdQn519FrPv1F7rRa
         FNEWPQvuRJKI7Ui6i2GwspTE1ArRdJcB0eqtUcUaSdPx+Q6st63IRQNeBUeQ4eMYI6
         VUp5jigpL+bq73/SwXkHMxRGlMphLz6Adw+CJZPo=
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: Rust-for-Linux Hydra CI
From:   Finn Behrens <me@kloenk.de>
In-Reply-To: <CANiq72nvB7LYTc7wfuV+UM-s9wvOpObBhdJa4=odd8103x7BKA@mail.gmail.com>
Date:   Fri, 16 Apr 2021 15:07:33 +0200
Cc:     rust-for-linux@vger.kernel.org, linux@petabyte.dev,
        Joerg Thalheim <joerg@thalheim.io>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BB89357B-DB5C-4D4D-A0F0-0B57F9F5CE11@kloenk.de>
References: <04861911-1275-449E-BE54-C6871B53F4A3@kloenk.de>
 <CANiq72nvB7LYTc7wfuV+UM-s9wvOpObBhdJa4=odd8103x7BKA@mail.gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        me@christine.website
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

> On 16. Apr 2021, at 15:00, Miguel Ojeda =
<miguel.ojeda.sandonis@gmail.com> wrote:
>=20
>> PS: I=E2=80=99m not sure If this will break if we rebase to a newer =
linux version, as nix needs a version to find some files.
>=20
> If we rebase, does it affect negatively Hydra or some of the other
> tools? i.e. would we be blocking some other project in some way? If it
> is just us seeing a "red" state in the CI, then I think it is fine :)

I confirmed that rebasing breaks the build. But yes this is only a red =
state as the build fails, but it does not block anything. Ofcourse if we =
get around to build nixos-vm tests those tests are also blocked as there =
is no kernel that builds and so can be tested. But still, this is only a =
broken state, and does not affect any other projects.
We can also monitor different branches of the rust-for-linux linux tree, =
where a rebase in one branch would not affect another branch.

Maybe Christine want=E2=80=99s to add tests, the nix derivations are at =
https://github.com/rust-for-linux/nix and are automatically updated by =
hydra, as I should write my finals and not linux tests :-).=20

CU,
Finn=
