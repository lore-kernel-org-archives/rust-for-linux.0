Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D46B640;
	Fri, 13 Feb 2026 12:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770986740; cv=none; b=diCj9bXArvPPOXFQRXGkPwBKJbZCkiiE2qKyoiHGvShexL4OZC1Yb58GXNOQnCupT7S3YpvBMAudbACJUjsQKZ6MiSMx/dPBuLWR9rEeRLM20NmK1eygWNcgeuiwN8khPGXXkedvqeC7QZuwaOE6okXxgqThePrW97i50ZAY1ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770986740; c=relaxed/simple;
	bh=KS5OyQUGwYr7RjzTwiKXxGKlic/PWFi6BwMtgn/vHxc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Qw9m5jvYh7lbVTfdXzLhR+mOSAKPVxpvMzR0c2HXYvAwpR8Ij4Il93udcyNB1kr0V88CSiVzQIvVDBm/p5Y1tHilbAaUBTrkDr4vukEfvVFw0uD73SCkHzq4GUf/TiYYx5f/9DEne/9LD3HhUf6paPRjlxxZqPqTqkJequSIzcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eb3XMWT0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eb3XMWT0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61663C116C6;
	Fri, 13 Feb 2026 12:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770986739;
	bh=KS5OyQUGwYr7RjzTwiKXxGKlic/PWFi6BwMtgn/vHxc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Eb3XMWT0Y0yEZN4X+QeqeNspRK0AUqY0KUDwdhDD8l9ocB1RlRwwd4D5bB8FpVKm+
	 o7JKqjUp2YhxtaKxdnWUYvusu7lX9pRjxmuavV/3kJVuTwdZI1oOu08O6iXAssNTof
	 FozvICy9uiBZ1VwthY6RGmCG1wW6/Nq/zhqp2O5d1Gwr06WByfWZLAlbLwMuMRFLwq
	 BF+xbltbYgYOQB/l8nc29cakD0j7VXIOWN8ID+PvH1A/euiOd5FAuevJ1pfYcBgu1q
	 r6+b7yObGCE+XcNyoBYciMMgq1jIKdnPyb6yUONwWjtK0nduyV8A0zfFSD5QIEJi5e
	 7cjPufpBajS3w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
In-Reply-To: <20260213112837.GT2995752@noisy.programming.kicks-ass.net>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <MJX-TLnHWp9yJ9t7suTC8ExghroIz2g2epZG9Rmp6l-9W7BylahrPTqXQBI3D0EUah4xdEt3UXh6ROBa4LdEDw==@protonmail.internalid>
 <20260213112837.GT2995752@noisy.programming.kicks-ass.net>
Date: Fri, 13 Feb 2026 13:45:28 +0100
Message-ID: <87a4xcu80n.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Peter Zijlstra" <peterz@infradead.org> writes:

> On Fri, Feb 13, 2026 at 07:42:53AM +0100, Andreas Hindborg wrote:
>> When copying data from buffers that are mapped to user space, it is
>> impossible to guarantee absence of concurrent memory operations on those
>> buffers. Copying data to/from `Page` from/to these buffers would be
>> undefined behavior if no special considerations are made.
>>
>> Add methods on `Page` to read and write the contents using byte-wise atomic
>> operations.
>>
>> Also improve clarity by specifying additional requirements on
>> `read_raw`/`write_raw` methods regarding concurrent operations on involved
>> buffers.
>
>
>> +    /// - Callers must ensure that this call does not race with a write to the source page that
>> +    ///   overlaps with this read.
>
> Yeah, but per the bit above, its user mapped, you *CANNOT* ensure this.

Not all pages are user mapped. If `self` is user mapped, you cannot use
this function. As you say, it would not be possible to satisfy the
safety precondition.

If `self` is only mapped in the kernel and if you can guarantee that
there are no other concurrent writes to it, you can use this function.

>
> And same comment as for v2, none of this makes sense. Byte loads are not
> magically atomic. And they don't actually fix anything.

I am curious about on what architectures byte loads can tear?


Best regards,
Andreas Hindborg


