Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615D813A26E
	for <rust-for-linux@vger.kernel.org>; Mon, 27 May 2024 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801930; cv=none; b=ZerWZXdM9ZW0z6+PwlBMDBpuDxXVVaPYxuxIVTRazpbZT65CoN+fc75fLzQ6iBwCqY1f4SHBiOYUarZwOKYxruxLnVUdAJ0E1YY7FVT9xACfvlZWt/Yd6bCFOXeOdTJcuStgUbBXfB9FZMKDsiNaiKGqjlAg0nMizwxcgSclQk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801930; c=relaxed/simple;
	bh=MoYpXoQd6dgd1S+BiMwm5EnBhyCwhBKy+on1h+PnKXI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lc8xxIFQxZFh3hSPd8NN3FJ5Mj+3RdBNvz0UrLV1GiNpYyr430T+BQYzaFPKkk8PKDf/y/mnVHd9ZCvBEHBSGZBtCLljYeBCILrP3n6+XU7p5PFhYyTz0UcrmBH6gmg/31B8qaPdGSvKtMB3jRaxNcQM2RNOWdmXBxvlvfhPMtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ObSnODJy; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ObSnODJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=x4b5jwmoy5he5m5aofddcrodj4.protonmail; t=1716801919; x=1717061119;
	bh=5Oa3A89J8+5axYPE1P3GO1ihKzX85SeBoOVRylK7fAM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ObSnODJyiaLu9Jg6mPveTrmTzjetYQt6V2+zpd+OqLy90KQBT9zz/kCM9PD/9S1qA
	 f/csl5QsY4Zkzn255uvdQ99mO0b3c/pjr5qDiym/hrWFMiqFwY5M+wDRFeR1PvWRdF
	 hR/vmE5J1ePOWT7Q47crVCi959AbwSnt4Uzw8oR6aLY0pZWmu6Iml0dVK0lFMGNeW+
	 AUT1ZhwrXos4nC4x4jecCdGCUqaNo0VnzJazkzGyRJJmb5cysTQKm8jV/dEw4ivpah
	 p2H6hIWnL6+OguPIO/j3cy/w0v8oLe3MYoJsGxYfvXkHy/aYElAYi4dBvLVNg+aKPp
	 JX6irjOvV/1og==
Date: Mon, 27 May 2024 09:25:16 +0000
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Coly Li <colyli@suse.de>, Paolo Abeni <pabeni@redhat.com>, Pierre Gondois <pierre.gondois@arm.com>, Ingo Molnar <mingo@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/9] rust: list: add ListArc
Message-ID: <3d04db54-8561-4c09-82c0-6ebcfb3e9ceb@proton.me>
In-Reply-To: <20240506-linked-list-v2-1-7b910840c91f@google.com>
References: <20240506-linked-list-v2-0-7b910840c91f@google.com> <20240506-linked-list-v2-1-7b910840c91f@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 8f4490f9c6da6cbc3385e001d019440362da4de9
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06.05.24 11:53, Alice Ryhl wrote:
> +impl<T, const ID: u64> ListArc<T, ID>
> +where
> +    T: ListArcSafe<ID> + ?Sized,
> +{
> +    /// Convert a [`UniqueArc`] into a [`ListArc`].
> +    #[inline]
> +    pub fn from_unique(unique: UniqueArc<T>) -> Self {
> +        Self::from_pin_unique(Pin::from(unique))
> +    }
> +
> +    /// Convert a pinned [`UniqueArc`] into a [`ListArc`].
> +    #[inline]
> +    pub fn from_pin_unique(mut unique: Pin<UniqueArc<T>>) -> Self {
> +        // SAFETY: We have a `UniqueArc`, so there is no `ListArc`.
> +        unsafe { T::on_create_list_arc_from_unique(unique.as_mut()) };
> +        let arc =3D Arc::from(unique);
> +        // SAFETY: We just called `on_create_list_arc_from_unique` on an=
 arc without a `ListArc`,
> +        // so we can create a `ListArc`.
> +        unsafe { Self::transmute_from_arc(arc) }
> +    }

I think these two functions would make sense as `From` impls.

> +
> +    /// Like [`from_unique`], but creates two `ListArcs`.
> +    ///
> +    /// The two ids must be different.
> +    ///
> +    /// [`from_unique`]: ListArc::from_unique
> +    #[inline]
> +    pub fn pair_from_unique<const ID2: u64>(unique: UniqueArc<T>) -> (Se=
lf, ListArc<T, ID2>)
> +    where
> +        T: ListArcSafe<ID2>,
> +    {
> +        Self::pair_from_pin_unique(Pin::from(unique))
> +    }

[...]

> +    /// Returns a reference to an [`Arc`] from the given [`ListArc`].
> +    ///
> +    /// This is useful when the argument of a function call is an [`&Arc=
`] (e.g., in a method
> +    /// receiver), but we have a [`ListArc`] instead.
> +    ///
> +    /// [`&Arc`]: Arc
> +    #[inline]
> +    pub fn as_arc(&self) -> &Arc<T> {
> +        &self.arc
> +    }

Should this be an `AsRef` impl instead?

---
Cheers,
Benno

> +
> +    /// Returns an [`ArcBorrow`] from the given [`ListArc`].
> +    ///
> +    /// This is useful when the argument of a function call is an [`ArcB=
orrow`] (e.g., in a method
> +    /// receiver), but we have an [`Arc`] instead. Getting an [`ArcBorro=
w`] is free when optimised.
> +    #[inline]
> +    pub fn as_arc_borrow(&self) -> ArcBorrow<'_, T> {
> +        self.arc.as_arc_borrow()
> +    }

[...]

