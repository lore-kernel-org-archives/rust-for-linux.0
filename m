Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E7E3E3DA6;
	Tue,  9 Jun 2026 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995077; cv=none; b=L2aCNsoNM7CqnDTmB7R6ETLXIWh5+3srq65aAwjI/ptqzV1SV6WuJ8rjCFaZQQljUue3IqhiN3CigzcoIA63PCG+19l2EYny415lXVzY02I04E+b7heYSy0nWLDYbrGSas7uQojDq1kdGYp6frsXudN5fT8MAMNGliVmmegGm+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995077; c=relaxed/simple;
	bh=aC1ftIpSiFmn4RfgIzq5ZTrKyyWubFxnEqtacDD9Ox4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qbOWbI8jG9FVwNSOS8lFx/QbFpfPjanuxpSrMA88sx0sjTpnf5j6Q3wSXAB/aftWOY+4v7i+HBbhgevWhwqENl6UPi2WehP+Boyuk77SyyNHVVGhjzR3V+Vws/2Jq9aTh9VNaGVvCVQGo+iKnjeqS42NdoyZ4iLoHDeO+Amqir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlpdyG3U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlpdyG3U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFD51F00893;
	Tue,  9 Jun 2026 08:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780995076;
	bh=+nDVPgpp1Ly0QDUYr7vUHvL0g/QTd0ZvsPif4iWADII=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=OlpdyG3UWPhN1uXUi98IS74Ht7BSPhiSYXnOsvq3E9qRV36IJ1OihYJtlMI+FIDb2
	 BjaN0cFx5TeAcuSB2Y01mncxs1/23kq5jocXpuToxCv3ylCnu5nrYfa69QY2zOjSg8
	 KyuAK/rDFdlzRoFajLcIr2NF0UBmFlzkuppUGyXxPcYKrX5Dwv+/Gs65j5koj99G6j
	 zeoX2ruCuxcLz0jWqz6Ug9q6Q6qjd+vUNEpSO9mIqOKk82ggH0V7vXHlNgqBcHsO1J
	 prkdKVrcewMaXpQJzozyHqLV7he3TIuGYrbQk1sqldsf/DCdswgif01DNxmqVvkJiv
	 +KNuzkHNMeoSw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Tamir Duberstein <tamird@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry
 Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, Daniel Gomez
 <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 05/11] rust: xarray: simplify `Guard::load`
In-Reply-To: <178067251349.96312.11784247103754750756.b4-review@b4>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-5-965f6028790e@kernel.org>
 <178067251349.96312.11784247103754750756.b4-review@b4>
Date: Tue, 09 Jun 2026 10:39:21 +0200
Message-ID: <87ik7sglae.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tamir Duberstein <tamird@kernel.org> writes:

> On Thu, 04 Jun 2026 21:58:11 +0200, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>> Simplify the implementation by removing the closure-based API from
>> `Guard::load` in favor of returning `Option<NonNull<c_void>>` directly.
>
> This is simpler, but the closure-based API was here for a reason (to
> avoid passing around untyped pointers). This patch is estabilishing the
> style for subsequent patches, but doesn't honestly describe that it is
> doing so.

I'll be sure to mention this in the commit message for next spin.

>
>>
>>
>> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
>> index 05e6dc1ffe69..7da57c778669 100644
>> --- a/rust/kernel/xarray.rs
>> +++ b/rust/kernel/xarray.rs
>> @@ -212,28 +212,23 @@ fn from(value: StoreError<T>) -> Self {
>> [ ... skip 26 lines ... ]
>> -        self.load(index, |ptr| {
>> -            // SAFETY: `ptr` came from `T::into_foreign`.
>> -            unsafe { T::borrow_mut(ptr.as_ptr()) }
>> -        })
>> +        let ptr = self.load(index)?;
>> +
>
> Inconsistent whitespace.

Thanks!

Best regards,
Andreas Hindborg



