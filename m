Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE240C43381
	for <rust-for-linux@archiver.kernel.org>; Thu,  4 Mar 2021 00:26:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B50C664E56
	for <rust-for-linux@archiver.kernel.org>; Thu,  4 Mar 2021 00:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384030AbhCDAYZ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:24:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1843001AbhCCKXf (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 3 Mar 2021 05:23:35 -0500
X-Greylist: delayed 313 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 03 Mar 2021 00:33:03 PST
Received: from gimli.kloenk.dev (gimli.kloenk.dev [IPv6:2a0f:4ac0:0:1::cb2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353FAC061225
        for <rust-for-linux@vger.kernel.org>; Wed,  3 Mar 2021 00:33:02 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kloenk.dev; s=mail;
        t=1614760063; bh=cBBn4cJNvT/8hiu0vHJV1CoUQ3gE1QffC9R9qkvwVJA=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To;
        b=l6YHN19P52wHPVW0uiPcH0QAtOobZY6cN0x1ScA6iEYlf2ztt7zr7a/eWoYOBWDPT
         S1ITnlNz1Za9ZDkR7xYwYrSCI2MOQYjBEx65IhEfIDUDKxESKo58AygnOIx6VU7xpw
         FxE/0oOmoN3213jQ+spE6wY+aI9FgbQgsB7DX/g0=
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.32\))
Subject: Re: Upstreaming plan
From:   Finn Behrens <finn@kloenk.dev>
In-Reply-To: <CANiq72knSgMU30A2ALaJGY5FWumPKU18ThvfjR1t14_77kYLrQ@mail.gmail.com>
Date:   Wed, 3 Mar 2021 09:27:42 +0100
Cc:     rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E47CEF26-62E4-4659-98F9-9DECE493E812@kloenk.dev>
References: <CANiq72knSgMU30A2ALaJGY5FWumPKU18ThvfjR1t14_77kYLrQ@mail.gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,
Upstreaming sounds great.
I could hopefully try building the rust part with nix again next weekend =
(currently exams in school :-) ), as I think there should be a buildable =
derivation before upstreaming. It should be doable, and just some work =
because of how the kernel is build with nix.
Will write again when I have something that is building, great work so =
far.

Finn

> On 15. Feb 2021, at 06:35, Miguel Ojeda =
<miguel.ojeda.sandonis@gmail.com> wrote:
>=20
> Hi all,
>=20
> I think we are in a reasonable position to start thinking about
> upstreaming. While things are still experimental and will be for a
> while; and while there are many bits to be solved (e.g. an example
> driver and everything it may entail), the setup is closer to how
> things will look like, which means maintainers can start giving
> feedback. Plus things look fairly usable for other developers too.
>=20
> Today v5.11 was released, and this is the approximate kernel release =
schedule:
>=20
>  2021-04-18 v5.12 released
>  2021-05-02 v5.13 end of merge window
>  2021-06-13 v5.13 released
>  2021-06-27 v5.14 end of merge window
>=20
> I propose we target v5.13's merge window for the upstreaming. If we
> don't make it (likely), that is fine, we can use it as a test drive to
> solve whatever is left and be ready for v5.14.
>=20
> To that end, the plan can be:
>=20
>  - Up to around 2021-03-28 (6 weeks): finish whatever features we may
> want to have in the initial PR; including cleanups and any example
> module/driver, etc.
>=20
>  - 2021-03-29 - 2021-04-04 (1 week): Then I will rebase and draft a
> series for upstreaming. Here it is where we should do a full review of
> the entire diff, just in case something got messed up in the different
> syncs, plus allows us to spot any final touches.
>=20
>  - 2021-04-05 - 2021-04-18 (2 weeks): Send the series as an RFC 2
> weeks or so before v5.13 merge window to the LKML. This way we get
> some general feedback and discussion, plus Linus et. al. can be aware
> we might send it. Depending how things go here, we can decide whether
> to go for v5.13 merge window or delay to v5.14 (then the same plan
> would apply, shifted by 2 months).
>=20
> Thoughts welcome! -- Specially if you have something baking that may
> need more time than those initial ~6 weeks (e.g. you are busy etc.).
>=20
> Cheers,
> Miguel

