Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B722472AA
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 02:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773023098; cv=pass; b=PV9qunzEFj91VUQ/PJ1pWp5iJ3hXZXEJGZz26HhazYGfc65TLN2Bp+xCqTR/Xjzm5czrgRkIhEhOET2KNBkNn0kVO+MoeltUiaHawaNzVSHX2xIN3OGM++S5hlN2fCyuzqxvNV7shXYISDCICxug18enuHNJ7efj2lACQIaSGs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773023098; c=relaxed/simple;
	bh=tbXEvofdk+di6K4Z1aBpjtHo6nWKycLuYhbu/g64ES4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qe0IJnqe9ijgsy2gaPeH1QdCKaPnTXWPVkyD2LF7GyiH92iCG8wOHg5Kr8lmynCgeeNWk0XY2XDc90nr/dNVLCSfWIKu8m1BC/Rsz7FiMzhDjQ2SFdYEOmkmOE07y4/jX8VyZN1J1mpc2k+vmwhabkIOvD/A2fCk69qGyPA8QL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qpq3hORq; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qpq3hORq"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cb3bae8d3eso1037881885a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Mar 2026 19:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773023096; cv=none;
        d=google.com; s=arc-20240605;
        b=UbQYpTZCHHoGgBShG/jZVwz61eUWbehBmUQszU3ey7eitEQJ83/nl5s5ZmUoViHqx3
         7IIkMM/66uBOc7RfZHLz8v4OgD5PncWsZCjt8OCZFmP5hO+BBi57uin/+cW3zeoPLdj3
         lWJU5T4WafRH1+Dlg9rEk05lGHgnqB6ZZBYx+WokGP4lvkcBOovkBMlCO5h80Iab2mkZ
         hWpoNLSmWVZt7AiH9uZ2SpNoeW8hLZTrQaYpqwyF31cdx8d7wUpEZzaecB8Xw18nI/Vn
         qtnEc0n4r0mRBsdUv9A3I4Sgg1Ppiv1d6G7LYIUMLOs9Wp3Z23zhKLlZsUwN/wPWDTVO
         ZYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ME79/BhTuYHXlDgks9eyy4AhFiVjtqIOJ757hdc+T20=;
        fh=QaZgo6iQwX2PB86qBG4HHocm32TWewEqeeKGkWGqRyQ=;
        b=T7NVN+P75dDFwVG8leG6ssoWAY9VKhjbVP7BiKGxr7fwSO3sKbD/juio0gq4KAQDvq
         C5yVh1Oa/pXoCv/hUSDiRl391cVyn82gsygFEcngV7fcWrw2JzW9viCpouEy26PTKCVQ
         nCgX2tDLI2EgEs0A/kt+W6crzr1J7586mDZmsPbAwOjmvMR8EpccSYlr/namLrgAq4yt
         jPssD2YMcVW3JT+N+d5sg7dKcJ/GCNHCZPU5MMQKEQuJnFmc6YegPl2jj6U2fuIlWIaK
         WpcOYx87Fssx0i4bZzkMrl3bQ5ky9lHPEUJ37G4wtDGCssLdMpaczl4Nu+AYPAQoMD1O
         axIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773023096; x=1773627896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ME79/BhTuYHXlDgks9eyy4AhFiVjtqIOJ757hdc+T20=;
        b=Qpq3hORqS+K+gSmla2+A/Snlzq+jc/TRgX0EfDM8PF23hy4VZMypkS+momjMeBoFNP
         CYHGyc1qIy+YKcqPynHDvUEDx/7L5LlW3ToCz2WeNA+Z2CyLPauqTLqNEJ8AgSiu5Z+O
         QKbOJdl7xV4WbojDO46iHwea4bKC8n1wsdCHRroRJcOujI68uoE8+jtaGNlobltYTWTy
         H0rJQRNjRPs3joUT7zehrsLXo1lypyQKGzGU/cbXHUOWj05twgNIUTLIJHnYQ6nHiPTl
         9rzQ2DOBBVM28TjymkA568c5ij/PHf1bqrezB+vAfGNJwp0ZZ9XE8i5YK48tEBrvE4r4
         FOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773023096; x=1773627896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ME79/BhTuYHXlDgks9eyy4AhFiVjtqIOJ757hdc+T20=;
        b=HgzV9W28yQ/CMnZedBGs3gSbDyEq8TIgwsgg4Nxdv5n3Ptlvp0LgqaTRDAPo0RFevp
         qzV/62hcL41bZNFLPO6BF6rSJMp/2GAMKw0W3zuNFp7BXjZonp8cywETGOSYkf7ZNVN7
         zvp7YSxUEn0wit47Qwt2E9Hh8gZsOEKBy5ytCShi1bh2lcdVomhPuJQY+lqKYG7mOlGf
         UiHscXIgh8fzkJi5IycmvStwk5OdH6UNvS7siwDUgly3C2OSBp6TjzT6GDbUyBppFY9k
         46oKqB+pfiG2+6nxTffL6ovIQpcFpxVbmixvZnoJpW2YuVloRhFa0iO99awbHqW+8kIX
         VGRA==
