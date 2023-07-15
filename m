Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A22C001B0
	for <rust-for-linux@archiver.kernel.org>; Sat, 15 Jul 2023 08:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbjGOIHn (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 15 Jul 2023 04:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjGOIHn (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 15 Jul 2023 04:07:43 -0400
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B71F1B6
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Jul 2023 01:07:41 -0700 (PDT)
Date:   Sat, 15 Jul 2023 08:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1689408457; x=1689667657;
        bh=s/0tYO5qmt276h4IQn5dGAY7Mf7gP5cdcTvShCpZbv8=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=h10VdabBrbclLGzI1nFAZMkUnYs8GpHBlzSnBrfbM815hiyIhC/n/T81OoYOUxroS
         vzy9HU3zeYzCxJSjYFDVu6I0Xh6rRUSb6mBWafat/8dK3z7QY8QgCJc8i46VUc8YBd
         kvmKLr+Vom6fwgUwMav4AuTzX6vQROGO/JzM3q1MiFK/Nslr+JjWPLee52dc0lURa+
         phE7HmUytygSnlMkK5YwnmO14LGTMZlJg4NyBiN13JT0dkBebsB0X5KBWJiekPm82c
         kb6eL5NP5+B0kGP2cP60ZXftZYgQ5xgGMwNFEjCWZtxBFPcRSK7UGGLBo48vBpTWaP
         uIGRvqmXZIqnQ==
To:     Martin Rodriguez Reboredo <yakoyoku@gmail.com>
From:   Benno Lossin <benno.lossin@proton.me>
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>
Subject: Re: [PATCH v2] scripts: read cfgs from Makefile for rust-analyzer
Message-ID: <fW_Nn96x2phVy1b0wgVr6-xSGl3YXXhw5r-3XmAbDz_vsYWr3OmRu-b8pQnVlf0OcAbXRa9BnJXc_tsqVPijmkQtHTAzoZlbt8Gl-4f423w=@proton.me>
In-Reply-To: <1326c1e8-1707-9275-c1b4-4b4870912158@gmail.com>
References: <20230520231701.46008-1-yakoyoku@gmail.com> <diYQuBM2vYke0twpM2m8npuzVA2tHeJ2y52qN25pwSUmgBG0wxwaEQjBVg8eZnxu2kqcBf8wqNiu0aqgAGR3mlmtT2wPuO_HbVxAyhxR3X0=@proton.me> <1326c1e8-1707-9275-c1b4-4b4870912158@gmail.com>
Feedback-ID: 71780778:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 15.07.23 05:33, Martin Rodriguez Reboredo wrote:
> On 7/14/23 12:55, Benno Lossin wrote:
>>> Both `core` and `alloc` had their `cfgs` missing in `rust-project.json`=
,
>>> to remedy this `generate_rust_analyzer.py` scans the Makefile from
>>> inside the `rust` directory for them to be added to a dictionary that
>>> each key corresponds to a crate and each value, to an array of `cfgs`.
>>>
>>> Signed-off-by: Martin Rodriguez Reboredo yakoyoku@gmail.com
>>
>> When I try this patch *all* configuration options are input into the `cf=
g`
>> field of the `core` crate (others are also affected):
>> ```json
>>               "cfg": [
>>                   "CONFIG_RING_BUFFER",
>>                   "CONFIG_RING_BUFFER=3D\"y\"",
>>                   "CONFIG_HAVE_ARCH_SECCOMP_FILTER",
>>                   "CONFIG_HAVE_ARCH_SECCOMP_FILTER=3D\"y\"",
>>                   "CONFIG_KERNEL_GZIP",
>>                   "CONFIG_KERNEL_GZIP=3D\"y\"",
>>                   "CONFIG_CC_HAS_SANCOV_TRACE_PC",
>>                   "CONFIG_CC_HAS_SANCOV_TRACE_PC=3D\"y\"",
>>                   "CONFIG_ARCH_WANT_OPTIMIZE_VMEMMAP",
>> ```
>> The snippet would continue on for about 1000 lines.
>> I think this is wrong and not intended.
>>
>> --
>> Cheers,
>> Benno
>>
>=20
> Wait, can you tell me which branch are you on? As it works on
> `rust-dev` and `rust-next` with `make rust-analyzer`. Also, do you
> have any other details?

I tried it on both `rust-dev` and on `rust-next` and on both I have
this problem. Here is what I executed:

```sh
git checkout $branch
make clean
make mrproper
make menuconfig
make LLVM=3D1 rust-analyzer
```

In the `make menuconfig` step I disabled `DEBUG_INFO_BTF` and enabled
`RUST`.

If you want, I can upload the `rust-project.json` file to GH, since
it is 55k lines long.

--=20
Cheers,
Benno


