Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF101306D26;
	Wed, 11 Mar 2026 13:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235519; cv=none; b=Cvz91kYXz87GsYQW5rac0wgLivuBSwsEn9pwyG3Kw/mJXa5mmkn5up0yz+9Y/8mJL+2sWAVbZ0YVJesgOh9hfO3tWoAD2SvsIjnyGiQge685vgMh76K/zfgh7RPxNBC8OLhSYqwwFJp+6aPQ6qkVzc3vKuyL8C8llav2Py33w/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235519; c=relaxed/simple;
	bh=o9iNn7auwjSkCVMzlijorFCMcEpTisNZTW5ZKKM68hM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=mu64/5EPVkkyTt4smyC9+NhtqgUcjj4fVnys2Bldbs8Oo2sFpJP9El5+CMEOoLI44pguQf4cOQ6XO+jtgGiHhquA10aPWoLs4xgekEArJlnbndwLX3lPQgHLnd74fCsX24R25TqsPlgOgloXqW29gSK6rBmyvmrWpKjAGundMq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0uGvePY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0uGvePY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5007C4CEF7;
	Wed, 11 Mar 2026 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773235519;
	bh=o9iNn7auwjSkCVMzlijorFCMcEpTisNZTW5ZKKM68hM=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=M0uGvePYxRHKKSAN/c3141oMWvr0pVCny8AhuyFhZcGKrnkQBHhXg2bgShnRVlcbp
	 yWnwlqUACW3Ali3dQTw+0VaLUd7p/RVlsRUd5i9Mphzibi1jCNhaZ7gf8vDb68DVk2
	 73CXF9gRJeOQmggOjTSHC2UIqnvlNuwr1UNr3+I2p0VrsMV6O+SDcC/Ge4HU441cg2
	 tmTfbpcT+YJSA4gpbJXciRihwceA8cjE+/Jw6M3mfgNJUc5u/FssgndYIR4DCcls0e
	 2B4pVemWcJrZhAMCCdK6rEBrk0vWoM32JGxFCde2i6p7DM/KLiYa9UkKbKfMhyzDho
	 FxnTXZvcYZryg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 14:25:13 +0100
Message-Id: <DGZZJ18RP1N4.3OMOHZU9WEML6@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v8 07/10] rust: io: introduce `IntoIoVal` trait and
 single-argument `write_val`
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-7-424f80dd43bc@nvidia.com>
 <DGZ8XPCCUDQ5.14RUPZWK8L509@kernel.org>
 <DGZGK7BW0J65.2T447EQK6I0HV@garyguo.net>
In-Reply-To: <DGZGK7BW0J65.2T447EQK6I0HV@garyguo.net>

On Tue Mar 10, 2026 at 11:33 PM CET, Gary Guo wrote:
> On Tue Mar 10, 2026 at 4:34 PM GMT, Danilo Krummrich wrote:
>> On Mon Mar 9, 2026 at 4:14 PM CET, Alexandre Courbot wrote:
>>> +    /// Generic infallible write of value bearing its location, with c=
ompile-time bounds check.
>>> +    ///
>>> +    /// # Examples
>>> +    ///
>>> +    /// Tuples carrying a location and a value can be used with this m=
ethod:
>>> +    ///
>>> +    /// ```no_run
>>> +    /// use kernel::io::{Io, Mmio};
>>> +    ///
>>> +    /// fn do_writes(io: &Mmio) {
>>> +    ///     // 32-bit write of value `1` at address `0x10`.
>>> +    ///     io.write_val((0x10, 1u32));
>>> +    /// }
>>> +    /// ```
>>> +    #[inline(always)]
>>> +    fn write_val<T, L, V>(&self, value: V)
>>
>> Still not super satisfied with the name write_val() plus I have some mor=
e
>> considerations, sorry. :)
>>
>> Let's look at this:
>>
>> 	let reg =3D bar.read(regs::NV_PMC_BOOT_0);
>>
>> 	// Pass around, do some modifications, etc.
>>
>> 	bar.write_val(reg);
>>
>> In this case read() returns an object that encodes the absolute location=
 and
>> value, i.e. read() pairs with write_val(), which is a bit odd.
>
> I mean, it also pairs with `bar.write(regs::NV_PMC_BOOT_0, reg)`, so it's=
 not

s/also pairs with/also works with/

