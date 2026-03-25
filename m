Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E353FFAC4
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 17:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458522; cv=pass; b=FAfB9arEdd92r6ubTUK7+aqWqD9dtXD8jB959vgtfFiqbIHTTEqPfzbzJhI2V98u4IxwYUzyel60c4kfCwKHCCrxtKpzQPbb8Hlcm60c3RVW0i/srhPTwTwgWw/Eho7REvKa34ZRO+8iZHIPsnlYO5r+Jm0LWqN+W+SMkXRIVps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458522; c=relaxed/simple;
	bh=2SA21GpYatS67AvAzCFnZhbD7v8/rwCpsixQygU9K1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/KcF2uUY5+rFBu8l8sFiQfkKdn68AzbcXbAJx/9AY35g4qGwRObPLXtGL5Anrbs1uGS8fPCC9xHWdagbOkgUyBpPJpczCXYn9g2V2Br8tyDf+pmoDs5r8Uf0LNREgRYOo7oRPWH72fsT0wjSLqf0p1tyi5TbQt2DtZnYKTaZdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QLqyt/cB; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QLqyt/cB"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-661ce258878so613a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 10:08:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774458512; cv=none;
        d=google.com; s=arc-20240605;
        b=XBQMnzXz+gCzbKikVJ8ftZy6pUo3dxxEhu8coQ6efp56bIp5SOF9Fm1E4jSg5qRjRL
         AXIwATZa5Wf0aLKGz7GjFOzAGw5c9FTfI+D4nzQ3F5KU5QGmFS3aRPAJ+KCZISWkEU4C
         msCx/kEA/zf3BcgscbANbfdSMY3th08T2fBKfsBtCpVzqPrG9dySrltMl+eIKHJmZR2I
         Pqk9qcNnaYAD85XoBJlfj+x0kv8weO5gQKfSmnW0dCXr6zWVuo8T66b3UftQ2Oi/pUvz
         ZSuk3Va5kpSkZF9as/B0+n90dlyxqZMrT72p6K2TUEjCzaVDAaUrVVM33l/XaGQtyykE
         1PHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2SA21GpYatS67AvAzCFnZhbD7v8/rwCpsixQygU9K1g=;
        fh=OAEqYrR0Fyu1Gfn2aZnrqjyWHsPV1dzyhLlEndm8zTY=;
        b=MMQlYw6AOKDWdbIG0/uYaaymXX6CGbw+q+Ef1990vyUUWe4+VNrIUSFRH9vZvMQerZ
         xGd+GMBdUMBmPsJwGZmxGHJ3khmbSSFXk5Qy6hx3IiWBjg8llEfN4fPx08hIxZI8ec8v
         92WMxgtU0CMbIzPryQa8Tplm/Wql/Xjd1u1gVgxG5a2Cik+pviRg3N+XZkC3aPQcICAi
         M9lt2DB4ox6FwKp3xt/72wXNOpOsLU0AapX9cq3YM/rSBlgC5kPp1pOZcZl3vHKXvlGT
         veAo8mLmMI16rRPYeRx48xft20rU6Oa544t3gixHz4P2JP/MlLwCidZ+YoOaf0OJMw9B
         Buuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774458512; x=1775063312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SA21GpYatS67AvAzCFnZhbD7v8/rwCpsixQygU9K1g=;
        b=QLqyt/cBYWYCqcT8lwqot2UE7BgA+9Vbyq0lLUsokMYgsnVkLeG5YZhj9xOcEZUwNw
         6LqrziOPSRqeD4XOjcgnJUv23+pDGU7R+eax7301YEkS/df29kb5j+UTKxrPwtXgSqQq
         tVdkHaLMwP57YeGl08J6W1ZRyfL0WqGDDuIW10Wk39XR0QR3TrA8sanRnfJbcGQW4rx5
         4+y9Y46K+68FyNAXJqoIPaiEAs60putkNA72giRGpq69GvEAaynq8Y6hZZbjS6aqMCS/
         msS6G53ZL3JAUDJ3+13dIigLB/fut4z1oHF2xQCS37RJh6UgvN96qmY8Yl92pU1phtv9
         yXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774458512; x=1775063312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2SA21GpYatS67AvAzCFnZhbD7v8/rwCpsixQygU9K1g=;
        b=j38hvGNGQulINXdk0ahjPmbUkgTiKcxzgnd74cVBblFT9Joyw3Yu2rr+XgzUl8yVuO
         boiQiwnIXplE2e1GDDPf79zY0F9dQScHlMzYvV5HMhUc5ivHvWWdKLSLDEY2zaTIKZ+7
         sOdIVkRkreQVL6hP9T1xpmtSeFE6CivmP9Oi/iWfqXKYND3LBFAC7AbLdDss8g7V3bqy
         ckHiWMwEd9Wc0FfvTC3bAv7feB2pXBRI3QS886uG5VuDGPav+UXD/fLUJABdh5GD2Td9
         WPd+cMwhFbDwJKD9z8K6HXgG5LCkjlRF8rzcDzv3nziEshRoZ2b7ydnIaOxC3b8AEyUV
         rE3w==
