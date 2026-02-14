Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47F378C9C;
	Sat, 14 Feb 2026 08:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771057111; cv=none; b=UerVsKu1uIYbemqHWKU2SfKo6RWBOy9jV/hs0JoMVWI5V5IBczwByPhWJerDYGg22jtXlN16y4CyGcZPBUMcwdRRgd5tMoGsIuGewb9YLgeKrojqdZwVmCalo9lxuGW++aPWL3mlEXFB/CmZua5xCQPYoIlCgN/1l9++hkkz/QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771057111; c=relaxed/simple;
	bh=O8x1zhA6Vi8ynCREZI3k2t41Zy8F2bQqNAoQ3vIS1d0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YD7z3R1KMVIzHbWo0FWMxgwSYF4hABnpxM8Rc/NpQkcwTfCyxsPFC9Ebr5KZKp2Hme/TTISRL2yV1Yk9N6ySzUiScXgGB1mmwCEnvhv0fUVaL9Pjgf35FeYO5HbIzVyLkZs8T26ZjT4v+VpLbFu5FrFoNkB2xJuRcvWPxNl2DzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jphuTcDA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jphuTcDA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B9AC19422;
	Sat, 14 Feb 2026 08:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771057111;
	bh=O8x1zhA6Vi8ynCREZI3k2t41Zy8F2bQqNAoQ3vIS1d0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jphuTcDAy5Kdn63OCdQdo3hS88GeN50loPFKsDm367J1Ae8LIoTFuV9m/wIFndl1r
	 oPrst4EpmqLmkPQeMnCkyxDf3BevPduv7e/pYWtKwV5bYUy1ZdH21G1R5kI/Bn2RUb
	 moguguPAnELKphe89Os9NnIAku04ER+ls5Hwts8SbbLz9DZ3ThOnsteukrR1EG342N
	 I/eYYmsAIHhLhdPvqgrVzvosRbLhFIjbjxLCylsu70mBUeGFMXTZx3Bf4A62olg2Mr
	 17P9XyBfBWUpKKRB0PCynhXj4dv2zJoJ6/K9JP0MVTCDqtmhE4NLyWPe8rgob/IBkS
	 iEOW4OW+me2RQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
In-Reply-To: <aY9i8rbvnxdOA9DV@tardis.local>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <aY9i8rbvnxdOA9DV@tardis.local>
Date: Sat, 14 Feb 2026 09:04:56 +0100
Message-ID: <87wm0fsqc7.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Boqun Feng <boqun@kernel.org> writes:

> On Fri, Feb 13, 2026 at 07:42:53AM +0100, Andreas Hindborg wrote:
> [...]
>> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>> index 4aebeacb961a2..8ab20126a88cf 100644
>> --- a/rust/kernel/sync/atomic.rs
>> +++ b/rust/kernel/sync/atomic.rs
>> @@ -560,3 +560,35 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
>>          unsafe { from_repr(ret) }
>>      }
>>  }
>> +
>> +/// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
>> +///
>
> Given Greg and Peter's feedback, I think it's better to call out why we
> need `atomic_per_byte_memcpy()` and why we use bindings::memcpy() to
> implement it. How about a paragraph as follow:
>
> /// This is the concurrent-safe version of `core::ptr::copy()` (the
> /// counterpart of standard C's `memcpy()`). Because of the atomicity at
> /// byte level, when racing with another concurrent atomic access (or
> /// a normal read races with an atomic read) or an external access (from
> /// DMA or userspace), the behavior of this function is defined:
> /// copying memory at the (at least) byte granularity.
> ///
> /// Implementation note: it's currently implemented by kernel's
> /// `memcpy()`, because kernel's `memcpy()` is implemented in a way that
> /// byte-wise atomic memory load/store instructions are used.
>
> And probably we make it a separate patch for this
> atomic_per_byte_memcpy().

Sure, I'll queue that.


Best regards,
Andreas Hindborg



