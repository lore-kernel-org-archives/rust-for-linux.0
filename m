Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244C5C433B4
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 11:27:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E91536142A
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 11:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhD2L1s (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Apr 2021 07:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbhD2L1s (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Apr 2021 07:27:48 -0400
Received: from gimli.kloenk.dev (gimli.kloenk.dev [IPv6:2a0f:4ac0:0:1::cb2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC455C06138B
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 04:27:01 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kloenk.de; s=mail;
        t=1619695616; bh=b889TRzO6OzDBzPrOpA5ZVqDMouo54h15av3KLVawlY=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To;
        b=WFUhp98nc08c3/ZcLRpB1gkFNSU3hMWTPvb8COxtnBgPTMb3UYz2P2y63CYyx2fsH
         LjlZGQCdKG2sDLsT3GUVGccWTrtTi64Nkube5uMPqOx97qag6JoTk9GC9MINmmmD25
         TQv5/F86w1eL450yIGE7LTQrUvd3LU0O54XjcGK0=
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: module parameters permission
From:   Finn Behrens <me@kloenk.de>
In-Reply-To: <20210429102543.GG1409@agape.jhs>
Date:   Thu, 29 Apr 2021 13:26:56 +0200
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2A893F5B-9867-4F7F-B16F-6FAD4FE36E3D@kloenk.de>
References: <20210429095819.GE1409@agape.jhs> <YIqE1B3qMK+5AwQj@kroah.com>
 <20210429102543.GG1409@agape.jhs>
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

The module macro is a proc_macro. This is written in a way to only =
accept one single iteral at that position. So that is an expected =
behaviour with the current implementation.
If needed, this macro could be extended with functionality to deal with =
that case, but if octal values are preferred, I don=E2=80=99t see a =
reason to introduce that level of complexity.

Finn

> On 29. Apr 2021, at 12:25, Fabio Aiuto <fabioaiuto83@gmail.com> wrote:
>=20
> On Thu, Apr 29, 2021 at 12:05:08PM +0200, Greg KH wrote:
>> On Thu, Apr 29, 2021 at 11:58:20AM +0200, Fabio Aiuto wrote:
>>> Hi all,
>>>=20
>>> I'm trying to declare module parameters this way:
>>>=20
>>>=20
>>>   params: {
>>>        scull_major: i32 {
>>>            default: 0,
>>>            permissions: bindings::S_IRUGO as i32,
>>>            description: b"Major number",
>>>        },
>>>        scull_minor: i32 {
>>>            default: 0,
>>>            permissions: bindings::S_IRUGO as i32,
>>>            description: b"Minor number",
>>>        },
>>>=20
>>> i.e. using S_IRUGO macro exposed by bindgen. But I have the
>>> following compiler error:
>>>=20
>>> error: proc macro panicked
>>>  --> samples/rust/rust_scull.rs:12:1
>>>   |
>>> 12 | / module! {
>>> 13 | |     type: RustScull,
>>> 14 | |     name: b"rust_scull",
>>> 15 | |     author: b"Alessandro Rubini, Jonathan Corbet",
>>> ...  |
>>> 44 | |     },
>>> 45 | | }
>>>   | |_^
>>>   |
>>>   =3D help: message: Expected Literal
>>>=20
>>> the same if I remove as i32 casts.
>>>=20
>>> if I write permissions as in samples/rust/rust_module_parameters.rs
>>>=20
>>>    params: {
>>>        my_bool: bool {
>>>            default: true,
>>>            permissions: 0,
>>>            description: b"Example of bool",
>>>        },
>>>        my_i32: i32 {
>>>            default: 42,
>>>            permissions: 0o644, <-------
>>>            description: b"Example of i32",
>>>        },
>>>=20
>>> I get no error.
>>>=20
>>> What's the right way to use S_I*UGO macros?
>>=20
>> Not at all, use the octal values instead please.
>>=20
>> That's the way that we have declared a while ago, and I think
>> checkpatch.pl will even catch if you try to do this in any new code.
>> Please don't force us to deal with S_* defines in rust code as well.
>>=20
>> thanks,
>>=20
>> greg k-h
>=20
> thank you I didn't know that. I will use octal than.
>=20
> Anyway I'd like to know what was the matter with those bindings...
>=20
> fabio

