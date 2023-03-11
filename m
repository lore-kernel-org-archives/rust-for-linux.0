Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50990C6FD1C
	for <rust-for-linux@archiver.kernel.org>; Sat, 11 Mar 2023 16:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjCKQ2M (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 11 Mar 2023 11:28:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbjCKQ2L (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 11 Mar 2023 11:28:11 -0500
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch [185.70.40.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672A9BDD4
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Mar 2023 08:28:08 -0800 (PST)
Date:   Sat, 11 Mar 2023 16:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1678552086; x=1678811286;
        bh=S+gySCwE1x57oZGP0+LN4wO5oMPNUpThL+DgD/Yvk7I=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=Ts0sLxGnSyFJex7+8TGgNZGawNuui70paUMRfxN3WDou4n8TSkDmRkXL4IRQwye3H
         VFb/nQn14JkHphCTbbu+2blNQvC/grymz9p9SuzzJhZLWyRc8crlFTJckW07cWQzMM
         pPKwzZQh46QLT3UuDGgcpHZP/LfH0qV/RUDlp83VtXiQ8gwG7uVn0SA1dhLhgXh1Ks
         vAGKUXQFzlOctinpwEHZizAttJSS5HYdjuXcDHGHa903L+uh3kgiokgtEur09rJ4xj
         fIUxXIXAOGSqLk1hU8c4Gd3+lNJdtvSDyC3NVYvVKwFZHQN0BG+qPPqj1dGK6uENFj
         a5y+U4tdYBdaw==
To:     Andrea Righi <andrea.righi@canonical.com>
From:   =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: distribute linux-headers to build out-of-tree Rust modules
Message-ID: <-sFVmNNf30qsKc4eJpPbRN0rKWrj8NTpzhADsBb71F_lqa7eZAa7tOUESLJL_f5TraFzq2nfikArgxXrXtLdvatMIccCT4VMxvgAMfH9PdM=@protonmail.com>
In-Reply-To: <ZAyJnCKa65WKozEJ@righiandr-XPS-13-7390>
References: <ZAyJnCKa65WKozEJ@righiandr-XPS-13-7390>
Feedback-ID: 27884398:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Saturday, March 11th, 2023 at 15:01, Andrea Righi <andrea.righi@canonica=
l.com> wrote:

> Hello,
>=20
> I'm trying to distribute a linux-headers package (deb) that would allow
> to build out-of-tree Rust modules.
>=20
> Everything looks fine, except for the following error:
>=20
> error[E0461]: couldn't find crate `core` with expected target triple targ=
et-10951614936105594995
> |
> =3D note: the following crate versions were found:
> crate `core`, target triple target-3759196539525232825: /usr/src/linux-he=
aders-6.2.0-16-generic/rust/libcore.rmeta
>=20
> All I need to do is to "refresh" the headers by running a
> "make modules_prepare" after installing my linux-headers package on my
> system and then everything works perfectly.
>=20
> Is this because my system, where I try to build the out-of-tree module,
> has different toolchain versions (e.g., binutils) than the build host?
>=20
> Any pointer/documentation to better understand how the target triple
> version is determined?

The target id for external targets should be determined based on the filena=
me and the hash of the target specification json file since https://github.=
com/rust-lang/rust/pull/98225. That it happens to work with "make modules_p=
repare" may be that it recompiles all rust code for the new target triple a=
nd through luck it just so happens to have the exact same abi as the origin=
al. There is no guarantee that two compiled rust crates have the same abi u=
nless they have the exact same contents. To debug why the target id changed=
 could you try running the following rust program in both the linux source =
dir and the /usr/src/linux-headers-6.2.0-16-generic dir?

    use std::hash::{Hash, Hasher};

    fn main() {
        let content =3D std::fs::read_to_string("rust/target.json").unwrap(=
);
        let mut hasher =3D std::collections::hash_map::DefaultHasher::new()=
;
        content.hash(&mut hasher);
        println!("{}", hasher.finish());
    }

Cheers,
Bjorn
