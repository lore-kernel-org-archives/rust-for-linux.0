Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DA8389DE6;
	Thu, 26 Mar 2026 10:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522408; cv=none; b=Q4Do+won5Z0Bz/ny/QdG2B4XvMTfl/84CakuzGimjlBkoTLhiKxf5MQfbnEEkURP3ZszMq+sKynvuLFCVQ1PRjPbTy63ehY9NBBO3tEF1LvLer6fUbXYRkB5MZwo/z+Oytw9rOL7/3vcr9IjC5eX01TnqN2avyfvuMkYrEjHnJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522408; c=relaxed/simple;
	bh=HmnOYKKNajNEREUNJifW8aXSM5GSliTpVXpt3pH60Ko=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=F4QQPvho3EUb25n+420YficT1wiNlmUiDq84wG6yrJ9fGTlyMdIYxEygzQVm49sVhiXhKA1lDxeaBtPwELs5kdsvscan4GvzetWiAg4BAimX5GmIgNoXfNfVDrlmy3410FEBNHgInfYMYR3FoIO0KLTWZMzSkQEziv30+xKLkFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heqKrjKj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heqKrjKj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A880C19423;
	Thu, 26 Mar 2026 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774522407;
	bh=HmnOYKKNajNEREUNJifW8aXSM5GSliTpVXpt3pH60Ko=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=heqKrjKjTUjvIgfyEo0SOqP8E5CGBnpJ/NB98yBWGVuCJuJ/MxprMTV4IjCWnHbld
	 VT6XdTgGGAqfYNmN6rt8K/MjnGl4hMcVm6xIKVZQnvTcE9jxxMvvhc5Wr3u9uCNx4d
	 q3xYxfGT2rn2pP2bIMB8fOWYB7pK4Dzi9AO2O9TwCWRoo/qyOatG5yS7f9PLQX1zkz
	 Jx0OBfacIRa/NDMqFrtsUVwhG/eYG5IBh0+PyTWPYJ7Slt8SH++ix/o0zt+fkggEJd
	 pX5J98iPPFl69LrA5MZq0xjrFGFoof+leIT0holPUL3Uf4nN9a9C7C6iT08LqCTFpk
	 4E2DPbUYpt2Jw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 11:53:23 +0100
Message-Id: <DHCNOY4GFV7B.3VGGZNT3382L0@kernel.org>
Subject: Re: [PATCH] rust/alloc: add Vec::into_boxed_slice()
Cc: <rust-for-linux@vger.kernel.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@kernel.org>, "Liam
 R. Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki"
 <urezki@gmail.com>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>
To: "David Rheinsberg" <david@readahead.eu>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260326095621.846840-1-david@readahead.eu>
In-Reply-To: <20260326095621.846840-1-david@readahead.eu>

On Thu Mar 26, 2026 at 10:56 AM CET, David Rheinsberg wrote:
> Add `Vec::into_boxed_slice()` similar to
> `std::vec::Vec::into_boxed_slice()` [1].

Do you have a user for this?

> +    /// Converts the vector into [`Box<[T], A>`].
> +    ///
> +    /// Excess capacity is retained in the allocation, but lost until th=
e box
> +    /// is dropped.
> +    pub fn into_boxed_slice(self) -> Box<[T], A> {
> +        let (buf, len, _cap) =3D self.into_raw_parts();
> +        let slice =3D ptr::slice_from_raw_parts_mut(buf, len);
> +
> +        // SAFETY:
> +        // - `slice` has been allocated with `A`
> +        // - `slice` is suitably aligned
> +        // - `slice` has at least a length of `len`
> +        // - all elements within `slice` are initialized values of `T`
> +        // - `len` does not exceed `isize::MAX`
> +        unsafe { Box::from_raw(slice) }

Box::from_raw() is missing the safety requirement that the allocation made =
with
A must have been made for Layout::for_value::<T>(), as this is what we assu=
me in
the destructor.

For this function we should call A::realloc() and document that
into_boxed_slice() may shrink the backing allocation.

Additionally, can you please add a doc-test?

Thanks,
Danilo
