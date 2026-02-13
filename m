Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317D154763
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 16:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770999656; cv=none; b=iqfVbYv8Tijjl6lx76+ZvEAW+fm6w+bOQFtgUi8n5O9mK9XWK/8keGJpf74xLZ/xY4S3VV8MKMphEOtiCSWqqxFkxDkPpPZyKtvvamlDf8+NRbFrXeO+o2Yg2B9p+m3BTzg0qKmmOHgit4ad+AhnTyhlmLRxND8tl5US3/Jy5m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770999656; c=relaxed/simple;
	bh=E5UBTKx1R+6Rxq9EJfforiQbYLQTpCoL7W90ku/j7jY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CUmSs4Ev4VuZOjSgXuCh1lDT5/MvYR9cSpD4tjRwRi3uwpSPLKxsTtJXl/9XlXk+R2fwbeO2jeE/c86AvsocdjbiHcSHMo5CLtCMVTHwj1BF/mRbkWp/0pha7myV9gqA/uAy6AnSVlbnq4LkcN5hpomNa45rZ+opXO4++p2Pnso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cSY4/v9m; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cSY4/v9m"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8db7f340b3so40880666b.3
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 08:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770999652; x=1771604452; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DQu1gUXRp8ebxI+NO5hrCYotkgjViwiMnrHXh1J3cbE=;
        b=cSY4/v9mdlS/B50ZtIASdslgKdujPH4ccLZ/5nGG2MEdczSCISfaTFpiSMv1NQSWjW
         B08IRVucft98ovZPYb3Qi3KgFTu2ZdT/1OpwQotDtE2kCLqmWLrKaErsOau1yM8bjfGt
         JjRkoT59n5FPFDviOmQ/1KGtBmRFntKRP4Y/J49cdu8TKvInBHz9LfiG3yavxsAPEbRn
         LmYrz9s4+j/eMnUrcbVNkgbixmGOfmqXIhlxObqhaNcapz4Ckszq+q+MHXmZzPFSTigg
         SGYyWTG7obHU9k5mZTS4UeN99In4yZ82GpKZJrXrf35Pv0znEnaV5iHncrf/sARHcyKt
         daCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770999652; x=1771604452;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQu1gUXRp8ebxI+NO5hrCYotkgjViwiMnrHXh1J3cbE=;
        b=qenYSrkudEwUMnpQPVO1DuSVimhwBXu1ZrlfeDn8xxwoqK8arEyiE3IgaLnrFr+Gdp
         ugQmMFY9z7wO7s5jeeW908B+WBz5hFKp9rN75TvrbXYs1NX89SsCKW6mHdWUzpLFAwAp
         xJL52KyclIxNe+8LibbBwyMm/tVQPqclx3X80WWDaFXEqnuhRKSAxz+n1cFJk0xy2hw6
         s/1OWi/MniLdWUJ1Bic+CCyt95REwJLfnugQp2Xf7h6542HPzRPHcKtQrjnbXH1I+nQZ
         7TeI8ZZ5KFuW/oGOiUSXi4wSm1ed01KHhJuN92SW1JwxSGv1yVK9JwNlN3nP8C+9h+Kf
         mFQg==
X-Forwarded-Encrypted: i=1; AJvYcCXzntMaZkz+3UdFXuKFoPkz1Z5rRHWz/X54K24xJJk1gW+2b0wjoWWg1R/4urSI1TuK+ktNkBw9BiwrhLVU1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjP35TCLme9UufcqX0vBXautYmXDW5kJcQnjFgMq5voNxQrgrD
	bwFHpsMRnVN8N07D02IFSpbKiJt45i01XWbYljP2FXxU4d/kWXngkI5Sid6W9djbWetcU6EjACk
	rRns3P7HKYWNwPqRuhw==
X-Received: from ejas18.prod.google.com ([2002:a17:906:3552:b0:b8e:f942:673b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e85:b0:b87:117f:b6f0 with SMTP id a640c23a62f3a-b8fb4476d29mr128328866b.30.1770999652278;
 Fri, 13 Feb 2026 08:20:52 -0800 (PST)
Date: Fri, 13 Feb 2026 16:20:51 +0000
In-Reply-To: <20260212-rust-de_thread-v2-2-7d274c4fd02e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212-rust-de_thread-v2-0-7d274c4fd02e@google.com> <20260212-rust-de_thread-v2-2-7d274c4fd02e@google.com>
Message-ID: <aY9PY9CsHjTAZ60z@google.com>
Subject: Re: [PATCH v2 2/2] rust: task: use atomic read for pid()
From: Alice Ryhl <aliceryhl@google.com>
To: Jann Horn <jannh@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <walmeida@microsoft.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

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

Thanks.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

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
