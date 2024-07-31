Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C2381AD
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 18:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722451308; cv=none; b=DXYnjCCVRtxw2iegncWc1f0zV3ZKWeY7c3LNyrUTGK+BJOtZymcXrSdrFUjFWVdibuuaNgBn6R7b8dArT+hGUAlSaovJNSCNuzDja4avtxVBhufJSOzMZb9MJDbQmoBE1Fsqytq5EdqWZKenRddKPho3yZz0DeWhLgHRqLxM7S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722451308; c=relaxed/simple;
	bh=lJilw/AoVHYdYfRUwSwCjA7exwUKyo868FVxs6MJao8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TR5BbqivnZVoNWJbT7KD/9mUBI7RT7XCRwdWv8QvoZ7L8suFeujhqRl3GLsQj07Q9gOMmkWFwMJX7kNS+tUlxPdFzTJqOnz+/KAlXvkSk3piwtvRa4L3Xdem9FbpBvfq1es4rIinlbVTU9Kb56vpI7NPmcCQ5cuEu97QPrpwyKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=aRv7cnXn; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="aRv7cnXn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722451303; x=1722710503;
	bh=j42rHfXMMIaRB2UIZ2G8pZNOKdDpMtFUjLRZK4Fc7YQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aRv7cnXnwMx+MADwFzWx7EPDrs0XS7Fo4WyNQN8t4Ejrnf+wGiV7WO82K4ss8euJi
	 c15z5eWV6fRWrwdT0ufY+Uajqkp57T7Knue3H4uoowr8gEAtBGAyDQ5sAGDS6VRkQT
	 ZcSCACYQVDyzSkgw4CvQsR6kGajgm15GLygS6zPNlv1sb/6R3beyoJ/cYFvRQ6XkeG
	 uW6YCoQav8e1OTEzpAkTMKcD63g6GK8l7FJW0x6obz+BkNoYLY4lx0GRtGKp40kO8i
	 9gL4LX0uiflpNGVMJNwtxogSSo1d+GrTCe9dn/fLdDN/379oUD/jBSkiseHS8N/nwc
	 P0Y/51xokpdUw==
Date: Wed, 31 Jul 2024 18:41:38 +0000
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Marco Elver <elver@google.com>, Coly Li <colyli@suse.de>, Paolo Abeni <pabeni@redhat.com>, Pierre Gondois <pierre.gondois@arm.com>, Ingo Molnar <mingo@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 04/10] rust: list: add struct with prev/next pointers
Message-ID: <1b2078d8-d93b-4626-a73f-edc5616a2357@proton.me>
In-Reply-To: <20240723-linked-list-v3-4-89db92c7dbf4@google.com>
References: <20240723-linked-list-v3-0-89db92c7dbf4@google.com> <20240723-linked-list-v3-4-89db92c7dbf4@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 8aa0c8a898d34210a5055c792d60eb3bc6c0071d
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 23.07.24 10:22, Alice Ryhl wrote:
> +/// The prev/next pointers for an item in a linked list.
> +///
> +/// # Invariants
> +///
> +/// The fields are null if and only if this item is not in a list.
> +#[repr(transparent)]
> +pub struct ListLinks<const ID: u64 =3D 0> {
> +    #[allow(dead_code)]
> +    inner: Opaque<ListLinksFields>,

Do you really need `Opaque`? Or would `UnsafeCell` be enough? (If it is
enough and you change this, be aware that `Opaque` is `!Unpin`, so if
you intend for `ListLinks` to also be `!Unpin`, then you need a
`PhantomPinned`)

> +}
> +
> +// SAFETY: The next/prev fields of a ListLinks can be moved across threa=
d boundaries.

Why? This is not a justification.

> +unsafe impl<const ID: u64> Send for ListLinks<ID> {}
> +// SAFETY: The type is opaque so immutable references to a ListLinks are=
 useless. Therefore, it's
> +// okay to have immutable access to a ListLinks from several threads at =
once.

You don't need to argue via `Opaque`, the type doesn't expose any
`&self` functions, so there are no functions to consider.

---
Cheers,
Benno

> +unsafe impl<const ID: u64> Sync for ListLinks<ID> {}
> +
> +impl<const ID: u64> ListLinks<ID> {
> +    /// Creates a new initializer for this type.
> +    pub fn new() -> impl PinInit<Self> {
> +        // INVARIANT: Pin-init initializers can't be used on an existing=
 `Arc`, so this value will
> +        // not be constructed in an `Arc` that already has a `ListArc`.
> +        ListLinks {
> +            inner: Opaque::new(ListLinksFields {
> +                prev: ptr::null_mut(),
> +                next: ptr::null_mut(),
> +            }),
> +        }
> +    }
> +}
>=20
> --
> 2.45.2.1089.g2a221341d9-goog
>=20