X-Forwarded-Encrypted: i=1; AJvYcCWZsUdLDHG/zGbErFZN4PmJMmfJ3+mA3aAIVJy3i/nrOTbwO6FRHf+buZYIstETSu5jayb4ZjVhw9gSRjJU6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFdxAagrLp8XphAQVRxA8s4ARLmI5t0Xj4ZQWysOQ5uPZDEGHX
	ELWJJUWKbbtqGGGaYS7ibD1QsgjaC400tQQ0ZIl17pZKDxAmGFUkvMBG2wS6agI2KsqwybSs4jl
	G1TuwGB7DCaYb62fB9N8v6XdVam+dRJ8=
X-Gm-Gg: ATEYQzzlu/AsxMrqs8rILD026loN4qxmANR9L7FmX7IvqZD9I0rsfLaCri+SunSk1I/
	VP5YpMdHrD58A1KfAMMISs1UdsATghdTKZVVo9JvqaQaY1C41VQvjXu1Fvx9I8uADPObNj1WRYY
	vxkHFVBH50dPt4oUKDYheGqUxUAdZlROoA7tw8reSi0assbOU8e0PB3AB7DjdrrJGs1FRW7+UXJ
	6h6uAckPFGUjBbHnPYAEM+s8wPCIVI5MSdoMzl5CyfqbzBiMf4ioJalI+yFNqIx0xLR4yxLqg8n
	BpyL8Q==
X-Received: by 2002:a05:620a:b86:b0:8cd:79f2:dc55 with SMTP id
 af79cd13be357-8cd79f2dde6mr493624385a.5.1773023095692; Sun, 08 Mar 2026
 19:24:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226234736.428341-1-thepacketgeek@gmail.com>
 <20260226234736.428341-3-thepacketgeek@gmail.com> <f88cefdd-3366-4be1-a1a1-3b48d500138c@suse.com>
In-Reply-To: <f88cefdd-3366-4be1-a1a1-3b48d500138c@suse.com>
From: Matthew Wood <thepacketgeek@gmail.com>
Date: Sun, 8 Mar 2026 19:24:45 -0700
X-Gm-Features: AaiRm53zggdCh3GRVV1f9eBLsMcdSBZTMsDGYYuI2AOpm3dGBAC03iNgD3WS83Q
Message-ID: <CADvopvaX17ayxuGDubHS5wsjeRhxzsDjg-i8eGM7YWzSgBMF6w@mail.gmail.com>
Subject: Re: [PATCH 2/8] rust: module_param: wire StringParam into the module! macro
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, David Gow <davidgow@google.com>, 
	=?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 12:13=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 2/27/26 12:47 AM, Matthew Wood wrote:
> > Add support for `string` as a parameter type in the module! macro.
> >
> > On the runtime side, add:
> >   - set_string_param(): an extern "C" callback matching the
> >     kernel_param_ops::set signature that stores the raw C string
> >     pointer directly into the SetOnce<StringParam> container, avoiding
> >     an unnecessary copy-and-parse round-trip.
> >   - PARAM_OPS_STRING: a static kernel_param_ops that uses
> >     set_string_param as its setter.
> >   - ModuleParam impl for StringParam with try_from_param_arg()
> >     returning -EINVAL, since string parameters are populated
> >     exclusively through the kernel's set callback.
> >
> > On the macro side:
> >   - Change the Parameter::ptype field from Ident to syn::Type to
> >     support path-qualified types.
>
> Why is it necessary to change the type of Parameter::ptype? My
> understanding is that this token can currently be "i8", "u8", ...,
> "isize", "usize". Additionally, the value "string" should now be
> accepted. When should one use a path-qualified type in this context?
>

Hi Petr,

Thanks for the review! Yes, I believe your point is correct and I will look
at this again. I think I left that after wanting to be able to use the
StringParam
type, but realized that matching on `string` is more ergonomic.

> > +/// Set a string module parameter from a string.
> > +///
> > +/// Similar to [`set_param`] but for [`StringParam`].
> > +///
> > +/// # Safety
> > +///
> > +/// Same requirements as [`set_param`].
> > +unsafe extern "C" fn set_string_param(
> > +    val: *const c_char,
> > +    param: *const bindings::kernel_param,
> > +) -> c_int {
>
> The safety comment is somewhat inaccurate because set_param() says that
> the input value needs to be valid only for the duration of the call,
> whereas set_string_param() and StringParam require it to be valid for
> the module's lifetime.
>

Yes, thank you. After reading these safety comments back I agree they need
to be fixed. Miguel had a similar point as well. I'll update these in v2.

Thank you!
- Mat
