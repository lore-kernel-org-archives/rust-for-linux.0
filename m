Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A54210F53
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Dec 2024 10:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828149; cv=none; b=A60az3jcCD660trbuYPhTGXVHBIMHtCUiUNqOetb99fbt8zjP2P+z1alVTqrh2sRBOswq7u4dnydtkarmhqjEZbOOuscuXWnlimCwQLvYZAeVEMyUvaXsrDNzUkME0/UtBpsiM6Jq++a7qVBo7cUoDZf0vr07EJp8FU7oCZfIuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828149; c=relaxed/simple;
	bh=dfXHaZApg1kAp8ngob6EwNugQ82l0HdC7g+rjbDHgZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqoIoLK9f+F54so1Gu3QPC60FC93x43NwEdR4QqwKD5whOJVNvyMO6/VX8glTenrheubK7rx6N3z73c1xraCgMU8BT80rd0ex2VRCpz+5mGB438uvkzAwNa64kiQ0K1j1s5fjaBsxmol49yFTLFBWa1SEPPVXonE0SoDH4FfRiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hc7oKrvn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hc7oKrvn"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-435005192d1so10820425e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Dec 2024 02:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733828146; x=1734432946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfXHaZApg1kAp8ngob6EwNugQ82l0HdC7g+rjbDHgZQ=;
        b=Hc7oKrvnBTfMx1RQpq+fCnTOZlg0i9ATA2CqHmUpeNxhieXk7wOk9Gw3Ri3lgcrH+s
         /1wVD0iUIYF9oBI7ILjegYUwaWkPvNYqvZFCQFrudjwxLo2botBNKIB+XBcwzjO8jnwl
         2L9YRaN1+t7i/l6kZQExjq8S5kMyxGn+GDnsrJmReDJpkaico/uZvHDhkfV+F0rlfJOI
         cKSHFp1QDOyYi1VSjIxzR0b536+8Gh5K9Ug8n3mwzid0pfsouG3yKTdBSQjywmlyOgt2
         eE+RyOoMy/4VBvQIsU9HlfDwobRVFBlhw3qeRoujWLWo9mECA2ygXCyAWtjDT0ht1AeW
         iULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733828146; x=1734432946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfXHaZApg1kAp8ngob6EwNugQ82l0HdC7g+rjbDHgZQ=;
        b=WEGzIw5icizuH0+cVnYkePM8+EycUsMxuu5F9gJ+Wt6DIYUY+uxAhIJvum1IahUmVL
         yl5pRrRN8B5o4ngj51x0crbLTRDyTr5WXaREhUwDq/pbUy0peEWUItnwGjnwK0hQ4X/7
         rE4DX58pQKVyzGw1GZHReFvYOGG8N+5EXeBzNAXmJ+99xCDuohZu0mEGbEVwlLFWT2BI
         2d2zY2TDEx1k03CcqlZC6f0ado88RvL8gk2rryfiruMIwyyKxJP/TFky8o4Nk0rvEuPp
         Ny2besOUgFk7LQ2/PjJ5qIGxF618X7V4ByYCsJTXVFA4XpfD9EtdiR48JBZY/EHN2Eum
         gLYA==
X-Forwarded-Encrypted: i=1; AJvYcCVEukFgHxXrPamWwFRpNYbzDoExy0srXNU75VbdNUJhJAgbYb8QMPz9b3/7K04j93UliKXziC7woNnhUYPikg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4JWKHKmeoIiu5lkRPVBgJ96oVOxq1Lhefue4Dm3LAXoKV3dig
	YaNA1Djj615oV8sr100Bt+qIPp7+YaoaP8/dr2ngRRtFhTg1YP61RiOOO3LIqeguV0g5UaenCRp
	ahhSLwNAYn77m06bNDVnepV8U+NZvCwypErsx
X-Gm-Gg: ASbGncvBPck2ytQoee0QsDyhwLNIqMSipIM4+sku2UPmHPqSfO3fn1ijtF+CAmNbmvP
	EpQRXok0+YdzPPCRMXVc70UOsTlVYWwMcf3u/7IoMiYN7DPI5X/wFJqCFSpx7Qbn8pQ==
X-Google-Smtp-Source: AGHT+IG0Y9INJmMgnj5Aq1qmzA2XI8kCQB+a+xINu5oEbG4VnKvTmmuaC9cO2DZywjG71233iorWGqYcrsutxnOfz+M=
X-Received: by 2002:a5d:64c6:0:b0:386:3213:5b9b with SMTP id
 ffacd0b85a97d-38632136068mr10993724f8f.43.1733828145989; Tue, 10 Dec 2024
 02:55:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205141533.111830-1-dakr@kernel.org> <20241205141533.111830-9-dakr@kernel.org>
 <CAH5fLgh6qgQ=SBn17biSRbqO8pNtSEq=5fDY3iuGzbuf2Aqjeg@mail.gmail.com> <Z1bKA5efDYxd8sTC@pollux.localdomain>
In-Reply-To: <Z1bKA5efDYxd8sTC@pollux.localdomain>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Dec 2024 11:55:33 +0100
Message-ID: <CAH5fLgixvBWSf-3WDRj=Mxtn4ArQLqdKqMF0aSxyC6xVNPfTFQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] rust: pci: add basic PCI device / driver abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	tmgross@umich.edu, a.hindborg@samsung.com, airlied@gmail.com, 
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org, 
	daniel.almeida@collabora.com, saravanak@google.com, dirk.behme@de.bosch.com, 
	j@jannau.net, fabien.parent@linaro.org, chrisi.schrefl@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 11:44=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Fri, Dec 06, 2024 at 03:01:18PM +0100, Alice Ryhl wrote:
> > On Thu, Dec 5, 2024 at 3:16=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> > >
> > > Implement the basic PCI abstractions required to write a basic PCI
> > > driver. This includes the following data structures:
> > >
> > > The `pci::Driver` trait represents the interface to the driver and
> > > provides `pci::Driver::probe` for the driver to implement.
> > >
> > > The `pci::Device` abstraction represents a `struct pci_dev` and provi=
des
> > > abstractions for common functions, such as `pci::Device::set_master`.
> > >
> > > In order to provide the PCI specific parts to a generic
> > > `driver::Registration` the `driver::RegistrationOps` trait is impleme=
nted
> > > by `pci::Adapter`.
> > >
> > > `pci::DeviceId` implements PCI device IDs based on the generic
> > > `device_id::RawDevceId` abstraction.
> > >
> > > Co-developed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >
> > > +/// The PCI device representation.
> > > +///
> > > +/// A PCI device is based on an always reference counted `device:Dev=
ice` instance. Cloning a PCI
> > > +/// device, hence, also increments the base device' reference count.
> > > +#[derive(Clone)]
> > > +pub struct Device(ARef<device::Device>);
> >
> > It seems more natural for this to be a wrapper around
> > `Opaque<bindings::pci_dev>`. Then you can have both &Device and
> > ARef<Device> depending on whether you want to hold a refcount or not.
>
> Yeah, but then every bus device has to re-implement the refcount dance we
> already have in `device::Device` for the underlying base `struct device`.
>
> I forgot to mention this in my previous reply to Boqun, but we even docum=
ented
> it this way in `device::Device` [1].
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/rust/kernel/device.rs#n28

We could perhaps write a derive macro for AlwaysRefCounted that
delegates to the inner type? That way, we can have the best of both
worlds.

Alice
