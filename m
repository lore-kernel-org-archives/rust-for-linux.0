Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EAF28688D;
	Thu, 12 Feb 2026 17:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770916432; cv=none; b=ctXBkxhxWudRBpYwPYfVIZIMznWQ/pZE8yDdHe8YZRtZetpPv0iunK73Md4UfXkjiNiM0X5lyki6zEtpgoSasxRHBqbbj3CzmDhgLsK1/bGUr4tRYMafTbJzdPxhwwVW1kGc3WWEE9sqU2Tm7Nm9lsfmKfovgIwHErbKUK/5z94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770916432; c=relaxed/simple;
	bh=aKNiohvoRx9lE3DcnNCrKRs4ltP/UUdVyhPTzidgMRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rp00IyHjHjGxmSrmiYIb2irni1YGIo3fRUOsneoMarDx/Wzam6pE4j2Z/MaJlUhxzXXPE35tUwPKyuAWSXQIYEed0RcAgnLdEWrlb4jRQrYPdrA5a6BR6fNOTl9gtl/zaEuZXqi1DNO7uykfda3XSq0xexmENyGhd3zz7LD4cfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eelCRMXx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eelCRMXx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09F5C4AF0B;
	Thu, 12 Feb 2026 17:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770916432;
	bh=aKNiohvoRx9lE3DcnNCrKRs4ltP/UUdVyhPTzidgMRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eelCRMXxn2ybFeMDB4zsh8ILyqYpNl1jr9lG5i+UcyLMDkD0WlKIttlDi/C6GUOV0
	 JnhTB3wwY3dIKOfdBTvNTVPAFAVP5Tiv2c9eggLcfdsUFxfQdYAOQy8dmLtiF67gRj
	 Xa1C1XBUJZspuLRGFbkXzyvru7YBoRMnhTq+Q8ZOGZvc1hCcL5JHX/cruJvTUtpboB
	 REVbJMRQDbLqEDG2PpxCO3xZ2aB7PvfecXoAGj+ubxp/E12o8ywojl09n/rbM2WeVR
	 Pv+OVxigCkCaboC+OarLxPnw5MmBkcQSZUUaCQO9EQXrn6xBby/mUppqZpoYrpPE7o
	 4kACpjVj/v+Lw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id D063CF4006A;
	Thu, 12 Feb 2026 12:13:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 12 Feb 2026 12:13:50 -0500
X-ME-Sender: <xms:TQqOaWNkqL1Vzeb6lCANPLvm_ZFWFf94of2m1563sGakiA9jiGNrLQ>
    <xme:TQqOaTc4ko8MB26iW9p2y_aoC_Z-uEkqjhmutrA-1eA3hztzkgtLVNsCqJB7tkx9C
    Vmt5s_E4-Hk3o_o9wnxWA3Tq0CNVFTltEKmRwvkc7Ze8NDfKZe_lQ>
X-ME-Received: <xmr:TQqOaYyYlaJMSeGhE3qZbKryIBxKt1-C5Gdg4tSgAZvh9R2EVEfXghMDqkuhSD-wC2kf53gUwmnv0GHFSl8qnOx6vRuWWti2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdehleegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekfeetgeejleffhfejkeejffelffeuheeigfejkeetgefghfefieefvedujeffkeenucff
    ohhmrghinheprghspghpthhrrdhgrhhouhhppdgrshgpphhtrhdrphhiugdpphhiugdrrh
    gvrggupdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlh
    hithihqdduieejtdelkeegjeduqddujeejkeehheehvddqsghoqhhunheppehkvghrnhgv
    lhdrohhrghesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedugedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepjhgrnhhnhhesghhoohhglhgvrdgtohhmpdhrtghp
    thhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrg
    hrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgr
    ihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghl
    ihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhsshesuh
    hmihgthhdrvgguuhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:TQqOaQ1PS4xnt7ZpBMUdzGEt7Dd1kwJLuZNnMrRQ59HwUYA51O7kGQ>
    <xmx:TQqOaXfW8stG-Aq__UEAuu0z1AEYbnZq6GMktCkhCQSnZRvjfB41XA>
    <xmx:TQqOadXLgy37rybKZKRf0KKC-cDxVJQn2rA-jzxGkCP3PP0RO9-q2g>
    <xmx:TQqOaX880O9uDnPD0VRDUklY3KLwkbYF8MsQ8CGv7j-el2KOR0fDrg>
    <xmx:TgqOafh73sW8aJRQdkGyZPHy7fqntEyOgRBHtTTtl1_VLiqP7r2sMlns>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Feb 2026 12:13:49 -0500 (EST)
