Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4682D9796
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 18:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763146421; cv=none; b=hry5VYo7Ktc8nU8mV26fofq8oG7Xpwzah/NrEpG5IpNXO8NR/5aUH2GtJjia93deRd5QyYqApToN249jL2VX61Fjwu5B8eVM9LpqFvypyMk62uYn+cy8/Q9EEj5USACu2G52+OAC9Lmd1zQR3y8pjfvO67yT4352HJfArb7AbeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763146421; c=relaxed/simple;
	bh=7527cBILDN2WaQ5BZNMPhTwXiEJ1VTXpTpreo+jr2BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8SVpOc387RF5qAfIk0wg7Za2R7zCpRshyp5eH5zCsYLmG7u+ekQ2e5jmwrms54j0wLec6GSK/8bGFhVIK4R0/Bk50fhe4fbEYRKfLKHF4w/R7o2V/dNfktQ04Zq/TWaCS+e+NtH7tHtSzhzluS6+SRgMBXjsJqgeAPDVpI5QPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jmc9OKGm; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jmc9OKGm"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37ba781a6c3so14426321fa.0
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 10:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763146418; x=1763751218; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7527cBILDN2WaQ5BZNMPhTwXiEJ1VTXpTpreo+jr2BA=;
        b=Jmc9OKGmucPXFhlLFh27pCFl0ly9m5eEiCv9bfyV3jZGeKFdSKrl9W8bt4IvvaNcSM
         rMJWRp8WFy/bfJYLcKwK5K0UXYxnyv+zZWDsYsCK1GqKWctJD22M26ORFJ4KIwaoJNS9
         3FN1d93KgzUzFnkEzBVopNfkQ3mE5CdcxrGs7FCSYG5ZwJinz9YLcr2+x5YSIW/+xQDE
         Ot4/AuNbNvvLov6TVQ9QW64J/hOLNdczWRi5KlhqT43YXsYGKfggsw2dwZUndLy3L1mr
         atLZjjNgl1Tw8GKTMVdVJ1sft28v45J4tnyd4uqar/BQHpUTcohKbsMh/yE7PgOGCciB
         3VHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763146418; x=1763751218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7527cBILDN2WaQ5BZNMPhTwXiEJ1VTXpTpreo+jr2BA=;
        b=I0BiAH0omGVeV/Jwjr4wD2mnnamI1qAUlllPqNKn1Seg+UcwJV+FpkxmpWwhuFuAZB
         j/AmoJY4F/6fpvpLcDpAkqaQyGe6gfbwHLpDJfJvVLKKtUuhlDbURzjwWlJ3SB85lTlR
         6HJhlcchwSsnFeJ4sxe+3NXOu8zhJ61YA33B887G3M8vc5ggyGdh/qgKSPry04EYpq3Y
         sDfoCb96w5YrPzld2AuFwQblVkAjUxsepTx7XC+1/MReWVlT0HyGGWCspwmqTgTX6p0e
         7i82meBPr0MGNPFTIKm8n+UAc5hnRGKItt0Tyh329WAA1VV0cClALBk+fb5paRh9ryMN
         fVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6KA8WZJ2udcLrh5dUMaAcFF1IG9sNnsGg/V44oAPL9JtcYViGoygh0GwzZ2YZVlTbtDXFZ1AHsDyJCRbE9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUTVv59Iq87ucW8jCoPRVGyqOq91kVnj5itUj4VdST/WXyZX4u
	Q1aGAX9SnhbVufMhaCEjF16UwLGOXwqeBNWVDzLr7A/DaFfy/tDnhim5fbdvLKlRFbvIPB8KTKe
	5dpOR2BXLYjmPSJ/ZTcBx4e6/b6zl7hk=
X-Gm-Gg: ASbGncv99iK3dnAqVEpQmrBIATtlR3UzhFGNQy3tLXSIwhweOD5dx4VEwlThcb4/JAO
	QoG5VVpsEPulRDlq2xu5Yy4ox/ww9MGhYjnKAv/zwey4pnITQgA+/hA/OHOIHJ/eLJxXpiM4zbT
	9KzVM9PAQu6OWPNcyIl7rKQqeF9g21V8w6PXd3NY852zncyvlp+Sm6b8U2Gpr1s5CdxySbO1eaY
	wwILOeSlP4YXHGO5iot7nc24QXaBCqrdqSFbThRufcCis9TO/suYSnwFeQeX3eil1S9tH/gIdoX
	BxQ5Bkv2ZoggC3k6OwOhzJiY3hIW0l+zEHqNkk/aL1ZaM7Kaclbuo/0mY52fgvTPzzr1irsRUPg
	vP3H6nQ==
