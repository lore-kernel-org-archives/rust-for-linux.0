Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CA2331ECC
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 23:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782516522; cv=none; b=pFZLGPUpyAR+LO9YCXaXlKudsGMl2OpzgS9kQtid3uKF2bVBR8NmiK8j0pYCL4VqSe7f0/Q+eZvOKZDtBAVIeRjrLvVIV+fidI5uU6yEIXZmsWCZAyZassC+julVM3gSk5umGo0ToV+S/qmBvk1PLgDMEBHiM6ZmDG3oaMUtwXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782516522; c=relaxed/simple;
	bh=g/9XI3ior4FGSepU4aTRl5CoHf1XN5AXCFZXSsNzAp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwCUuOeKINdXTBKYS8ko/+TEud9e2JQOZyA9hfKgBGJohpvJ6aeOCkgue/ZJkpFRsig0w7Bff7Si2YpqAnK0oS8olK82fdI+q+BpOWRr1nD9dsCvv2r09s055VH/LI2Wvz4hjdtnqiZOgFCFWGYKb74y92N5WJmhBW7RyJt6vFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A258+glQ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A258+glQ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c9b2ac97cdso235ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 16:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782516519; x=1783121319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d743/IMP0R5FGHdDnybTt/easCOX5xZy3RcR2x9mo8k=;
        b=A258+glQ/cWY/fESE+mSbn/yyw2epMhvN3GnvhPhIQPN25fo5Gf7mqGFG6iHHwnWWP
         D4mOYSVNJiXgWPlQcNtbh1rXuQuTobYmyHdxZA/2aLXT7bUWYq+3Dlf0LMmpsWUhDR+X
         trd17tox8Hp7LYYMQ2MUSXAB63zPXBH2Z/uKKEz8rtchX6ioGhi1JG7wm+MOq0yfDfQZ
         ZAA0m5qMCOWdVqwDF+a/FVe0BBPw1NxUEMQOqfBBnZuU2RwUx4BaX3Kdqnx88CwKKcAK
         nIIzXX1B6QxF9PHLChVtT5I1J76FegqcnHkgIFuYXsqFMmrcjaiC7x7EUkartMsFc6vD
         4H1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782516519; x=1783121319;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d743/IMP0R5FGHdDnybTt/easCOX5xZy3RcR2x9mo8k=;
        b=RxEOUWFMmnHbuy59STdAZFiobbma6tqFl/qCp0bA7Cuv6DGX6iGJX+fNda2lmoS5L6
         nTZiZETs9o90MmTRhSovj/l/6NlWAsnVWuNHb3xc3Tu15pD2cazujWvWjy52OhuJal8l
         nvpao1PjCXKidDekVoHJM2hMPhXJNDd5rIFyomzeoe+41pQfbe/Yw1OlMHv0ZqogtHTY
         HVMQhC0upqD24t8wTznVl7k9UEFr/66lKm854vDdvGzFk8MCNPnDQmR6RhC4X8x0oGli
         p5dTiQ+LhENLESgeICSynG9XZDZ1Mbgmgtlnb43MI4DTvLzAEhQIrUMa99KWPRWE4NOk
         t/qg==
X-Forwarded-Encrypted: i=1; AHgh+RqsOf2eez04XKBu4t/J2DARwiqjaZemJ8/538glRtsFnMYyoKhZ7ZZxT1Qy3P8bP0b4XZhhw7TxbBnx7EXCvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSlZ01g55X1FhnuN5eNx+nWqC9MDn0Q7ihtqTwz9yh4gSoTLD+
	4ZKayFyhbHbrNGpuEkYS0YCsgiu5qLD9tjddyrae4FSkTbxV2C9k9RsbifyPww93rg==
X-Gm-Gg: AfdE7ckTRbJ59osXrKw64kZoGcTjc5R7yP6Qt9GQ/uHuXLwWT2T7o3XIqDAkVIjBRMo
	9DsGcDczoz3gTpC10QhtXlcukN92gV8gcwFKUnlJdautnFnhbPBMLbT1u8zPrRMaIV8CwMSLG65
	R3uN7iefMkNehhA5cZpRHDjX2ScYWUPbfMp0lFO+hHRnf403tErFln6Pbxd/ecC+cuAHT28+0iZ
	Y3uZaizD/DpviALzSwMS/NmY/5YvbfZQZeBJVda97viND4fvQaw8nVuuEKzJTE59cKNzA8/LDt2
	Wm37IubqhV9jbvQgA1mrpFuY2tRDxco+FLMU50ff9ZmF/4+6huABWI5uswnRqIpPwm7wos0mRdo
	t7dJRFgVWW/EO1VAAt7oN0sQkaoK8i8Nc3ewtBpau0WI9bRHlA+aYBmA+DN2Kk0sFi61npiYieF
	x9I5pA4fu0jwFbZaoQgHLFzaOLztTjj9UG9sXLXZvKupAnOzxwC1TW42Adk5aHcMMA9W7kTH4Jg
	SLgKhrVa/2LALc5tsFOFS/lJf9MBNTvSBndDpklo61Y4A==