> totally odd. We just need to teach that "write_val" infers the register l=
ocation
> from value.
>
>>
>> In this example:
>>
>> 	let reg =3D bar.read(regs::NV_PFALCON_FALCON_RM::of::<E>());
>>
>> 	// Pass around, do some modifications, etc.
>>
>> 	bar.write(WithBase::of::<E>(), reg);
>>
>> read() pairs with write(), since the object returned by read() does only=
 encode
>> a relative location, so we have to supply the base location through the =
first
>> argument of write().
>>
>> Well, technically it also pairs with write_val(), as we could also pass =
this as
>> tuple to write_val().
>>
>> 	bar.write_val((WithBase::of::<E>(), reg));
>>
>> However, my point is that this is a bit inconsistent and I think a user =
would
>> expect something more symmetric.
>>
>> For instance, let's say write() would become the single argument one, th=
en
>> read() could return an impl of IntoIoVal, so we would have
>>
>> 	let reg =3D bar.read(regs::NV_PMC_BOOT_0);
>> 	bar.write(reg);
>>
>> 	let reg =3D bar.read(regs::NV_PFALCON_FALCON_RM::of::<E>());
>> 	bar.write(reg);
>
> How would you modify the value then? `reg` becomes a combined pair with b=
oth
> location and value, and we would start need to use a closure to mutate in=
ner
> values again, which in my opinion is bad.

IIUC, the return value could be a generic tuple struct with <L: IoLoc<T>, V=
:
IntoIoVal<T, L>> that dereferences to V?

I.e. the current write_val() already allows this:

	bar.write_val((WithBase::of::<E>(), reg))

so, a corresponding read_val() - both write_val() and read_val() should rea=
lly
have different names - could return the same thing, just as a generic type =
that
dereferences to self.1.

With this you could do

	let reg =3D bar.read_reg(regs::NV_PFALCON_FALCON_RM::of::<E>());

	reg.modify();

	bar.write_reg(reg);

without repeating the of::<E>() part while

	let val =3D regs::NV_PFALCON_FALCON_RM::zeroed();

	// Set a couple of fields.

	bar.write(WithBase::of::<E>(), val);

is still possible.

> This would again become the `IoWrite` design of the last iteration which =
is the
> part that I disliked most.
>
>>
>> and additionally we can have
>>
>> 	let val =3D bar.read_val(regs::NV_PFALCON_FALCON_RM::of::<E>());
>> 	bar.write_val(WithBase::of::<E>(), val);
>>
>> The same goes for
>>
>> 	let val =3D bar.read_val(regs::NV_PMC_BOOT_0);
>> 	bar.write_val(regs::NV_PMC_BOOT_0, val);
>>
>> which for complex values does not achieve anything, but makes sense for =
the FIFO
>> register use-case, as val could also be a primitive, e.g. u32.
>>
>> With a dynamic base, and a single field we could just do the following t=
o
>> support such primitives:
>>
>> 	let val =3D bar.read_val(regs::NV_PFALCON_FALCON_RM::of::<E>());
>> 	bar.write_val(regs::NV_PFALCON_FALCON_RM::of::<E>(), val);
>>
>> I think adding this symmetry should be trivial, as most of this already =
compiles
>> with the current code.
>>
>> Also, let's not get into a discussion whether we name on or the other wr=
ite()
>> vs.  write_foo(). I just turned it around as I think with the specific n=
ame
>> write_val() it makes more sense this way around.
>
> To me flipping this around is the odd one. If this is flipped around then=
 this
> should be named `write_at`, but then it becomes odd as it is the dual of =
`read`
> and we won't have `read_at`.

That's why I said I only flipped it because write_val() is an odd name for =
what
it does currently. Please also note the below.

>> But I'm perfectly happy either way as long as we find descriptive names =
that
>> actually make sense.
>>
>> Unfortunately, I can't really think of a good name for write_val() with =
its
>> current semantics. If we flip it around as in my examples above, the _va=
l()
>> prefix seems fine. Maybe write_reg() and read_reg()?
>>
>>> +    where
>>> +        L: IoLoc<T>,
>>> +        V: IntoIoVal<T, L>,
>>> +        Self: IoKnownSize + IoCapable<L::IoType>,
>>> +    {
>>> +        let (location, value) =3D value.into_io_val();
>>> +
>>> +        self.write(location, value)
>>> +    }

