Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E7C16F295
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Jun 2024 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718963022; cv=none; b=ppitxXf4UcG7V8gDb2Ojc7LksZFUsPckKaORaTC4BBIUVY7lfHLcNlOpog5elwYjk6HMrYfF8By7HFt7wHNiBcYhdOWPFA2Cb9XHsUMbv6ydjikCOG+LJ7gz9O6NXMLpCKN/Kknwa13CVCgeCIpXKvXYfq+H9cz/1qM0CSQygT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718963022; c=relaxed/simple;
	bh=dOu7TKpD65Qn91FhP+3ezNvvdaK37n0H64MukY+aZBs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BThQROI8gIVha5KbAGIhMTv/iDNp8lhO13GO3QehQ87jnzmC1D6AqaFEeWPgXcvAfpWq8/yU1tydg3dhMfszU2CoPd/zsHORklxu+kmPwGBdTjpXTMlM/A2NTemYeDXIIEqUH10lxHILK6hNDIL4Eo7LDewh8Shq1XMf3JR/V9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OpW740uO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OpW740uO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718963019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOu7TKpD65Qn91FhP+3ezNvvdaK37n0H64MukY+aZBs=;
	b=OpW740uOPpYyvCTz2Q0IjwVxxvyOr6sNuIBxjznAmhDCJ/BTkbYydieWGW1m+kyZxOIzsD
	fkh7QALhV16Yn20rdwPynp1S92BhlwMUMCMB9dgUrXT5DGnbXIUB39Qe3I7Oz+aqiJsFw5
	a6VMBC8OMDoH80Cdmq4EzqshOUIQcBc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-QwD8xfjKMqOmx7bxKxhnWQ-1; Fri, 21 Jun 2024 05:43:38 -0400
X-MC-Unique: QwD8xfjKMqOmx7bxKxhnWQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-36333c6b9c7so290240f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Jun 2024 02:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718963017; x=1719567817;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dOu7TKpD65Qn91FhP+3ezNvvdaK37n0H64MukY+aZBs=;
        b=unJp/p5kC1NI616XubQNhgKbnwThbx5z+T4ULtm7DyH/I6/z1yzZ6AZ1/lfSxG3Fbw
         AHbjuaAglfkPeOyE5BrM2BrB7adhP5AUqJ2awjJ3abcGS6slTIl4Ar4ETnOtDuK/icT/
         Wfm/eO9mZHzQCOR3cRJN2gJTSPuVgsBPuw4bDJNvIRHwSVVsGCeSivawkgXuHC7okWAA
         4hXrKETkhPvajquNuGh+j01hfEel/QXwKXBBaxU+yJSa6WO+OM06vrZK9zeakdci2o5A
         y3TFb7DsEpuF5VrCiCohGhpE2VehFtySHcfSXDXkSa/t33ipUFdlXHLr4YI2oxRuScUT
         fc4A==
X-Forwarded-Encrypted: i=1; AJvYcCVZMesKlqWilZ+NRfQrzWDIOENGnguziWmPNB1aGL5DjCSKuFWYNP1EZEJJqJ9k1eS8S6VTVEELJ+LMT1ACUq1xh307zOr1gV9Dw9nZjGc=
X-Gm-Message-State: AOJu0Yw1/A8UH0pq193qKgDAFfVyBdcHrWpyyBJY2Gum976U/4/+WPyi
	RzSRjtlZzqDILxe2j8y1kKl0WB8+V2xZxxhRkM2qfwHKhXt1/KerlcX0obPmgeY7sytYAbmv9S9
	T3UySAE1ynm9grFMUeQwoJqyOmhumd0+95oXRDExg6aKnvYKxR5eEbVhkqmoU8A2L
X-Received: by 2002:a05:600c:1c8b:b0:423:146b:36f8 with SMTP id 5b1f17b1804b1-42478e41349mr46698975e9.4.1718963017060;
        Fri, 21 Jun 2024 02:43:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZy81YPJtm/RjjImN0bEGbtNnfnO0rKFhNc/jBgxq3caLP+I9REwIpO9tZ1V0UMa7wvG04DA==
X-Received: by 2002:a05:600c:1c8b:b0:423:146b:36f8 with SMTP id 5b1f17b1804b1-42478e41349mr46698725e9.4.1718963016540;
        Fri, 21 Jun 2024 02:43:36 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817a99fbsm19971705e9.16.2024.06.21.02.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 02:43:36 -0700 (PDT)
