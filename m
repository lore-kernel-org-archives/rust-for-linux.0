Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8824C1E3DCD;
	Sat, 14 Feb 2026 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771078659; cv=none; b=o/GF7qDYLLr7pIe125E6FeKT9MgU1GxKDcqmYImElyG91Et9/k494cYyTG01GYSkMSRjFVXVsc3UpBXIxzRjhTXUYQvXxhc5MTtSQvRgWtB75C7Aomy0/ReqNFRUTKsl6qf6I/VOA2MiCCs59LYuVzobSIOIy49ZTMo5s1XanWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771078659; c=relaxed/simple;
	bh=FxzwbsVBfsW/+x5X5ONQrRx9WQbErVb62f0Ev7ePIQE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=RHWBXp7CXJwJIIMBvtTGB9yTNGz1qlDebTxR3ULSDOns3J9H3buk3TTRP2Ami3/U8gcpiavttgDTnzcpUR/OWE9m7naEi/BcVTNpWNth+NNNikgeNcSzH2a3KtZcXy6DhZUhYCXahXPJ/NpHbJoi44erchWRsZtbOTotEjlqwZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQsL/AeE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQsL/AeE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EAEC16AAE;
	Sat, 14 Feb 2026 14:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771078659;
	bh=FxzwbsVBfsW/+x5X5ONQrRx9WQbErVb62f0Ev7ePIQE=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=HQsL/AeERE9qXkTMZaPeeiGp8ADS1dGPy5p6Mlll8HS86d3/CFd9CTeO91sNRoUOb
	 fiX+EPIYJurJSHeIuZf5xkSYbPIDu4KuOfwMpr87LMSN6bP69P8tvhqPB3/oHpfwwF
	 aMBggmWOcJQDLt7eflvcQBdx3uiBs5t9UNLX2N95/EaCw78zYAid/P99UH1gqFCuPa
	 JH1O/pZ9u2pjcshSVWf8aMMJ8rK7RRDFE2wPhXHnu9jSAlzQg+AL+VbMZu1deLibz/
	 dZSTreUPk5QHa8KruUGr2vGwsSHT5sBGOoE3NdIbMyQlTsi8DqRUGP1iA/V68ujqyX
	 Cfs203RqFYmog==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 15:17:34 +0100
Message-Id: <DGEQZHTOW6FC.2SWNBWY9XE3LD@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: alloc: allow different error types in
 `KBox::pin_slice`
Cc: "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Uladzislau
 Rezki" <urezki@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
References: <20260214-pin-slice-init-v1-1-0b174fbb1844@kernel.org>
In-Reply-To: <20260214-pin-slice-init-v1-1-0b174fbb1844@kernel.org>

On Sat Feb 14, 2026 at 2:28 PM CET, Andreas Hindborg wrote:
> Previously, `KBox::pin_slice` required the initializer error type to matc=
h
> the return error type via `E: From<AllocError>`. This prevented using
> infallible initializers like `new_mutex!` inside `pin_slice`, because
> `Infallible` does not implement `From<AllocError>`.
>
> Introduce a separate type parameter `E2` for the initializer error type a=
nd
> require `AllocError: Into<E>` and `E2: Into<E>` instead. This allows the
> initializer to return a different error type that can be converted into t=
he
> final error type, enabling use of infallible pin initializers in fallible
> allocation contexts.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

I assume you have a user? I.e. do you need this patch in another tree?

> @@ -333,24 +333,31 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box<T,=
 A>>, AllocError>
>      /// assert_eq!(s[3].d.lock().a, 20);
>      /// # Ok::<(), Error>(())
>      /// ```
> -    pub fn pin_slice<Func, Item, E>(
> +    pub fn pin_slice<Func, Item, E, E2>(
>          mut init: Func,
>          len: usize,
>          flags: Flags,
>      ) -> Result<Pin<Box<[T], A>>, E>
>      where
>          Func: FnMut(usize) -> Item,
> -        Item: PinInit<T, E>,
> -        E: From<AllocError>,

I think we should keep this bound and just add:

	E: From<E2>,

> +        Item: PinInit<T, E2>,
> +        AllocError: Into<E>,
> +        E2: Into<E>,
>      {
> -        let mut buffer =3D super::Vec::<T, A>::with_capacity(len, flags)=
?;
> +        let mut buffer =3D match super::Vec::<T, A>::with_capacity(len, =
flags) {
> +            Ok(buffer) =3D> buffer,
> +            Err(err) =3D> return Err(err.into()),
> +        };

This...

>          for i in 0..len {
>              let ptr =3D buffer.spare_capacity_mut().as_mut_ptr().cast();
>              // SAFETY:
>              // - `ptr` is a valid pointer to uninitialized memory.
>              // - `ptr` is not used if an error is returned.
>              // - `ptr` won't be moved until it is dropped, i.e. it is pi=
nned.
> -            unsafe { init(i).__pinned_init(ptr)? };
> +            match unsafe { init(i).__pinned_init(ptr) } {
> +                Ok(()) =3D> (),
> +                Err(err) =3D> return Err(err.into()),
> +            }

...and this match becomes unnecessary then.
