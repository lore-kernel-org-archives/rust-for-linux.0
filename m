Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D181155389
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 21:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726263090; cv=none; b=FDc6BliQclTNdbhzy9eU/czB8aV5fCnkBt8EYOgGeueBSssegy5Mv0rTje4z1A3Q5lhZpihNCgsUhVh1LOZyaBxTBrphF/+Q4zRIkKf1lmv52GfDMXIejjslzxyjjicSxMW0nbJN9GkBD+mWHaMdtVSUAEO3ga5QQcd0ydKEB6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726263090; c=relaxed/simple;
	bh=yE2O/TCbVUEJl++iI9v7kbdxzMVfIk8qbzcEy9LW+vY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MU1xGVoAY5fWfvkPTApa0E54TuN8GuzEeI+MEZsePspUww2a+1zJYNEzg7PizSsnHOD9jb/kAy7P0MrS/RNbqKoWUtezLQbonfLRZa28h1TmgMTrWKPpK7tGtWk/F8Ft7AvsqRu+cGpRN5qwTUiVzp+QJU7BLh+xOzpTshCy3Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=elaSGnOG; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="elaSGnOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1726263085; x=1726522285;
	bh=3AgZzUjAfdgxp+molM3zEwtPisdoS/53XcyUIZB27p8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=elaSGnOGkMKN8piUfR+kqd6xOqLp2fSd3auQd3XZuof35Kymxx3hOzpOM9u1J12RW
	 /PmVFEvzSeq2hqOiEVhmmWEDdzAghf+qpWpr1WWojnbzFrhHUoKRcA9KB81CJs/wZT
	 MffqCfH3neCPoNQBpr14673pyQcPxwcFgVCPUKXTazEcY8aHTXtbvJzWafW+ouK1Y1
	 DyupCR20Oe5sKSV1bPj43Opx5njmqSPLvI2mGNuIYOkPZn/zr3fAbhQWj4F0/0Iq3e
	 5d/6rwfCPz+C9uTRkciCj3LC1A51Kn4Cfc3L6XBq9enc0jLGGtGzgutY+1rT4zwCzo
	 pt5xbVwUheYLg==
Date: Fri, 13 Sep 2024 21:31:20 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Greg KH <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/3] Untrusted data abstraction
Message-ID: <0bbec37d-2a4e-4a65-9592-c6d36fec87ac@proton.me>
In-Reply-To: <ZuSkAL8Ulmlx2Xty@phenom.ffwll.local>
References: <20240913112643.542914-1-benno.lossin@proton.me> <ZuSkAL8Ulmlx2Xty@phenom.ffwll.local>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 0b8f40119c76f3b4e83585f8c7fe8ba683731201
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13.09.24 22:43, Simona Vetter wrote:
> On Fri, Sep 13, 2024 at 11:26:54AM +0000, Benno Lossin wrote:
>> Enable marking certain data as untrusted. For example data coming from
>> userspace, hardware or any other external data source.
>>
>> This idea originates from a discussion with Greg at Kangrejos. As far as
>> I understand the rationale, it is to prevent accidentally reading
>> untrusted data and using it for *logic* within the kernel. For example
>> reading the length from the hardware and not validating that it isn't
>> too big. This is a big source for logic bugs that later turn into
>> vulnerabilities.
>>
>> The API introduced in this series is not a silver bullet, users are
>> still able to access the untrusted value (otherwise how would they be
>> able to validate it?). But it provides additional guardrails to remind
>> users that they ought to validate the value before using it. As already
>> stated, they can access the value directly, but to do that, they need to
>> explicitly call one of the `untrusted_*` functions signaling to
>> reviewers that they are reading untrusted data without validation.
>>
>> There are still some things to iron out on the Rust side:
>> - allow better handling of `Untrusted<T>`, for example allow comparing
>>   `Untrusted<[u8]>` for equality (we should do this via a trait
>>   extending `PartialEq`)
>> - rebase this on Gary's patch to enable arbitrary self types. This would
>>   allow me to remove one `untrusted_mut()` call in `inode.rs`. I would
>>   expose the `cap_len` function even if the underlying data is
>>   untrusted.
>> - get more feedback as to what `Untrusted` should make available
>>
>> In addition to adding the abstraction, I also provide very experimental
>> RFC patches using the API in tarfs by wedson. They are based on his
>> vfs-v2 branch [1] and I will not aim to upstream these patches. They sho=
uld
>> give you some idea as to how the API is intended to be used.
>>
>> Open to any suggestions and improvements!
>>
>> [1]: https://github.com/wedsonaf/linux/tree/vfs-v2
>=20
> I forgot to add: If we do this, we should really wrap Untrusted<> around
> all the copy_from_user wrappers we have in the uaccess module. That's one
> of the main entry points for untrusted garbage into the kernel we have,
> and it's already in upstream rust

Will do with the next version.

> There's even a very nice TOCTOU example bug in the docs which would becom=
e
> flat out impossible if we wrap everything in Untrusted.

Well you technically can still be very stupid and just call `validate()`
twice (I hope that this doesn't happen in practice, but you never
know...). But it's another big improvement.

> Also, while I drop some feature requests: I think it'd be very nice to
> have a macro or something to implement FromBytes and AsBytes automaticall=
y
> and savely for C structs from the bindings which only contain linux uapi
> safe types.

We would probably need some changes to bindgen. But I also think that
it's a good idea.

> And also better contain absolutely no padding, since that
> tends to be bugs on the C side too. But no idea whether rust can do that.

So padding bytes are not allowed for types implementing `AsBytes`. For
`FromBytes` they are.

---
Cheers,
Benno

