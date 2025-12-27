Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B96E3A1E96
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 18:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766861363; cv=pass; b=EVNNyap4BBkRdsc1MYDhBB2yphkbLmipe6//mB4QAhn8jche58J60kbjn4Xm5iQxhK0liFu95VxuN9IzHZS0GM8V6ehvc9ce7X+9foZL1iNouTxLSM7FrFklTFpOFzKJT7ytQoJAYPD9/9SjXRZFyAhto4fpeFNl/N1fN58Qdgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766861363; c=relaxed/simple;
	bh=AmDTe6few5OR3BtblpOx3TeIkT4yzyikca9+E2cyh6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZ9/G35Oa1PTdYgohr6cYYLhCQPYYTDaZPB9EIhN1/i7hufanyynWY4sZEAbcX/1O/mFiR+AzNUGq7em8mk6ht3dmnGG/Oc93GCskaoURfugReHU386qhEm3JaFOmFu8VHLguX4+eu+aNlvXBtyQ25QAIcpaxosSxNkME52X9mM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3VHU3Rv+; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3VHU3Rv+"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64b5b56d72fso67196a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 10:49:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766861359; cv=none;
        d=google.com; s=arc-20240605;
        b=FY0Ya5N+Jlnkw+dpqwzRMx+aA3wMhnEspvNmIT24nulhBESBOtBq+jR3Mxadl/VcBB
         fBipSBUJM4PUafMe/Zspd3OiN3457MEVcKTvnpBB5gb8MxWKj/iqDKiDrG5I4t+gAfUu
         22zG3P6NAtZrV62fNMK/fb8UYy0s0QIHFJPsczL+0Xn53kNVqr6MCQifRYsAoGVPq1Gy
         PbNZMQ3/A3/LGReRvjVCmBzE7ixhnrs9jswm+dDFK6h+Ex/DUZNofcqLK1+6A+ZNj2su
         QjwIMTiIytIt+STNKWavu+CcP83kr81p98rFu/w+RoPumLR5gWcPAWe37whopprYFvX2
         YU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JDsztgYUgjJcmEqac+DYH4C7PlDkvMV1sHquRdLYf0M=;
        fh=OlVfFyKMBgltZfdS9kMptukMB3J4t0SWWazZSe71XzU=;
        b=D/qd9aco2NcO2grsULxRKIMEV7NGOwrfVofMGl3rYVcE2G0ctg6R7OuPOXBhHQxIKt
         VxoqyCqNse12yyJdXWqeHX/B1KejLKDOtWopg0OqFkQ/JVA+g66joRUsvg0ON2dxYt5s
         hLswTMyNFlzx5WdiQfh3dbmse6krlJqSg0coYPFPpgvSMW7Lbmo/UqNtNVqWKlt7xGUY
         p8M2HTaMCFuSB9wbTweZBwV9J7cEZ+aGmrtSraBM7Cr+EE6Vjwterk/9h84RJD7t4L9H
         CscFhLxRbYmlG+6f0q2hd/dbArUQt+qHM9uLQYsC7rVgS4Sr4MXEGl3P81XBQFIBa91x
         SZ+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766861359; x=1767466159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDsztgYUgjJcmEqac+DYH4C7PlDkvMV1sHquRdLYf0M=;
        b=3VHU3Rv+YJphCy0JiX7DKetIRBqZIceoDEXTKIbOxvho4PYVD5TMBAb9va6mMZB/EN
         b238uRSSqfNrs21TcQMddmjT1KBWblbCyG5lSb10D/LwUHo6wpkdhNmefmZWFxg2NWbh
         H/EpJwqWkWUmHcWSZZHPZd8JC+EbYQLFws8TdQlQK/RTUnVY9nTFGVojkIMazXpIF2t0
         hlLJbzi2GEjtfWmTKWzXVB8glc/aycSa0o66IP+6n/45jeOhuGMgidZHdBl6ViSMj8Nn
         +ncHruuHzQdVSAEvFNHAWXJXNYvREKBIW6nwBYCrerxQhoBOEuQNsklPnCjGcN6ZhDBH
         oPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766861359; x=1767466159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JDsztgYUgjJcmEqac+DYH4C7PlDkvMV1sHquRdLYf0M=;
        b=ariTYkGdjPgBbOta5vvhEwhCmX2ukWanrpOkHWYHE5McSCWzV0HfAvaoGFoQwXwCw1
         gjGy6GE4b01d8KUdTLRPrVP6rH8Yja0rs6MUOPD+q+buqLZoubrjcXt/RDGAZhBbpg1Y
         5KWD4l7g1V0hFxlQper2syZsYsw/xerjFOi06TFPzK05RWjXQ+pOqFD3gJ3KA8LbAvfr
         WP1pLOZq6J/ydfL/k3BneXsXOf0T7HmGOHanC3S7GwrpZkA6dKGWIB3ExctnDHXpmG9J
         u57kBm8PbolDXFRd6jqLZciZTKhLaTaerb3DIXOGLfzvBB5AiokTChc0MQBCMpsOT8ye
         oF+w==