X-Forwarded-Encrypted: i=1; AJvYcCWmt55ZHBz3ZheDAvSUCfNrmUGVUblJi6gvB40jxbo7gqlEh2LoCU/aZnUhIrszifSIIFs1dy/PMicAN/ddig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXkxuQowbEnD5BLTsfVRw9MS2U73PwgQ7UzqmzaqvE07pYcDe+
	IIEoqnsE/qDDdpDg0+2+N/LJMdmQy2OYa6U9w9NcB0voKOJdcqSSDUQoUCSwGGDrW/58KuwfeIG
	h9w+WfvhaGa5WGGggYg7PwWtkLRv2DyfjbEh/Nzy1
X-Gm-Gg: ATEYQzxlg860mxvyfNMWd9zfYYN9Y1lxkdB3c02FKCibvndV91/V/8hltE7FdbPTxKr
	pWQuTt/NWB+0DT4nnNLbCzreJDX3wNLXrvfaBA9TFdMg2b0mpOcxAp6Hu06Dj6uNYHIIDVZWJwH
	FKCNY1H35oF6QjVaQMaC3MfvmVU2diMvPUD2uXztpnOcq59RqKCE+nA4aEp5dSTPDhSCrasu01t
	ErQauce3PsIYXVmUgglaXji8/3RWQI00v01Bqv8AAzAKIhFGQGB3T/hyDfb6fmNy96/4YeF6P+W
	9Lrv5/vCC7FUvNJJppPOW0oDR7Tw93LRIDc=
X-Received: by 2002:a05:6402:a2cb:20b0:664:6b93:8547 with SMTP id
 4fb4d7f45d1cf-66ad906d8acmr795a12.12.1774458511306; Wed, 25 Mar 2026 10:08:31
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
 <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net> <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
 <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net> <CAH5fLghkK76Od1AxSH_NgrxOr2pt2XOoVBuLD6ZovzcLoxNwQQ@mail.gmail.com>
 <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net> <20260319235443.GB769346@ax162>
 <DH7XVDAUF5JT.2U3SPHXDFH8PS@garyguo.net> <CAF1bQ=T8-tWaB5Sf2eqWSodMgp=Pf9Guut-JavV62dczHpGNBg@mail.gmail.com>
In-Reply-To: <CAF1bQ=T8-tWaB5Sf2eqWSodMgp=Pf9Guut-JavV62dczHpGNBg@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Wed, 25 Mar 2026 17:08:18 +0000
X-Gm-Features: AQROBzDqH2vQpnCwpt0XUgrDzcnbSYyl3KDW_HT4rSwIQ7t-2lYSQNEQfa3eF1I
Message-ID: <CAF1bQ=Q+iY_HTngUsdM4RWVf=Jt3K9uPkSncaL0vTQBCxNnmDw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Resend in plain-text mode)

