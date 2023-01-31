Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EE9C636CC
	for <rust-for-linux@archiver.kernel.org>; Tue, 31 Jan 2023 16:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbjAaQuB (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 31 Jan 2023 11:50:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbjAaQt6 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 31 Jan 2023 11:49:58 -0500
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD102069B
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Jan 2023 08:49:57 -0800 (PST)
Date:   Tue, 31 Jan 2023 16:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1675183793; x=1675442993;
        bh=ul/r5dgqnSupEUq4aNIIyHVHQIQ84I55hEH0IqmpHPg=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=umhLBs1zyvBE+Lb0j6U5mxLmYoA3/H6s4CxKlxbhXXBlv0ZEVNF4eNyFP0QOcwoxO
         l4XY32Vo6pR2toAXzkivq7bgOmBX2RbvG9S+MMxiPxRm25YWmcg76uQvMFFXl5ts0y
         6pDy9J+nc6SBxtC9qn+dR8pKlnPsEe8Yr9FLHLAiHbvlk8GNqUmYS+/ryPpgCVOYYF
         OFsL0rpLXGaHeuC0fMGH2SPSzC+AEUv1N83ToqY8ZRFW6s94b4y8fzPBYNOw63p7oD
         6hhPJ6TUITyXJ406d5aXyZwmnX0gjdTlK0QLEtzpsmnAzleWYWOsz8v+OI68O2jU6D
         t2BGV6+Fcpppw==
To:     Will Deacon <will@kernel.org>
From:   =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>, steve.capper@arm.com
Subject: Re: [PATCH 1/3] arm64: rust: Enable Rust support for AArch64
Message-ID: <Bs9NB9XuVGuOkEvvTFpYIPDo-S-bn6LpsSKciLfFkp5J73L84wAsJFXGKYEZ7VtCKYIWUWyKxvtelgi7NuvcDT6kgPXGiz8VoUv6gh-fFGQ=@protonmail.com>
In-Reply-To: <20230131161905.GC2646@willie-the-truck>
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com> <20230125163739.3798252-2-Jamie.Cunliffe@arm.com> <20230126163552.GD29438@willie-the-truck> <CANiq72mpzRjT1ZHCHcGrOJ_71eQPR_-WgP=5YfDWDBNR6JNP4w@mail.gmail.com> <20230131161905.GC2646@willie-the-truck>
Feedback-ID: 27884398:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tuesday, January 31st, 2023 at 17:19, Will Deacon <will@kernel.org> wrot=
e:

> On Thu, Jan 26, 2023 at 06:56:01PM +0100, Miguel Ojeda wrote:
>=20
> > On Thu, Jan 26, 2023 at 5:35 PM Will Deacon will@kernel.org wrote:
> >=20
> > > Why do we need to specify this stuff here? LLVM already knows about A=
Arch64
> > > and can compute the data-layout string in computeDataLayout(). Can we=
 have
> > > the tools figure this out for us instead, please?
> >=20
> > I agree -- the reason we have this for the moment is to provide full
> > control of the target spec, in particular for cases where `rustc` may
> > not provide enough flags to customize exiting builtin target specs
> > and/or may emit warnings for unknown target features etc.
> >=20
> > If it is already enough for arm64 to use e.g. the
> > `aarch64-unknown-none` target spec plus flags on top, then we should
> > go for that, because that is the end goal: these target spec files are
> > unstable in the Rust compiler (and not intended to become stable).
>=20
>=20
> Please confirm that this is the case, but I really think we should be
> aiming for that rather than starting off my specifying this stuff manuall=
y.
>=20
> > For context, upstream Rust so far has been willing to merge support
> > for flags and target features that we needed, which is great.
>=20
>=20
> One thing I ran into while playing around is that 128-bit types aren't
> supported with ffi unless '-A improper-ctypes' is passed. Given that we
> use '__uint128_t' to represent the fpsimd state, I think this is probably
> something which will crop up as an issue.

This lint exists because u/i128 are indeed not compatible with their C coun=
terpart on many targets including x86_64 with the SysV ABI. As it turns out=
 however, it is compatible on AArch64. A little under a year ago 128bit int=
 type aliases were added to the libc crate on AArch64 (except on Windows) w=
hich are equal to u/i128 [1]. In addition it has const assertions for the c=
orrect size and alignment. As such if rustc every regresses on non-Windows =
AArch64, this will show up in a crater run and almost definitively be fixed=
. Because of this I don't think there will be any problem with assuming __u=
int128_t and u128 are compatible when compiling for AArch64.

>=20
> Will

Cheers,
Bjorn

[1]: https://github.com/rust-lang/libc/pull/2719/files