Date: Thu, 12 Feb 2026 09:13:48 -0800
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
Subject: Re: [PATCH] rust: task: clean up safety issues wrt de_thread()
Message-ID: <aY4KTKEeljWt2NfH@tardis.local>
References: <20260212-rust-de_thread-v1-1-948f5b992624@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-rust-de_thread-v1-1-948f5b992624@google.com>

On Thu, Feb 12, 2026 at 05:44:15PM +0100, Jann Horn wrote:
> (Note: This is not a bugfix, it just cleans up incorrect assumptions.)
> 
> Task::pid() and Task::group_leader() assume that task::pid and
> task::group_leader remain constant until the task refcount drops to zero.
> 
> However, Linux has a special quirk where, when execve() is called by a
> thread other than the thread group leader (the main thread), the thread
> calling execve() swaps its identity with the thread group leader's,
> becoming the new thread group leader. This means task::pid and
> task::group_leader can't be assumed to be immutable for non-current tasks.
> (The actual swapping of PIDs is implemented in exchange_tids(); the change
> of leadership is in de_thread().)
> 
> For reference, you can see that accessing the ->group_leader of some random
> task requires extra caution in the prlimit64() syscall, which grabs the
> tasklist_lock and has a comment explaining that this is done to prevent
> races with de_thread().
> 

Thank you for the patch. I think it's actually a fix to the API, so we
need to Cc: stable here. Could you also split the patches into two? One
is moving the `group_leader()` into `CurrentTask` and the other is using
*atomic load* to read `pid` (see below)?

> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  rust/kernel/task.rs | 34 ++++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index 49fad6de0674..989165116278 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -103,7 +103,7 @@ macro_rules! current {
>  unsafe impl Send for Task {}
>  
>  // SAFETY: It's OK to access `Task` through shared references from other threads because we're
> -// either accessing properties that don't change (e.g., `pid`, `group_leader`) or that are properly
> +// either accessing properties that don't change or that are properly
>  // synchronised by C code (e.g., `signal_pending`).
>  unsafe impl Sync for Task {}
>  
> @@ -204,23 +204,13 @@ pub fn as_ptr(&self) -> *mut bindings::task_struct {
>          self.0.get()
>      }
>  
> -    /// Returns the group leader of the given task.
> -    pub fn group_leader(&self) -> &Task {
> -        // SAFETY: The group leader of a task never changes after initialization, so reading this
> -        // field is not a data race.
> -        let ptr = unsafe { *ptr::addr_of!((*self.as_ptr()).group_leader) };
> -
> -        // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
> -        // and given that a task has a reference to its group leader, we know it must be valid for
> -        // the lifetime of the returned task reference.
> -        unsafe { &*ptr.cast() }
> -    }
> -
>      /// Returns the PID of the given task.
>      pub fn pid(&self) -> Pid {
> -        // SAFETY: The pid of a task never changes after initialization, so reading this field is
> -        // not a data race.
> -        unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
> +        // SAFETY: The pid of a task almost never changes after initialization,
> +        // so reading this field is usually not a data race.
> +        // The exception is a race where the task is part of a process that
> +        // goes through execve(), see exchange_tids().
> +        unsafe { ptr::addr_of!((*self.as_ptr()).pid).read_volatile() }

Please use 

    Atomic::from_ptr(&raw const (*self.as_ptr()).pid).load(Relaxed)

here. Or maybe you want to use `atomic_load()` [1]? We should avoid
using arbitrary `read_volatile()`.

[1]: https://lore.kernel.org/rust-for-linux/20260120115207.55318-3-boqun.feng@gmail.com/

Regards,
Boqun

>      }
>  
>      /// Returns the UID of the given task.
> @@ -345,6 +335,18 @@ pub fn active_pid_ns(&self) -> Option<&PidNamespace> {
>          // `release_task()` call.
>          Some(unsafe { PidNamespace::from_ptr(active_ns) })
>      }
> +
> +    /// Returns the group leader of the current task.
> +    pub fn group_leader(&self) -> &Task {
> +        // SAFETY: The group leader of the current task never changes in syscall
> +        // context (except in the implementation of execve()).
> +        let ptr = unsafe { *ptr::addr_of!((*self.as_ptr()).group_leader) };
> +
> +        // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
> +        // and given that a task has a reference to its group leader, we know it must be valid for
> +        // the lifetime of the returned task reference.
> +        unsafe { &*ptr.cast() }
> +    }
>  }
>  
>  // SAFETY: The type invariants guarantee that `Task` is always refcounted.
> 
> ---
> base-commit: 192c0159402e6bfbe13de6f8379546943297783d
> change-id: 20260212-rust-de_thread-0ad9154aedb0
> 
> --  
> Jann Horn <jannh@google.com>
> 
