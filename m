Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C72421EEC;
	Wed,  4 Feb 2026 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770220706; cv=none; b=D+12uPUAYxAHDwhyeMksd28VdJnp4jvbqgPBq85jKXGAq2vVNDju+PEp/dMOG38XrHx+dp22qcZDrXw9EA8fMbPI3rTC00Jo/8IQhH6KoLDpuGvVpFd6WNHCJ4ZYcjaF0JlqYmNWGNpy+TI27ucCBCPRpmmzjGD+dTQES1JhevM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770220706; c=relaxed/simple;
	bh=3bUz2AaZf5udaWQISdBQH/xVAmAdhsGVcK8NDcYpos8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hZHiv9Sc2sH8VzIXc2tJGBMt8MRpjLUwTMTzTYQxDfCh6ajkDcLvsblwLpcbT9xlNmeGdgpD/1HjQ5G+Hl7V15xxEhHaiyDrB3AWd99/p50HXwvDvBjZ7DzK8oCVPYNLrIuwCFZzOYNAXKczrV1DcfmrH5UGEZlpVs22St0084E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAPPMSnp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAPPMSnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B13C4CEF7;
	Wed,  4 Feb 2026 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770220706;
	bh=3bUz2AaZf5udaWQISdBQH/xVAmAdhsGVcK8NDcYpos8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OAPPMSnp2yeeCopj0oweHQxNJWIJrec4WzMqF8B3zJgb3lS7G+RTrpcHbqMkmK8c+
	 7Ci/YU1Wnd7WYm/c4der193cO64OzJqSlJpMLNaGcA58bWnPbhWCXIq/u7TJ9GI695
	 XKHGxGW/o8drcDO68GDrdtXE2uGxxpyPbIh1eCOfyIsgAsD2PgsopugGvHwLiYe2wD
	 WwdCv9zs9HLEW6c3BCB8PUxqasxgii8YkqwPEVKzJOtN8bC8DP6eM0F63zc4UHNnJn
	 8YLPkrjQjP5m1j/KB/OYaRm2VjFFo64D+EzIImDYO/3/Y3VvAg0O7OiPGI0NwZ3bdq
	 rHH+8NWhh/Y1Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: page: add volatile memory copy methods
In-Reply-To: <aYNOLt_kj6buuhH9@google.com>
References: <aX0lcVngRcRwqgd5@tardis.local>
 <SEV7bR_nyQNtvtgoO8X80HMkMTPLW_6roBSxJ-MpKHHNmkZQyVxSS9k1iFV7-bgAlHSLM566L8EqtRBnht65uA==@protonmail.internalid>
 <aX2tyn9nBUEKM-SN@tardis.local>
 <87ms1trjn9.fsf@t14s.mail-host-address-is-not-set>
 <gKLHFGuJqzRyjCupif-LFYn2ZY6OmhkyYj6idYTOnN4zMmNacFLBD1G9zzsYpTJn13GGvL0i-7JA-lIlBgakgQ==@protonmail.internalid>
 <DG2WLWJD8V5W.2I24LZKS6JG6Q@garyguo.net>
 <87bji9r0cp.fsf@t14s.mail-host-address-is-not-set>
 <878qddqxjy.fsf@t14s.mail-host-address-is-not-set>
 <aYFKbWfQmTInYy91@tardis.local>
 <87ldh8ps22.fsf@t14s.mail-host-address-is-not-set>
 <6QJArRFFMpiUrEi-zRSP4gEUGBGzGiajuJusY3rvLVeNC63eAefWPrDVPQbZnKRwV0PSTG3DrLdobBa4YUm1HQ==@protonmail.internalid>
 <aYNOLt_kj6buuhH9@google.com>
