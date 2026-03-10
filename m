Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F230AD00;
	Tue, 10 Mar 2026 16:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773160499; cv=none; b=QNgy1dGyuCmbG4RraxYz4JlS0UtOCECWHEgNjF2hB6BaRXXImOmAXy4dNOBu65U9YEuVkL6UzgUsFeCQRmmdryNIEXWFyshyx7IpPFVZb58FhmbVPY9BnMLl1gSz6oF7S9u4CFLZNqmlFgXxkCroeung9iak+8mOciJ1dnYQI5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773160499; c=relaxed/simple;
	bh=yCuUK+ophe5GEAM3KX/PkfggmxPTdFkTeolpCuDaeVc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=oycvWvgi1qZkJpMjJPEiwmLsdlHlMwhX7gr1CXDJSGPFXeKe5tfzkG1QdfTsMOw8UL9ebaeEEBEYKEqHk2/0Z9qsFZfsbD/oqHN4KN4olwc/xClM/gYTL5xO27G8zUgzBaCF6/5CMTS6+CloaQLD5MB8/soMV+pafKEW/pL8qRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4FiaucW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4FiaucW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50048C19423;
	Tue, 10 Mar 2026 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773160499;
	bh=yCuUK+ophe5GEAM3KX/PkfggmxPTdFkTeolpCuDaeVc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=J4FiaucWSNUZEeQc++npq5RWuF53HqSM5Q/dGOBb8hXd7MHRKEEIfwgXCc3gwvGb+
	 DjS6cGzf2mwq04FstmeuMaEB0QgDPnEJ94v+FSeQxnbkgn39hExYeEZ3j6DpUiQfZ7
	 kmJq9VpHo9IH/N8kn374oSuInyK08Yul4NffNQAu2CA7IsJHFSIh+4d+fyTfYoZphV
	 RQwnkmQcBr5Ya458VBIDQWRqMcgoMthXO8jxuKJsVCOAQnT6ojBxqyLGizMNmaRIlw
	 JK7RiefJaZxjBQqkr0GbiCt9OHIwo/aKmB+hB0v3+RcTuuttwR8uNJJsq9XLm0tkYd
	 NyG+2S6CFFFGA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 17:34:53 +0100
Message-Id: <DGZ8XPCCUDQ5.14RUPZWK8L509@kernel.org>
Subject: Re: [PATCH v8 07/10] rust: io: introduce `IntoIoVal` trait and
 single-argument `write_val`
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-7-424f80dd43bc@nvidia.com>
In-Reply-To: <20260310-register-v8-7-424f80dd43bc@nvidia.com>

On Mon Mar 9, 2026 at 4:14 PM CET, Alexandre Courbot wrote:
> +    /// Generic infallible write of value bearing its location, with com=
pile-time bounds check.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Tuples carrying a location and a value can be used with this met=
hod:
> +    ///
> +    /// ```no_run
> +    /// use kernel::io::{Io, Mmio};
> +    ///
> +    /// fn do_writes(io: &Mmio) {
> +    ///     // 32-bit write of value `1` at address `0x10`.
> +    ///     io.write_val((0x10, 1u32));
> +    /// }
> +    /// ```
> +    #[inline(always)]
> +    fn write_val<T, L, V>(&self, value: V)

Still not super satisfied with the name write_val() plus I have some more
considerations, sorry. :)

Let's look at this:

	let reg =3D bar.read(regs::NV_PMC_BOOT_0);

	// Pass around, do some modifications, etc.

	bar.write_val(reg);

In this case read() returns an object that encodes the absolute location an=
d
value, i.e. read() pairs with write_val(), which is a bit odd.

In this example:

	let reg =3D bar.read(regs::NV_PFALCON_FALCON_RM::of::<E>());

	// Pass around, do some modifications, etc.

	bar.write(WithBase::of::<E>(), reg);

read() pairs with write(), since the object returned by read() does only en=
code
a relative location, so we have to supply the base location through the fir=
st
argument of write().

Well, technically it also pairs with write_val(), as we could also pass thi=
s as
tuple to write_val().

	bar.write_val((WithBase::of::<E>(), reg));

However, my point is that this is a bit inconsistent and I think a user wou=
ld
expect something more symmetric.

For instance, let's say write() would become the single argument one, then
read() could return an impl of IntoIoVal, so we would have

	let reg =3D bar.read(regs::NV_PMC_BOOT_0);
	bar.write(reg);

	let reg =3D bar.read(regs::NV_PFALCON_FALCON_RM::of::<E>());
	bar.write(reg);

and additionally we can have

	let val =3D bar.read_val(regs::NV_PFALCON_FALCON_RM::of::<E>());
	bar.write_val(WithBase::of::<E>(), val);

The same goes for

	let val =3D bar.read_val(regs::NV_PMC_BOOT_0);
	bar.write_val(regs::NV_PMC_BOOT_0, val);

which for complex values does not achieve anything, but makes sense for the=
 FIFO
register use-case, as val could also be a primitive, e.g. u32.

With a dynamic base, and a single field we could just do the following to
support such primitives:

	let val =3D bar.read_val(regs::NV_PFALCON_FALCON_RM::of::<E>());
	bar.write_val(regs::NV_PFALCON_FALCON_RM::of::<E>(), val);

I think adding this symmetry should be trivial, as most of this already com=
piles
with the current code.

Also, let's not get into a discussion whether we name on or the other write=
()
vs.  write_foo(). I just turned it around as I think with the specific name
write_val() it makes more sense this way around.

But I'm perfectly happy either way as long as we find descriptive names tha=
t
actually make sense.

Unfortunately, I can't really think of a good name for write_val() with its
current semantics. If we flip it around as in my examples above, the _val()
prefix seems fine. Maybe write_reg() and read_reg()?

> +    where
> +        L: IoLoc<T>,
> +        V: IntoIoVal<T, L>,
> +        Self: IoKnownSize + IoCapable<L::IoType>,
> +    {
> +        let (location, value) =3D value.into_io_val();
> +
> +        self.write(location, value)
> +    }
