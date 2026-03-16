Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0205439C639
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 14:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670334; cv=none; b=B/cYcRvT7lzk+WxofJnaaJtAV66/FT0dsxxlyM4PQZpxiOUjlPPxaVgG9YdnSd9vj6gNlAfusL8xE0w9WSOX8v0bFF76QwGlbtgL8r3Du9UqzeghZ9vGT7ovgMnbNPgY7iCLWfantI0l0bU0qKlKYLmPnLYrRf4d40U04K5V/Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670334; c=relaxed/simple;
	bh=ULPs/NgBTZBGkoC7acvByANZrSjbAc0GYNR2ggy3bnA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hzIbZqg0PsVjP2N0hA/yetZkStEHmGrSNlvNDueLf5dOJsNWFU6kfKObF+JkdNYeY+qEaKlH0Bb4jZ7/wrw51d3np6NrL2CP72mP0UWDtXzI8OFJwtuIlrSmMez6no7ZfbliM1sND2Z+1t4W/lxSpVfjsqCMvC+nQwCA+wy88Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rbNmV/UZ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rbNmV/UZ"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48541cac34dso43771705e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 07:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773670331; x=1774275131; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xCRSeVyOFCsZ19TzNJUmgxiPcS30PA28dcYIWkztzvc=;
        b=rbNmV/UZTrhokuhMltTU7dzFCWvaydN5HPPcKKdj0idnd1pIAH4z0yIuUhBDAaTtvr
         Z9HUmMp93j3Ig3IlNCN9wns7+velB3/mHCW+Zb2lxBm1haCkqcN+V7EsVsUCiP4EBGyk
         qS53GzNrcYGObZ8JsQsnkL2WDUWKnshlxwBe1w3eQowjXOvfUVqYYwUWNtXyB88wq3PS
         TDIDICI2tBbN1areGk6FuWVLTm9eRmqXk81YUKe5iT3wnGD3QbGimacg/ef0FmXWV6Y3
         L4pKnzFyFtyvh0MNTUPvK/VYbqgdxaQAwTN0kDS6vnNtEKccU49ubCjR8iEFDKqriUOR
         eVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773670331; x=1774275131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCRSeVyOFCsZ19TzNJUmgxiPcS30PA28dcYIWkztzvc=;
        b=sPB6WuiYlYaNf8AKUOVXuai8IVreejgvcJxcqLoWv9XuUIqN7kZOcie4hUlF3L7Aon
         gvyUA/S8ySlMjaRW2uY6Hnwy9JiJb9/jC6niNT5SJj52a7h9P2Q9UdTbbAqBK5nBeFmX
         sH/2kfA2mQ5uM003gfl9WG/jPrXoX93O7zWc8a7baV5x3wjSABWZjZzJbMfneKtjYulv
         c5t7FEz9blQ207VMjERi4j9DfWDX65X9C7jjFrTiPJac1RjifEv9g7C8Tx6j22vdnFTM
         hEZErvATj4SHX7soazxqFMQ79iSNt73YOMXVc8UGgSMib8dCS21AqSZ4z+2mBDrVOHFH
         zgLg==
X-Forwarded-Encrypted: i=1; AJvYcCVWKChP0UB8e/lAyRVimTlUk6aDAXxBLg5/iZYJ5DjZIy2rlnHxFCNN/tUT88zSYUB06EP5IOIBSwQRmVeIWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoctYxgqf8NxASgsHnu7JFGu6/5d2/61Pl5P2hH3B3aVvz+WAs
	FGT4nKvZgehj5GbfzT7+f2Mu3bFrxjWCdbXGhFI9Mi8ED2Nk2HxhrpJOomBLZq2gZxOMc+AUUrD
	0PnfDhcNY/ybDFvlaiw==
X-Received: from wmbb25.prod.google.com ([2002:a05:600c:5899:b0:485:39ba:7003])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8a0c:20b0:485:54cd:6e4e with SMTP id 5b1f17b1804b1-485566facebmr168001015e9.18.1773670331290;
 Mon, 16 Mar 2026 07:12:11 -0700 (PDT)