Date: Wed, 04 Feb 2026 16:58:17 +0100
Message-ID: <87ikccpkkm.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Wed, Feb 04, 2026 at 02:16:37PM +0100, Andreas Hindborg wrote:
>> Boqun Feng <boqun@kernel.org> writes:
>>
>> > On Sat, Jan 31, 2026 at 10:31:13PM +0100, Andreas Hindborg wrote:
>> > [...]
>> >> >>>>
>> >> >>>> For __user memory, because kernel is only given a userspace address, and
>> >> >>>> userspace can lie or unmap the address while kernel accessing it,
>> >> >>>> copy_{from,to}_user() is needed to handle page faults.
>> >> >>>
>> >> >>> Just to clarify, for my use case, the page is already mapped to kernel
>> >> >>> space, and it is guaranteed to be mapped for the duration of the call
>> >> >>> where I do the copy. Also, it _may_ be a user page, but it might not
>> >> >>> always be the case.
>> >> >>
>> >> >> In that case you should also assume there might be other kernel-space users.
>> >> >> Byte-wise atomic memcpy would be best tool.
>> >> >
>> >> > Other concurrent kernel readers/writers would be a kernel bug in my use
>> >> > case. We could add this to the safety requirements.
>> >> >
>> >>
>> >> Actually, one case just crossed my mind. I think nothing will prevent a
>> >> user space process from concurrently submitting multiple reads to the
>> >> same user page. It would not make sense, but it can be done.
>> >>
>> >> If the reads are issued to different null block devices, the null block
>> >> driver might concurrently write the user page when servicing each IO
>> >> request concurrently.
>> >>
>> >> The same situation would happen in real block device drivers, except the
>> >> writes would be done by dma engines rather than kernel threads.
>> >>
>> >
>> > Then we better use byte-wise atomic memcpy, and I think for all the
>> > architectures that Linux kernel support, memcpy() is in fact byte-wise
>> > atomic if it's volatile. Because down the actual instructions, either a
>> > byte-size read/write is used, or a larger-size read/write is used but
>> > they are guaranteed to be byte-wise atomic even for unaligned read or
>> > write. So "volatile memcpy" and "volatile byte-wise atomic memcpy" have
>> > the same implementation.
>> >
>> > (The C++ paper [1] also says: "In fact, we expect that existing assembly
>> > memcpy implementations will suffice when suffixed with the required
>> > fence.")
>> >
>> > So to make thing move forward, do you mind to introduce a
>> > `atomic_per_byte_memcpy()` in rust::sync::atomic based on
>> > bindings::memcpy(), and cc linux-arch and all the archs that support
>> > Rust for some confirmation? Thanks!
>>
>> There is a few things I do not fully understand:
>>
>>  - Does the operation need to be both atomic and volatile, or is atomic enough on its
>>    own (why)?
>>  - The article you reference has separate `atomic_load_per_byte_memcpy`
>>    and `atomic_store_per_byte_memcpy` that allows inserting an acquire
>>    fence before the load and a release fence after the store. Do we not
>>    need that?
>
> We can just make both src and dst into per-byte atomics. We don't really
> lose anything from it. Technically we're performing unnecessary atomic
> ops on one side, but who cares?

OK.

>
>>  - It is unclear to me how to formulate the safety requirements for
>>    `atomic_per_byte_memcpy`. In this series, one end of the operation is
>>    the potential racy area. For `atomic_per_byte_memcpy` it could be
>>    either end (or both?). Do we even mention an area being "outside the
>>    Rust AM"?
>>
>> First attempt below. I am quite uncertain about this. I feel like we
>> have two things going on: Potential races with other kernel threads,
>> which we solve by saying all accesses are byte-wise atomic, and reaces
>> with user space processes, which we solve with volatile semantics?
>>
>> Should the functin name be `volatile_atomic_per_byte_memcpy`?
>>
>> /// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
>> ///
>> /// This copy operation is volatile.
>> ///
>> /// # Safety
>> ///
>> /// Callers must ensure that:
>> ///
>> /// * The source memory region is readable and reading from the region will not trap.
>> /// * The destination memory region is writable and writing to the region will not trap.
>
> Ok.
>
>> /// * No references exist to the source or destination regions.
>
> You can omit this requirement. Creating references have safety
> requirements, and if such references exist, you're also violating the
> safety requirements of creating a reference, so you do not need to
> repeat it here.

Cool.

>
>> /// * If the source or destination region is within the Rust AM, any concurrent reads or writes to
>> ///   source or destination memory regions by the Rust AM must use byte-wise atomic operations.
>
> Unless you need to support memory outside the Rust AM, we can drop this.

I need to support pages that are concurrently mapped to user processes.
I think we decided these pages are outside the Rust AM if we only do
non-reference volatile IO operations on them from kernel space.

They are different than pages that are never mapped to user space, in
the sense that they can incur concurrent reads/writes from the user
space process, and we cannot require any kind of atomicity for these
reads/writes.


Best regards,
Andreas Hindborg



