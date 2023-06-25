Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FA2EB64DC
	for <rust-for-linux@archiver.kernel.org>; Sun, 25 Jun 2023 13:07:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231626AbjFYNHW (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 25 Jun 2023 09:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbjFYNHV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 25 Jun 2023 09:07:21 -0400
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C011B3
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jun 2023 06:07:17 -0700 (PDT)
Date:   Sun, 25 Jun 2023 13:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1687698435; x=1687957635;
        bh=6zSwMhwbuqPy3zgYvaxQEVw9DmXm9kLhhzopKBxaS9E=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=AuvQvn5cTfmNK3KGLVxo3I53MuaDjk9Hk80Mf9CDCVwEeI5aIRt2pOa4f04m4Ps4/
         o2dSuRaYC7Geud2F7xxJGf6xfxW45v0FVeut+KPrHyA2ttGjIP6+4YonQP/SOlk2St
         6KjEJyvlC2/CxOpaYxH2o0ZMLOiemAk+dUUNLtN6FZPmnwS3sCBgk5xhhO/itJ+QES
         Kufxa3wjInKIVcRoS8CeYbeLB8VUXRJAaj+JAcAEJ45mdEsxxMuh3RAvRqwVZmpeBy
         /ErxuACLB396S9jhWBFnXVU+FZ+teYVyfq0U1IZZiFlBT52ReYvEryI4clWgK0RbsE
         SAIU1ld8ZXBsw==
To:     =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
From:   Benno Lossin <benno.lossin@proton.me>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        Alice Ryhl <aliceryhl@google.com>,
        Andreas Hindborg <nmi@metaspace.dk>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 5/7] rust: init: add `..Zeroable::zeroed()` syntax for zeroing all missing fields
Message-ID: <6f4e1d68-f828-8990-4859-8ab24907fa46@proton.me>
In-Reply-To: <we7PHkrpBV6kIgFZojiBFerqlXtSJB9HWkj129OGUWUVyVFwtuoirr3gVybgLzW2hmpUqqSAAQUPsdfL9QC2JyNKOLRNX0mSTfgD8llSJKE=@protonmail.com>
References: <20230624092330.157338-1-benno.lossin@proton.me> <20230624092330.157338-5-benno.lossin@proton.me> <W1fY0aa_v9j7lJNWXk_WNaxY2qruJo1R6k7u0g-X5L5Rxuod-VMBMmByICDwjF_fFGvNJTV41QapW0WeVduNYqxgo9S243gnNGXbexq6P3Q=@protonmail.com> <f4bcd952-1ad9-42b7-6e0b-72a115dcbe8e@proton.me> <we7PHkrpBV6kIgFZojiBFerqlXtSJB9HWkj129OGUWUVyVFwtuoirr3gVybgLzW2hmpUqqSAAQUPsdfL9QC2JyNKOLRNX0mSTfgD8llSJKE=@protonmail.com>
Feedback-ID: 71780778:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 25.06.23 14:56, Bj=C3=B6rn Roy Baron wrote:
> On Saturday, June 24th, 2023 at 23:14, Benno Lossin <benno.lossin@proton.=
me> wrote:

>>>> +                        // Ensure that the struct is indeed `Zeroable=
`.
>>>> +                        is_zeroable(slot);
>>>> +                        // SAFETY:  The type implements `Zeroable` by=
 the check above.
>>>> +                        unsafe { ::core::ptr::write_bytes(slot, 0, 1)=
 };
>>>> +                        $init_zeroed // this will be `()` if set.
>>>
>>> How does this work? Shouldn't there be a ; after $init_zeroed to consum=
e the () value?
>>
>> It is the last expression of a block and since it is `()` it is ok
>> (adding a ; would also be ok, but it is not necessary).
>
> I'm surprised it is considered the last expression of a block. Unlike wit=
h {} using $()? will still
> allow variables defined inside this as if they were outside of it. Also I=
 can't reproduce this
> behavior with:
>
>      macro_rules! foo {
>          ($($a:expr)?) =3D> {
>              $($a)?
>              bar();
>          }
>      }
>
>      fn main() {
>          foo!(());
>      }
>
> Is there something I'm missing?
>
> Cheers,
> Bj=C3=B6rn

Not sure what you mean with "allow variables defined inside this
as if they were outside of it". But note that in the macro `$init_zeroed`
is the last expression of a block. Here is a small example:

```
macro_rules! foo {
     ($($a:expr)?) =3D> {{
         $(
             bar();
             $a
         )?
     }};
}

fn bar() {}

fn main() {
     foo!(());
     foo!();
}
```

it expands to this:
```
fn main() {
     {
         bar();
         ()
     };
     {};
}
```

--
Cheers,
Benno


