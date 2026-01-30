Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF631349AE7;
	Fri, 30 Jan 2026 16:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769790022; cv=none; b=BysD9HsdEjjcb0WVnkC2swULEEm8OXMRDGaFpcy4fXcySvWxYkZICHMAyawurkVBbvDL3ZBOSBLy5xQgkv44RLXVIek4TDMqoa//dLJgZRfKdq97jfO4aclsX8bUWobczxU7vrk++rB82I/k2Id2a5fLl/4Wj7Pgzr1hYHhNQFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769790022; c=relaxed/simple;
	bh=wbMp/Ly/rcVA2pmYBu1rMZylfBh/m35lPzSeL9oO8r4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KA3aLerf/8dkKfvtwtEey8mRc5mUF7uGxuMznmBenlQLZ8/D1osRDChQykWGqAiwHEfR4kRT3P1G8L0uv/Xvb+6E/U/eYu48UVoBI+A6QSjHt6/yJeTY1/mziTH9Ljpq5mK8BGncim1xatzKzzNOmLiypQyE6qvmP44qDop5b50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pCWz1Hgb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pCWz1Hgb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5364C4CEF7;
	Fri, 30 Jan 2026 16:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769790022;
	bh=wbMp/Ly/rcVA2pmYBu1rMZylfBh/m35lPzSeL9oO8r4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pCWz1Hgbb4VYoxBeKZZd6bM55HuDHy3ywRrcyuWWv28r3GcL+I66y3+sohOf7KgZC
	 xgunwvoGcaliAuM9/emydvPZ5b8lsiKDUg+o8qz+svU3AbrB6OHYq0dnAK5bbWGmp2
	 xbiduuD+trFq3bc/1Y0VyEtCkJZnQf+Y9By3JOYabSOeUuDEBHbh6/y2UBk7I/L3vF
	 yb2RZdnMeltqYRh+F3x2//+ydhQYfi7QwqzvjfSaAM/xWQPljGYxH6J9c0GjY5crpI
	 YF1jKJ9OegLtsvMej86qa88xVye1ZUXwHVjEqkT5Fyq/uxImWEt1E5why5vYIPZTDy
	 pXWRpwNfT9gOA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Abdiel Janulgue
 <abdiel.janulgue@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: dma: update safety comments for volatile memory
 access
In-Reply-To: <DG213XWX7XHK.1YK7VU26U6N7T@kernel.org>
References: <20260130-dma-doc-update-v1-1-bac46939cfea@kernel.org>
 <6OtgND__pkW_qf9usEP8uPit7UYZ5lUgDF9Ubf-mc0uQQij85ZeomxKhGrZMonsT2UtxcYOo9T3DOitDY2WbHw==@protonmail.internalid>
 <DG20XIGFWXHR.3JEF2WM3OHZ0P@garyguo.net>
 <87y0lfqg0r.fsf@t14s.mail-host-address-is-not-set>
 <lCSfF-GOVxfvBXyN2kw7re-_Z48sqHa3UDOnqato-niGzpIvZ8kr4IxL2PksiRlyoTSYGLLdlaoaBHIjsBvxiw==@protonmail.internalid>
 <DG213XWX7XHK.1YK7VU26U6N7T@kernel.org>
Date: Fri, 30 Jan 2026 17:05:37 +0100
Message-ID: <87v7gjqe5q.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Danilo Krummrich" <dakr@kernel.org> writes:

> On Fri Jan 30, 2026 at 4:25 PM CET, Andreas Hindborg wrote:
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>>> On Fri Jan 30, 2026 at 2:59 PM GMT, Andreas Hindborg wrote:
>>>> At the time `CoherentAllocation::read_field` and
>>>> `CoherentAllocation::write_field` was merged, `ptr::{read,write}_volatile`
>>>> was under specified. The documentation for these functions have been
>>>> updated and we can now formulate a proper safety comment for the calls.
>>>>
>>>> Update safety comments in `CoherentAllocation::{read,write}_field`.
>>>>
>>>> Link: https://doc.rust-lang.org/stable/core/ptr/fn.read_volatile.html
>>>> Link: https://doc.rust-lang.org/stable/core/ptr/fn.write_volatile.html
>>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>> ---
>>>>  rust/kernel/dma.rs | 25 +++++++++----------------
>>>>  1 file changed, 9 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>>>> index acc65b1e0f245..0b55671a94faf 100644
>>>> --- a/rust/kernel/dma.rs
>>>> +++ b/rust/kernel/dma.rs
>>>> @@ -593,14 +593,12 @@ pub fn item_from_index(&self, offset: usize) -> Result<*mut T> {
>>>>      pub unsafe fn field_read<F: FromBytes>(&self, field: *const F) -> F {
>>>>          // SAFETY:
>>>>          // - By the safety requirements field is valid.
>>>> -        // - Using read_volatile() here is not sound as per the usual rules, the usage here is
>>>> -        // a special exception with the following notes in place. When dealing with a potential
>>>> -        // race from a hardware or code outside kernel (e.g. user-space program), we need that
>>>> -        // read on a valid memory is not UB. Currently read_volatile() is used for this, and the
>>>> -        // rationale behind is that it should generate the same code as READ_ONCE() which the
>>>> -        // kernel already relies on to avoid UB on data races. Note that the usage of
>>>> -        // read_volatile() is limited to this particular case, it cannot be used to prevent
>>>> -        // the UB caused by racing between two kernel functions nor do they provide atomicity.
>>>> +        // - `field` points to memory outside any Rust allocation.
>>>
>>> Hmm, this isn't actually correct, as the memory behind `CoherentAllocation`
>>> isn't MMIO (they're just also accessible by device). We provide `as_slice()`
>>> which exposes these memory directly to the Rust memory model.
>>
>> I would not get too hung on the MMIO term. But if we provide `as_slice`,
>> this implementation of `read_field` and `write_field` is not sound at
>> all. We should fix that.
>
> as_slice() is unsafe and the requirements do not allow you any concurrent reads
> or writes as long as the slice is live.

As far as I understand, this does not matter for
ptr::volatile_{read,write}. Once you make a reference to a memory
region, it can no longer be considered to be outside of any Rust
allocation. But this is just what I picked up. Someone more compiler
savvy should chime in.


Best regards,
Andreas Hindborg


