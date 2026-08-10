Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04083C1D64
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 23:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786405540; cv=none; b=IyppIo8Ugarn7WePQBnLDpvJz8aYndBc0ayiix3RA3n7pvkxdT6W9rOVQbHO25gF1xVIyYrJYrEvvP01OWRgR31fVr+/7DoAuXn+wxM4D6RkU+88afifw/JTmkBQwNklte6xD1OnOQez6bnwI7HXIwcR58/npV3SQNrsm2GvUtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786405540; c=relaxed/simple;
	bh=7oQW9UEh4FhBjngWgpMYzrhLQbdG1TFOQZWs5Sts+3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHD61OjaQ0wA/2Ajd57+2G2NxTTCdLuXV2bzdGqqBjknxyfk/UubYp/E9aq0HP5LKsRMTyvx7MZC9cz1DOFhRiMEmT4fqm8OR4CqLRJkPcIfZ0RCiidosJuGmcWtQsmsGcAdQG+8pjq6t3ZTQ9Vd0it9LCWP9UWQBX0lJHOnvb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p1JyDKG4; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p1JyDKG4"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cab97c86bdso27395ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 16:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786405538; x=1787010338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BSmjiU1tDKbUzSU+Zv3NJ2dqrsW8qHiyYg0xERaQDKE=;
        b=p1JyDKG459V2k/9iPaVzGHartjWXwzHXesSeBawjtll5VtDJ9g6RvW6ZE1dbJdeNfQ
         gEpDWxH2AHyUTUr9xJytc0JWsHUWAWwjuGxgnp8rMjUS2Yztc1bIUJdMCCsbkg1n8S3I
         I2bWDLEPGUOKCGY6/f3BTO8nD5nLP/Ll0bmfsGnHbQYtDxJWP0B9d8JeTavxEHUGYIfQ
         mo6a9tZ46jMpMlWXBU7+sMK9tPXeao7VJtWnkUFA6exMKnrLrYzqmAB/9aiZ8bi6hxbk
         oRKbiriK9Qs7R28rJzftR6w4KIHKqSjaLJv736p4nJE2xK3LFAsFQbk8Mz/hrK7Cbsuu
         UWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786405538; x=1787010338;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSmjiU1tDKbUzSU+Zv3NJ2dqrsW8qHiyYg0xERaQDKE=;
        b=ss+L0bkEGZOqpoVkxFJ4Gmr7cSz0NzaMiKSBu0SJvV8juZ5O9uhmd5+72BYFGvGHsx
         +IlCLCJ06WskEyNPKl1w0hXGFchBrMlX1n4bFxGB8s8e8TlBfDeP3dS7594QXZVcgZRh
         7NhNn3/lKVVWDcVUq/49Tx+kBLIVz3E7JLD99rt4DlfdpzIDATzoGoU61127S/yW0Qm2
         N1y9q++kxngRbFNG6/yFKkfFr/s+DLdM3EEwat1LLNH8Xl/LKnoI7Jw1iM9uGhHc0eiA
         3XdREY5PaNGbMmo8HJMZssd/aBVwEEJSWCBR6HUtaKv/2WFZDXfvziTZ4zDatMrh/eHX
         nQFA==
X-Forwarded-Encrypted: i=1; AHgh+RqeUqmL+SBIulBCJ73qn1WlbU1dRC9GkD+5u5JnBCOZ2UBynvkO1sAyVJMsXlpzVw+p41Odev6Kq0fRhihBnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUAstBeKDzWHGoXiRNd841e/TC7lkEAOOA1YeXQHNWvsD8mlbC
	fnyv+Nid/r7hw5BQnvhGvsX9K1gjYJIFGcUPSwbjlLmh78EMEQi9YxbFYCS3YP5JmQ==
