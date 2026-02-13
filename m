Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0313EBF10;
	Fri, 13 Feb 2026 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770987507; cv=none; b=Py9rIGOJL6qCOYz/Gxz94EIUZEPdrUHgNvJ+xtpefesChsY759LajAMcbiuJ24EHwqe49bR22S3nTQ+ebjCtplq8bMazF3nZp/FA/zIzb1eDf+/2S1t9klB2SCdayTHZwek+fVO6QbCzNnlSbjQ9XfhIliAxGOEPU2hFg26swV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770987507; c=relaxed/simple;
	bh=mr+a0c/cTqCnHJ+pfrjOEc85QJabkVXEsS2N9SJdxf8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NGEz4aS/mjjPwW2Ein/d1PNEB+ih5AC01uByKunOEdHpm3d8cXiXMvv8oKjWxS7b/o2tO0WawBz2sBLYucIHiUFg+LnUoWvy5MNuWHDHBTJ9Ql02Vo5vFSIAT6segAoEcoh+GmZ0ZQiwqT2PsLP2LhmqVzq0/Q3UrCNRq4Ad6Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKTNrLA9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKTNrLA9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5BCC116C6;
	Fri, 13 Feb 2026 12:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770987507;
	bh=mr+a0c/cTqCnHJ+pfrjOEc85QJabkVXEsS2N9SJdxf8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QKTNrLA9TWhj72HiG/JezifSgEA2dqjhTgfGUZraAunZjWYJLwtRPLiAUmi7asc1/
	 HVB7mKnJEzs6HLVTNJlaJ4Ic8lyaJKu874XrCUyn6gMHp4yUle2R3CYRtOYns+KGq5
	 OKBmnrDeboYfquV1SDvUhNNpSHDvnGhL/+LohiimBNONgffogL5STY6WWBOAPHQ8TR
	 9QB2dSxeADNJjp+8AKNyBsWijB+orJR8Fx61JdBMAPa/fqCbE3s7iSAHzNiOGsxFkT
	 cgKT5jAW4bdOj7d+5f4MxYNW/s/ilEIK920D4dWYnwfUqisvnmnJgB2Uj0PNkCLhNM
	 1ZDqJns12e+yw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>
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
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
In-Reply-To: <2026021343-germicide-baritone-efe8@gregkh>
References: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>
 <20260213095557.GS2995752@noisy.programming.kicks-ass.net>
 <40xUh92AU5E9oFxQrdej-AXVg76jmaWGKXZMLoOHXe35Lw9x_eNEoLup9bB60LyGZ_0USPmoxr-9hE3ujA67cQ==@protonmail.internalid>
 <2026021343-germicide-baritone-efe8@gregkh>
Date: Fri, 13 Feb 2026 13:58:16 +0100
Message-ID: <877bsgu7fb.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Greg KH" <gregkh@linuxfoundation.org> writes:

> On Fri, Feb 13, 2026 at 10:55:57AM +0100, Peter Zijlstra wrote:
>> On Thu, Feb 12, 2026 at 03:51:24PM +0100, Andreas Hindborg wrote:
>> > When copying data from buffers that are mapped to user space, it is
>> > impossible to guarantee absence of concurrent memory operations on those
>> > buffers. Copying data to/from `Page` from/to these buffers would be
>> > undefined behavior if no special considerations are made.
>> >
>> > Add methods on `Page` to read and write the contents using byte-wise atomic
>> > operations.
>>
>> I'm completely failing to understand. What!?
>>
>> There is no such thing as an 'atomic' byte load, nor does it help one
>> whit against concurrent modification of the memory you're copying.
>
> I too am totally confused when reading this patch, and the previous
> ones.  Shouldn't the "normal" copy_from_user() stuff be used here
> correctly?  Why is anything new needed?

One use for this is copying data out of a `struct bio_vec`. As far as I
know, there is no way to know where the pages backing a bio_vec are
mapped. They could be mapped to user space.

Best regards,
Andreas Hindborg