X-Forwarded-Encrypted: i=1; AJvYcCWCsSjHQF9KfIM+0qecWB6clmLud8788+Pu2Tu0rb/J+lbUOUfjIivbGjW6wJuabbf5WhUi1CmcE+SMRjeVgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVsaXfJvNMGtwMla1x0NYiEvrokbO7SSRfw2+T/rjRAYmIwkVD
	brtT7usdP43BhRqJpa8z8Pdkho0vvPniAZpKXQSQK586YTs+t9SOpyMmqVTE7zAVdNQHsXWTHj1
	ko/kORJqfH8caqVYxQ62+J6SKi1FBh6fe5jh8znzT
X-Gm-Gg: AY/fxX4BosIeO/fs6o22TXcxT8NDzNzBg8FBtzHTP+7Y13cKU8mWAe6uBDsaqS0KB/y
	6IG67ozQ2ZBVSnBnLxjDP/Jaca+Rrr+6D96I6vy3ftPm0Pn9yy/Zg4iT92+QIMxtJb21LkFwKHE
	HJ/J5FwNQ8PJvw92xkJootbrnVJtth3mrhKUTHPoNs1FuunnSKAXQSgAyGMzxBv2I8v1cH9wRUb
	Lf5ZJmneiCa+bdbk3fJiQ48mSmVavHd6S46Ie6wmhHBwG+AplAW+fREUoZ4Q132Aim1KPPn+Wsu
	w7j7zR1Au9ipeOSivR2JSQpfRP0C
X-Google-Smtp-Source: AGHT+IHknqEKObpBKwXWuIjVwThSSHANym7/Cti4iDBC2xuxIBsC14RC4RbSlvh6JHADcGy6dF/JTHHPSpPkdNsCGDM=
X-Received: by 2002:a05:6402:71a:b0:64b:2faa:d4e8 with SMTP id
 4fb4d7f45d1cf-64de0e5a793mr60151a12.1.1766861359408; Sat, 27 Dec 2025
 10:49:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226-soc-bindings-v4-0-2c2fac08f820@google.com>
 <20251226-soc-bindings-v4-3-2c2fac08f820@google.com> <CAKBF=psoOa2S5J2Q6Euf_tDdBJHhGpFA9P4304vo9WgA8y71Fg@mail.gmail.com>
In-Reply-To: <CAKBF=psoOa2S5J2Q6Euf_tDdBJHhGpFA9P4304vo9WgA8y71Fg@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Sat, 27 Dec 2025 10:49:05 -0800
X-Gm-Features: AQt7F2r0uzEQgAcKZB4DrYTLYkjNS3UM3_qM4cWnW43cPPSPvgd-E_545is1Bmw
Message-ID: <CAGSQo00QVhDg_qMAwq+sW9y+nA0M-Zw+9zyPJpe99kbqrE1B3A@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] rust: Add SoC Driver Sample
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 7:53=E2=80=AFAM Kari Argillander
<kari.argillander@gmail.com> wrote:
>
> On Fri, 26 Dec 2025 at 22:18, Matthew Maurer <mmaurer@google.com> wrote:
>
> > +    fn probe(
> > +        pdev: &platform::Device<Core>,
> > +        _info: Option<&Self::IdInfo>,
> > +    ) -> impl PinInit<Self, Error> {
> > +        let dev =3D pdev.as_ref();
> > +
> > +        dev_dbg!(dev, "Probe Rust SoC driver sample.\n");
> > +
> > +        let pdev =3D pdev.into();
> > +        pin_init_scope(move || {
> > +            let machine =3D CString::try_from(c"My cool ACME15 dev boa=
rd")?;
> > +            let family =3D CString::try_from(c"ACME")?;
> > +            let revision =3D CString::try_from(c"1.2")?;
> > +            let serial_number =3D CString::try_from(c"12345")?;
> > +            let soc_id =3D CString::try_from(c"ACME15")?;
> > +
> > +            let attr =3D soc::Attributes {
> > +                machine: Some(machine),
> > +                family: Some(family),
> > +                revision: Some(revision),
> > +                serial_number: Some(serial_number),
> > +                soc_id: Some(soc_id),
> > +            };
>
> To me it seems little bit awkward that all needs to be CStrings. Maybe so=
mething
> like this could be used (basically cow)
>
> ```rust
> pub enum AttrStr {
>     Static(&'static CStr),
>     Owned(CString),
>     None,
> }
> ```
>
> This will also take out Option with same time. Then some nice ergonomic w=
ay
> to use this. This is suggestion and I have nothing to do with soc layer.

IMO something like this should not be a SoC-specific special type.
Feel free to propose a `CowCStr` in `kernel::str`, or adding the more
general `Cow` and appropriate trait definitions to `kernel::alloc`,
and we could modify the API in the future. Basically, this seems like
a suggestion for a new vocabulary type rather than something for SoC.

We could technically also do a many-parameter'd struct and put `:
Deref<Target=3DCStr>` bounds on everything, but putting 6 type
parameters on something, which would then need explicit resolution
when `None` was used, seems potentially worse ergonomically.

>
>     Argillander