Message-ID: <a43dc0512194042d762bf5bb5f1396d41fef5bce.camel@redhat.com>
Subject: Re: [PATCH v2 07/10] rust: add `io::Io` base type
From: Philipp Stanner <pstanner@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@redhat.com>
Cc: rafael@kernel.org, bhelgaas@google.com, ojeda@kernel.org, 
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net,  bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com,  aliceryhl@google.com, airlied@gmail.com,
 fujita.tomonori@gmail.com,  lina@asahilina.net, ajanulgu@redhat.com,
 lyude@redhat.com, robh@kernel.org,  daniel.almeida@collabora.com,
 rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Date: Fri, 21 Jun 2024 11:43:34 +0200
In-Reply-To: <2024062040-wannabe-composer-91bc@gregkh>
References: <20240618234025.15036-1-dakr@redhat.com>
	 <20240618234025.15036-8-dakr@redhat.com>
	 <2024062040-wannabe-composer-91bc@gregkh>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-06-20 at 16:53 +0200, Greg KH wrote:
> On Wed, Jun 19, 2024 at 01:39:53AM +0200, Danilo Krummrich wrote:
> > I/O memory is typically either mapped through direct calls to
> > ioremap()
> > or subsystem / bus specific ones such as pci_iomap().
> >=20
> > Even though subsystem / bus specific functions to map I/O memory
> > are
> > based on ioremap() / iounmap() it is not desirable to re-implement
> > them
> > in Rust.
>=20
> Why not?

Because you'd then up reimplementing all that logic that the C code
already provides. In the worst case that could lead to you effectively
reimplemting the subsystem instead of wrapping it. And that's obviously
uncool because you'd then have two of them (besides, the community in
general rightfully pushes back against reimplementing stuff; see the
attempts to provide redundant Rust drivers in the past).

The C code already takes care of figuring out region ranges and all
that, and it's battle hardened.

The main point of Rust is to make things safer; so if that can be
achieved without rewrite, as is the case with the presented container
solution, that's the way to go.

>=20
> > Instead, implement a base type for I/O mapped memory, which
> > generically
> > provides the corresponding accessors, such as `Io::readb` or
> > `Io:try_readb`.
>=20
> It provides a subset of the existing accessors, one you might want to
> trim down for now, see below...
>=20
> > +/* io.h */
> > +u8 rust_helper_readb(const volatile void __iomem *addr)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return readb(addr);
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper_readb);
>=20
> <snip>
>=20
> You provide wrappers for a subset of what io.h provides, why that
> specific subset?
>=20
> Why not just add what you need, when you need it?=C2=A0 I doubt you need
> all
> of these, and odds are you will need more.
>=20

That was written by me as a first play set to test. Nova itself
currently reads only 8 byte from a PCI BAR, so we could indeed drop
everything but readq() for now and add things subsequently later, as
you suggest.



> > +u32 rust_helper_readl_relaxed(const volatile void __iomem *addr)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return readl_relaxed(addr);
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper_readl_relaxed);
>=20
> I know everyone complains about wrapper functions around inline
> functions, so I'll just say it again, this is horrid.=C2=A0 And it's goin=
g
> to
> hurt performance, so any rust code people write is not on a level
> playing field here.
>=20
> Your call, but ick...

Well, can anyone think of another way to do it?

>=20
> > +#ifdef CONFIG_64BIT
> > +u64 rust_helper_readq_relaxed(const volatile void __iomem *addr)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return readq_relaxed(addr);
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper_readq_relaxed);
> > +#endif
>=20
> Rust works on 32bit targets in the kernel now?

Ahm, afaik not. That's some relic. Let's address that with your subset
comment from above.

>=20
> > +macro_rules! define_read {
> > +=C2=A0=C2=A0=C2=A0 ($(#[$attr:meta])* $name:ident, $try_name:ident,
> > $type_name:ty) =3D> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /// Read IO data from a giv=
en offset known at compile
> > time.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /// Bound checks are perfor=
med on compile time, hence if
> > the offset is not known at compile
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /// time, the build will fa=
il.
>=20
> offsets aren't know at compile time for many implementations, as it
> could be a dynamically allocated memory range.=C2=A0 How is this going to
> work for that?=C2=A0 Heck, how does this work for DT-defined memory range=
s
> today?

The macro below will take care of those where it's only knowable at
runtime I think.

Rust has this feature (called "const generic") that can be used for
APIs where ranges which are known at compile time, so the compiler can
check all the parameters at that point. That has been judged to be
positive because errors with the range handling become visible before
the kernel runs and because it gives some performance advantages.


P.

>=20
> thanks,
>=20
> greg k-h
>=20

