Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D32137F8C5;
	Wed,  4 Mar 2026 20:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772656642; cv=none; b=ms4PtNUHhGT5by65BvhXjAPyoOy3jDzz9sAYnK4sdEc3Mfe/asyHTC+48VaoNa4VoElf6cVtl2k1fFrXCejRaTgbpsCezmreWcBzVX+/hqlNZMd5EOE0wjuuAG89KsHdyOtnrg/W5smWycyTAr7RLsFfObGXNaSAvZ4ms1CT29g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772656642; c=relaxed/simple;
	bh=l0aatOlpg16vzuI3qLpEk/qQ/D1PUDErgCsWFNKpMR4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DXsNBa7DfrVKCXUhMQma7fBEnWoNo4cDlp0PlZZh/5e4wF82kxrxlwqyYM67r7j9a1G5jGtOEhLvKXKBr0ZeKp374Xk0X8Ci5Z67TUzMnn1USeF5qNYvmxcCHn45U+egb8K48ZHBJ5Ju6ft/bvxf4A/v68WOdFyxs5EkVvv15fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=io+tgc2M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="io+tgc2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D158DC4CEF7;
	Wed,  4 Mar 2026 20:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772656641;
	bh=l0aatOlpg16vzuI3qLpEk/qQ/D1PUDErgCsWFNKpMR4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=io+tgc2MWF4pk18c4k0/6fom5AoL72AVm0JROYDKZumj0Go7ntYUB3H175z9A5y7B
	 skgzqmgZIlnL/Nk5B+/QFwK9jCkh404lPwX+IvY7yMHW1djMVLY8PrpT7y7e6Q0UtE
	 tjDlhKuYiQEmn6vQpiRgM8W/VEU13j02cXsP8kU9uv8/m68p20H67eqpOXHwoBcLws
	 GTjSfpdXIzuzSJq5Ti/ppjG+zA+l2TS5Mr7z4Z18gTABTrdMM+WVKKAQBAvm+DZvBd
	 ZEaPBrN8KcK0N2NSmn7Zbh0hM99Onf0TOsGKXIelTGxmSxpXVEbOb3NHjC5Hh9ihdj
	 G0MwnDhvsqH1Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 21:37:16 +0100
Message-Id: <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
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
 <DGU92W2W71JI.HBIFK6L78F9C@kernel.org>
 <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>
In-Reply-To: <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>

On Wed Mar 4, 2026 at 8:48 PM CET, Gary Guo wrote:
> On Wed Mar 4, 2026 at 7:38 PM GMT, Danilo Krummrich wrote:
>> On Wed Mar 4, 2026 at 7:58 PM CET, Gary Guo wrote:
>>> On Wed Mar 4, 2026 at 6:39 PM GMT, Gary Guo wrote:
>>>> On Wed Mar 4, 2026 at 4:18 PM GMT, Danilo Krummrich wrote:
>>>>> On Tue Mar 3, 2026 at 3:55 PM CET, Alexandre Courbot wrote:
>>>>>> So, to get a better idea of these two options I have converted this
>>>>>> patchset to use the 2-arguments `write_with` method. Here is the
>>>>>> difference between the two - it is particularly interesting to see h=
ow
>>>>>> nova-core changes:
>>>>>>
>>>>>> https://github.com/Gnurou/linux/compare/register_1arg..Gnurou:linux:=
register_2args
>>>>>
>>>>> This looks good to me, but the fact that this turns out nicely has no=
thing to do
>>>>> with write() now taking two arguments. I.e. there is no reason why we=
 couldn't
>>>>> have the exact same write_with() method together with the single argu=
ment
>>>>> write() method.
>>>>>
>>>>> The contention point for me with a two arguments write() method still=
 remains
