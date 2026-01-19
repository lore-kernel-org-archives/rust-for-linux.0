Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956B4352945
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 10:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817502; cv=none; b=YKNr6vFCPKYpr1pdxt10zO2cepnyG5Ds2KDlNpiF9LnPESFHjx8FfrjTZ/P3WNyAOPGHlhxFGM32ok4EGD3dcZGgMNZ2ngeWsWFW6S4pmn7KxwJh+cc9TS+xHcMtv2n7vQx+e3yAfhA9yBqeBaRtcqU/GBu2faYYOIe5asBvV+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817502; c=relaxed/simple;
	bh=Ssx9cOeeaeOAkrAUdOFWwQkudSdrQ32uSi9dHfkU6K4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RZw5Q9Qfw5tMi3krBAUbPeD3xrbisq8U5l8ve+6udnEUX6gVrmX8lHQJTtgh1KHvyaUJ1tJtvB3zoboSKFVPVBlWfpt8YY5e7yHE7KjjzrfAsL3s/vhFuQZUPftLsyoIg+U0mq4qpN4uHcBvKL7JbxbGtsG+QcmKxo5lnEtVTtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pKZpNbm4; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pKZpNbm4"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47d5c7a2f54so35218185e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 02:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768817499; x=1769422299; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=myeEaOqT7ZtmafUikt8QRfhp72T8cvpHGYSTXcwxmj8=;
        b=pKZpNbm41xsltk89kAt6nc4LPDzVfcGdz7Jis0yCBBcSYuB4M0f6p0b7QzW4kZgGFz
         rdkX7C+Y45QqOJfmGLzUra6rSHw4rydi+Skgvi7PnHLMtP73vVWvlWn0T6CC+8H1Du1T
         AiFoqeWt/RMI6UfDxnq4egNV3AzPud3uwjyN+4a74/yr7ddavXjaT/sFKHq3AprEgI9Q
         Ge1qEh6kgwPMURGY0ScQY7dTsHqh1sMIdadiXHp8d36DYXR1pH1G0NGQPY1SACcF7+gH
         bwTduw7nm12oOeN8xfCCvXlahYM5SAIQ9GvyDIANBjXtGhqNZarRQ8k+Bd4E3DyhQWlx
         HACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817499; x=1769422299;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=myeEaOqT7ZtmafUikt8QRfhp72T8cvpHGYSTXcwxmj8=;
        b=arWRvH7Yjl9cfZ23rwWzh5vFB6vIctZ3k4ETpusHCWAagzqI2ybd+sScDksolGq6EY
         iHLYGdIefyuFzkJpwU1O/YzvxU2dAQVQPWqJG2UQSAaHTK5N9o8G3AYCwn/2fViiU1/l
         KFReSvmLdusuiAW5oRIQdCwFaG6PZN4f34djkxdntZ/yHfHmHcRLTko1dMxUJoSgRJOU
         PtBs7W+z1FNNNoHnTfv581TnMsS10y2g9ovBVjWzTGT6YXnpAT4z7X61eXBnBEuoCiQC
         gt30KgXLc2nKU1rsFfjazrw2hxVeqSPQo8/AkCKYCFevEeR7hK+/BvvdUQsft9D5Hjd+
         f5qw==
X-Forwarded-Encrypted: i=1; AJvYcCVWda1PjtFhOjQT8uoE14Cc2mmQPutBkjOER1C3Fn7W2QOh7cWk59GkPN2Z5bFakUAFglsv7TDgSfgOrn39yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbC15ZJVJZVXdee6A8NiXrEeGh1GlGsoOgw3ivl+RrW5BG03b0
	qoAGdF3eJhW80MclUQq7s911TOcSRpPVWjVjaSwer+5aDXFPYXnmV2vFvBUAjO5f3dA1dAD5fkx
	BwbDsEONse/UiSM94FQ==
X-Received: from wmbjv16.prod.google.com ([2002:a05:600c:5710:b0:480:39fd:8dae])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3484:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-4801e670bf9mr140160455e9.11.1768817499043;
 Mon, 19 Jan 2026 02:11:39 -0800 (PST)
Date: Mon, 19 Jan 2026 10:11:37 +0000
In-Reply-To: <20260118142623.1188141-1-jason.kei.hall@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260118142623.1188141-1-jason.kei.hall@gmail.com>
Message-ID: <aW4DWebqCg1c8Fgb@google.com>
Subject: Re: [PATCH v2] rust_binder: refactor context management to use KVVec
From: Alice Ryhl <aliceryhl@google.com>
To: Jason Hall <jason.kei.hall@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@google.com>, Carlos Llamas <cmllamas@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Jan 18, 2026 at 07:26:23AM -0700, Jason Hall wrote:
> Replace the linked list management in context.rs with KVVec.
> This simplifies the ownership model by using standard
> Arc-based tracking and moves away from manual unsafe list removals.
> 
> The refactor improves memory safety by leveraging Rust's contiguous
> collection types while maintaining proper error propagation for
> allocation failures during process registration.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://github.com/rust-for-linux/linux/issues/1215
> Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>

