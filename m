Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6187A37F8A1;
	Tue, 21 Apr 2026 06:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776753874; cv=none; b=M7YiGm16KEXPMuQLAEcucPKOONRwqRGophZLAwI6IIohVYxS5VGNVd8a2BmVT41M2wVXj2C2UZVhZCXIkm+j9jxY8fwkZJhoVupCe0vOqwoLCU8bFfNWJglJcyVIWamPtHINwjm6KgMzy5l05L2cbRyQIRMMiEcLxta0xL1Y2Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776753874; c=relaxed/simple;
	bh=bC/w0nfNR6uEOD/7Pf1gGfQEERVmykjqohcCa3y5ATQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWrLpkytx0s8eeh14sTCvujiwz1JpKocmDNRW93u8g9IBSZcwtQ9DD8IxZugVpo0dC2gp17sTbyv4K7YT/9qVXw59OAZ2XNgjZGSccuOtJP8N2EU6pFSf6Q1/Ofn+zpEOZdt/jRZvMWYlJgctLHSRLUBGLFGbZWC5Kirbg3gpJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MHUQQl/m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MHUQQl/m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37ADC2BCB0;
	Tue, 21 Apr 2026 06:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776753874;
	bh=bC/w0nfNR6uEOD/7Pf1gGfQEERVmykjqohcCa3y5ATQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHUQQl/mOlY39yBqVddDvv9ZsHesnpQYHcsQHvjyhFNeisyyLbrGM4zGKiXl/ajlR
	 QfOcf/4Lij+Pbu7TxebjQ+K4sRopMRZ8X/Zf0boANdReNfHmJZOtLN6chC2ftNQGeE
	 3l3XDReon0vaGn3cAs6+xj50UOTxYuPsIC4h9MnU=
Date: Tue, 21 Apr 2026 08:44:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashutosh Desai <ashutoshdesai993@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add task_work abstraction
Message-ID: <2026042140-trickily-apprehend-0076@gregkh>
References: <20260421063836.742965-1-ashutoshdesai993@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421063836.742965-1-ashutoshdesai993@gmail.com>

On Tue, Apr 21, 2026 at 06:38:36AM +0000, Ashutosh Desai wrote:
> The kernel's task_work API (include/linux/task_work.h) allows any
> kernel thread to queue a callback that runs on a specific task the
> next time it returns to user space (or on exit). The C interface
> requires manual lifetime management of the callback_head allocation
> and careful ordering of init_task_work() and task_work_add().
> 
> Add a safe Rust abstraction consisting of:
> 
>  - TaskWork<T>: an owned, heap-allocated work item. Allocating
>    with TaskWork::new() ties a user-supplied value T (bound by the
>    new TaskWorkItem trait) to a callback_head. Scheduling with
>    TaskWork::add() initializes the callback, transfers ownership to
>    the kernel, and returns Err((ESRCH, data)) if the target task is
>    already exiting, so callers can always recover the value.
> 
>  - TaskWorkItem: a trait for types that can be scheduled as a task
>    work item. Implementors provide a run() method that receives the
>    inner value by move when the callback fires.
> 
>  - NotifyMode: a type-safe enum wrapping task_work_notify_mode,
>    covering TWA_NONE, TWA_RESUME, TWA_SIGNAL, TWA_SIGNAL_NO_IPI,
>    and TWA_NMI_CURRENT.
> 
> The repr(C) layout of the internal TaskWorkInner<T> places
> callback_head at offset 0, which lets the C callback pointer be
> cast back to the full allocation. Option<T> in that struct permits
> moving the data out before dropping the allocation without a Drop
> impl on TaskWork<T>.
> 
> Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
> ---
>  rust/kernel/lib.rs       |   1 +
>  rust/kernel/task_work.rs | 158 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 159 insertions(+)
>  create mode 100644 rust/kernel/task_work.rs

Do you have a user for this binding so that we can see how it is being
used to determine if it is correct?

thanks,

greg k-h
