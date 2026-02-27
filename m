Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D413D5222;
	Fri, 27 Feb 2026 19:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772220229; cv=none; b=t3FkcN2H8LwOlh2+esfShnMhV/m2QR7+dCaZ/0u4YJBVhPXjAey1s6Ohha20S1xvPTJ8yN2l9h4SfunmAx1AUJnNR38EjxSNwfynVjsvwE4MEeHNzgC6MbIZvZh1APjIRimx8u5PXjnC2eoB9Ldlbnr0FwuA+dfUaQABrMzulNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772220229; c=relaxed/simple;
	bh=8j5ZKcQ4d5zl2A4GAuq6a49HEq794Ux9UP/o3AbBX64=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=SM9fWJQhChGuA2BD9OQqlxCc6GYkJd4KWEgMuiwyH2Az882/czF6LlRh/eAcAxv9Eu/a+YtXzXBtahhfCvRlxu9lqT5goVGbzBtgcZpyKsPFS0dTNfWBThW0NyjhVMmGHfd2XQArhLnaeVcXRrEm8RN+9Sxnr9iD1NjX/CRb9ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=il60quBt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="il60quBt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80D2C19421;
	Fri, 27 Feb 2026 19:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772220229;
	bh=8j5ZKcQ4d5zl2A4GAuq6a49HEq794Ux9UP/o3AbBX64=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=il60quBt0k5z0njs7VdUz5V5hMWK7lIJBsShQ6bx2hf+k+PgWrRpxY7QAycdrOhCm
	 FaXWh6yxNBLqj0creAnHJLZtrnrIiexY39ooIQtqtjMffLXnF7DTwDB6iFhtNt3o58
	 KHgV4qH/G2ytzdoc5FmOYRDb5ATAL/GfKeWkXhOGOC01O0ycvk6LVvpJZk9grhz9Pe
	 +1z6gUWri18J3twQf7xJAla7uMzrybfAp7fvQXdKXe7O9Ra1SImjmGpKkxT6ybPV8H
	 dyfg1VQeU9xsU4t+h/S8DWAM649clCmwcwaoKlFXFG9iXN3VbOQ2m9PNHNadiAqidd
	 JenVB1gbWnw7w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 20:23:44 +0100
Message-Id: <DGPZMZKAQ2TC.RA0BF64C639M@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 2/2] rust: workqueue: add creation of workqueues
Cc: "Tejun Heo" <tj@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Benno Lossin" <lossin@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-2-87de133f7849@google.com>
 <DGPUOSG5I4GM.1N5AWMP5ZFY4M@kernel.org> <aaHq9VpaVN4_hchW@google.com>
In-Reply-To: <aaHq9VpaVN4_hchW@google.com>

On Fri Feb 27, 2026 at 8:05 PM CET, Alice Ryhl wrote:
> On Fri, Feb 27, 2026 at 04:30:59PM +0100, Danilo Krummrich wrote:
>> On Fri Feb 27, 2026 at 3:53 PM CET, Alice Ryhl wrote:
>> > +    /// Set the maximum number of active cpus.
>> > +    ///
>> > +    /// If not set, a reasonable default value is used. The maximum v=
alue is `WQ_MAX_ACTIVE`.
>>=20
>> Should we just mention the default value?
>
> I can mention the constant name, but I'd like to avoid mentioning a
> value that might change.

Yes, that's what I meant.

>> > +    #[inline]
>> > +    pub fn max_active(mut self, max_active: u32) -> Builder {
>> > +        self.max_active =3D i32::try_from(max_active).unwrap_or(i32::=
MAX);
>>=20
>> The workqueue code prints a warning for max_active >  WQ_MAX_ACTIVE. May=
be use
>> debug_assert()?
>
> What's wrong with just making use of the C-side warning?

IIRC, we have the same pattern in other Rust code that we use debug_assert(=
)
when a value got clamped, e.g. in udelay().

>> It's also a bit unfortunate that alloc_ordered_workqueue() becomes
>> .max_active(1).
>>=20
>> At the same time having a separate ordered() method competes with max_ac=
tive().
>>=20
>> Mybe a type state, i.e. Builder<Ordered> that doesn't have max_active()?
>
> Sorry I'm a bit confused by this. Why does an ordered() compete with
> max_active()?

Because you could get an inconsistent state with __WQ_ORDERED and
max_active > 1.

It also conflicts with sysfs() I think [1].

[1] https://elixir.bootlin.com/linux/v6.19.3/source/kernel/workqueue.c#L741=
7
