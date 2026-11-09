Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251741;
	b=rFZJ5vMDBlqqP1oF1yskZx+9JFSv0XaVAAcNcDxaqQE4VOvqG8LCmHcDosFsp01AzWev
	 m9nBa26scryZszjsXCQaAfNZvMaFrHOHzrwFlJFi4mqii4DS5LJIoNPzngK24CF0g5xUI
	 3RpnOLDodo2JB3RAxU5rkPx5/rEA7WKn9LkO1lKjryemRll6NhLhGOBINPZJhK205x29x
	 k52UINjuV/NJAzObgZlYUl+OXGeYlGExG2YmuRpzXN25jelxeRfPimWSB0qAP5AKaBWXE
	 tME2UagudFXwEdvOyFUxP48eKekovVfzXP5NAJCpw4uzfrcVmaOMo2XrLN3bVWyesJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GrUZJVeF5sY/cVx8v9rGUseT6GRoFxsf2dttb4YQUgo=;
	b=laubWnaRx/Z+YkuUrmjgOkpDni7GXsPGugmbN7tgW4BUqUwIlte7y8K+jMMZ7pLZBWfl
	 ITeU100kmdgOXA1+1zPb2j6ylcA6Twzzx0XwpzLZnGluE34IYaZIHJsnSCtCZxfqg7tPW
	 3xi5U9FwhOrlKtDggzZnN95LkMcvK5EkeEH+A6fdoKi6kYiWaOi7OEaPi5saYXJGOctz3
	 4+plZaxSkJfW5WwFrBZfa8ddSstD91IRAv08v+BWs1xev6spsz5I/uagT6X2E8a5Xk+WY
	 AQhUP5W/GTndQXtXiATc65LgSlPcZAmYINSo61GDC+rDCA9Xk/RBZuOSknI7r4cxh9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b62pqDy1;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAC1606A325
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Nov 2026 19:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCAC1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b62pqDy1
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed3f563739so7145ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 11:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794251740; x=1794856540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GrUZJVeF5sY/cVx8v9rGUseT6GRoFxsf2dttb4YQUgo=;
        b=b62pqDy14TCopaQGk/31fAvQW+KtHpoxHJYVFGmy4VkgmFW22BQfHeqxcaHnOvTP/7
         DLyXJKDQNu9FZTmJz37+rIhB6QrbnmmWWvlWmKCl8coLZ3G1pTDu7OArewcQn8E5msyp
         8HAKr3kzn0sLvBxZXiDcp8hevGxqyLPW5Qe9ckWIc8RG4mVwhWl5eA7oYqF3lBy3Z01Z
         NLTxAnu0DdgAjHzNxkt9MuFiIx1e6TvsIZJgRHvCp1aPyOQAsBpLdZh1yPt7IwejWOFA
         Z/dxDOda403RAJA7zfZKVKKtOqtLkwC7ZRyrWEvEP4Vquu0j2qwb9qBYjYflyF+Q8KCP
         7vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794251740; x=1794856540;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrUZJVeF5sY/cVx8v9rGUseT6GRoFxsf2dttb4YQUgo=;
        b=vjQhaTlfALHfTTZtfFa6tf61ZCn5RC1VP9T+0POfBKEvX6CStxSqVO7FLLggqN7noK
         drDE0Bz8DGykf1SaSee97t4DJc16Y4T1qd5O+l21SkVrkA/Y+JgFnDSjHtAxe2wt1PfU
         7DU4fVTW1o/nwd+V7c830rAW0HWt+GnvJLknpIiCKxlJ5x38W3nDrlN9r4xP1heYw5UU
         Aoz2qRcDKlwA948bL5aWBt/U3gOjW/k20bj5km5I/YYEijNH+6p4314ZNc42hAYKNk3e
         ZwgNMioGWYnfH2MB+l1izCgoH+zoiSCLIpGbg6gDzU92TLoZ2t4X1x3ESJuzVojI3V+n
         Cm2w==
X-Forwarded-Encrypted: i=1; AL+hErEOal08j3xTMVcvKBF1UOgx1LwErMjqpPXdOedEYBOhacCcL//By0ytcJbcmfhJATy2xQxfr62+u0UO93URgw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DlBvl17KcC2I8dm/Y1qrde4axANHV6YtWjAcdGTk0ZWzRayWO
	JmEPjEHGpkAh6Jpi6dhI1nGIT6t+An0xdgEzA74+5wvLkmGY23rmd68r+pY1yOvtHQ==
