Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3322459ED;
	Sat, 14 Feb 2026 08:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771057115; cv=none; b=FS0YPXYn6pxgb4gqBfDOblf+ADLk3QnaKtIrsyld2vPnXCXV/VMapZfP2/4rmsBihDTNzdJNOgw63Y9vik3QaxM63vPCLhNnsC2y+lYY1CZ5C27J8QTaR8JVtofd4W2mnAPgzvZqNKyWSdRxGU8RQtBWe+eRuzCbrirqptFAeSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771057115; c=relaxed/simple;
	bh=Tox5jLa15XoCUBQXIkE0c8jgaNR0Lc1vhq8GCSN9Rw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LJv4/1hdZ0c2qhfPMW6/N5kYYV1pIah0/rT/xbRRfO4XK3Lnkgp5vMbyAv6itukF8Cy3zFxe6KJ9i/j7vtUuf2kI0uxtlS90vVsiHT9358GotQSebqvgfGtWSdA/08Gnv95WXOqEPNI8s3X1ccoVjwXVuvniyGSMrHs59QljQCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jR1Z16eo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jR1Z16eo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC384C19421;
	Sat, 14 Feb 2026 08:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771057115;
	bh=Tox5jLa15XoCUBQXIkE0c8jgaNR0Lc1vhq8GCSN9Rw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jR1Z16eoNZfM/acOr/gy3tKDRoh2EblMxU/3YD3lCWCGoCjZ+Nl3DVWARKna8UDuh
	 nF0cT5PpnLZ40iKGO1v2PbHleXyxwmgfp+F9wuvjLq0yLQ7kZnNp8cxqnDZJjvt+0f
	 uwwXCQUmFtfey1RA/G0P5MxEtDKKRBgf7zzZmr/L47/Cp1eSwEl0cH6W6+KaW35BZe
	 l+c+s4In4xTNZbcYoSM+TtcLW+DazZJH5hyVYgFiQMRetPfFzOlkXR0eARuPwnyAxY
	 mvi3aLWWqxhnOKpmA4uSxRtxlR7A4OnaZyskCVLobuAS6wwd9GtO+zRsOgLXwNzrBB
	 gtYTDK5uLvyzg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
In-Reply-To: <aY9UedlaCmagVmzh@tardis.local>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <20260213112837.GT2995752@noisy.programming.kicks-ass.net>
 <aY9UedlaCmagVmzh@tardis.local>
Date: Sat, 14 Feb 2026 09:18:16 +0100
Message-ID: <87tsvjsppz.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Boqun Feng <boqun@kernel.org> writes:

> On Fri, Feb 13, 2026 at 12:28:37PM +0100, Peter Zijlstra wrote:
>> On Fri, Feb 13, 2026 at 07:42:53AM +0100, Andreas Hindborg wrote:
>> > When copying data from buffers that are mapped to user space, it is
>> > impossible to guarantee absence of concurrent memory operations on those
>> > buffers. Copying data to/from `Page` from/to these buffers would be
>> > undefined behavior if no special considerations are made.
>> > 
>> > Add methods on `Page` to read and write the contents using byte-wise atomic
>> > operations.
>> > 
>> > Also improve clarity by specifying additional requirements on
>> > `read_raw`/`write_raw` methods regarding concurrent operations on involved
>> > buffers.
>> 
>> 
>> > +    /// - Callers must ensure that this call does not race with a write to the source page that
>> > +    ///   overlaps with this read.
>> 
>> Yeah, but per the bit above, its user mapped, you *CANNOT* ensure this.
>> 
>
> First, this safety requirement is actually incorrect, because of the
> user mapped case you mentioned. I believe Andreas put it to prevent
> others from racing with memcpy(), e.g.

Since context is a bit washed out here, let's make sure we are talking
about `Page::read_bytewise_atomic``.

There are two buffers in play. `src`, which is provided by the `self:
&Page` and `dst: *mut u8`, which is passed as a function parameter.

The requirement for `src` is:

    Callers must ensure that this call does not race with a write to the **source page** that
    overlaps with this read.

This requirement is different than the requirement on `dst`. I do not
want to enforce that all memory operations on `src` be atomic, simply
that they are synchronized. This is a weaker requirement than the
requirement on `dst`. As we hold a shared reference to `self` and there
is no internal synchronization, I think this is the correct requirement.

For `dst` we have:

    For the duration of the call, other accesses to the area described by `dst` and `len`,
    must not cause data races (defined by [`LKMM`]) against atomic operations executed by this
    function. Note that if all other accesses are atomic, then this safety requirement is
    trivially fulfilled.

Which is also requiring no races, but is specifically mentioning atomic
operations, which I did not want on `src`.

With this in mind, do you still think they are redundant?


Best regards,
Andreas Hindborg


