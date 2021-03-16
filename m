Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16D0C433DB
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 Mar 2021 17:01:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7946265107
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 Mar 2021 17:01:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237018AbhCPRA6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 16 Mar 2021 13:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236957AbhCPRAh (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 16 Mar 2021 13:00:37 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB125C06174A
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Mar 2021 10:00:35 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id mm21so73304877ejb.12
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Mar 2021 10:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=cqvSFxcst8giAuJYf+upsKE30a7LRwj2nXI4GqnuW5E=;
        b=Rn8lU+c4Ab7zah2MjPEG1/F8gDwT8trXZ4KxUkcrYyEqQkVbquJj5Zzk7k+CsFMLL4
         bKS89nfx/rNBbZuKzBgEtdJfzRPDW5s38iWu/wQMXEc7Z78MBA64KJUC+TEDT3dN0CTn
         atUriX9Ga+yuXF51TPHU8AM6XXfcnF1Q7mvl8v+QC0l1/iXLe3L/lfD9qPWAoectLGUq
         J+pfQEEzJnEDyXOSaHayKVUulzMn1eX03nD29MyQkhadB6y64732vRNn1dEWUuYs3J+T
         +/OxWMfomO5YfsQnHpOKkH9qKIkvVAwf9L9RozKjITt+D9rt18XydJ8TaUk0gG9zDMg8
         Ulow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=cqvSFxcst8giAuJYf+upsKE30a7LRwj2nXI4GqnuW5E=;
        b=jpevI2/VnmWdMxeftLn2EKUPr62ClD02U0IGuWcL4tJEPDhkrh+q+0/J/b9LUoZLX5
         n20O0ApWQ038Fq0q4ygUl6aje6Pt3m5Ngu4SOhkicoKPQePWqIkeqZASvuxHIJ4K7DhN
         Ga0AaGsKicPIIst+DJN215hcMGjirr3lvsQKBL/+VQXqrpQy8aaYTEVLUV/98adrQP+A
         pbX/48br3fke9sZeHyjbCVescShhTAWvXcnnoN0D3YrFvkUnaTZ7s47SVMbq1xuJe3xH
         OB99rrwghAjC2h/kUgtzHqGl8zhdpPe2DVN3g4xj338dXFSa+pxVo9fM6tZ1kUdyBrF4
         NufA==
X-Gm-Message-State: AOAM531Uc3bRHbeRPUHhX6xKKnglR8cduLHijG4LmlrvnrAljotDSpSU
        k6vyJU1JooZ3my28J4JXxz0=
X-Google-Smtp-Source: ABdhPJzBy9aZZu/wBGiTscQGZHnDtyJqkPQbQjyguEu5HeMtvLGLrQXXwyygo9ZM0YC2aWiameovvQ==
X-Received: by 2002:a17:907:2d24:: with SMTP id gs36mr30875665ejc.344.1615914029812;
        Tue, 16 Mar 2021 10:00:29 -0700 (PDT)
Received: from ?IPv6:2a02:a212:a204:1980:81c8:ede2:c428:1eac? ([2a02:a212:a204:1980:81c8:ede2:c428:1eac])
        by smtp.gmail.com with ESMTPSA id e8sm10945981edq.77.2021.03.16.10.00.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Mar 2021 10:00:29 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Build system can't detect rustc
From:   Kaviraj Kanagaraj <kavirajkanagaraj@gmail.com>
In-Reply-To: <CANiq72=2FJQ7Ct_77MsaYe-3qThuRJ-gkLFvY-acq_GmhR9A4A@mail.gmail.com>
Date:   Tue, 16 Mar 2021 18:00:28 +0100
Cc:     Sumera Priyadarsini <sylphrenadin@gmail.com>,
        rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <39D26FFA-1635-483F-A43F-3BCF942D0AF8@gmail.com>
References: <20210315063044.ur3lvxv7emo2egu4@adolin>
 <CANiq72=ZUr5JcfnMYB_=Gnsi08q45PwOUo3-CPL84_d5G2EV1w@mail.gmail.com>
 <CACAkLuqMrRAE6d8dP_b9khtO3HY4mnEGP_Z+1HhzRYDMOaaN+Q@mail.gmail.com>
 <CANiq72=2FJQ7Ct_77MsaYe-3qThuRJ-gkLFvY-acq_GmhR9A4A@mail.gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

HI

I had similar issue even with LLVM=3D1 or CC=3Dclang enabled.

[kaviraj@kavi-desktop-manjaro linux-rs]$ export LLVM=3D1
[kaviraj@kavi-desktop-manjaro linux-rs]$ make
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  DESCEND  objtool
  CHK     include/generated/compile.h
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
  MODPOST vmlinux.symvers
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
ld.lld: error: Unexpected GOT entries detected!
ld.lld: error: Unexpected GOT entries detected!
ld.lld: error: Unexpected GOT entries detected!
make: *** [Makefile:1274: vmlinux] Error 1


The thing that worked for me is to  cp =
.github/workflows/kernel-x86_64-release.config .config and build again.

Although it would be nice to find out what is causing this when we =
generate config from make menuconfig (even after following the =
Quickstart guide)

Thanks
Kaviraj

> On 16 Mar 2021, at 16:09, Miguel Ojeda =
<miguel.ojeda.sandonis@gmail.com> wrote:
>=20
> On Tue, Mar 16, 2021 at 3:10 PM Sumera Priyadarsini
> <sylphrenadin@gmail.com> wrote:
>>=20
>> Hi Miguel,
>>=20
>> This definitely helped- I was using the master branch earlier. Can I
>> make a PR to add this to the documentation on rust/quick-start page?
>=20
> I didn't put it there since, if we manage to get this mainlined, then
> we would be in the master branch already. :-)
>=20
> However, you can send the PR to add a line to the `README.md` file,
> which is only intended for GitHub!
>=20
>> gcc versions 8 /9 / 10 but the error persists. I am not sure how to
>> proceed here :/
>=20
> This happens when bindgen (which uses Clang internally) gets GCC
> parameters, but that should not happen and is a bug when it does.
> Which kernel config are you using? defconfig for x86_64?
>=20
> To progress, please try a Clang build (pass CC=3Dclang or LLVM=3D1 to
> make), which is much more likely to work (GCC builds rely on a hack to
> make bindgen work), or use one of the kernel configs inside
> .github/workflows/ which are known to build since we check them in the
> CI.
>=20
> HTH,
>=20
> Cheers,
> Miguel

