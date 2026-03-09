Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C83A33E372;
	Mon,  9 Mar 2026 18:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079490; cv=none; b=Bh2JW7BHq0UnthHA3WiTQyahiy/r3im68XXXwiMMk23iNzehZ/PvcYBm4j+c73B33X4R05rs5++qJZv7Hn4ewGhHnmUsZoYZ1JSqFh7mLWhOwrf7eO4x7WsXaGy7M4iC3+LGOZQBcmnJAK1db0jXXgc9WQWjTQyZ8XrufQCcO8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079490; c=relaxed/simple;
	bh=YSpN3VHp0rfJbShJQGIZJOvpFOD4J9oSSnBKeF3Peyg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=My/zKEmeT9e9inCbfLmlV3rVh33/I/ejzamTiurbO1uTTq+UINaqKDFHYyX48Qq+zVf0WD763H2UlWJTkwK4tBp5VEwG4F6u4PL/KAj+BHHAtdvDEB1T1wweG59A8FDy4fd9Lvt2QA+8C5q1vHCfZxhio4UkWiCXorFrfBlA6ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f4Z6UhEP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4Z6UhEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F45C2BC87;
	Mon,  9 Mar 2026 18:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773079489;
	bh=YSpN3VHp0rfJbShJQGIZJOvpFOD4J9oSSnBKeF3Peyg=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=f4Z6UhEPCqvnCo2FJbb22veP3tSCvc0a+NwmUiITo89Rv229+X0ELLOZ9JyQCh7pV
	 Yovw3hKPMvmabuZN7/hxtKcuaw9qtlgXSMgijFQh3h8sm0N2Dc65XrU4u2xOs3ta25
	 MxRgRF6tZUVjCmIM9TQu47DDNKYKV5Io84njzQLw8VoyXYIM5XOPBZvFIepl8II3yz
	 sxujYFwl7CqjtwuiIEB+TFnDM5J60gXobCj2uo02bok54Bw5HyZ3yTkiQvckGwtMoZ
	 ROEmtBfSFeOvemtxPArOmIMzFqpjSOgCwObRrAGUwfx7yiAwuSROpGOcU7iYInKyLl
	 /9VZbfsNlSyrQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 19:04:43 +0100
Message-Id: <DGYG7XXC7MUW.11Z1EROJ8BUIM@kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH FOR REFERENCE v8 10/10] gpu: nova-core: use the kernel
 `register!` macro
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-10-424f80dd43bc@nvidia.com>
 <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
 <d85a3776-4a73-457d-8722-82d8dfc58591@nvidia.com>
In-Reply-To: <d85a3776-4a73-457d-8722-82d8dfc58591@nvidia.com>

On Mon Mar 9, 2026 at 6:34 PM CET, John Hubbard wrote:
> On 3/9/26 8:43 AM, Joel Fernandes wrote:
>>=20
>> On 3/9/2026 11:14 AM, Alexandre Courbot wrote:
>>>
>>> @@ -797,26 +792,30 @@ pub(crate) fn start(&self, bar: &Bar0) -> Result<=
()> {
>>>      /// Writes values to the mailbox registers if provided.
>>>      pub(crate) fn write_mailboxes(&self, bar: &Bar0, mbox0: Option<u32=
>, mbox1: Option<u32>) {
>>>          if let Some(mbox0) =3D mbox0 {
>>> -            regs::NV_PFALCON_FALCON_MAILBOX0::default()
>>> -                .set_value(mbox0)
>>> -                .write(bar, &E::ID);
>>> +            bar.write(
>>> +                WithBase::of::<E>(),
>>> +                regs::NV_PFALCON_FALCON_MAILBOX0::zeroed().with_value(=
mbox0),
>>> +            );
>>>          }
>>> =20
>>>          if let Some(mbox1) =3D mbox1 {
>>> -            regs::NV_PFALCON_FALCON_MAILBOX1::default()
>>> -                .set_value(mbox1)
>>> -                .write(bar, &E::ID);
>>> +            bar.write(
>>> +                WithBase::of::<E>(),
>>> +                regs::NV_PFALCON_FALCON_MAILBOX1::zeroed().with_value(=
mbox1),
>>> +            );
>>>          }
>>>      }
>>=20
>> TBH, this is quite a readability hit, the previous was much more readabl=
e IMHO.
>
> Yes, I think so too, except that "WithBase::of::<E>" makes a lot more
> sense on-screen, than "&E::ID". The latter just looks quite random,
> so this part is an improvement.
>
> Let's break down the remaining troublesome part a bit:
>
>     regs::NV_PFALCON_FALCON_MAILBOX1::zeroed().with_value(mbox1)
>
> * "regs::" can be omitted with a "use" statement, right?
>
> * ::zeroed() maybe should be the default behavior here, and then
>   it could also be omitted?
>
> * .with_value(mbox1) I'm sure this is necessary, but the construction
>   is unfortunately much less clear than .write(value)! Thoughts?

I think this could also just be

	bar.write(regs::NV_PFALCON_FALCON_MAILBOX1::of::<E>(), mbox1);

as we would want it for FIFO-like registers.
