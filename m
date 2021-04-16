Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAA1C433B4
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 13:12:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 244D861107
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 13:12:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235600AbhDPNMd (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Apr 2021 09:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235445AbhDPNMc (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Apr 2021 09:12:32 -0400
Received: from gimli.kloenk.dev (gimli.kloenk.dev [IPv6:2a0f:4ac0:0:1::cb2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1981BC061574
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 06:12:08 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kloenk.de; s=mail;
        t=1618578725; bh=8GbFUE0vAX4U/QHRUGvWkJA45Rbaf7rGTBwNR2pI0A4=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To;
        b=fg/+z8ZvSGYw5uNazzYMsJdnkGmsWLgF4cx0zIX0EWPnSk2dd29PQo3Cebejkxhbr
         P1jwqdhdz5VTKNzQqZ5rf4BMCFv/7e0H/Rcp1yxDuNR8XX6YyCtl7Bm974gGS8O9EM
         3yOhiV7ABi0g2i3+Ie6N3zxrans7bmUxUW5KsL1o=
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: Rust-for-Linux Hydra CI
From:   Finn Behrens <me@kloenk.de>
In-Reply-To: <CAE06CAE_g53DEB5cZr02eV-=okMPbnE0Do1vQgHR7UyZsS_edw@mail.gmail.com>
Date:   Fri, 16 Apr 2021 15:12:04 +0200
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux@vger.kernel.org, linux@petabyte.dev,
        Joerg Thalheim <joerg@thalheim.io>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A7F04F36-FFD2-4A3B-A1DC-CC8C376BCBD4@kloenk.de>
References: <04861911-1275-449E-BE54-C6871B53F4A3@kloenk.de>
 <CANiq72nvB7LYTc7wfuV+UM-s9wvOpObBhdJa4=odd8103x7BKA@mail.gmail.com>
 <BB89357B-DB5C-4D4D-A0F0-0B57F9F5CE11@kloenk.de>
 <CAE06CAE_g53DEB5cZr02eV-=okMPbnE0Do1vQgHR7UyZsS_edw@mail.gmail.com>
To:     Christine Dodrill <me@christine.website>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org



> On 16. Apr 2021, at 15:09, Christine Dodrill <me@christine.website> =
wrote:
>=20
> I will see what I can get done after work today. I would just submit
> the tests as a pull request, right?
>=20
Yes, add it to the default.nix, so default.nix returns a package set, =
hydra evaluates this default.nix (giving it the latest input) and builds =
every package returned by that function.

CU,
Finn=