X-Google-Smtp-Source: AGHT+IFuZHJU6SFj8M1CUMx/UFCmLll6FA1k9iygWNyaDb1I0TkN4qsTXvOvOWV/u5HGaDgi0r62EFAc5NBcHFnqf6Y=
X-Received: by 2002:a2e:9d83:0:b0:336:df0e:f4ac with SMTP id
 38308e7fff4ca-37babbe01bfmr7705701fa.25.1763146417838; Fri, 14 Nov 2025
 10:53:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110204119.18351-1-zhiw@nvidia.com> <20251110204119.18351-5-zhiw@nvidia.com>
 <aRcnd_nSflxnALQ9@google.com> <20251114192719.15a3c1a7.zhiw@nvidia.com>
In-Reply-To: <20251114192719.15a3c1a7.zhiw@nvidia.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 14 Nov 2025 13:53:01 -0500
X-Gm-Features: AWmQ_bm1palOnHQLGb9Lqe57hhSLXVTYRHZ9OFEe3OPIOZHz1Ym37zbLhMXSRQ0
Message-ID: <CAJ-ks9=8vm9Ggt2iJRr-QpTN+why5ZbNAzHYRmbDxiBXP4-b4Q@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 4/7] rust: io: factor common I/O helpers into Io trait
To: Zhi Wang <zhiw@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, dakr@kernel.org, 
	bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, markus.probst@posteo.de, helgaas@kernel.org, 
	cjia@nvidia.com, smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, acourbot@nvidia.com, 
	joelagnelf@nvidia.com, jhubbard@nvidia.com, zhiwang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 12:37=E2=80=AFPM Zhi Wang <zhiw@nvidia.com> wrote:
>
> On Fri, 14 Nov 2025 12:58:31 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Mon, Nov 10, 2025 at 10:41:16PM +0200, Zhi Wang wrote:
> > > The previous Io<SIZE> type combined both the generic I/O access
> > > helpers and MMIO implementation details in a single struct.
> > >
> > > To establish a cleaner layering between the I/O interface and its
> > > concrete backends, paving the way for supporting additional I/O
> > > mechanisms in the future, Io<SIZE> need to be factored.
> > >
> > > Factor the common helpers into a new Io trait, and move the
> > > MMIO-specific logic into a dedicated Mmio<SIZE> type implementing
> > > that trait. Rename the IoRaw to MmioRaw and update the bus MMIO
> > > implementations to use MmioRaw.
> > >
> > > No functional change intended.
> > >
> > > Cc: Alexandre Courbot <acourbot@nvidia.com>
> > > Cc: Bjorn Helgaas <helgaas@kernel.org>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: John Hubbard <jhubbard@nvidia.com>
> > > Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> >
> > This defines three traits:
> >
> > * Io
> > * IoInfallible: Io
> > * IoFallible: Io
> >
> > This particular split says that there are going to be cases where we
> > implement IoInfallible only, cases where we implement IoFallible only,
> > and maybe cases where we implement both.
> >
> > And the distiction between them is whether the bounds check is runtime
> > or compile-time.
> >
> > But this doesn't make much sense to me. Surely any Io resource that
> > can provide compile-time checked io can also provide runtime-checked
> > io, so maybe IoFallible should extend IoInfallible?
> >
> > And why are these separate traits at all? Why not support both
> > compile-time and runtime-checked IO always?
> >
>
> Hi Alice:
>
> Thanks for comments. I did have a version that PCI configuration space
> only have fallible accessors because I thought the device can be
> unplugged or a VF might fail its FLR and get unresponsive, so the driver
> may need to check the return all the time. And Danilo's comments were
> let's have the infallible accessors for PCI configuration space and add
> them later if some driver needs it. [1]
>
> I am open to either options. like have both or having infallibles first
> and fallibles later.

What about using an associated Err type? In the infallible case, it
would be `core::convert::Infallible`. It would be slightly more
ergonomic if associated type defaults were stable[0], though.

[0] https://github.com/rust-lang/rust/issues/29661
