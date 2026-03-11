Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6696282F33;
	Wed, 11 Mar 2026 14:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240996; cv=none; b=mOsXUYQn0OcwVserDB2xQTS628ZgZKwvhv2lXG1aUAoO52RgV3RMOTHI934xGDgT9uFnJ0njTk59lxTRYdDNT8aq9d7bOceMcwya6IJBVcHpuEOW7Px+0nfE7BPQAQFGBMwLsReIVpVSpd1MsH/LHYVA+xaMAxzi4oIOqCNm+t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240996; c=relaxed/simple;
	bh=0E6E9heeE0DbEcXro7whaww+nvSSOzj2Qv1miL4lGhg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=OE/EfnFkJRYVLRkYvuq6u1pAZs1uG0yQNq9A7s15EbfANYAkqlo+EjrOB7kLhPtEDf03zOEA99LUBt97pXjeYN09V47WKP02XoyqYJfB1+vhVmiLOpurYyFIjdfa+OVATlO682igT+rYDnhY7KVCqkFcFMxFk7cLnEDn1LugBc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tygz4haD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tygz4haD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D68C4CEF7;
	Wed, 11 Mar 2026 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773240996;
	bh=0E6E9heeE0DbEcXro7whaww+nvSSOzj2Qv1miL4lGhg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=tygz4haDZ+Len66BpYPsttLL6vMuRIeVmwoCNbtWdFaeGWyiJBndh40iDTR1Ia+JD
	 x47u+dNEolbtUIXgResSUDxvzITRzd9KD8xV3XlVlxRCk3jumynwMKttGY2co4or8c
	 ZPerOs19p1Yr0kiPHGKeSMz+nxDcokViKkJ6sIy0wfAYSZ/L8thaXa5coALgAvTqXp
	 hxSWdAtcIomiOpeyoW16pOZqDFqsL8xDX34FoBmkW6e+dl9svcjzw73JRmZYzppI2i
	 32sISQizOYS8SBHyg3Dr2798fcNUPY5VIBSw+cpV5CKSoOjg+SI7+MjHfz91En0G8m
	 uc3zKP+99xqFg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 15:56:30 +0100
Message-Id: <DH01GX7X7LSY.1N6WXIPLDCSTX@kernel.org>
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
 <DGZ8XPCCUDQ5.14RUPZWK8L509@kernel.org>
 <DGZZLNFLSJ4E.2P42FMI1XT47W@nvidia.com>
In-Reply-To: <DGZZLNFLSJ4E.2P42FMI1XT47W@nvidia.com>

On Wed Mar 11, 2026 at 2:28 PM CET, Alexandre Courbot wrote:
> The fact is, there is a symmetry between `read` and `write`:
>
> - `read` takes a location and returns a value,
> - `write` takes a location and a value.

This is not entirely true.

read() takes an absolute location and returns something that encodes the va=
lue
and a relative location, where for fixed registers the relative location is
equivalent to an absolute location.

write() works with both an absolute location and something that encodes the
value and a relative location, or a base location and something that encode=
s the
value and a relative location.

	// `reg` encodes the value and an absolute location.
	let reg =3D bar.read(regs::NV_PMC_BOOT_0);

	// `reg` encodes the value and a relative location.
	let reg =3D bar.read(regs::NV_PFALCON_FALCON_RM::of::<E>());

	// First argument is an absolute location, second argument is a type
	// that encodes a value and a relative location.
	bar.write(regs::NV_PFALCON_FALCON_RM::of::<E>(), reg);

	// First argument is a base location that infers the relative location
	// from `reg`.
	bar.write(WithBase::of::<E>(), reg);

And yes, I am aware that the above wording around the difference between
regs::NV_PFALCON_FALCON_RM::of::<E>() and WithBase::of::<E>() is at least a=
 bit
vague technically, but my point is about how this appears to users.

In any case, the fact that you can write WithBase::of::<E>() as a location
argument in the first place proves that `reg` is not *only* a value.

	fn write<T, L>(&self, location: L, value: T)
	where
	    L: IoLoc<T>,
	    Self: IoKnownSize + IoCapable<L::IoType>,

Which is the reason why L: IoLoc<T>, i.e. the relative location is on T, no=
t on
L.

So, what you could say is

  - read() takes an absolute location and returns something that encodes a =
value
    and relative location

  - write() takes a base location (or absolute location) and something that
    encodes a value and relative location

But then there is the case with fixed registers that simply do not have a b=
ase,
but write() still asks for a base (or absolute) location.

> `write_val` is really nothing but a convenience shortcut that has
> technically no strong reason to exist. As Gary pointed out, the
> counterpart of
>
>     let reg =3D bar.read(regs::NV_PMC_BOOT_0);
>
> is
>
>     bar.write(regs::NV_PMC_BOOT_0, reg);

I do not agree for the reasons mentioned above.

In this case read() returns (location + value), while write() asks for loca=
tion
*and* (location + value), i.e. there is no base location for fixed register=
s.

> ... and we introduced `write_val` for those cases where the value
> in itself provides its location, as `NV_PMC_BOOT_0` is redundant. But
> the above statement could also be written:
>
>     bar.write((), reg);

This makes more sense, as one could argue that a fixed register still requi=
res a
base location, which is just always zero, but why would we bother users wit=
h
this implementation detail?

Is this really less confusing than an additional bar.write_reg(reg) that ju=
st
works with any register?

> which is exactly the same length as the `write_val` equivalent - it's
> just that you need to remember that `()` can be used in this case. But
> if you can remember that your register type can be used with
> `write_val`, then why not this? This actually makes me doubt that
> `write_val` is needed at all, and if we get rid of it, then we have a
> symmetric API.

Still not symmetric, and I also don't think we will have a lot of fun expla=
ining
people why they have to call it as bar.write((), reg). :(

OOC, how would you explain it when the question is raised without arguing w=
ith
implementation details?

> We were so focused on this single issue for the last few revisions that
> the single-argument write variant sounded like the only way to handle
> this properly, but the `()` use proposed by Gary actually fulfills the
> same role and doesn't introduce more burden when you think of it.
>
> So why not try without `write_val` at first? We can always add it later
> if we feel the need (and the same applies to a `(location, value)`
> symmetric read/write API).

If you really think it's the best solution, I'm fine picking it up this way=
 for
now, but to me it still sounds like we have no solution for a very simple c=
ase
that does not at least raise an eyebrow.

> And most importantly, that way we also don't have to worry about its
> name. :)
