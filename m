Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9161B28D8F1;
	Fri, 30 Jan 2026 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769786939; cv=none; b=OUhetQGL1TtMhMg8DwOqOFRZ7YBqr5SgCmgCtmkmu3rLXg4SbLzLJiQ9NZ+FTxPMulF8jZnWhFymS1Q8dMREUQzKcV1Q6KfLzhSO9exnh/lDbkHVFBW6OvZ4G7BKydBvvB/7eTM5jKFwzSgh7/FTlj3veEE03YY7jLxLYfgkNTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769786939; c=relaxed/simple;
	bh=xAAMo9QkdLZtAMNGhE/MBJFkRbxmuKrI0LKJeHDzKQM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=EYhwsb8F/0i3oqeTdEgCCqnIeV5c5TpN3TcVefpmg+J0fNkSXLGlQjA26OdHZCL+JOjqVaUh8N1oXO/M1zPZxVCJSZLn6sLkHD5HUBodz3wPFrHC+iSEuJV7/SdxBMLt9lFZektD5755YRjmynvf/t4nwClhTBnoISvpNXqyhRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZRiT85F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZRiT85F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E83C4CEF7;
	Fri, 30 Jan 2026 15:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769786939;
	bh=xAAMo9QkdLZtAMNGhE/MBJFkRbxmuKrI0LKJeHDzKQM=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=iZRiT85FqWQ2/m18yxr2nE9oQYcEObt/+PVWCnZ0zbnUvfvHpzeI4znMguxPoYOIA
	 IqgXoDAdvJO+PUIfCynSgAVyVpvsj91FBKS6Vxr/x4rVbaymaq2om0w1QdvALPYOTE
	 Tgq6Q07QNNrHjDTX1rYX5f+vF1fBuI43Q+yGEPTEdHMZJ0ha/sYV4opMktG97jvLBw
	 NXOAAiLpGKhTzFtGLZd/lqYm9fzdElwdQjw04ivgomFBPNN+KGH9EeoYaxec9Jf1gh
	 oknkmWIbpWhe+S9w5/y8l6eHqCge0GqRVF61fgHvNMiCCdHYxRetpbwkZGJMdVa1eG
	 IWknlGmqB8jog==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 16:28:54 +0100
Message-Id: <DG213XWX7XHK.1YK7VU26U6N7T@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: dma: update safety comments for volatile memory
 access
References: <20260130-dma-doc-update-v1-1-bac46939cfea@kernel.org>
 <6OtgND__pkW_qf9usEP8uPit7UYZ5lUgDF9Ubf-mc0uQQij85ZeomxKhGrZMonsT2UtxcYOo9T3DOitDY2WbHw==@protonmail.internalid> <DG20XIGFWXHR.3JEF2WM3OHZ0P@garyguo.net> <87y0lfqg0r.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87y0lfqg0r.fsf@t14s.mail-host-address-is-not-set>

On Fri Jan 30, 2026 at 4:25 PM CET, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Fri Jan 30, 2026 at 2:59 PM GMT, Andreas Hindborg wrote:
>>> At the time `CoherentAllocation::read_field` and
>>> `CoherentAllocation::write_field` was merged, `ptr::{read,write}_volati=
le`
>>> was under specified. The documentation for these functions have been
>>> updated and we can now formulate a proper safety comment for the calls.
>>>
>>> Update safety comments in `CoherentAllocation::{read,write}_field`.
>>>
>>> Link: https://doc.rust-lang.org/stable/core/ptr/fn.read_volatile.html
>>> Link: https://doc.rust-lang.org/stable/core/ptr/fn.write_volatile.html
>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> ---
>>>  rust/kernel/dma.rs | 25 +++++++++----------------
>>>  1 file changed, 9 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>>> index acc65b1e0f245..0b55671a94faf 100644
>>> --- a/rust/kernel/dma.rs
>>> +++ b/rust/kernel/dma.rs
>>> @@ -593,14 +593,12 @@ pub fn item_from_index(&self, offset: usize) -> R=
esult<*mut T> {
>>>      pub unsafe fn field_read<F: FromBytes>(&self, field: *const F) -> =
F {
>>>          // SAFETY:
>>>          // - By the safety requirements field is valid.
>>> -        // - Using read_volatile() here is not sound as per the usual =
rules, the usage here is
>>> -        // a special exception with the following notes in place. When=
 dealing with a potential
>>> -        // race from a hardware or code outside kernel (e.g. user-spac=
e program), we need that
>>> -        // read on a valid memory is not UB. Currently read_volatile()=
 is used for this, and the
>>> -        // rationale behind is that it should generate the same code a=
s READ_ONCE() which the
>>> -        // kernel already relies on to avoid UB on data races. Note th=
at the usage of
>>> -        // read_volatile() is limited to this particular case, it cann=
ot be used to prevent
>>> -        // the UB caused by racing between two kernel functions nor do=
 they provide atomicity.
>>> +        // - `field` points to memory outside any Rust allocation.
>>
>> Hmm, this isn't actually correct, as the memory behind `CoherentAllocati=
on`
>> isn't MMIO (they're just also accessible by device). We provide `as_slic=
e()`
>> which exposes these memory directly to the Rust memory model.
>
> I would not get too hung on the MMIO term. But if we provide `as_slice`,
> this implementation of `read_field` and `write_field` is not sound at
> all. We should fix that.

as_slice() is unsafe and the requirements do not allow you any concurrent r=
eads
or writes as long as the slice is live.