> -    pub(crate) fn register_process(self: &Arc<Self>, proc: ListArc<Process>) {
> +    pub(crate) fn register_process(self: &Arc<Self>, proc: Arc<Process>) -> Result {
>          if !Arc::ptr_eq(self, &proc.ctx) {
>              pr_err!("Context::register_process called on the wrong context.");
> -            return;
> +            return Err(EINVAL);
>          }
> -        self.manager.lock().all_procs.push_back(proc);
> +        self.manager
> +            .lock()
> +            .all_procs
> +            .push(proc, GFP_KERNEL)
> +            .map_err(Error::from)

This can be simplified to:

self.manager
    .lock()
    .all_procs
    .push(proc, GFP_KERNEL)?;
Ok(())

>      }
>  
>      pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Process) {
> @@ -108,8 +99,12 @@ pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Process) {
>              pr_err!("Context::deregister_process called on the wrong context.");
>              return;
>          }
> -        // SAFETY: We just checked that this is the right list.
> -        unsafe { self.manager.lock().all_procs.remove(proc) };
> +        // Safe removal using retain
> +        self.manager.lock().all_procs.retain(|p| {
> +            let p1 = Arc::as_ptr(p);
> +            let p2 = proc as *const Process;
> +            p1 != p2
> +        });

Please use Arc::ptr_eq() for this comparison (in both places). You may
change deregister_process to take an &Arc<Process> as argument to make
this work.

Also, I think we should shrink the `all_procs` vector if it becomes too
much larger than the number of procs. Let's say ... after removing a
process, if the capacity() is less than half of the length and less than
128, then we shrink the capacity.

>      }
>  
>      pub(crate) fn set_manager_node(&self, node_ref: NodeRef) -> Result {
> @@ -158,13 +153,11 @@ pub(crate) fn for_each_proc<F>(&self, mut func: F)
>          }
>      }
>  
> -    pub(crate) fn get_all_procs(&self) -> Result<KVec<Arc<Process>>> {
> +    pub(crate) fn get_all_procs(&self) -> Result<KVVec<Arc<Process>>> {
>          let lock = self.manager.lock();
> -        let count = lock.all_procs.iter().count();
> -
> -        let mut procs = KVec::with_capacity(count, GFP_KERNEL)?;
> -        for proc in &lock.all_procs {
> -            procs.push(Arc::from(proc), GFP_KERNEL)?;
> +        let mut procs = KVVec::with_capacity(lock.all_procs.len(), GFP_KERNEL)?;
> +        for proc in lock.all_procs.iter() {
> +            procs.push(Arc::clone(proc), GFP_KERNEL)?;
>          }

Let's change get_procs_with_pid() too. Both to use KVVec, and also let's
have it iterate all_procs() directly.

> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index 132055b4790f..c3676fc7785d 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -513,7 +513,9 @@ fn new(ctx: Arc<Context>, cred: ARef<Credential>) -> Result<Arc<Self>> {
>          )?;
>  
>          let process = list_process.clone_arc();
> -        process.ctx.register_process(list_process);
> +        process
> +            .ctx
> +            .register_process(Arc::from(list_process.as_arc_borrow()))?;

You do not need to create a ListArc<Process> in the first place.

 impl Process {
     fn new(ctx: Arc<Context>, cred: ARef<Credential>) -> Result<Arc<Self>> {
         let current = kernel::current!();
-        let list_process = ListArc::pin_init::<Error>(
+        let process = Arc::pin_init::<Error>(
             try_pin_init!(Process {
                 ctx,
                 cred,
                 inner <- kernel::new_spinlock!(ProcessInner::new(), "Process::inner"),
                 pages <- ShrinkablePageRange::new(&super::BINDER_SHRINKER),
                 node_refs <- kernel::new_mutex!(ProcessNodeRefs::new(), "Process::node_refs"),
                 freeze_wait <- kernel::new_condvar!("Process::freeze_wait"),
                 task: current.group_leader().into(),
                 defer_work <- kernel::new_work!("Process::defer_work"),
                 links <- ListLinks::new(),
                 stats: BinderStats::new(),
             }),
             GFP_KERNEL,
         )?;
 
-        let process = list_process.clone_arc();
-        process
-            .ctx
-            .register_process(Arc::from(list_process.as_arc_borrow()))?;
+        process.ctx.register_process(process.clone())?;
 
         Ok(process)
     }

Alice
