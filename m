Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04A822ACEB
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 16:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771001388; cv=none; b=EYCeFZRx/lupzBhe1hzxgpfWZL9CpoJKpHjwaAUX02vkhukTSnmmtPnlpMGMvxUuLBeMlD34gGtU9kxOyYswB0A9Qd9DZ3TIhhnRnYaTSRnTQzHZMP1OuNgrUnGry8Ba9vh4JidwYZrxPD0XXVPCeSbr2VwvCP4Ars7NiWBHEro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771001388; c=relaxed/simple;
	bh=LpZ7jDw6BENdZH0lzr7oUAIv2oIZ8oNIiCVUk6nBg9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIGajdp2zjV93P3VtkR/iGhbumlYm6i/eVsWVcATQ76KExzGeEEUf7M33Ehv0Dz4Rx+mH9l8c9inqSOBJQ/wGqNj2F9EwG6GWABAp0YMiURy6QAxB1xN7Nhh90SbIyPF1gsNKKpotqFGPc1iZuSOSvvMSEMh0BJg7gxdGcDwauk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYASa03O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYASa03O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A33C19421;
	Fri, 13 Feb 2026 16:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771001388;
	bh=LpZ7jDw6BENdZH0lzr7oUAIv2oIZ8oNIiCVUk6nBg9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYASa03Os0VPhD1XHJ4ISfQbJC06jf4Qys0nBL3tdV9TcWczesgbhv96UXkqh+B+x
	 y3RFfEQ9D9Q+feuMDxZ8m/fy2wliOX8gTQLy0j5T5B1AVfed9BAn9Xq/WQxWLlhrGQ
	 lgNL5RwRSVTtJ2oxhJZhntb02k3m6+BNUzSWe0Bpi1GyRsjOOuqxCHbL3s6YQuPKB8
	 SSZFlVLlAfQsWS9KemAmGIHcV826bQSrx95MWFFuAwTdqNgW64Lcl/WeGx5T+a/hgX
	 4S/Dm6lsjV44B9g1F3yY5EUua4Sq/FSkqleMXQ4iOdu5MyqrcZLiFC02vHdnJgsAZe
	 5inUoRnQfgQrw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id F1128F40069;
	Fri, 13 Feb 2026 11:49:46 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 13 Feb 2026 11:49:46 -0500
X-ME-Sender: <xms:KlaPaeNBSc3Oav1rKp-pMqi81VJh0K4FtjEo-h9FZ2Odc45FNoHDDw>
    <xme:KlaPaSJHJwE8DBMhH2c3rnTKIlOinoEZsxKB0014qfARrQmnWTtpZbWGXIb8t9DSF
    p0QlO3E-xw0uT3ktEn87OAuWvUTq0yOOtwLhsQ9e6_4EA2IPJXH7w>
X-ME-Received: <xmr:KlaPaYpdZPYD6Sd9-kc7heCvx6REhmLx8iOL7XNdpcwKDJsqS7CdJIC9vQzvWxeu5DogJ3RWAQYkutVP18WzbwZrNnBTJmt2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdekjeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ehveekhfdvvefgveehjefgvdfgueeuleevieevuddtudduveefleekvdekkeevteenucff
    ohhmrghinheprghspghpthhrrdhpihgunecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudegpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehjrghnnhhhsehgohhoghhlvgdrtghomhdprh
    gtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhies
    ghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonh
    hmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    grlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhoshhs
    sehumhhitghhrdgvughupdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:KlaPaeMOHJqpNFzWfmvLy668Jdz5g5lFHFyqIBHljdATAkCLxKC3OA>
    <xmx:KlaPaRjcEUlXVQPF0YlBin5qQGc5LX4AnYu7ay1rDd0iegN8ZhagnA>
    <xmx:KlaPaSbGWB_gitdBKrYRF8CksMB01n1c8-JXG1Q0FYC-_wLqFliiEw>
    <xmx:KlaPaVgTlvzFGePXmYCDRaPN4vYFTnj6kxfVOJuXnRB_s5ZLlJfmTQ>
    <xmx:KlaPaUZhnA1PjvS5xPeK8-EtvacfWfoRPMaCGqyw3UShahs7FUVPHe7J>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Feb 2026 11:49:46 -0500 (EST)
Date: Fri, 13 Feb 2026 08:49:45 -0800
From: Boqun Feng <boqun@kernel.org>
To: Jann Horn <jannh@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rust: task: use atomic read for pid()
Message-ID: <aY9WKRQonrMopq2s@tardis.local>
References: <20260212-rust-de_thread-v2-0-7d274c4fd02e@google.com>
 <20260212-rust-de_thread-v2-2-7d274c4fd02e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-rust-de_thread-v2-2-7d274c4fd02e@google.com>

On Thu, Feb 12, 2026 at 11:12:07PM +0100, Jann Horn wrote:
> (Note: This is not a bugfix, it just cleans up an incorrect assumption.)
> 
> Task::pid() wrongly assumes that task::pid remains constant until the task
> refcount drops to zero.
> 
> However, Linux has a special quirk where, when execve() is called by a
> thread other than the thread group leader (the main thread), the thread
> calling execve() swaps its identity with the thread group leader's,
> becoming the new thread group leader. This means task::pid can't be assumed
> to be immutable for non-current tasks.
> (The actual swapping of PIDs is implemented in exchange_tids().)
> 
> Signed-off-by: Jann Horn <jannh@google.com>

Reviewed-by: Boqun Feng <boqun@kernel.org>

Regards,
Boqun

> ---
>  rust/kernel/task.rs | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index 91ad88cdfd3b..de0d90b47862 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -10,6 +10,8 @@
>      mm::MmWithUser,
>      pid_namespace::PidNamespace,
>      sync::aref::ARef,
> +    sync::atomic::ordering::Relaxed,
> +    sync::atomic::Atomic,
>      types::{NotThreadSafe, Opaque},
>  };
>  use core::{
> @@ -206,9 +208,13 @@ pub fn as_ptr(&self) -> *mut bindings::task_struct {
>  
>      /// Returns the PID of the given task.
>      pub fn pid(&self) -> Pid {
> -        // SAFETY: The pid of a task never changes after initialization, so reading this field is
> -        // not a data race.
> -        unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
> +        // SAFETY: The pid of a task almost never changes after initialization,
> +        // so reading this field is usually not a data race.
> +        // The exception is a race where the task is part of a process that
> +        // goes through execve(), see exchange_tids().
> +        // A temporary mutable pointer is created, but only actually used for
> +        // a load.
> +        unsafe { Atomic::from_ptr(&raw mut (*self.as_ptr()).pid).load(Relaxed) }
>      }
>  
>      /// Returns the UID of the given task.
> 
> -- 
> 2.53.0.273.g2a3d683680-goog
> 