>>>>> that the arguments are redundant.
>>>>>
>>>>> I.e. you first have the location in form of an object instance of a Z=
ST (which
>>>>> in the end is just a "trick" to pass in the type itself) and then we =
have the
>>>>> object that actually represents the entire register, describing both =
the
>>>>> location *and* the value.
>>>>>
>>>>> So, let's say a driver creates a register object with a custom constr=
uctor
>>>>>
>>>>> 	let reset =3D regs::MyReg::reset();
>>>>>
>>>>> then the two argument approach would be
>>>>>
>>>>> 	(1) bar.write(regs::MyReg, regs::MyReg::reset());
>>>>>
>>>>> whereas the single argument approach would just be
>>>>>
>>>>> 	(2) bar.write(regs::MyReg::reset());
>>>>
>>>> That's only for bit field registers that has unique types. I still bel=
ieve types
>>>> of registers should not be tightly coupled with name of registeres.
>>>>
>>>> Allowing a value of register to be directly used for `write` is also c=
onfusing
>>>> if a value is not created immediately before written to.
>>>>
>>>>>
>>>>> So, if I would have to write (1), I'd probably be tempted to implemen=
t a reset()
>>>>> function that takes the bar as argument to hide this, i.e.
>>>>>
>>>>> 	regs::MyReg::reset(bar);
>>>>>
>>>>> I also can't agree with the argument that the notation of write(loc, =
val) - or
>>>>> write(val, loc) as the C side does it - is common and we should stick=
 to it.
>>>>>
>>>>> This notation is only common because it is necessary when operating o=
n
>>>>> primitives or when the two representing types are discrete.
>>>>>
>>>>> But this isn't the case here, a register object is already distinct i=
n terms of
>>>>> its location and value.
>>>>
>>>> I see no reason why register values for different locations have to be=
 distinct
>>>> in terms of value types.
>>
>> That's not what the register!() macro currently does, a register type al=
ways has
>> a unique location, or is an array register, etc. In any case a register =
type is
>> assoiciated with a location.
>>
>> If the proposal is to disconnect location and register type entirely, th=
at would
>> be a change to the current design.
>
> It's not what the macro do today, but I don't want to ask Alex to change =
it
> further before landing the series. I do think it's a worthy follow-up to =
add the
> ability to decouple the location and type. It's not incompatible with cur=
rent
> design anyway.

I'm not sure there are any relevant use-cases for this. Do you have real
examples that would not be represented with array registers?

Otherwise, I think this disconnect has no advantages. Actually, I think it =
may
even be the opposite, as it would allow for confusing the location.

>> If we'd have this clear separation, I would obviously not object to this=
 change,
>> but currently it's just unnecessary redundancy.
>>
>>>> Even Nova today has quite a few registers that are just bitfields of a=
 single
>>>> field that spans all bits. I think many simple driver would probably w=
ant to
>>>> just operate on primitives for these.
>>>
>>> I shall add that I think the fact that the registers that are *not* fie=
lds still
>>> gain their dedicated type in Nova driver is due to the limitation of th=
e initial
>>> `register!` API design that *requires* unique types due to the `value.o=
p(io)`
>>> design as opposed to `io.op(value)`.
>>>
>>> I think even these ones should eventually be replaced by just primitive=
s
>>> eventually. I see no benefit of
>>>
>>>     bar.write(REG.init(|x| x.with_value(value)))
>>>
>>> as opposed to just
>>>
>>>     bar.write(REG, value)
>>
>> Well, you don't have to make that we have to use init() with a closure f=
or such
>> cases. We can also do something like:
>>
>> 	bar.write(Reg::from(value))
>
> This won't work for the array case, right? For array you'd have
>
>     bar.write(ARRAY.try_at(idx).ok_or(EINVAL)?.set(Reg::from(value)))
>
> and now the register name is repeating twice rather than just
>
>     bar.write(ARRAY.try_at(idx).ok_or(EINVAL)?, value)

We should be able to just do

	bar.write(ARRAY.try_at(idx).ok_or(EINVAL)?.set(value.into()))
