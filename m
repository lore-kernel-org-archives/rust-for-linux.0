Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E8A3D4137;
	Thu,  5 Feb 2026 12:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770296237; cv=none; b=SrgRfNOHhcVL0UBcEKoXvWN1SPPHLYcXwSnqW5ZDVOzWSD9G6qOw3ckS6mt1z8TK0Tae7NNLm3mlHjWuTghLhxOR+f83t8ehgnon7yIvMIgTxxK7YvC551B2Si3HsqVJH5BXrg4VEayC1kgjFgPdAzh3h5EvQj1iG+Wq/l8h62I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770296237; c=relaxed/simple;
	bh=ad3UUzoF7kT63rt6N1/6SqY6544pIqOC7JY63D75O9o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=WJ/E+OLRQOwRO3QA3TXT1vHMJUu/VPGJ4CRiBmD6OgE4Pa4LRIXQXPiAjawkPNSHEUAhsagJ0hV++tjrr4gppv+egIn7kHHS8Ok3A6X5BvIHtun+oBIVrJ8RbzQnwRPqBGZWFGg3uiA584DbGvvwRTZKdqPIS9XHHuhuIreg3K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Svi9uplu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Svi9uplu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF57AC4CEF7;
	Thu,  5 Feb 2026 12:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770296236;
	bh=ad3UUzoF7kT63rt6N1/6SqY6544pIqOC7JY63D75O9o=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Svi9uplumRKLHtk5fnRc4y0CfEzZIHdhiiUt/l7xJhu/BRMrPrM4iAvKODIYfjS5E
	 Ysdsipi32ViLUfRwroeovD1/KD+EoldWncCbOaWqGYeSLgG8EcceVfVISo2oeJfXgq
	 luHqw7nOPBShJYwPwfF7YaZyEhxs0DNEYzk45epi+ISs3etAPcLRsyuHVs5A2bGHXF
	 Rno5v5PsflbtbQODO50q4FFm3WbGLO0V2zhV1GyaWJD2TXQhVs3DW8EGTHBh8Gf0fd
	 XRgr2fwDl/iQJEL4efVKi9GTO90804Wc121MpLDbLYKew42tEw+OzHCQEag8qH6fdR
	 GQdz8vXx6TTbg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 13:57:09 +0100
Message-Id: <DG71N0HV7DQ8.35GWSCA3G4O8Y@kernel.org>
Subject: Re: [PATCH v2 2/4] rust: nvmem: Add an abstraction for nvmem
 providers
Cc: <rust-for-linux@vger.kernel.org>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Ard Biesheuvel" <ardb@kernel.org>, "Martin
 K. Petersen" <martin.petersen@oracle.com>, "Eric Biggers"
 <ebiggers@google.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Lyude Paul" <lyude@redhat.com>, "Asahi Lina" <lina+kernel@asahilina.net>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <officialTechflashYT@gmail.com>, "Ash Logan" <ash@heyquark.com>, "Roberto
 Van Eeden" <rw-r-r-0644@protonmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: "Link Mauve" <linkmauve@linkmauve.fr>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-3-linkmauve@linkmauve.fr>
 <DG6A3L2W1YC0.YOB6BUMGG38F@kernel.org> <aYSRoIvhx5FAygDe@luna>
In-Reply-To: <aYSRoIvhx5FAygDe@luna>

On Thu Feb 5, 2026 at 1:48 PM CET, Link Mauve wrote:
> On Wed, Feb 04, 2026 at 04:22:16PM +0100, Danilo Krummrich wrote:
>> On Wed Feb 4, 2026 at 5:04 AM CET, Link Mauve wrote:
>> > +impl Device {
>> > +    /// Register a managed nvmem provider on the given device.
>> > +    pub fn nvmem_register<T>(&self, mut config: NvmemConfig<T>, priv_=
: &T::Priv)
>> > +    where
>> > +        T: NvmemProvider + Default,
>> > +    {
>> > +        // FIXME: The last cast to mut indicates some unsoundness her=
e.
>> > +        config.inner.priv_ =3D core::ptr::from_ref(priv_).cast::<c_vo=
id>().cast_mut();
>> > +        config.inner.dev =3D self.as_raw();
>> > +        config.inner.reg_read =3D Some(NvmemConfig::<T>::reg_read);
>> > +        config.inner.reg_write =3D Some(NvmemConfig::<T>::reg_write);
>> > +        // SAFETY: Both self and config can=E2=80=99t be null here, a=
nd should have the correct type.
>> > +        unsafe { bindings::devm_nvmem_register(self.as_raw(), &config=
.inner) };
>> > +    }
>> > +}
>>=20
>> This should not be a method on the generic device type. Typically we use=
 a
>> Registration struct for this, i.e. this would become
>> nvmem::Registration::register().
>
> Should I also switch to the nvmem_register()/nvmem_unregister() API
> instead of the devm_nvmem_register() API, so that the unregister can
> happen in the Drop impl instead of being managed by the kernel?

No, ensuring unregistration when the bus device is unbound is the correct t=
hing
to do.

We typically support two patterns:

	impl Registration {
		fn new(dev: &Device<Bound>) -> Result<Devres<Registration>>;
		fn register(dev: &Device<Bound>) -> Result;
	}

Registration::new() still ensures unregistration when the bus device is unb=
ound,
but also allows you to unregister before that happens.

Registration::register() is eqivalent to devm_nvmem_register().

You don't have to implement both, you can just pick the one you need for yo=
ur
driver. I think in the case of nvmem you probably only every need register(=
).