X-Gm-Gg: AR+sD10tQQRfvFrWr9woGjTo9Kf9Q1guH8gOZcvP9PEz7Wi6q2EllsCaSqYeEwxSxeQ
	DbWv/ZgL3sx2+NBCj25qk32Jh528QZO/ZxTTWgbFBEX5NYlJ04bzXr9RIeiJWX2mxO2Ankz0P4k
	ZauXNwF4wJwfMnuyu8+I5CmPi/6wykZNirYfG6RK/pOEuTlQA8nk6LrUVNnAXSsCCKoHjpU0YAB
	qRUJr3mCzuytPC1K8IDDGJBJ0EBn53uc7c3QeU5J0UcBOfeCKt1wi96Vr7MmBU8DcMeYqeEYHeU
	znI7fbaC4jv2CNv2vQLYgHCSbjY1ZNCSj7lanhOVOLrO1BM9i6+ZSJyKuWqbMP/Pyoy4qWOTuA5
	EigJsPE5ibu9x7kzgh7HsVg9n2lDTOVdg7Avwbr2f/DrUi72lIgaHFueeaafDPkVyE7zK7HWMpE
	uJWSmKyOrZMNmL04C8XJEO2RJYJ30w6/YyMLDQZsGyTQ92BA3QuSmn4qMrHm/bH+I+wTNlH1s0B
	JuIW3k4y1y3zw09W3dvW8WyiolKiJCHabMpW+WpjS9sXIAqtRZ85VcFI9u1csmYwS2jvILwFsUf
	ckT4QIu7HSl+Fj18kA==
X-Received: by 2002:a17:902:d984:b0:2cf:41ba:96b8 with SMTP id d9443c01a7336-2d3107ba82fmr1811185ad.6.1786405537222;
        Mon, 10 Aug 2026 16:45:37 -0700 (PDT)
Received: from google.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d5381dd3sm1242042a91.16.2026.08.10.16.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:45:36 -0700 (PDT)
Date: Mon, 10 Aug 2026 23:45:32 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Todd Kjos <tkjos@android.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust_binder: add TF_DEFER_COMPLETE flag for avoiding
 userspace roundtrip
Message-ID: <anpinBy0adT0JDVn@google.com>
References: <20260722-defer-complete-v2-1-6c67af0e2ac2@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-defer-complete-v2-1-6c67af0e2ac2@google.com>

On Wed, Jul 22, 2026 at 09:09:22PM +0000, Alice Ryhl wrote:
> Outgoing transactions are able to send a message and wait for its reply
> in a single ioctl. Why not avoid a userspace roundtrip by applying the
> same logic for replying to incoming messages and waiting for the next
> incoming message?
> 
> Generally, when you send a reply using BC_REPLY, the kernel sends
> BR_TRANSACTION_COMPLETE as a reply to BC_REPLY right away. The
> BR_TRANSACTION_COMPLETE command indicates that it's safe for userspace
> to free any resources associated with this message (such as embedded fds
> or Binder nodes). However, the BR_TRANSACTION_COMPLETE message is
> problematic because after BC_REPLY is issued, there will be a pending
> message for userspace. The kernel will refuse to sleep for incoming
> messages in this scenario.
> 
> The way this is handled for outgoing transaction is through a mechanism
> known as deferred delivery of BR_TRANSACTION_COMPLETE. The idea is that
> when you send an outgoing transaction, then we do not return to
> userspace right away if BR_TRANSACTION_COMPLETE is the only pending
> message. This patch adds a new flag called TF_DEFER_COMPLETE that lets
> userspace opt-in to the same deferred delivery mechanism for
> BR_TRANSACTION_COMPLETE when using BC_REPLY.
> 
> Given this new uapi, we can adjust sendReply in userspace libbinder
> so that it writes the BC_REPLY command into mOut but does not flush the
> buffer to the kernel. Then, userspace simply continues running until it
> returns all the way out to the top-level joinThreadPool() loop, which
> calls into the kernel to get the next incoming transaction. At this
> point, mOut is flushed, sending the reply. The same ioctl then proceeds
> to sleep for an incoming message.
> 
> Userspace only actually specifies TF_DEFER_COMPLETE when the Parcel does
> not contain fds or refcounts on binder objects. This is because
> otherwise said fd or binder node will not be freed until the binder
> thread receives another incoming transaction, which could be a long
> time. In the case of fds, this is especially important because delaying
> fclose() can result in processes hanging because they read from a pipe
> that isn't being closed due to fclose() not getting called. Note that
> even if TF_DEFER_COMPLETE is not specified for this transaction, it can
> still be useful to defer the BC_REPLY command, as it can still avoid a
> userspace roundtrip when a new incoming transaction is available right
> away.

The processing of a deferred COMPLETE doesn't change right? It doesn't
matter if the kernel rejects / ignores the new flag, userspace will
still follow the same path. 100% backward-compatible then.

