Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C2CC6FD19
	for <rust-for-linux@archiver.kernel.org>; Sun, 12 Mar 2023 13:39:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbjCLNjZ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 12 Mar 2023 09:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjCLNjY (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 12 Mar 2023 09:39:24 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972C91FF1
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Mar 2023 06:39:23 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id h11so9009011wrm.5
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Mar 2023 06:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678628362;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxAbnq7LTGEhftBl38auDrP8lj2/9QaxVUAfWaigrUA=;
        b=juvQ3KrrbJ3UWOzLiQCylxylJA+JiLjo8P8RyTVcHpLpspK8jWL52lHTru01hK851z
         Eua70IpUv5w3XwizIDVtWbxfZzxuUgHzpWqq4b+oYv0Jqy7xdkZLw8gd4RixBrpbRYTo
         zkyRsNrFzoibJJJdbyzEi3e8YvQADofSoC97NbTTlpBsoCRPaeLjrWkk888vb6QspKfQ
         xCa5Xovr4tuDwicVl0a5eOKzGZkPZ0FNBFh7Ge0AbPMb4iZDD4W/bUn4IdC9WFJ8/bYC
         U0lMCC15jEAwQA/zkWbST1rHSVQs/zhkj5kQwNRNjN3tdkdXpBxPHaT1wU5/Fsd1gw8B
         sazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678628362;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AxAbnq7LTGEhftBl38auDrP8lj2/9QaxVUAfWaigrUA=;
        b=FoLyHgZt5fw+ylfeABFnBtTqbkT5cbF+pRctdWMPLePFbT+xNDt81Z2P/USgAWjjsK
         NMqRwq9kwD6WQxLQ8NxgO2GCSg5CqrJ4v50gvyNkaNSwTAaDCY14BRe7Ri4jGDR/ZlKj
         FNMqQayUdhSGCDDlA3OwIrXb7I4J4Xh0x7wxwUc0rhpM16pR12VdEafsoFqiv/Ke9EUM
         0HmoRPspyJIB5qZeZD3JOOa8PFuZUdAmfjX7dhSggpYv6l2it6hWuYSOu/ygle2dswrb
         JiTpJYaHqSiS3gXmISAyzKs38rMVKA1r0beNMLoHDKNa9YRXmCc6UYaaWkv+ADoTU9SF
         elNg==
X-Gm-Message-State: AO0yUKX9Jr54LledmA9XPyOy944St6D+myu8wJXag7r1qsVOKtcwioXU
        YkeijNcBPg6TRBAErsaCCpZzRciBgqxhdg==
X-Google-Smtp-Source: AK7set+69H7laXm04MrYa8OvwGSS/BnLZmvwBGySYfuCXyKRnRUDNYWQp+Ksl4QLuIGbOSzMGNllQw==
X-Received: by 2002:adf:fcc8:0:b0:2ce:a8f4:2b01 with SMTP id f8-20020adffcc8000000b002cea8f42b01mr2055607wrs.32.1678628361956;
        Sun, 12 Mar 2023 06:39:21 -0700 (PDT)
Received: from localhost ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
        by smtp.gmail.com with ESMTPSA id g14-20020a05600c310e00b003e8dcc67bdesm6323700wmo.30.2023.03.12.06.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 06:39:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Sun, 12 Mar 2023 14:39:20 +0100
Message-Id: <CR4G3AY4U6IJ.2ZRJBDCGH9Z0Q@vincent-arch>
Cc:     <rust-for-linux@vger.kernel.org>
Subject: Re: distribute linux-headers to build out-of-tree Rust modules
From:   "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To:     "Andrea Righi" <andrea.righi@canonical.com>,
        =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
X-Mailer: aerc 0.14.0
References: <ZAyJnCKa65WKozEJ@righiandr-XPS-13-7390>
 <-sFVmNNf30qsKc4eJpPbRN0rKWrj8NTpzhADsBb71F_lqa7eZAa7tOUESLJL_f5TraFzq2nfikArgxXrXtLdvatMIccCT4VMxvgAMfH9PdM=@protonmail.com> <ZAzedS9sx5l6gmzB@righiandr-XPS-13-7390>
In-Reply-To: <ZAzedS9sx5l6gmzB@righiandr-XPS-13-7390>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat Mar 11, 2023 at 9:03 PM CET, Andrea Righi wrote:
> On Sat, Mar 11, 2023 at 04:27:52PM +0000, Bj=C3=B6rn Roy Baron wrote:
> > On Saturday, March 11th, 2023 at 15:01, Andrea Righi <andrea.righi@cano=
nical.com> wrote:
> >=20
> > > Hello,
> > >=20
> > > I'm trying to distribute a linux-headers package (deb) that would all=
ow
> > > to build out-of-tree Rust modules.
> > >=20
> > > Everything looks fine, except for the following error:
> > >=20
> > > error[E0461]: couldn't find crate `core` with expected target triple =
target-10951614936105594995
> > > |
> > > =3D note: the following crate versions were found:
> > > crate `core`, target triple target-3759196539525232825: /usr/src/linu=
x-headers-6.2.0-16-generic/rust/libcore.rmeta
> > >=20
> > > All I need to do is to "refresh" the headers by running a
> > > "make modules_prepare" after installing my linux-headers package on m=
y
> > > system and then everything works perfectly.
> > >=20
> > > Is this because my system, where I try to build the out-of-tree modul=
e,
> > > has different toolchain versions (e.g., binutils) than the build host=
?
> > >=20
> > > Any pointer/documentation to better understand how the target triple
> > > version is determined?
> >=20
> > The target id for external targets should be determined based on the fi=
lename and the hash of the target specification json file since https://git=
hub.com/rust-lang/rust/pull/98225. That it happens to work with "make modul=
es_prepare" may be that it recompiles all rust code for the new target trip=
le and through luck it just so happens to have the exact same abi as the or=
iginal. There is no guarantee that two compiled rust crates have the same a=
bi unless they have the exact same contents. To debug why the target id cha=
nged could you try running the following rust program in both the linux sou=
rce dir and the /usr/src/linux-headers-6.2.0-16-generic dir?
>

> $ pwd
> /usr/src/linux-headers-6.2.0-16-generic
> $ ./test
> 5559158138856098584
>
> $ pwd
> /home/ubuntu/src/linux
> $ ./test
> 5559158138856098584
>
> ^ Same hash, but at this point I think we already know that the problem
> is the patch above that I'm missing in rustc.

Maybe we should increase the compiler version required by rust in the
kernel?

Cheers!

Vincent.
