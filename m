Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFF3C433EF
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Oct 2021 00:27:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E579861100
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Oct 2021 00:27:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbhJHA3r (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Oct 2021 20:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhJHA3q (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Oct 2021 20:29:46 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13397C061570
        for <rust-for-linux@vger.kernel.org>; Thu,  7 Oct 2021 17:27:52 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id r201so1452646pgr.4
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Oct 2021 17:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=iUTP4HSmp3xOxpRb2/2WXV/LFPy9RUoNRuoCStV1//0=;
        b=fSUzY63Jmmm/DuqrShGqGPchX5++2iYRP1UFP7+UwCqPyC3dYdjHcCd9fKDTwGnjaS
         x0X19fhMYWxSbAk86L7ASpaVrnjDcFNXszlI6isv0rQBVa9lKoACPP3SwJVK0TaeAGs9
         RGtqb87/kErbDavONn9uCXKRhSdQgzgPI2FfqJSW3Cpukarc5aOF99vYK5uzJPBsNhYm
         jybEnbjffsBLxxo9kep+LxAWvG32O2nCDMJampTMt+20IaKLaunpMI1qEu78Td5zN9+J
         byCArEVQsiHp9pB4Ah+jPRCGlWFaZVOKm5gjZog1A0ZoPnhhrxeUZkWkOli6eAsO5hrM
         s2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=iUTP4HSmp3xOxpRb2/2WXV/LFPy9RUoNRuoCStV1//0=;
        b=dtr7n9bIRyvTqRTWTMf+qxa4cPH6nGX2Z7Gz7alohmeiJCWkX3SuBft3QsjCnJQUPJ
         qoUyvu3py2uf0zxXBUQgQutPX+L7Lyuxj71Ma32/RAvXGbuQ4MgmtGpMcENIF8wbeO+g
         9vYjCPveE+WRNrhtBK0CxAcy+O5YwoohMSZAfoSVi31by8l5pxPtzno1O8kRuqW2ibHu
         OVbJOBHAjArwhjzmHFfRysHn9eV5mgas9tW8EgA9bOhl/aWBVpe82FEpqy7R/0dzXuBw
         zF/cpHvhwHvEdnAJO8yXQYHUW9fnf/Q3o61RVrLRtqXsw8/eOUJHirolcie3uPEwFops
         QMJA==
X-Gm-Message-State: AOAM5304iVBT1vEhbMo4Cu7wDA/89JUT1c20ISyrKBhfEozlUd6IrkFW
        OSEB7Wv34pccyoh4hRsIIOne32DTudE=
X-Google-Smtp-Source: ABdhPJxsJ7M7Hn+8GfxhncRJz2s/fIezpo+tT4fl40nemY0rbf0mSmqjzi1Bs5ZwJSxQDUVvVr+cdA==
X-Received: by 2002:a05:6a00:1693:b0:44c:64a3:d318 with SMTP id k19-20020a056a00169300b0044c64a3d318mr7089306pfc.81.1633652871605;
        Thu, 07 Oct 2021 17:27:51 -0700 (PDT)
Received: from smtpclient.apple ([2601:647:5000:47cf:692c:444f:b010:8bc4])
        by smtp.gmail.com with ESMTPSA id k1sm349838pjj.54.2021.10.07.17.27.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Oct 2021 17:27:50 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
From:   comex <comexk@gmail.com>
In-Reply-To: <20211008005958.0000125d@garyguo.net>
Date:   Thu, 7 Oct 2021 17:27:49 -0700
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F4A43CA9-29C2-44B7-803D-FAED9A75909D@gmail.com>
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
 <YV8A5iQczHApZlD6@boqun-archlinux>
 <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
 <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
 <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1>
 <20211007224247.000073c5@garyguo.net>
 <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008000601.00000ba1@garyguo.net>
 <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008005958.0000125d@garyguo.net>
To:     Gary Guo <gary@garyguo.net>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org



> On Oct 7, 2021, at 4:59 PM, Gary Guo <gary@garyguo.net> wrote:
>=20
>=20
> I should probably say that doing LTO or not wouldn't make a UB-free
> program exhibit UB (assuming LLVM doesn't introduce any during LTO).

Yes, but LTO makes certain types of UB =E2=80=93 the types that exist =
mainly to enable compiler optimizations =E2=80=93 more likely to cause =
actual misbehavior.  But that=E2=80=99s no different from C.  Though, =
Rust code does tend to make more aggressive use of inlining than C code, =
and then there=E2=80=99s the whole saga with noalias=E2=80=A6=