X-Gm-Gg: AYBFou0pgM+x/NQUHQBveuFs9Wf0y+rcp1EqSIh8GxQM7U3WDos1QLnn+BdY/OyHv8x
	vHuaCDaTfIHYrK+CLUwccsuKlY6J6kpxnZQFSfBYgU5q0dRI0oFfnqr0zZ3WQDcPpYhQ//iXC5n
	8P/6rOtB+4RWGV0n5cyUvNtfxqqgRiKsYC9PdWxIelIVSlhBEvFelyTYsqapjLBkTWRRHLcCEcw
	StbDYVC6fK1fVWVXPaHkoG21vfWKdY0LJjOB2blb6Ap5r02if0fPlLfRZGdb6jkd1y82weJGnC3
	LWRS9JTZGkMgufhK6lpzLixi1vtS4vFplX/4E865EXXL2xdt9QqFe/tls4fuVQ6Ycyp89WPxtfD
	V3AOA+TfhGtY1mn3SQhS7qsbmCCXMPDVaiSKyMchhk93QwVS0YuICtqlijQkvTtRmvrXHyGxcnM
	zAcwpeIf3SZJmtkzaj32v9t+oQYN/gUWWgiT1csHbrZ4bELmhVILDJfb9MN+kenIPr8Pymsn/u2
	WQUUO0iuj9meqnE13TTwus9oWt6DAzx37b5dNSHU/21S4rFDpQ9S7eXvQP2H5x2efOQ6fZbfGyC
	jg4OULPKzSkJyACW32Qtf1e36PmwEnOouTmBgvgXt0zL33JdaLEti0Jz5vmFKpazSkJaKaTrl2L
	17CVcezghCJl5kbleh234HW1pTdipS7rFZCzGrHtN16Mf5to+BJ22SLlw3+5TjbTzuYi/yJwsqW
	EV4Xf0Y8NPqXCR1g+m24b91b+HT/kqPSWHpB/uuri4xcULSJMa8WVacDcLqNAVVyJn
X-Received: by 2002:a17:902:e80d:b0:2d5:db38:8013 with SMTP id d9443c01a7336-2edb70335bemr923045ad.18.1794251739421;
        Mon, 09 Nov 2026 11:15:39 -0800 (PST)
Received: from google.com (25.229.125.34.bc.googleusercontent.com. [34.125.229.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e9dasm35868b3a.34.2026.11.09.11.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:15:38 -0800 (PST)
Date: Mon, 9 Nov 2026 19:15:34 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Chris Wiseman <chriswiseman@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] rust_binder: reject sync transaction with pending
 sync work
Message-ID: <avIb1n3zk7KKdFfj@google.com>
References: <18e61a85b0d13e9c.3137322e32332e3235332e313736.9c152.0000sendgmr@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18e61a85b0d13e9c.3137322e32332e3235332e313736.9c152.0000sendgmr@google.com>

On Sun, Nov 08, 2026 at 03:11:01PM +0000, Chris Wiseman wrote:
> When a thread replies to a transaction with TF_DEFER_COMPLETE, its
> BR_TRANSACTION_COMPLETE work item stays in inner.work_list while the
> next blocking read waits in Process.ready_threads. A new incoming
> synchronous transaction can then be queued behind that deferred
> completion in inner.work_list. If the thread's read buffer only has
> room for the deferred completion, the ioctl returns to userspace with
> inner.current_transaction cleared while the incoming synchronous
> transaction remains queued in inner.work_list.
> 
> If that thread sends an outgoing synchronous BC_TRANSACTION before
> draining its work queue, Thread::transaction_inner sets
> inner.current_transaction to Some(t_out), and the read phase of the
> same BINDER_WRITE_READ ioctl pops the pending incoming transaction and
> overwrites inner.current_transaction with Some(t_in). This orphans
> t_out from the sender's transaction stack so
> Thread::unwind_transaction_stack aborts on exit, leaving a permanent
> Arc<Thread> <-> DArc<Transaction> reference cycle that pins both
> Arc<Process> instances and their mapped ShrinkablePageRange pages
> after the processes exit.
> 
> Resolve the TODO in Thread::transaction_inner by rejecting outgoing
> synchronous transactions with EINVAL when inner.work_list contains any
> item where DeliverToRead::should_sync_wakeup() is true. Checking
> should_sync_wakeup() matches C Binder's BINDER_WORK_TRANSACTION check
> and ignores Node or NodeWrapper BR_INCREFS/BR_ACQUIRE items pushed
> onto inner.work_list when Transaction::new translates flat binder
> objects.
> 
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Fixes: 8eb05e8e47f1 ("rust_binder: add TF_DEFER_COMPLETE flag for avoiding userspace roundtrip")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Wiseman <chriswiseman@google.com>
> ---
>  drivers/android/binder/thread.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
> index f5965e838a96..3ca5c95695e4 100644
> --- a/drivers/android/binder/thread.rs
> +++ b/drivers/android/binder/thread.rs
> @@ -1393,8 +1393,6 @@ fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResu
>          info.to_pid = node_ref.node.owner.task.pid();
>          info.to_node_debug_id = node_ref.node.debug_id;
>          security::binder_transaction(&self.process.cred, &node_ref.node.owner.cred)?;
> -        // TODO: We need to ensure that there isn't a pending transaction in the work queue. How
> -        // could this happen?
>          let top = self.top_of_transaction_stack()?;
>          let list_completion = DTRWrap::arc_try_new(DeliverCode::new(
>              BR_TRANSACTION_COMPLETE,
> @@ -1407,7 +1405,9 @@ fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResu
>          // it with the new transaction.
>          {
>              let mut inner = self.inner.lock();
> -            if !transaction.is_stacked_on(&inner.current_transaction) {
> +            if inner.work_list.iter().any(|w| w.should_sync_wakeup())
> +                || !transaction.is_stacked_on(&inner.current_transaction)
> +            {
>                  binder_debug!(UserError, "got new transaction with bad transaction stack");
>                  return Err(EINVAL.into());
>              }
> -- 
> 2.56.0.317.g454f8302e1-goog
> 

If the issue happens when there is already a pending transaction, would
it be better to relocate the new check to top_of_transaction_stack(),
before we execute Transaction::new()? If possible, we can skip all the
unwinding associated with this. If not....

Reviewed-by: Carlos Llamas <cmllamas@google.com>

Thanks
--
Carlos Llamas
