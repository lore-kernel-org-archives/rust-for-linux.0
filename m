Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A4B3242D7;
	Fri, 30 Jan 2026 15:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769786733; cv=none; b=MNfSsCCCial4tDozgacHajxq+8nl8Kqv9w+JqIs95dvIirYFoO8eAb5SSF05iJRBIIseX9g0mT4wukz1SrMfJXGNIIq2RsljpAX0yAcmIPs27xtj0vSRexCLNnqBa2fZi5TiyBO0TtfHDR6aZbawTLokoq5l9BXCWzDZ5uf+Kr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769786733; c=relaxed/simple;
	bh=KAuOy0sZhClp7Bp37UyA7YWgZfeaoJMfeFtjdNY+vbY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UoVSs19r55hskgIVA8PNsNWVuXeuG5MfFckTHr8Qj25OHuwyBhrJ0wd1AjPfh0CMjEkkTj7qiIdBfk/9zWfMakcGaY6jpnw1Z5+DKwIRyM+1rU8yt4mq6NRN5WJVeQ/cQZ/ulCfKMiL8uc/mgiwGpOOJk3H3lnVMgohQGm+ci7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8U1snfc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8U1snfc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B3CC4CEF7;
	Fri, 30 Jan 2026 15:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769786733;
	bh=KAuOy0sZhClp7Bp37UyA7YWgZfeaoJMfeFtjdNY+vbY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=X8U1snfcPYQbrP9SIpEjz3wCPcswrvZvLfFUi16633cYNJsyWjE+BExZ7yvOBZ6ds
	 5iERoUu/n7LoEmJiaP4cerocbOqeqONVviHkWWhrSPwQ+GS7Ta8yKawZkjoHtCe+mc
	 xdDzsmYk1Oa2VudI9KW1F6Z8GT/14pxsDR3ODrXl0dl0lhF0XAn40iNeD1Jb4L8iQp
	 eqsVrwziibG3KwR0+vanN7CgLazZMMQNTA6a2cVvuwYn+CJEv6v+ia5cA9x0YdNHyv
	 emVBRMWfrQqdOn/Xxw0VAxLZEqe/S0DXmBEa70NDYJ4A7hsaU4vTz7aiyMnlGz1dXR
	 aElxV/tADIntQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Abdiel
 Janulgue <abdiel.janulgue@gmail.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Robin Murphy
 <robin.murphy@arm.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: dma: update safety comments for volatile memory
 access
In-Reply-To: <DG20XIGFWXHR.3JEF2WM3OHZ0P@garyguo.net>
References: <20260130-dma-doc-update-v1-1-bac46939cfea@kernel.org>
 <6OtgND__pkW_qf9usEP8uPit7UYZ5lUgDF9Ubf-mc0uQQij85ZeomxKhGrZMonsT2UtxcYOo9T3DOitDY2WbHw==@protonmail.internalid>
 <DG20XIGFWXHR.3JEF2WM3OHZ0P@garyguo.net>
Date: Fri, 30 Jan 2026 16:25:24 +0100
Message-ID: <87y0lfqg0r.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Fri Jan 30, 2026 at 2:59 PM GMT, Andreas Hindborg wrote:
>> At the time `CoherentAllocation::read_field` and
>> `CoherentAllocation::write_field` was merged, `ptr::{read,write}_volatile`
>> was under specified. The documentation for these functions have been
>> updated and we can now formulate a proper safety comment for the calls.
>>
>> Update safety comments in `CoherentAllocation::{read,write}_field`.
>>
>> Link: https://doc.rust-lang.org/stable/core/ptr/fn.read_volatile.html
>> Link: https://doc.rust-lang.org/stable/core/ptr/fn.write_volatile.html
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/dma.rs | 25 +++++++++----------------
>>  1 file changed, 9 insertions(+), 16 deletions(-)
>>
>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>> index acc65b1e0f245..0b55671a94faf 100644
>> --- a/rust/kernel/dma.rs
>> +++ b/rust/kernel/dma.rs
>> @@ -593,14 +593,12 @@ pub fn item_from_index(&self, offset: usize) -> Result<*mut T> {
>>      pub unsafe fn field_read<F: FromBytes>(&self, field: *const F) -> F {
>>          // SAFETY:
>>          // - By the safety requirements field is valid.
>> -        // - Using read_volatile() here is not sound as per the usual rules, the usage here is
>> -        // a special exception with the following notes in place. When dealing with a potential
>> -        // race from a hardware or code outside kernel (e.g. user-space program), we need that
>> -        // read on a valid memory is not UB. Currently read_volatile() is used for this, and the
>> -        // rationale behind is that it should generate the same code as READ_ONCE() which the
>> -        // kernel already relies on to avoid UB on data races. Note that the usage of
>> -        // read_volatile() is limited to this particular case, it cannot be used to prevent
>> -        // the UB caused by racing between two kernel functions nor do they provide atomicity.
>> +        // - `field` points to memory outside any Rust allocation.
>
> Hmm, this isn't actually correct, as the memory behind `CoherentAllocation`
> isn't MMIO (they're just also accessible by device). We provide `as_slice()`
> which exposes these memory directly to the Rust memory model.

I would not get too hung on the MMIO term. But if we provide `as_slice`,
this implementation of `read_field` and `write_field` is not sound at
all. We should fix that.


Best regards,
Andreas Hindborg


