Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7626039183D;
	Wed,  4 Mar 2026 21:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772660327; cv=none; b=H1mahksxU24x2dk9HWjXjeIW1oad+mHe2dgZr5c7mkl9deaYk7cm0OPfM2GqvCIC5f6oqIw34N63JBFJIDPgCgxJukJSJA53waloTLh4H2SziCulqz+jnsIXOQoj17avni79wiPfJScEDmnsQc02mAUz84ccMljPop/s5O48HdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772660327; c=relaxed/simple;
	bh=PWejfH98M23YRxUVbkOTYD/C/sOLtdGCOjI6gGZ44YM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=cLBIOsyhh8dWcCVNPEIM1k6SV1f37yxDyn8WVtUO5d06tMsBl9n/XZvBA6TzkeQhUa61TBef7g4vUSZz8fowZxuAoFpFw7so9coKSh0Lh5fXSlV+7CGec5WJ6K5qkbivog0Szp8zYmS/1rQxYePTJ5DFa/pPpQy9xI2u9vUVRl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9ymyrWn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9ymyrWn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1A3C4CEF7;
	Wed,  4 Mar 2026 21:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772660327;
	bh=PWejfH98M23YRxUVbkOTYD/C/sOLtdGCOjI6gGZ44YM=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=P9ymyrWn+v9N3FschCYepxjTKmhq7szPpCMAKni68xEjAfSJmW0XD2rET7aOX7gug
	 QJOhNrvTzomBPtdQyU6oAsLaCkSbZvtzzIiVGAC4cRk+6uGO94awTihV8KghF25zcm
	 LvD1Q6h88cUewTBlcE/SYjSugZmGp4nn+CFzs1OfYmiL4Pl4jSDCoJEMXm2J+WAZBD
	 ZkK7YJwjK1b4iVQr5FRcbsYy9ZJodKR421IRNN5pKmX9iagzGKHK2FoE0knpgXZT5R
	 nfV/O2bgdWXLOEdRQY00wmwyRhjTN04KQ8pj3w46soLV5HbaczHwN2T/j7EjiBOb1D
	 gYPUa29f3BWpA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 22:38:41 +0100
Message-Id: <DGUBN1HP1F8I.2RZGSFCBO9FQS@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
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
 <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
 <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>
In-Reply-To: <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>

On Wed Mar 4, 2026 at 10:13 PM CET, Gary Guo wrote:
> On Wed Mar 4, 2026 at 8:37 PM GMT, Danilo Krummrich wrote:
>> On Wed Mar 4, 2026 at 8:48 PM CET, Gary Guo wrote:
>>> On Wed Mar 4, 2026 at 7:38 PM GMT, Danilo Krummrich wrote:
>>>> On Wed Mar 4, 2026 at 7:58 PM CET, Gary Guo wrote:
>>>>> On Wed Mar 4, 2026 at 6:39 PM GMT, Gary Guo wrote:
>>>>>> On Wed Mar 4, 2026 at 4:18 PM GMT, Danilo Krummrich wrote:
>>>>>>> On Tue Mar 3, 2026 at 3:55 PM CET, Alexandre Courbot wrote:
>>>>>>>> So, to get a better idea of these two options I have converted thi=
s
>>>>>>>> patchset to use the 2-arguments `write_with` method. Here is the
>>>>>>>> difference between the two - it is particularly interesting to see=
 how
>>>>>>>> nova-core changes:
>>>>>>>>
>>>>>>>> https://github.com/Gnurou/linux/compare/register_1arg..Gnurou:linu=
x:register_2args
>>>>>>>
>>>>>>> This looks good to me, but the fact that this turns out nicely has =
nothing to do
>>>>>>> with write() now taking two arguments. I.e. there is no reason why =
we couldn't
>>>>>>> have the exact same write_with() method together with the single ar=
gument
>>>>>>> write() method.
>>>>>>>
>>>>>>> The contention point for me with a two arguments write() method sti=
ll remains
>>>>>>> that the arguments are redundant.
>>>>>>>
>>>>>>> I.e. you first have the location in form of an object instance of a=
 ZST (which
>>>>>>> in the end is just a "trick" to pass in the type itself) and then w=
e have the
>>>>>>> object that actually represents the entire register, describing bot=
h the
>>>>>>> location *and* the value.
>>>>>>>
>>>>>>> So, let's say a driver creates a register object with a custom cons=
tructor
>>>>>>>
>>>>>>> 	let reset =3D regs::MyReg::reset();
>>>>>>>
>>>>>>> then the two argument approach would be
>>>>>>>
>>>>>>> 	(1) bar.write(regs::MyReg, regs::MyReg::reset());
>>>>>>>
>>>>>>> whereas the single argument approach would just be
>>>>>>>
>>>>>>> 	(2) bar.write(regs::MyReg::reset());
>>>>>>
>>>>>> That's only for bit field registers that has unique types. I still b=
elieve types
>>>>>> of registers should not be tightly coupled with name of registeres.
>>>>>>
>>>>>> Allowing a value of register to be directly used for `write` is also=
 confusing
>>>>>> if a value is not created immediately before written to.
>>>>>>
>>>>>>>
>>>>>>> So, if I would have to write (1), I'd probably be tempted to implem=
ent a reset()
>>>>>>> function that takes the bar as argument to hide this, i.e.
>>>>>>>
>>>>>>> 	regs::MyReg::reset(bar);
>>>>>>>
>>>>>>> I also can't agree with the argument that the notation of write(loc=
, val) - or
>>>>>>> write(val, loc) as the C side does it - is common and we should sti=
ck to it.
>>>>>>>
>>>>>>> This notation is only common because it is necessary when operating=
 on
>>>>>>> primitives or when the two representing types are discrete.
>>>>>>>
>>>>>>> But this isn't the case here, a register object is already distinct=
 in terms of
>>>>>>> its location and value.
>>>>>>
>>>>>> I see no reason why register values for different locations have to =
be distinct
>>>>>> in terms of value types.
>>>>
>>>> That's not what the register!() macro currently does, a register type =
always has
>>>> a unique location, or is an array register, etc. In any case a registe=
r type is
>>>> assoiciated with a location.
>>>>
>>>> If the proposal is to disconnect location and register type entirely, =
that would
>>>> be a change to the current design.
>>>
>>> It's not what the macro do today, but I don't want to ask Alex to chang=
e it
>>> further before landing the series. I do think it's a worthy follow-up t=
o add the
>>> ability to decouple the location and type. It's not incompatible with c=
urrent
>>> design anyway.
>>
>> I'm not sure there are any relevant use-cases for this. Do you have real
>> examples that would not be represented with array registers?
>
> Even for the cases where there's a PIO register, I think it's beneficial =
to just
> get a value without a type.
>
> I don't see why we want people to write
>
>     self.io.read(UART_RX).value()
>
> vs
>
>     self.io.read(UART_RX)
>
> or
>
>     self.io.write(UART_TX::from(byte))
>
> vs
>
>     self.io.write(UART_TX, byte)
>
> what benefit does additional type provide?

Well, for FIFO registers this is indeed better. However, my main concern wa=
s
this

	bar.write(regs::MyReg, regs::MyReg::foo())

for the reasons explained above.

As for FIFO registers, another option could be to leverage the raw accessor=
s and
make a location type dereferece to the offset, e.g.

	bar.write8(regs::TX_FIFO, byte)

The same goes for the array case of course.
