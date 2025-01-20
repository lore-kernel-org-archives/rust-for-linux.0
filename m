Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95A71E47B3;
	Mon, 20 Jan 2025 13:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737381553; cv=none; b=D+thd1f7t47qjeQpwIUTRjkJ823OlJ29qEIKi2gIhCqSkNpDV6/+NAlD8LHG6cw7yAoeATbtrPZYRKjUjlZKYWwcJO8cVMjUetRqQfjqstLvUSk7ZokcJwPvl2yv3KB3Uc/HZ69jCCTpOMcehijOjRvwf4fjbjlMFNR1ZBUDozk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737381553; c=relaxed/simple;
	bh=xX8Fslu/iNqWzv4/ioO5CGh56VQd2iiseKcRaRQi8os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u7dz2RVJMLXxIBgSWe9ATqw4Kdc7gFonJuTZ8zw19XEufOD8Ld85RHX6/TSoAwPdFO0pKEYsxbmSIEerNsioZdceDzcfUw/e0HSFsOnnEvMyGYOodvCANd6P6Nn/whKCVPwbVMP1/OBBeRU3hZRew/leUpvM9irtMf3Y18HLuVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOe43vZ7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOe43vZ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFBCC4CEDD;
	Mon, 20 Jan 2025 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737381553;
	bh=xX8Fslu/iNqWzv4/ioO5CGh56VQd2iiseKcRaRQi8os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OOe43vZ7mFmDOAtiU2TnshDSYqFVWoSsWtzLRhFxHaSiqwFxln+v6jhxBrPvoC7jZ
	 bTGpOf7M/wEWwTdtE1vunAbturi/2gKamuZtCPUtX7N8kYnt2fLbn4rWjWPRGS8jSP
	 m94fuzFClUEoa40zS2en2gSqZ5Q/5wcYeeIMUj5xHlzsjbr7VZ26XFppnoofqaEG3m
	 psPSGxLruWC2K36nkTvkVSbjIebvbXFY6ZFm8AxnzWwDuPNeyCwG+oDerhnuVR3Hc7
	 ow+5uEgQGGEjoTsiBTOxj4kcdc2t2Ul2xbdZktG0EDPrD1GTEuECj+5/XIKpr3ffbX
	 ZWxfs0aqBswxQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Matthew Wilcox"
 <willy@infradead.org>,  "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
  "Vlastimil Babka" <vbabka@suse.cz>,  "John Hubbard"
 <jhubbard@nvidia.com>,  "Liam R. Howlett" <Liam.Howlett@oracle.com>,
  "Andrew Morton" <akpm@linux-foundation.org>,  "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,  "Arnd Bergmann" <arnd@arndb.de>,  "Jann
 Horn" <jannh@google.com>,  "Suren Baghdasaryan" <surenb@google.com>,
  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Trevor Gross" <tmgross@umich.edu>,  <linux-kernel@vger.kernel.org>,
  <linux-mm@kvack.org>,  <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v12 8/8] task: rust: rework how current is accessed
In-Reply-To: <20250115-vma-v12-8-375099ae017a@google.com> (Alice Ryhl's
	message of "Wed, 15 Jan 2025 13:35:11 +0000")
References: <20250115-vma-v12-0-375099ae017a@google.com>
	<o9ZXQ40pZdDgfHHs1Le4Hz0NBb3Uwq9hJftjOGYIF9So3PWCUILYzHzbVUEBnyaSaYBubVRAGmImTjqaZ6BRLw==@protonmail.internalid>
	<20250115-vma-v12-8-375099ae017a@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 14:58:18 +0100
Message-ID: <87cyghd1tx.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> Introduce a new type called `CurrentTask` that lets you perform various
> operations that are only safe on the `current` task. Use the new type to
> provide a way to access the current mm without incrementing its
> refcount.
>
> With this change, you can write stuff such as
>
> 	let vma = current!().mm().lock_vma_under_rcu(addr);
>
> without incrementing any refcounts.
>
> This replaces the existing abstractions for accessing the current pid
> namespace. With the old approach, every field access to current involves
> both a macro and a unsafe helper function. The new approach simplifies
> that to a single safe function on the `CurrentTask` type. This makes it
> less heavy-weight to add additional current accessors in the future.
>
> That said, creating a `CurrentTask` type like the one in this patch
> requires that we are careful to ensure that it cannot escape the current
> task or otherwise access things after they are freed. To do this, I
> declared that it cannot escape the current "task context" where I
> defined a "task context" as essentially the region in which `current`
> remains unchanged. So e.g., release_task() or begin_new_exec() would
> leave the task context.
>
> If a userspace thread returns to userspace and later makes another
> syscall, then I consider the two syscalls to be different task contexts.
> This allows values stored in that task to be modified between syscalls,
> even if they're guaranteed to be immutable during a syscall.
>
> Ensuring correctness of `CurrentTask` is slightly tricky if we also want
> the ability to have a safe `kthread_use_mm()` implementation in Rust. To
> support that safely, there are two patterns we need to ensure are safe:
>
> 	// Case 1: current!() called inside the scope.
> 	let mm;
> 	kthread_use_mm(some_mm, || {
> 	    mm = current!().mm();
> 	});
> 	drop(some_mm);
> 	mm.do_something(); // UAF
>
> and:
>
> 	// Case 2: current!() called before the scope.
> 	let mm;
> 	let task = current!();
> 	kthread_use_mm(some_mm, || {
> 	    mm = task.mm();
> 	});
> 	drop(some_mm);
> 	mm.do_something(); // UAF
>
> The existing `current!()` abstraction already natively prevents the
> first case: The `&CurrentTask` would be tied to the inner scope, so the
> borrow-checker ensures that no reference derived from it can escape the
> scope.
>
> Fixing the second case is a bit more tricky. The solution is to
> essentially pretend that the contents of the scope execute on an
> different thread, which means that only thread-safe types can cross the
> boundary. Since `CurrentTask` is marked `NotThreadSafe`, attempts to
> move it to another thread will fail, and this includes our fake pretend
> thread boundary.
>
> This has the disadvantage that other types that aren't thread-safe for
> reasons unrelated to `current` also cannot be moved across the
> `kthread_use_mm()` boundary. I consider this an acceptable tradeoff.
>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


