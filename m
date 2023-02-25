Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF515C6FA8E
	for <rust-for-linux@archiver.kernel.org>; Sat, 25 Feb 2023 17:17:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjBYRRb (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 25 Feb 2023 12:17:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjBYRRa (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 25 Feb 2023 12:17:30 -0500
X-Greylist: delayed 566 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 25 Feb 2023 09:17:28 PST
Received: from out-44.mta1.migadu.com (out-44.mta1.migadu.com [95.215.58.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44A612866
        for <rust-for-linux@vger.kernel.org>; Sat, 25 Feb 2023 09:17:28 -0800 (PST)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
        s=key1; t=1677344879;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y7PlEP+T3ywtdXp5JitW0ulIPd3g9+rROb4eABEC9Xg=;
        b=FDU2+uKCtdcByFBbeUvmHSI/1MzMFsVdvofgWZzHN6BxQhtr/IhHnha09zIiRD2tfiLxg6
        +A5tqyviacVbPMpKJC8Pny2nVYHtCnoRSZtLI/v9YXKG4o5C9Bjow/RPvYOSCVNdK/l5oH
        w4f3ewR2iTLgcI9MU2a+1HgHnEjzPuKBg5oV1/8X10CyXaXWXdUta4M7ND5R8c1DR+ffTB
        N5MCeWpBklPBHXQ92awTucDOPwdDCgPB7XChP+/ufXiysR1TpD1uDFsKQXMyoI9gSbdRy6
        dFulp8MXDt3WJ2/77Tz6DfJ8kvkAdgqAh8U0Exm4H8DSutposKawa6A36J0cwA==
Date:   Sat, 25 Feb 2023 17:07:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   alyssa@rosenzweig.io
Message-ID: <96e9949bf7210225515ed48911627743@rosenzweig.io>
Subject: Re: [PATCH 2/5] rust: device: Add a minimal RawDevice trait
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Asahi Lina" <lina@asahilina.net>
Cc:     "Miguel Ojeda" <ojeda@kernel.org>,
        "Alex Gaynor" <alex.gaynor@gmail.com>,
        "Wedson Almeida Filho" <wedsonaf@gmail.com>,
        "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
        "=?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?=" <bjorn3_gh@protonmail.com>,
        "Will Deacon" <will@kernel.org>,
        "Robin Murphy" <robin.murphy@arm.com>,
        "Joerg Roedel" <joro@8bytes.org>,
        "Hector Martin" <marcan@marcan.st>,
        "Sven Peter" <sven@svenpeter.dev>, "Arnd Bergmann" <arnd@arndb.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Neal Gompa" <neal@gompa.dev>, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, asahi@lists.linux.dev
In-Reply-To: <Y/jW161RuT7OtlSf@kroah.com>
References: <Y/jW161RuT7OtlSf@kroah.com>
 <20230224-rust-iopt-rtkit-v1-0-49ced3391295@asahilina.net>
 <20230224-rust-iopt-rtkit-v1-2-49ced3391295@asahilina.net>
 <Y/ieQ0UX/niAG1Hg@kroah.com>
 <ef3a3638-6381-87ab-d674-644306b6b6ce@asahilina.net>
 <Y/jFeZzZVCpBGvGv@kroah.com> <Y/jHeP4LileLYxO8@kroah.com>
 <bbc824ee-ef4e-40cb-f009-0d693d757869@asahilina.net>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

February 24, 2023 10:25 AM, "Greg Kroah-Hartman" <gregkh@linuxfoundation.=
org> wrote:=0A=0A> On Fri, Feb 24, 2023 at 11:44:59PM +0900, Asahi Lina w=
rote:=0A> =0A>> On 2023/02/24 23:19, Greg Kroah-Hartman wrote:>> Can we s=
ee some users=0A>> of this code posted so I can see how struct device=0A>=
> is going to work in a rust driver? That's the thing I worry most about=
=0A>> the rust/C interaction here as we have two different ways of thinki=
ng=0A>> about reference counts from the two worlds and putting them toget=
her is=0A>> going to be "interesting", as can be seen here already.=0A>> =
=0A>> Also, where are you getting your 'struct device' from in the first=
=0A>> place? What bus is createing it and giving it to your rust driver?=
=0A>> =0A>> That would be platform for my GPU driver, matched via OF comp=
atible.=0A> =0A> Ick, a platform device? The GPU isn't on the PCI bus? Wo=
w, that's=0A> horrid...=0A=0AThis is bog standard for Arm SoCs... As far =
as I know, it's all platform devices in the Arm GPU world: Mali, Adreno, =
Tegra, VideoCore, and yes, Imaginapple. not really sure what good PCI wou=
ld do for integrated GPUs.
