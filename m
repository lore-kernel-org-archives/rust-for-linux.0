Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52AF18A6B0
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Jun 2025 15:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137952; cv=none; b=RV5tbY/gjxsuEEUxqRs6JY6qjVmgiNr4P+8NvqsfU7hb4EaaLmxRiD0cX8zeR9QMDi8iifAt2TiY7B2RJl7fWLu7fd9s9I+MKMa3ZI95BYNLS9au59voCnBvB2Hc75mgh35glu2f0D2T858unsehanSHokT0J/MxYZxhj+uNbm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137952; c=relaxed/simple;
	bh=+qIlnSp7EiFAhKFCDXrhEBigcDZxUNAAcEp3C3jjn1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbC98gh4S03J0GxmAQ00nvVvF0Dv1sF1ED5T16HNDChI6/jWah4XZyUjvzHu+nZtXJ48UFcNdFOWf+xOi/EchPekD8J7ZWNdXvE8OUmcEVS9qQQ7H2MBFPBYy4FSeDDV3ZzQA40agu8qnUZm0r8dGLeoxSl8yUvMmzal0hcnY8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7iNpE5Y; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7iNpE5Y"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b26ed911f4cso153745a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Jun 2025 08:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749137949; x=1749742749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPrb9czhCVuLvR+8zO/z5PUZmMcTZy9y8M1FA9QO8JI=;
        b=V7iNpE5YCG+5ae8k1qXhi242Q7PoQ1km/YX0kxVUIlwUHysYthYArjX9bQoGSYi1GZ
         dVzH0AtuezZC2STKBcRlEHj17O05A2lqAE4E+g2Wn9qOojvbFPP0OQhTQJ1P4OFWV6Jo
         e3bFqGlAzBkhpBMAMXZlRrekcYzUpRJY9DC7X+7J7WoKTl0O4Cs+YEaHQNO5l2G/dtYj
         fDsog0G545eeQCEefu4qiNZIonqQDzsZOY/oHIWyh8Hl5zMzW+AqTcLlXF1AQWq7wj4k
         RetUr5nDUAzJtfNMxcJ8RgmMrDNDLb2H/36F65NH2lZIhCRL/H4GM0EPZAmsVoWkGPI5
         90dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137949; x=1749742749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPrb9czhCVuLvR+8zO/z5PUZmMcTZy9y8M1FA9QO8JI=;
        b=UApBqf8iF5SBDiHSs6X83mJxtRiNcSUzAzkBao9uCeOlXXXTa1WTHAtRwPvU48BC2z
         OzbDYq18cVd5Lg88AsxOPIDDr45bFjNlAX51jN2ekoQEBeyltS3ZaEYZSB2AV25VTSZ2
         z2gGOkkCc3ou5dEnYZv5k5VYrpNHpZQLo8dsWp65d4g380rRopWCnxUZnUl9ZaOq1X+i
         RoQtE+viYcP/JTAH4dz4vsStaQm9xzE4EsTd10lPA2UdvzctjsiyV0odR/icHajTFb3k
         OT+RcJGNn5w+p4lZ4d4sb8VCvz62o+NzthgB3OG16YkZ7PctvZTnriJ+SjefuvLDywWy
         ePfg==
X-Forwarded-Encrypted: i=1; AJvYcCW6ZHdCm3fdsdiwJZw64H8Ya50qS/dBQqCQiEMnocsbOlFrPS0pnJCToRNK29Iyri1S6lMjdTXNIBaHQaXlwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1hRCehAFovF4EqZNXPY25RfPfYARcNA0fGHOrjD9SeaURpaqp
	Qi8tf0fvPLBel+xkFm1VzITIxJ0YnAlTlAfP3bMBKfNuea5QHsLyeXrDsF0UDI81SWglgYk/7+N
	DY96sx986932s+SKEJxZRODlI0/iTZXE=
X-Gm-Gg: ASbGncv9WgJPdTWs5iswJH8neg4BsFOQCR1RrxSBkcPbbxaR6WI9iLECaL0uORlsZOA
	OAQGyG3mvDatUvfIktLm4bQArnjL7vpQDqIpjYmq8ycQZJucQVC/yTO08HLP1yQtd550/7Pdpaz
	8iK0HLzF7V9vH1i3hJQEvKAB7QqhhnHDPo
X-Google-Smtp-Source: AGHT+IHptJ80PMmgYhgPdfvYn9vXZ7tnhmPS8lnUEJvyfMx7DdQ1nocPMb6P5owsuqXedkhDWUisDMQL6aRY+3Kg/ps=
X-Received: by 2002:a17:90b:17c2:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-31347a2b73emr37045a91.3.1749137948874; Thu, 05 Jun 2025
 08:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529184547.1447995-1-ttabi@nvidia.com> <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
 <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com>
 <7f644a70cc0c91bb42badd1ac747518843bb1ef7.camel@nvidia.com>
 <CANiq72mLEFV6iEX43=+d+5P8g9HT+Wip7eTBgPgqXQ--=dQxWQ@mail.gmail.com>
 <874ffd400b0632cff99b618661adffe472abbf8d.camel@nvidia.com>
 <2025060508-spool-twistable-66af@gregkh> <7faac30f75f2ba651995d9667c463706b61ffca5.camel@nvidia.com>
 <2025060511-surcharge-overfill-a721@gregkh>
In-Reply-To: <2025060511-surcharge-overfill-a721@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Jun 2025 17:38:56 +0200
X-Gm-Features: AX0GCFuzka808buCOccyoiQP3yr1t-TubBjuU9kzIhvusX5cDtyi8fOUI9GshCQ
Message-ID: <CANiq72khbkdS625Bcb1iX1EbUwo1iQOLVoke698SUm9BA3PgYw@mail.gmail.com>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: Timur Tabi <ttabi@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"dakr@kernel.org" <dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 5:21=E2=80=AFPM gregkh@linuxfoundation.org
<gregkh@linuxfoundation.org> wrote:
>
> And I'm saying "don't use dbg!()" :)

You likely know all this, but in case it helps to clarify the
discussion: `dbg!` is only meant for temporary code, i.e. so it
shouldn't be used (in the sense of committing into Git).

That is, it is a development tool, unlike `pr_dbg!`.

It is also fairly different in interface: it is meant to be trivial to
use, taking and returning a single expression (essentially). That
means you can even use it within other expressions, without having to
deal with formatting etc. For instance, if you have some code like:

    let x =3D f() + g();

Then you can temporarily "inject" it there:

    let x =3D dbg!(f()) + dbg!(g());

To get an output like:

    [example.rs:10:13] f() =3D 42
    [example.rs:10:25] g() =3D 43

That is also why we picked `pr_info!` instead of higher levels, since
if you use `dbg!`, it is because you really want to see the output in
the log (and we perhaps could use a lower level, for that matter).

Now, we could look into changing its output to be something that looks
more like a usual print, of course. On the other hand, making it very
visible/different than the rest of the kernel log is also the point.

I hope that explains why I think we shouldn't just do exactly what
`pr_dbg!()` does.

Cheers,
Miguel
