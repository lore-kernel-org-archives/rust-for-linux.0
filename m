Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7B93D6CC2;
	Wed,  4 Mar 2026 19:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772653106; cv=none; b=YNJ9F5e6kfVpfXiLbBnel8pYZE8Ds6wP/DM4N6szK+7/5lQnG/g6t7OStvxdsRJFiAb44VTtMOxPS0PkVLf8PCTUgwgnAW8NmZzoD67i3DptT6KVfmH00Fozpzy88CLDYM4XP4VXeqH2cVOkS3ga9ALttbqh/ZzmG8Q8P5ctArI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772653106; c=relaxed/simple;
	bh=o1Q/NfCRF5EqaqGJsKwZoUG9+WodHsQ2iHSLma9k5Bo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=jKbyHY4TZ0voLAnr5PbQcRyRSaeavWSPpVo9vXTq7VfOGnGSR9x6DthOfXbDASZm/GSLZ/2pC2JfgaSvOzoxgVNqbEJ7Tt76mjZav7SEJZt3W3CZO23ZF9DW5Gwrmh+Ujhgs39plxSpBSS08c9hsRc7HMwV5KeTCmBrW0kfJslQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLjYOdYH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLjYOdYH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7DDC4CEF7;
	Wed,  4 Mar 2026 19:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772653106;
	bh=o1Q/NfCRF5EqaqGJsKwZoUG9+WodHsQ2iHSLma9k5Bo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=XLjYOdYHRKdVAWrHHkCx+2iCDwVQN7JYWQkcH2yykeeiSqFSwBnp915AjQsdpm3tD
	 fUNtwfj2HYzlYrjLCpC9Tsf8jmO8jTmBntrbk0+QISmOz5+YIQHG+XJzfZo9hPmF3x
	 BE1TPiusXGAgh8qLKJFJ2nUlpr+dAIsIsUrgkHWfz0IZIwOvxp9IioapyDFpLRsIWe
	 ipV2OcnACOsra12DqUI0AJ/ufgT7h8Q95U8J+m3GKutoNrh6KBx5JJ8cbSelYauXEf
	 Ht1pqkiShTTTJ1jNGJlHOySGpT1x4nUkLMhjbgCajzy9b7taI/UVMBt1o9uZGNJMSW
	 FlmCawGd3F+8A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 20:38:20 +0100
Message-Id: <DGU92W2W71JI.HBIFK6L78F9C@kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
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
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
 <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
 <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
In-Reply-To: <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>

On Wed Mar 4, 2026 at 7:58 PM CET, Gary Guo wrote:
> On Wed Mar 4, 2026 at 6:39 PM GMT, Gary Guo wrote:
>> On Wed Mar 4, 2026 at 4:18 PM GMT, Danilo Krummrich wrote:
>>> On Tue Mar 3, 2026 at 3:55 PM CET, Alexandre Courbot wrote:
>>>> So, to get a better idea of these two options I have converted this
>>>> patchset to use the 2-arguments `write_with` method. Here is the
>>>> difference between the two - it is particularly interesting to see how
>>>> nova-core changes:
>>>>
>>>> https://github.com/Gnurou/linux/compare/register_1arg..Gnurou:linux:re=
gister_2args
>>>
>>> This looks good to me, but the fact that this turns out nicely has noth=
ing to do
>>> with write() now taking two arguments. I.e. there is no reason why we c=
ouldn't
>>> have the exact same write_with() method together with the single argume=
nt
>>> write() method.
>>>
>>> The contention point for me with a two arguments write() method still r=
emains
>>> that the arguments are redundant.
>>>
>>> I.e. you first have the location in form of an object instance of a ZST=
 (which
>>> in the end is just a "trick" to pass in the type itself) and then we ha=
ve the
>>> object that actually represents the entire register, describing both th=
e
>>> location *and* the value.
>>>
>>> So, let's say a driver creates a register object with a custom construc=
tor
>>>
>>> 	let reset =3D regs::MyReg::reset();
>>>
>>> then the two argument approach would be
>>>
>>> 	(1) bar.write(regs::MyReg, regs::MyReg::reset());
>>>
>>> whereas the single argument approach would just be
>>>
>>> 	(2) bar.write(regs::MyReg::reset());
>>
>> That's only for bit field registers that has unique types. I still belie=
ve types
>> of registers should not be tightly coupled with name of registeres.
>>
>> Allowing a value of register to be directly used for `write` is also con=
fusing
>> if a value is not created immediately before written to.
>>
>>>
>>> So, if I would have to write (1), I'd probably be tempted to implement =
a reset()
>>> function that takes the bar as argument to hide this, i.e.
>>>
>>> 	regs::MyReg::reset(bar);
>>>
>>> I also can't agree with the argument that the notation of write(loc, va=
l) - or
>>> write(val, loc) as the C side does it - is common and we should stick t=
o it.
>>>
>>> This notation is only common because it is necessary when operating on
>>> primitives or when the two representing types are discrete.
>>>
>>> But this isn't the case here, a register object is already distinct in =
terms of
>>> its location and value.
>>
>> I see no reason why register values for different locations have to be d=
istinct
>> in terms of value types.

That's not what the register!() macro currently does, a register type alway=
s has
a unique location, or is an array register, etc. In any case a register typ=
e is
assoiciated with a location.

If the proposal is to disconnect location and register type entirely, that =
would
be a change to the current design.

If we'd have this clear separation, I would obviously not object to this ch=
ange,
but currently it's just unnecessary redundancy.

>> Even Nova today has quite a few registers that are just bitfields of a s=
ingle
>> field that spans all bits. I think many simple driver would probably wan=
t to
>> just operate on primitives for these.
>
> I shall add that I think the fact that the registers that are *not* field=
s still
> gain their dedicated type in Nova driver is due to the limitation of the =
initial
> `register!` API design that *requires* unique types due to the `value.op(=
io)`
> design as opposed to `io.op(value)`.
>
> I think even these ones should eventually be replaced by just primitives
> eventually. I see no benefit of
>
>     bar.write(REG.init(|x| x.with_value(value)))
>
> as opposed to just
>
>     bar.write(REG, value)

Well, you don't have to make that we have to use init() with a closure for =
such
cases. We can also do something like:

	bar.write(Reg::from(value))