> 
> Observing the cuttlefish logs while booting with this change shows that
> there were 4297 opportunities for this optimization to kick in (that is,
> boot invoked BC_REPLY 4297 times). Out of those, 3441 binder ioctls sent
> and received a transaction in the same ioctl. This indicates that we
> successfully eliminated a syscall on the server side for 80% of incoming
> transactions. Generally, this means that a server is now able to handle
> incoming messages using one syscall per incoming message (for each
> incoming transaction, the syscall handles one BC_FREE_BUFFER and
> BC_REPLY command, and then waits for the next incoming transaction).
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - Return deferred thread work instead of the process global work if
>   there is work in the process global list.
> - Link to v1: https://lore.kernel.org/r/20260716-defer-complete-v1-1-ce0e38d30dc6@google.com
> ---
>  drivers/android/binder/defs.rs      |  3 +-
>  drivers/android/binder/process.rs   |  8 ++++++
>  drivers/android/binder/thread.rs    | 55 +++++++++++++++++++++++++++++++------
>  include/uapi/linux/android/binder.h |  1 +
>  4 files changed, 57 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/android/binder/defs.rs b/drivers/android/binder/defs.rs
> index 8ac9bdd7a499..cc4becd6e168 100644
> --- a/drivers/android/binder/defs.rs
> +++ b/drivers/android/binder/defs.rs
> @@ -77,7 +77,8 @@ macro_rules! pub_no_prefix {
>      TF_ONE_WAY,
>      TF_ACCEPT_FDS,
>      TF_CLEAR_BUF,
> -    TF_UPDATE_TXN
> +    TF_UPDATE_TXN,
> +    TF_DEFER_COMPLETE,
>  );
>  
>  pub(crate) use uapi::{
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index 1778628d8acd..4f23a7cf7352 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -686,8 +686,16 @@ pub(crate) fn get_work(&self) -> Option<DLArc<dyn DeliverToRead>> {
>      pub(crate) fn get_work_or_register<'a>(
>          &'a self,
>          thread: &'a Arc<Thread>,
> +        thread_has_deferred_work: bool,
>      ) -> GetWorkOrRegister<'a> {
>          let mut inner = self.inner.lock();
> +
> +        if thread_has_deferred_work && !inner.work.is_empty() {
> +            if let Some(work) = thread.pop_work_even_if_deferred() {
> +                return GetWorkOrRegister::Work(work);
> +            }
> +        }
> +
>          // Try to get work from the process queue.
>          if let Some(work) = inner.work.pop_front() {
>              return GetWorkOrRegister::Work(work);
> diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
> index a51821dde0ad..c4d67b9ef39b 100644
> --- a/drivers/android/binder/thread.rs
> +++ b/drivers/android/binder/thread.rs
> @@ -572,9 +572,21 @@ fn get_work_local(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn Deliv
>      // mangled symbol names.
>      #[export_name = "rust_binder_wait"]
>      fn get_work(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRead>>> {
> +        let thread_has_deferred_work;
> +
>          // Try to get work from the thread's work queue, using only a local lock.
>          {
>              let mut inner = self.inner.lock();
> +
> +            // The process_work_list boolean is used to make us go to sleep even if there is work
> +            // in the thread todo-list, but it doesn't apply to the process todo-list. Furthermore,
> +            // work in the thread todo-list must still be delivered before the process list.
> +            //
> +            // Thus, in some scenarios we must return the thread work now even if we were requested
> +            // to wait. Adjust `process_work_list` to `true` accordingly.
> +            inner.process_work_list |= inner.looper_need_return;
> +            inner.process_work_list |= !wait;
> +
>              if let Some(work) = inner.pop_work() {
>                  return Ok(Some(work));
>              }
> @@ -582,18 +594,26 @@ fn get_work(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRe
>                  drop(inner);
>                  return Ok(self.process.get_work());
>              }
> +
> +            // Note that if the thread list is empty, then the call to `pop_work()` has changed
> +            // `process_work_list` back to `false` even if we set it to `true` above.
> +            thread_has_deferred_work = inner.process_work_list;

I might be getting this wrong, but for the new TF_DEFER_COMPLETE case,
we have !process_work_list and !work_list.is_empty(). Then pop_work()
does not touch process_work_list because it's already false.

So we set thread_has_deferred_work to false? Maybe this was meant to be:
	thread_has_deferred_work = !inner.work_list.is_empty()

>          }
>  
>          // If the caller doesn't want to wait, try to grab work from the process queue.
>          //
>          // We know nothing will have been queued directly to the thread queue because it is not in
> -        // a transaction and it is not in the process' ready list.
> +        // a transaction and it is not in the process' ready list. We also know the thread list has
> +        // no deferred work due to the `inner.process_work_list |= !wait` call above.
>          if !wait {
>              return self.process.get_work().ok_or(EAGAIN).map(Some);
>          }
>  
>          // Get work from the process queue. If none is available, atomically register as ready.
> -        let reg = match self.process.get_work_or_register(self) {
> +        let reg = match self
> +            .process
> +            .get_work_or_register(self, thread_has_deferred_work)
> +        {
>              GetWorkOrRegister::Work(work) => return Ok(Some(work)),
>              GetWorkOrRegister::Register(reg) => reg,
>          };
> @@ -609,14 +629,18 @@ fn get_work(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRe
>              inner.looper_flags &= !(LOOPER_WAITING | LOOPER_WAITING_PROC);
>  
>              if signal_pending || inner.looper_need_return {
> -                // We need to return now. We need to pull the thread off the list of ready threads
> -                // (by dropping `reg`), then check the state again after it's off the list to
> -                // ensure that something was not queued in the meantime. If something has been
> -                // queued, we just return it (instead of the error).
> +                // We need to return now.
> +                //
> +                // We need to pull the thread off the list of ready threads (by dropping `reg`),
> +                // then check the state again after it's off the list to ensure that something was
> +                // not queued in the meantime. If something has been queued (or if there is
> +                // deferred work), we just return it (instead of the error).
>                  drop(inner);
>                  drop(reg);
>  
> -                let res = match self.inner.lock().pop_work() {
> +                inner = self.inner.lock();
> +                inner.process_work_list = true;
> +                let res = match inner.pop_work() {
>                      Some(work) => Ok(Some(work)),
>                      None if signal_pending => Err(EINTR),
>                      None => Ok(None),
> @@ -674,6 +698,12 @@ pub(crate) fn push_return_work(&self, reply: u32) {
>          self.inner.lock().push_return_work(reply);
>      }
>  
> +    pub(crate) fn pop_work_even_if_deferred(&self) -> Option<DLArc<dyn DeliverToRead>> {
> +        let mut thread_inner = self.inner.lock();
> +        thread_inner.process_work_list = true;
> +        thread_inner.pop_work()
> +    }
> +
>      fn translate_object(
>          &self,
>          obj_index: usize,
> @@ -1398,8 +1428,15 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
>              let process = orig.from.process.clone();
>              let allow_fds = orig.flags & TF_ACCEPT_FDS != 0;
>              let reply = Transaction::new_reply(self, process, info, allow_fds)?;
> -            // Not notifying: Reply to current thread.
> -            let _ = self.inner.lock().push_work(completion);
> +            {
> +                // This performs a deferred push so that `read` can wait for the next incoming
> +                // transaction without a userspace roundtrip.
> +                let mut inner = self.inner.lock();
> +                inner.push_work_deferred(completion);
> +                // However, if `TF_DEFER_COMPLETE` is not set, then set `process_work_list` to make
> +                // the push non-deferred. This forces a userspace roundtrip.
> +                inner.process_work_list |= info.flags & TF_DEFER_COMPLETE == 0;

If there is already a push_work() and a push_work_deferred() why use
process_work_list directly? Is it to avoid an if/else?

> +            }
>              orig.from.deliver_reply(Ok(reply), &orig, None);
>              Ok(())
>          })()
> diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/android/binder.h
> index 701cad36de43..96e5b0184a1b 100644
> --- a/include/uapi/linux/android/binder.h
> +++ b/include/uapi/linux/android/binder.h
> @@ -296,6 +296,7 @@ enum transaction_flags {
>  	TF_ACCEPT_FDS	= 0x10,	/* allow replies with file descriptors */
>  	TF_CLEAR_BUF	= 0x20,	/* clear buffer on txn complete */
>  	TF_UPDATE_TXN	= 0x40,	/* update the outdated pending async txn */
> +	TF_DEFER_COMPLETE = 0x80,	/* defer transaction complete to userspace */
>  };
>  
>  struct binder_transaction_data {
> 
> ---
> base-commit: 2cedf2272f1bb42471e646868ac572cc5752bd91
> change-id: 20260715-defer-complete-f1dea9af13a8
> 
> Best regards,
> -- 
> Alice Ryhl <aliceryhl@google.com>
> 
