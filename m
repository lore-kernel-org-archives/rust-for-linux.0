Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D967C3B2FD5;
	Thu, 12 Mar 2026 15:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330855; cv=none; b=hfqUH5RrCvkEitITPh5W/lk+SxIwQ0BBbjutnRQTNk5Efs30hW53x40/l4XsqG3segPy2iPu8MDPDQxxzMn69b7lHaNhVJHykcyPTOqs0QyZ7kI+pFdw8KBWf6xcKkHk3CDLxSGt+KHRzwe1vBPOKhG0v/qCExhtNovFifDlrS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330855; c=relaxed/simple;
	bh=YJ6PeadscocZMcQzSsPWRpnphKVFNBQNksT5oxhRwvo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=cpTkvLRaPjqBP7LVgEmPUc6zDMny0Ylxq/lS2sJoIt1YOz/0Wpd9hBO4w8qB8LfIOOvDjT/0p0NskIfiDlRDw5Rv0Z8YCCcPpo5yzSoLrfPAY5PGJPKVr0Ba3YtVYAD1+v2qn2MzyX/iD1P7F4ZknmwQHzo5BfS8UX6rxNWHQWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7U+TiCU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7U+TiCU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4C6C4CEF7;
	Thu, 12 Mar 2026 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773330855;
	bh=YJ6PeadscocZMcQzSsPWRpnphKVFNBQNksT5oxhRwvo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=u7U+TiCUkxxF8/yNSp7WK+hYz5NEdzj2qVrm8z3z3tQv7ltgAhuIIJUz8hVr1nV2U
	 OsHMiqrUMs+7oKtOV4GUqqLJ8fjfnNSbiupJD/xHBJ0R4k1MVPR+Tt1QEV18RpeSBM
	 RBEs45jUHT6y7NC8fLNysW94Y2xVFexDvrY9EVc1sdqzodyfRLgRx3aC6Upq/WDWlp
	 uqAfSWqIZzZNicfc7wrnKykIbMpdQYYLvGO931sO5GUFkoxbsHmCOGgWx4HejW2NKe
	 p31O2/Yyi9bscSBioC2NmQ1zD7SnBaikJForYVWFlYOS4aQXhYqdSmDW9hsROdjwVq
	 mn/P0xJxOp/XQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 16:54:09 +0100
Message-Id: <DH0XBLXZD81K.22SWIZ1ZAOW1@kernel.org>
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
 <DH01GX7X7LSY.1N6WXIPLDCSTX@kernel.org>
 <DH0UR584E7YD.1A41R0UEVJK1D@nvidia.com>
In-Reply-To: <DH0UR584E7YD.1A41R0UEVJK1D@nvidia.com>

On Thu Mar 12, 2026 at 2:53 PM CET, Alexandre Courbot wrote:
> On Wed Mar 11, 2026 at 11:56 PM JST, Danilo Krummrich wrote:
>> And yes, I am aware that the above wording around the difference between
>> regs::NV_PFALCON_FALCON_RM::of::<E>() and WithBase::of::<E>() is at leas=
t a bit
>> vague technically, but my point is about how this appears to users.
>>
>> In any case, the fact that you can write WithBase::of::<E>() as a locati=
on
>> argument in the first place proves that `reg` is not *only* a value.
>
> But that is only true in the case of registers.

Agree with this and all the above. But - and this is why I wrote "my point =
is
about how this appears to users" - users use this API with registers only a=
nd
except for the FIFO use-case, which is not implemented yet, it is obvious t=
o
users that part of the location comes from the value type.

I'm not saying that this is a problem. Actually, quite the opposite.

When I proposed the register!() macro, one of the problems I wanted to solv=
e was
that people can't read from a certain location and accidentally treat it as
something semantically different.

Or in other words, if you want to read register A, you shouldn't be able to
accidentally read from B and treat it as A.

> The I/O module can and does cover things other than registers - currently
> primitive values, but we might want to extend that in future (don't ask m=
e
> with what, but I don't see a reason to close the possibility :)).

Neither do I. :)

But, as mentioned above, we should be aware that people notice that for
registers part of the location information comes from the value type (excep=
t for
the FIFO case of course) and registers are the thing that people deal with =
most.

Other use-cases such as I/O memcpy, etc. will be accssible through other AP=
Is,
such as IoSlice, or more generally, IoView.

Having that said, my point is that considering the use-cases it also makes =
sense
to think about how this API will be perceived.

And from this context something like bar.write((), reg) looks pretty odd.

>> Is this really less confusing than an additional bar.write_reg(reg) that=
 just
>> works with any register?
>
> I don't think it is less or more confusing, in the end they are really
> equivalent.

From your point of view being an expert on the I/O and register!()
implementation details, but please also consider the above.

Also, look at the Tyr patches for instance, they exclusively use write_val(=
).

> What I would like to avoid is having register-specific functions spill
> into the `io` module. I mean, I am not strictly opposed to it if we
> reach the conclusion that it is more convenient to users - in this case
> we could add an `impl Io` block in `register.rs` and add a `write_reg`
> method (and possibly a `read` variant returning the full position
> information?). But if we can just use the same 2 methods everywhere,
> that's better IMHO.

Just leave it in the io module I'd say, register access is probably the mos=
t
essential part of I/O, I think there is no need to factor it out.

>>> which is exactly the same length as the `write_val` equivalent - it's
>>> just that you need to remember that `()` can be used in this case. But
>>> if you can remember that your register type can be used with
>>> `write_val`, then why not this? This actually makes me doubt that
>>> `write_val` is needed at all, and if we get rid of it, then we have a
>>> symmetric API.
>>
>> Still not symmetric, and I also don't think we will have a lot of fun ex=
plaining
>> people why they have to call it as bar.write((), reg). :(
>>
>> OOC, how would you explain it when the question is raised without arguin=
g with
>> implementation details?
>
> This seems to indicate that instead of a `Io::write_val` method in `io.rs=
`,
> we might need a `Io::write_reg` method in `register.rs` that is
> dedicated to writing unambiguous registers exclusively. How does that
> sound to you?

I don't see it adds any value to factor it out with an extention trait, ren=
ame
to write_reg() seems fine.

Additionally, I'd like to leave it open for the future to add read_reg() me=
thod
returning a generic (loc, val) tuple dereferencing to the value in case we =
see a
repetition of the following pattern.

	let reg =3D bar.read(regs::NV_PFALCON_FALCON_RM::of::<E>());

	// modify reg

	bar.write(WithBase::of::<E>(), reg)

The reason is the same as mentioned above. In most cases drivers don't want=
 to
switch the base location between a read and a write, i.e. write the value f=
rom A
to B.

The most common case is to read from A and write back to A. For instance,
talking to the Tyr folks, they told me that for the array registers they wi=
ll
have, they will never have the case that they want to write a register valu=
e
from A to B.

So, I still think it would be good to provide an option for drivers to prev=
ent
any mistakes in the first place.

Now, obviously this would require that we also provide register accessors t=
hat
take a mutable reference for this to work, but that doesn't seem like a big
deal.

I also don't think we have to do this now, but I'd like to have something l=
ike
this in the future.

For now s/write_val/write_reg/ and we should be good to go. :)
