Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9BB35C19F
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826341; cv=none; b=qxhC/q70Pj34voTMRXhh/FNMNN2ncPoT8UlUTSzuWeDvc5w/9aQG1hsoCxCI0ksllSIagT7OS3dHX8bMmazXxZYx+N+ZnWRG2sduXeS0QVaDKmprqUw0vHJT3i5kllzUIIAYbHFyXLhwCJkEYoKBe8VZkbWEUzTx0fOdRpus8Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826341; c=relaxed/simple;
	bh=arAi38nJkadXyPRr0fJ12sZFQzJWjy+451u08njCcY0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=BpgOfduhhuzXL2cJyOsFEpeaYO0zda21Nx0ZWaLTgHGRRX6OKn5wUyrYrNusJt1AQfEX5nSZGfbeZRPNk4gWOL92+oDhI2GCMzpi1bzUIya85mNAxg9GOFHrHX9N2Hr3ppTEZdgC0g10dDfIyNwldggXA7PxMFPXb/knBQU4TO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sVu7QSFY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVu7QSFY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F2FC116C6;
	Mon, 19 Jan 2026 12:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826341;
	bh=arAi38nJkadXyPRr0fJ12sZFQzJWjy+451u08njCcY0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=sVu7QSFYPvyLRg7UrRGkxJd1Tb4MoW9OUw9cKNRNU9AZMz4JgfdYn92lF84IIBPZp
	 SSlzsejx8HY7v4ML4M32GAKdVA329c5Q11dTjOUQzaTw9Dm8v5KshWCgchAuJ2UKZk
	 6nODMBxSJztdPywwvrTMT2Pu4oou/Mddash0rh/6qSX/sjMJUoEueEPp17e2vgqNtZ
	 0Y/5r2NoWgSynzCeCyS6ibr5/IXZ0Bf5iDHPrY/4k9AtTmTZJXHbWre3TBd39FRkaJ
	 f6y8ORpVysQT+mUDHDglaiYfDKonWwv3NFMlr9hzCWaoxbGzd6ur+XeGq+8d5bLOJr
	 WsF6umjoZuQaA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 13:38:58 +0100
Message-Id: <DFSKLTVPNQ11.26N3WVT559F22@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Matthew Maurer" <mmaurer@google.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 3/8] rust: uaccess: add
 UserSliceWriter::write_buffer() for raw pointer writes
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-4-ttabi@nvidia.com> <aWuNbUywGRH1zo-0@google.com>
 <aWubWE4kstGI42P9@google.com> <DFQXTQJSCXV5.2FSUVMTSF2OB3@kernel.org>
 <DFSK2KHCXTIB.3RR5Q81ADGKRR@garyguo.net>
In-Reply-To: <DFSK2KHCXTIB.3RR5Q81ADGKRR@garyguo.net>

On Mon Jan 19, 2026 at 1:13 PM CET, Gary Guo wrote:
> On Sat Jan 17, 2026 at 2:35 PM GMT, Danilo Krummrich wrote:
>> On Sat Jan 17, 2026 at 3:23 PM CET, Alice Ryhl wrote:
>>> On Sat, Jan 17, 2026 at 01:23:57PM +0000, Alice Ryhl wrote:
>>>> On Fri, Jan 16, 2026 at 03:49:54PM -0600, Timur Tabi wrote:
>>>> > +    pub unsafe fn write_buffer(
>>>> > +        &mut self,
>>>> > +        data: *const u8,
>>>> > +        len: usize,
>>>> > +        offset: usize,
>>>> > +        count: usize,
>>>> > +    ) -> Result {
>>>>=20
>>>> Why not this signature?
>>>>=20
>>>> 	unsafe fn write_raw_slice(&mut self, data: *const [u8]) -> Result;
>>>>=20
>>>> You can implement `write_slice` in terms of it.
>>>
>>> To clarify, I think this would be a simpler signature for
>>> `write_buffer()`. And `write_raw_slice()` can be used both for DMA and
>>> to simplify the existing `write_slice`.
>>
>> I.e. you can use it also to create a safe helper for DMA:
>>
>> 	fn write_dma(
>> 	    &mut self,
>> 	    data: &dma::CoherentAllocation<u8>,
>> 	    offset: usize,
>> 	    count: usize
>> 	) -> Result;
>
> Would it make sense to expose a `&CoherentAllocation<u8>` -> `&[Atomic<u8=
>]`
> conversion method and have a `write_slice(&mut self, data: &[Atomic<[u8]>=
)` for
> `UserSliceWriter`?

But we don't need any atomic operations for this. Maybe a transparent new t=
ype
that only allows access with {read,write}_volatile(), or maybe an UnsafeSli=
ce
type that can provide accessors that internally use *mut [u8] with
{read,write}_volatile().

But for this problem we only need something to eventually pass to
write_slice_raw() which will just use copy_to_user(), so it might be orthog=
onal.