Date: Mon, 16 Mar 2026 14:12:10 +0000
In-Reply-To: <20260308-rust-binder-trace-v2-3-9e38637a2193@sdhn.cc>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260308-rust-binder-trace-v2-0-9e38637a2193@sdhn.cc> <20260308-rust-binder-trace-v2-3-9e38637a2193@sdhn.cc>
Message-ID: <abgPugGZKSCvLjFX@google.com>
Subject: Re: [PATCH v2 3/3] rust_binder: add in the new tracepoint calls
From: Alice Ryhl <aliceryhl@google.com>
To: Mohamad Alsadhan <mo@sdhn.cc>, '@google.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Mar 08, 2026 at 04:24:36AM +0300, Mohamad Alsadhan wrote:
> Wire the new Rust Binder tracepoints into live execution paths.
> 
> Hook trace calls into:
> 
> - ioctl entry/exit (`binder_ioctl`, `binder_ioctl_done`)
> - command parsing and return writes (`binder_command`,
>   `binder_return`)
> - read/write completion (`binder_read_done`, `binder_write_done`)
> - wait (`binder_wait_for_work`)
> - transaction (`binder_transaction_received`)
> - fd translation (`binder_transaction_fd_{send,recv}`)
> - buffer/page lifecycle (`binder_alloc_*`, `binder_free_*`,
>   `binder_unmap_*`)
> 
> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>

Thanks for your series.

Instead of having one commit declaring *all* the tracepoints, and
another commit calling *all* the tracepoints, this needs to be one
commit per tracepoint category. Declaring the tracepoint and adding its
caller can happen in the same commit.

Also, I'm not sure we need the buffer/page lifecycle ones, so I think we
can just drop those.

Alice