X-Received: by 2002:a17:903:2acc:b0:2c7:f6ca:2deb with SMTP id d9443c01a7336-2c9a5f976e6mr865865ad.22.1782516518994;
        Fri, 26 Jun 2026 16:28:38 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac9285sm47910125ad.11.2026.06.26.16.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 16:28:38 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:28:34 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 4/5] rust_binder: consolidate transaction failure prints
Message-ID: <aj8LInp1enuylpRg@google.com>
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-4-cc922f544dc0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-pr-ratelimited-v1-4-cc922f544dc0@google.com>

On Tue, Jun 23, 2026 at 03:38:07PM +0000, Alice Ryhl wrote:
> When a transaction fails, it currently hits multiple pr_warn!
> invocations meaning that a single failure can result in several lines in
> the kernel log. This is unnecessary, so consolidate them into one print
> used for all transaction failures.
> 
> For ENOSPC errors we want to know the transaction size, so a field is
> added to TransactionInfo that bubbles up this information to the new
> print location.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/error.rs       |  4 ---
>  drivers/android/binder/thread.rs      | 59 ++++++++++++++++++++---------------
>  drivers/android/binder/transaction.rs | 21 +++----------
>  rust/kernel/error.rs                  |  2 +-
>  4 files changed, 39 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/android/binder/error.rs b/drivers/android/binder/error.rs
> index 1296072c35d9..aed1c747640b 100644
> --- a/drivers/android/binder/error.rs
> +++ b/drivers/android/binder/error.rs
> @@ -37,10 +37,6 @@ pub(crate) fn new_frozen_oneway() -> Self {
>              source: None,
>          }
>      }
> -
> -    pub(crate) fn is_dead(&self) -> bool {
> -        self.reply == BR_DEAD_REPLY
> -    }
>  }
>  
>  /// Convert an errno into a `BinderError` and store the errno used to construct it. The errno
> diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
> index def00edce9c4..a5b038877747 100644
> --- a/drivers/android/binder/thread.rs
> +++ b/drivers/android/binder/thread.rs
> @@ -25,7 +25,7 @@
>  use crate::{
>      allocation::{Allocation, AllocationView, BinderObject, BinderObjectRef, NewAllocation},
>      defs::*,
> -    error::BinderResult,
> +    error::{BinderError, BinderResult},
>      process::{GetWorkOrRegister, Process},
>      ptr_align,
>      stats::GLOBAL_STATS,
> @@ -1018,18 +1018,9 @@ pub(crate) fn copy_transaction_data(
>                  .ok_or(ENOMEM)?,
>              size_of::<u64>(),
>          );
> +        info.debug_total_size = len;
>          let secctx_off = aligned_data_size + offsets_size + buffers_size;
> -        let mut alloc = match to_process.buffer_alloc(debug_id, len, info) {
> -            Ok(alloc) => alloc,
> -            Err(err) => {
> -                pr_warn!(
> -                    "Failed to allocate buffer. len:{}, is_oneway:{}",
> -                    len,
> -                    info.is_oneway(),
> -                );
> -                return Err(err);
> -            }
> -        };
> +        let mut alloc = to_process.buffer_alloc(debug_id, len, info)?;
>  
>          let mut buffer_reader = UserSlice::new(info.data_ptr, data_size).reader();
>          let mut end_of_previous_object = 0;
> @@ -1259,6 +1250,15 @@ fn read_transaction_info(
>  
>          info.debug_id = super::next_debug_id();
>  
> +        // We don't yet know the real message size because it depends on the secctx size, so for
> +        // now write an estimate. When the real value is computed, this estimate is replaced.
> +        // Writing an estimate here ensures that the approx message size can still be printed if
> +        // the transaction fails before it is computed exactly.
> +        info.debug_total_size = info
> +            .data_size
> +            .saturating_add(info.offsets_size)
> +            .saturating_add(info.buffers_size);

hmm, I'm not so sure about this "estimation". I can see how it might be
confusing against the "final" size, after secctx and alignment, bla bla.
I wonder if it would be best to leave this as zero (until this is known)
or maybe have the "raw" individual values from userspace?

> +
>          Ok(())
>      }
>  
> @@ -1277,6 +1277,9 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
>              self.transaction_inner(&mut info)
>          };
>  
> +        // This runs when return work is passed to the caller. This is not
> +        // always the same as the transaction failing, as reply errors are
> +        // delivered to the remote process.
>          if let Err(err) = ret {
>              self.push_return_work(err.reply);
>              if err.reply != BR_TRANSACTION_COMPLETE {
> @@ -1290,13 +1293,6 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
>                              ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
>                      }
>                  }
> -
> -                pr_warn!(
> -                    "{}:{} transaction to {} failed: {err:?}",
> -                    info.from_pid,
> -                    info.from_tid,
> -                    info.to_pid
> -                );
>              }
>          }
>  
> @@ -1305,8 +1301,27 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
>              // useful in case the transaction failed with BR_TRANSACTION_PENDING_FROZEN.
>              info.report_netlink(BR_ONEWAY_SPAM_SUSPECT, &self.process.ctx);
>          }
> +        // This runs when the transaction failed.
>          if info.reply != 0 {
>              info.report_netlink(info.reply, &self.process.ctx);
> +            let err = BinderError {
> +                reply: info.reply,
> +                source: Error::try_from_errno(info.errno),
> +            };
> +            pr_warn!(
> +                "{}:{} {} to {} failed: {err:?}, {} bytes\n",
> +                info.from_pid,
> +                info.from_tid,
> +                if info.is_reply {
> +                    "reply"
> +                } else if info.is_oneway() {
> +                    "oneway"
> +                } else {
> +                    "transaction"
> +                },
> +                info.to_pid,
> +                info.debug_total_size
> +            );
>          }
>  
>          Ok(())
> @@ -1374,12 +1389,6 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
>              // At this point we only return `BR_TRANSACTION_COMPLETE` to the caller, and we must let
>              // the sender know that the transaction has completed (with an error in this case).
>  
> -            pr_warn!(
> -                "{}:{} reply to {} failed: {err:?}",
> -                info.from_pid,
> -                info.from_tid,
> -                info.to_pid
> -            );
>              let param = err.source.as_ref().map_or(0, |e| e.to_errno());
>              let ee = ExtendedError::new(info.debug_id as u32, err.reply, param);
>              orig.from
> diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
> index 9aefa01599fb..316627e5f9ac 100644
> --- a/drivers/android/binder/transaction.rs
> +++ b/drivers/android/binder/transaction.rs
> @@ -39,6 +39,7 @@ pub(crate) struct TransactionInfo {
>      pub(crate) offsets_ptr: UserPtr,
>      pub(crate) offsets_size: usize,
>      pub(crate) buffers_size: usize,
> +    pub(crate) debug_total_size: usize,
>      pub(crate) target_handle: u32,
>      pub(crate) errno: i32,
>      pub(crate) reply: u32,
> @@ -138,21 +139,13 @@ pub(crate) fn new(
>          let txn_security_ctx = node_ref.node.flags & FLAT_BINDER_FLAG_TXN_SECURITY_CTX != 0;
>          let mut txn_security_ctx_off = if txn_security_ctx { Some(0) } else { None };
>          let to = node_ref.node.owner.clone();
> -        let mut alloc = match from.copy_transaction_data(
> +        let mut alloc = from.copy_transaction_data(
>              to.clone(),
>              info,
>              info.debug_id,
>              allow_fds,
>              txn_security_ctx_off.as_mut(),
> -        ) {
> -            Ok(alloc) => alloc,
> -            Err(err) => {
> -                if !err.is_dead() {
> -                    pr_warn!("Failure in copy_transaction_data: {:?}", err);
> -                }
> -                return Err(err);
> -            }
> -        };
> +        )?;
>          if info.is_oneway() {
>              if from_parent.is_some() {
>                  pr_warn!("Oneway transaction should not be in a transaction stack.");
> @@ -193,13 +186,7 @@ pub(crate) fn new_reply(
>          allow_fds: bool,
>      ) -> BinderResult<DLArc<Self>> {
>          let mut alloc =
> -            match from.copy_transaction_data(to.clone(), info, info.debug_id, allow_fds, None) {
> -                Ok(alloc) => alloc,
> -                Err(err) => {
> -                    pr_warn!("Failure in copy_transaction_data: {:?}", err);
> -                    return Err(err);
> -                }
> -            };
> +            from.copy_transaction_data(to.clone(), info, info.debug_id, allow_fds, None)?;
>          if info.flags & TF_CLEAR_BUF != 0 {
>              alloc.set_info_clear_on_drop();
>          }
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 05cf869ac090..89c247f150b3 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -137,7 +137,7 @@ pub fn from_errno(errno: crate::ffi::c_int) -> Error {
>      /// Creates an [`Error`] from a kernel error code.
>      ///
>      /// Returns [`None`] if `errno` is out-of-range.
> -    const fn try_from_errno(errno: crate::ffi::c_int) -> Option<Error> {
> +    pub const fn try_from_errno(errno: crate::ffi::c_int) -> Option<Error> {
>          if errno < -(bindings::MAX_ERRNO as i32) || errno >= 0 {
>              return None;
>          }
> 
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog
> 
