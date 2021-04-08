Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6A6C433ED
	for <rust-for-linux@archiver.kernel.org>; Thu,  8 Apr 2021 02:38:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83C7D61139
	for <rust-for-linux@archiver.kernel.org>; Thu,  8 Apr 2021 02:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbhDHCiV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 7 Apr 2021 22:38:21 -0400
Received: from wilbur.contactoffice.com ([212.3.242.68]:36128 "EHLO
        wilbur.contactoffice.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhDHCiV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 7 Apr 2021 22:38:21 -0400
Received: from ichabod.co-bxl (ichabod.co-bxl [10.2.0.36])
        by wilbur.contactoffice.com (Postfix) with ESMTP id 89A4E827;
        Thu,  8 Apr 2021 04:38:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617849489;
        s=20210208-e7xh; d=mailfence.com; i=seiro22@mailfence.com;
        h=Date:From:Reply-To:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        l=1971; bh=mE9O6qI/7k69qESgu5JH+DRJwxW9CDMOJeG7Z8LzJgM=;
        b=d5WbT6r/mSnyJ/5m9PuepNpN/Dm1kIV6O9hQamwAojkOrv4FoxSJnXEtuE/s7kl4
        j1w+hGbLPk7qV6tYIBxnaqqysgzaZrWlnOFl+otBVquD817Pq5um0zYY8ptqNqyW+C7
        Do6TaboyatNEA8y+fEO8hgU1Zqqpip5MLwfXBD5DKkzvpgASjjc4KHMbJDZTAA1McHG
        fw+nSahG4q+HzDWyhHaf/YqmWG33PS6xxztbZ9gCCHFceltshg/ptK/QCKcIiZDMEaM
        piBReGh5klAvX/m7Vf8wazzUeqfhwklWDB1Iu+sKDmM9QOFAnvvvpMEPjuXC55uKSvQ
        HDxmV9j7Zw==
Date:   Thu, 8 Apr 2021 04:38:06 +0200 (CEST)
From:   se iro <seiro22@mailfence.com>
Reply-To: se iro <seiro22@mailfence.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Message-ID: <315832261.93199.1617849486791@ichabod.co-bxl>
In-Reply-To: <CANiq72nWvusyKf_N2N8i+de5HA-UZYfFPUrp9taRFbXya5h18w@mail.gmail.com>
References: <1802230489.25122.1617805363569@ichabod.co-bxl> <CANiq72nWvusyKf_N2N8i+de5HA-UZYfFPUrp9taRFbXya5h18w@mail.gmail.com>
Subject: Re: leaky info and kernel modules
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
X-Mailer: ContactOffice Mail
X-ContactOffice-Account: com:283344282
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

you mention debug but this is building release mode not debug which is why =
it odd.
and yeah if these paths exists its not reproducible as they different for e=
veryone else. steve k commented on reddit and said he thinks so long as bui=
ld process is same its reproducible, not that hashing matching is require. =
rust team may have differ opinion on what reproducible builds are too which=
 affect this like you say

> ----------------------------------------
> From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Sent: Wed Apr 07 23:50:54 CEST 2021
> To: se iro <seiro22@mailfence.com>
> Cc: <rust-for-linux@vger.kernel.org>
> Subject: Re: leaky info and kernel modules
>=20
>=20
> Hi Se Iro,
>=20
> On Wed, Apr 7, 2021 at 11:03 PM se iro <seiro22@mailfence.com> wrote:
> >
> > saw post on reddit and github issues where rust compiler adds username =
and systems paths/info to **release** mode compile bins. also its pkg mgr c=
argo does the same with registry paths. otherwise its extra strings bloatin=
g output that not needed and strip command doesnt work. also not working is=
 compiler opts described
> >
> > does this impact chat of rust in linux since rust team seems to be igno=
ring the issue?
>=20
> Yeah, Rust is adding few strings with paths (at least ~4 KiB from a
> quick test in my case); while a non-Rust kernel, in-tree build without
> `DEBUG_KERNEL` does not seem to contain any absolute paths (although
> please note that kernels typically contain your username/host anyway
> unless you tweak `KBUILD_BUILD_*` etc.).
>=20
> So while I don't think it is that critical at the moment, any bloat
> that can be reduced (e.g. those paths could be relative) is always a
> good idea. It is also good for improving reproducibility of builds
> etc.
>=20
> I will create a quick issue about this.
>=20
> Thanks!
>=20
> Cheers,
> Miguel


--=C2=A0
Sent with https://mailfence.com
Secure and private email