> ---
>  drivers/android/binder/allocation.rs       |  1 +
>  drivers/android/binder/page_range.rs       | 17 +++++++++++++++++
>  drivers/android/binder/process.rs          |  7 +++++--
>  drivers/android/binder/rust_binder_main.rs |  1 +
>  drivers/android/binder/thread.rs           | 15 +++++++++++++--
>  drivers/android/binder/transaction.rs      |  2 ++
>  6 files changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
> index 7f65a9c3a..8c0f94463 100644
> --- a/drivers/android/binder/allocation.rs
> +++ b/drivers/android/binder/allocation.rs
> @@ -208,6 +208,7 @@ pub(crate) fn translate_fds(&mut self) -> Result<TranslatedFds> {
>              let res = FileDescriptorReservation::get_unused_fd_flags(bindings::O_CLOEXEC)?;
>              let fd = res.reserved_fd();
>              self.write::<u32>(file_info.buffer_offset, &fd)?;
> +            crate::trace::trace_transaction_fd_recv(self.debug_id, fd, file_info.buffer_offset);
>  
>              reservations.push(
>                  Reservation {
> diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
> index fdd97112e..43fe23907 100644
> --- a/drivers/android/binder/page_range.rs
> +++ b/drivers/android/binder/page_range.rs
> @@ -327,6 +327,8 @@ pub(crate) fn use_range(&self, start: usize, end: usize) -> Result<()> {
>  
>              // SAFETY: The pointer is valid, and we hold the lock so reading from the page is okay.
>              if let Some(page) = unsafe { PageInfo::get_page(page_info) } {
> +                crate::trace::trace_alloc_lru_start(self.pid, i);
> +
>                  // Since we're going to use the page, we should remove it from the lru list so that
>                  // the shrinker will not free it.
>                  //
> @@ -335,9 +337,12 @@ pub(crate) fn use_range(&self, start: usize, end: usize) -> Result<()> {
>                  // The shrinker can't free the page between the check and this call to
>                  // `list_lru_del` because we hold the lock.
>                  unsafe { PageInfo::list_lru_del(page_info, page.nid(), self.shrinker) };
> +
> +                crate::trace::trace_alloc_lru_end(self.pid, i);
>              } else {
>                  // We have to allocate a new page. Use the slow path.
>                  drop(inner);
> +                crate::trace::trace_alloc_page_start(self.pid, i);
>                  // SAFETY: `i < end <= inner.size` so `i` is in bounds.
>                  match unsafe { self.use_page_slow(i) } {
>                      Ok(()) => {}
> @@ -346,6 +351,7 @@ pub(crate) fn use_range(&self, start: usize, end: usize) -> Result<()> {
>                          return Err(err);
>                      }
>                  }
> +                crate::trace::trace_alloc_page_end(self.pid, i);
>                  inner = self.lock.lock();
>              }
>          }
> @@ -448,8 +454,12 @@ pub(crate) fn stop_using_range(&self, start: usize, end: usize) {
>  
>              // SAFETY: Okay for reading since we have the lock.
>              if let Some(page) = unsafe { PageInfo::get_page(page_info) } {
> +                crate::trace::trace_free_lru_start(self.pid, i);
> +
>                  // SAFETY: The pointer is valid, and it's the right shrinker.
>                  unsafe { PageInfo::list_lru_add(page_info, page.nid(), self.shrinker) };
> +
> +                crate::trace::trace_free_lru_end(self.pid, i);
>              }
>          }
>      }
> @@ -667,6 +677,7 @@ fn drop(self: Pin<&mut Self>) {
>      let mmap_read;
>      let mm_mutex;
>      let vma_addr;
> +    let pid;
>  
>      {
>          // CAST: The `list_head` field is first in `PageInfo`.
> @@ -700,7 +711,9 @@ fn drop(self: Pin<&mut Self>) {
>  
>          // SAFETY: Both pointers are in bounds of the same allocation.
>          page_index = unsafe { info.offset_from(inner.pages) } as usize;
> +        pid = range.pid;
>  
> +        crate::trace::trace_unmap_kernel_start(pid, page_index);
>          // SAFETY: We hold the spinlock, so we can take the page.
>          //
>          // This sets the page pointer to zero before we unmap it from the vma. However, we call
> @@ -709,6 +722,8 @@ fn drop(self: Pin<&mut Self>) {
>          page = unsafe { PageInfo::take_page(info) };
>          vma_addr = inner.vma_addr;
>  
> +        crate::trace::trace_unmap_kernel_end(pid, page_index);
> +
>          // From this point on, we don't access this PageInfo or ShrinkablePageRange again, because
>          // they can be freed at any point after we unlock `lru_lock`. This is with the exception of
>          // `mm_mutex` which is kept alive by holding the lock.
> @@ -719,7 +734,9 @@ fn drop(self: Pin<&mut Self>) {
>  
>      if let Some(vma) = mmap_read.vma_lookup(vma_addr) {
>          let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
> +        crate::trace::trace_unmap_user_start(pid, page_index);
>          vma.zap_page_range_single(user_page_addr, PAGE_SIZE);
> +        crate::trace::trace_unmap_user_end(pid, page_index);
>      }
>  
>      drop(mmap_read);
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index 41de55931..4d7b165e7 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -1656,11 +1656,14 @@ pub(crate) fn ioctl(this: ArcBorrow<'_, Process>, file: &File, cmd: u32, arg: us
>  
>          const _IOC_READ_WRITE: u32 = _IOC_READ | _IOC_WRITE;
>  
> -        match _IOC_DIR(cmd) {
> +        let res = match _IOC_DIR(cmd) {
>              _IOC_WRITE => Self::ioctl_write_only(this, file, cmd, &mut user_slice.reader()),
>              _IOC_READ_WRITE => Self::ioctl_write_read(this, file, cmd, user_slice),
>              _ => Err(EINVAL),
> -        }
> +        };
> +
> +        crate::trace::trace_ioctl_done(res);
> +        res
>      }
>  
>      pub(crate) fn mmap(
> diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
> index aa5f2a75a..1028e0a8a 100644
> --- a/drivers/android/binder/rust_binder_main.rs
> +++ b/drivers/android/binder/rust_binder_main.rs
> @@ -116,6 +116,7 @@ fn new(writer: UserSliceWriter, thread: &'a Thread) -> Self {
>      /// Write a return code back to user space.
>      /// Should be a `BR_` constant from [`defs`] e.g. [`defs::BR_TRANSACTION_COMPLETE`].
>      fn write_code(&mut self, code: u32) -> Result {
> +        crate::trace::trace_return(code);
>          stats::GLOBAL_STATS.inc_br(code);
>          self.thread.process.stats.inc_br(code);
>          self.writer.write(&code)
> diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
> index 0b62d24b2..ef7fba700 100644
> --- a/drivers/android/binder/thread.rs
> +++ b/drivers/android/binder/thread.rs
> @@ -706,6 +706,7 @@ fn translate_object(
>                      core::mem::offset_of!(uapi::binder_fd_object, __bindgen_anon_1.fd);
>  
>                  let field_offset = offset + FD_FIELD_OFFSET;
> +                crate::trace::trace_transaction_fd_send(view.alloc.debug_id, fd, field_offset);
>  
>                  view.alloc.info_add_fd(file, field_offset, false)?;
>              }
> @@ -1323,6 +1324,7 @@ fn write(self: &Arc<Self>, req: &mut BinderWriteRead) -> Result {
>          while reader.len() >= size_of::<u32>() && self.inner.lock().return_work.is_unused() {
>              let before = reader.len();
>              let cmd = reader.read::<u32>()?;
> +            crate::trace::trace_command(cmd);
>              GLOBAL_STATS.inc_bc(cmd);
>              self.process.stats.inc_bc(cmd);
>              match cmd {
> @@ -1412,11 +1414,18 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
>              UserSlice::new(UserPtr::from_addr(read_start as _), read_len as _).writer(),
>              self,
>          );
> -        let (in_pool, use_proc_queue) = {
> +        let (in_pool, has_transaction, thread_todo, use_proc_queue) = {
>              let inner = self.inner.lock();
> -            (inner.is_looper(), inner.should_use_process_work_queue())
> +            (
> +                inner.is_looper(),
> +                inner.current_transaction.is_some(),
> +                !inner.work_list.is_empty(),
> +                inner.should_use_process_work_queue(),
> +            )
>          };
>  
> +        crate::trace::trace_wait_for_work(use_proc_queue, has_transaction, thread_todo);
> +
>          let getter = if use_proc_queue {
>              Self::get_work
>          } else {
> @@ -1482,6 +1491,7 @@ pub(crate) fn write_read(self: &Arc<Self>, data: UserSlice, wait: bool) -> Resul
>          let mut ret = Ok(());
>          if req.write_size > 0 {
>              ret = self.write(&mut req);
> +            crate::trace::trace_write_done(ret);
>              if let Err(err) = ret {
>                  pr_warn!(
>                      "Write failure {:?} in pid:{}",
> @@ -1498,6 +1508,7 @@ pub(crate) fn write_read(self: &Arc<Self>, data: UserSlice, wait: bool) -> Resul
>          // Go through the work queue.
>          if req.read_size > 0 {
>              ret = self.read(&mut req, wait);
> +            crate::trace::trace_read_done(ret);
>              if ret.is_err() && ret != Err(EINTR) {
>                  pr_warn!(
>                      "Read failure {:?} in pid:{}",
> diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
> index 75e6f5fba..c43846bb7 100644
> --- a/drivers/android/binder/transaction.rs
> +++ b/drivers/android/binder/transaction.rs
> @@ -430,6 +430,8 @@ fn do_work(
>  
>          self.drop_outstanding_txn();
>  
> +        crate::trace::trace_transaction_received(&self);
> +
>          // When this is not a reply and not a oneway transaction, update `current_transaction`. If
>          // it's a reply, `current_transaction` has already been updated appropriately.
>          if self.target_node.is_some() && tr_sec.transaction_data.flags & TF_ONE_WAY == 0 {
> 
> -- 
> 2.52.0
> 