I have reviewed this patch and it looks good to me. I suggest updating
autofdo.rst to explicitly mention support for Rust.

Regarding the naming convention, I understand Gary's point that Clang
and Rust should both be viewed as LLVM frontends. I am open to
renaming *FLAGS_AUTOFDO_CLANG to *FLAGS_AUTOFDO_LLVM. However, I would
prefer not to use *FLAGS_AUTOFDO, as GCC also supports AutoFDO, but it
hasn't been integrated into kernel builds yet.

These naming updates can be handled in a separate patch.


On Wed, Mar 25, 2026 at 5:01=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> I have reviewed this patch and it looks good to me. I suggest updating au=
tofdo.rst to explicitly mention support for Rust.
>
> Regarding the naming convention, I understand Gary's point that Clang and=
 Rust should both be viewed as LLVM frontends. I am open to renaming *FLAGS=
_AUTOFDO_CLANG to *FLAGS_AUTOFDO_LLVM. However, I would prefer not to use *=
FLAGS_AUTOFDO, as GCC also supports AutoFDO, but it hasn't been integrated =
into kernel builds yet.
>
> These naming updates can be handled in a separate patch.
>
> Reviewed-by: Rong Xu <xur@google.com>
>
>
> On Fri, Mar 20, 2026 at 9:48=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
>>
>> On Thu Mar 19, 2026 at 11:54 PM GMT, Nathan Chancellor wrote:
>> > On Thu, Mar 19, 2026 at 07:09:22PM +0000, Gary Guo wrote:
>> >> On Thu Mar 19, 2026 at 4:33 PM GMT, Alice Ryhl wrote:
>> >> > On Thu, Mar 19, 2026 at 12:47=E2=80=AFPM Gary Guo <gary@garyguo.net=
> wrote:
>> >> >> On Thu Mar 19, 2026 at 11:44 AM GMT, Alice Ryhl wrote:
>> >> >> > Do you think it's worth having Rust not match the CFLAGS here?
>> >> >> >
>> >> >>
>> >> >> I think the C flags should probably be renamed AUTOFDO_LLVM too. A=
fter call, all
>> >> >> the perf tools involved here are called llvm-foobar as well.
>> >> >
>> >> > But isn't it just called this because the config option is
>> >> > CONFIG_AUTOFDO_CLANG? So it's the CFLAGS or RUSTFLAGS related to th=
at
>> >> > particular config option. It may make sense to rename
>> >> > CONFIG_AUTOFDO_CLANG to CONFIG_AUTOFDO, but that's out-of-scope for
>> >> > this change, in my opinion.
>> >>
>> >> I get that it's an existing config name, but previously it is a corre=
ct
>> >> description, while after this change it is no longer accurate.
>> >>
>> >> I don't know if there's an established practice on renaming CONFIG op=
tions when
>> >> this sort thing happens though. Perhaps one way is to have add
>> >> CONFIG_AUTOFDO_CLANG that selects CONFIG_AUTOFDO.
>> >
>> > As Miguel mentioned, there is the transitional keyword for Kconfig to
>> > handle renames now but I would really like there to be a compelling
>> > reason for the rename other than LLVM is a little more accurate than
>> > CLANG. The kernel has never really done a great job of referring to
>> > Clang when it means the C compiler vs. the whole LLVM toolchain (like
>> > LTO_CLANG and all its derivatives should be LTO_LLVM since it requires
>> > ld.lld, llvm-nm, and llvm-ar in addition to clang). Additionally, asid=
e
>> > from the configuration, there is the user facing Make variable
>> > CLANG_AUTOFDO_PROFILE that would presumably need to be changed for
>> > consistency.
>>
>> If you think the config name should be kept as CONFIG_AUTOFDO_CLANG, the=
n I
>> think there is no real benefit in changing the variable name.
>>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>>
>> Best,
>> Gary
