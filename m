Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB49222C339
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Sep 2025 03:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757128792; cv=none; b=RLzkgt5Xvq32Hxn9voAzAPVioKB9Wrans8YCIi7yXatXlrjz3nh9WTRfOlp0iv+fqth9gCAVJsOFXczgBrL2ChjyFxuTwAPiw82v68rmLyKFJEWgfsqWFvv548tWcghsOS0O0bwFsHodqC5ReRxd/zxo95pJIXb2R91A+zRGblo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757128792; c=relaxed/simple;
	bh=i0jDtPuAuQMt1NM0OTOsP3ZSUoN0wBDTLoW32cCtkys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9i1AjSDL80Ll59SRlk7EFlcCO8xWWKvuAtHSsjI+P8CC4bmaMlByLW0bRw9t2kdwzsLXIT5dxjcYGaNz5QdM0I0V+Sdmi/n8piCnXRbmhAhcOW/oAlIjCoGAUIR3A5Rf4BUI11Z/feGo8fTChMd9Lz53aIni1L+lINXja1wsYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0Utz0GLM; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0Utz0GLM"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61cfbb21fd1so4345a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Sep 2025 20:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757128789; x=1757733589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUnrEbym8cWaiMWORTWqmwUrvmW7nXo4vpAgjGxb8aQ=;
        b=0Utz0GLMuP8tViw6Sga50ji7n51DEttRaPkRwSYoYkYxK7Kd7OCcjDn2CKLtSZCL+8
         rj7OURbwlM2I1rCmuS1vj1zwNYdjiYKdaihLYeiy9xcXreS3gdqFHiGeLlW2QT7e+xp8
         2unFmSPXZPRM5wO2sLcEz11rUS2ifITnjL4W4J//S2fGlDPNSxmhbc1Pk68R3eGa198s
         Ngm2HE7VKAp5UTy8JDohS0Y1LjUKj8ql7y6GgdCN9gVDoBhVvsC/yje+M7Kbj0x/3Ia/
         lPDlwqT7NUmtcdfV8cJ9k9nUGOddgKqSSvULwMOmK5c3H8oyZDFAOkY2Vt8UuI1eFeVm
         DiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757128789; x=1757733589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUnrEbym8cWaiMWORTWqmwUrvmW7nXo4vpAgjGxb8aQ=;
        b=BNPwFOAzCwMbnCyCX7M7yHdGOOspDnUvgCs6HeCF+ko2yac5wrVwohP2EAp8fv7bXN
         ljJehKzX7gG+u57FSUET0ug41f59X4bjI5uDH43oCtYwBMG42aka5PZ2mE5zscbTv3ep
         MEUF9oL/BYuY6aaAi97BboQdONQF6DT6x0VmOW9t/AuBfxA/0SR5KsASKB6GHScQRQja
         M1vf/oPuYaxeBn3ArCVB9pOHLIxGjooSi7GlSuGtKzFE68sKxCa3ySS08JZFfb7JJ4ve
         LmKRUVm584raK5MllE0/9EKhE1PDykgUjXXaOSxTc++XtY5pF+9np2+R3AYWeOrYmXnO
         r0gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCEw1Avu6PUg0RbTo4E0ikVId9+M7VdcyiMC0xa+4O+k0iZ5aqNDDjtTlnWTfegOqX3LyoxYWrCcvYIGsjCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHvvkon8KxvXkap0H/Flt/96HV70Z0Xm7zh+PiPTCU49rInPN4
	pxTVz91giN26zL1Yt+9DeAS0xcAcN3IG/zXjdkOxB0MmYqnB+M5ZooT3dlfxbkWGQAMRyhvpQqv
	Kxz798+Y3u+Nnh1SK5RZ/ieI32aSUcjhRKa2rLIjF
X-Gm-Gg: ASbGncs63qKxFkoXVMm6cjSemicA0jrqlfNgTv817zk2+uwrm3+mPHvBk/PXF7jomIC
	kSO2HFcOxU1alurvHEoYK4ja/KB7/6ce82MfaI885kNNPR5UcDbx4RlknPsym5q5KjSoG+jEdXb
	KV1yUVqvOnJcLScGdtElToRYk96XjXYgK6Y7RnXClz9Zb/DGlxJ+SX4x3Mnal5E2HEBPrgHeOMN
	LOA/TyiaU6JLyCUsIvKE8QD8oGbPzLCLP36xUwJaCeeYbzSb2A=
X-Google-Smtp-Source: AGHT+IEpbvl1msst8Y8AhGIvfgeiQKuRecMVvBy0eQgxYcmCQKMzwJNAg62WHMaeTshzfL236ebrPRRUZ+ytR5USn9g=
X-Received: by 2002:a50:d506:0:b0:61e:ce79:1da7 with SMTP id
 4fb4d7f45d1cf-62356cc4e97mr35864a12.6.1757128788834; Fri, 05 Sep 2025
 20:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904-debugfs-rust-v11-0-7d12a165685a@google.com>
 <20250904-debugfs-rust-v11-5-7d12a165685a@google.com> <DCKQS4126EVC.38ZJ0GOFDYCP7@kernel.org>
In-Reply-To: <DCKQS4126EVC.38ZJ0GOFDYCP7@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 5 Sep 2025 20:19:37 -0700
X-Gm-Features: Ac12FXyiznx642yKmGiPP2r86OtClJU0KrUs-LmHZJ_nsO5FoE6RnPhhD18rLLU
Message-ID: <CAGSQo01He7cNvcOQBxAqLicSjKniSp=97K6GupnxS4B=G9p4rw@mail.gmail.com>
Subject: Re: [PATCH v11 5/7] samples: rust: Add debugfs sample driver
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, 
	Dirk Beheme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 2:00=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Thu Sep 4, 2025 at 11:13 PM CEST, Matthew Maurer wrote:
> > +kernel::acpi_device_table!(
> > +    ACPI_TABLE,
> > +    MODULE_ACPI_TABLE,
> > +    <RustDebugFs as platform::Driver>::IdInfo,
> > +    [(acpi::DeviceId::new(c_str!("LNUXDEBF")), ())]
>
> This should use "LNUXBEEF", as we explicitly reserved it for sample and t=
est
> code.
>
> I think we could reserve more if we see a benefit, but so far it's only u=
sed by
> the platform driver sample, so we should be good.
>
> Either way, no need to resend for this only, it can be fixed up on apply.=
 :)

Ah, thanks, I was unaware that it was specially reserved and so tried
to pick something distinct. You fixing up this and the `OF_ID_TABLE`
on apply SGTM.

>
> > +);
> > +
> > +impl platform::Driver for RustDebugFs {
> > +    type IdInfo =3D ();
> > +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D None;
>
> NIT: This defaults to None, so it can be omitted.
>
> > +    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D Some(=
&ACPI_TABLE);
