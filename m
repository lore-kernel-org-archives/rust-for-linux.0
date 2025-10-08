Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E91034BA37
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 16:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759942458; cv=none; b=paKP6bSJLq/QY8z3g4Ha0Ss2PkkBBcYHMK64ja+/RaMomc6KQn+YSlsA2I2fWiAjjB31mARdIqRCGVGlfT5beqx09oCutkGJhB5XOsvobw4096oz7Y3/fHYohJPshqaf3a2TDnpVATR897M7dgfgg0smK4gc3S3Q+hu+HSEZ608=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759942458; c=relaxed/simple;
	bh=UGRZ3uEA9q12JAZqw6ZMlDUasnC1s2wFJ556FT5y5ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZOIGpEw944BkwYZqmsRIHjTL2NTGhrHqqO96IWc06wTE+Q4CZiinmm0JqNRODinhv4XFAN47LGoeBoE0GgTuyLUPZUGPxHjs+l0Jr8VwJGB+MX7EyHyxGV2/S5d++G8VUfYva7h8WFU7AnMihpnH+jZ39ivKBwHqNRSq2PYkGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RBm4jLMz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RBm4jLMz"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-27d67abd215so6705ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759942456; x=1760547256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A9n4lSlNWVXGTI/OWK+6EiUk3ULeZvBLkXL7rOFBV4Q=;
        b=RBm4jLMzKqn0yGgWIpvZbSwOIdF5wmv16tFDxomhWvVbroJZEsVghJh585btT0Ba39
         n5S9vWjNqbC+x3/SxK4c/kjyFOnj911J9++wX87i5DWzoDCkKd0Xy+9blk7OFF7/Z9cD
         nKpd9xisqDQcvcvhqs6tjF4h+iGPMdMFKdfhvA4s7QouVL4rJVjnruR8ahm/PrnQWhR6
         eIlao2rgukT5cpeQOqIKvrSeZKsuDagt3ATOhkaxxo3vS9aK7TfSMuCVUq7Xq0HgoR3i
         Ejw3LDRP3f6n3YMilW8KOL9ASCK5+Imnt92oHTQOTcsLqvN9/f1Kx+Z++g1hqUq5lLXN
         eOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759942456; x=1760547256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9n4lSlNWVXGTI/OWK+6EiUk3ULeZvBLkXL7rOFBV4Q=;
        b=cvMKh7oMrCwR/B0HReeN4ChYDO9lzR+VhJaKZ4esTaHZSBh0DEiYgrHt+NgWaCiQiF
         SgRQrwLeooGHv4tg/yPk/8B6FwlCUEXyIVi7eAheTNz9Fr9a5xeKDZ0MI2HQSVMFiJO7
         jWuc0zf2qUlbNfqyNRTMuyojRTLEmWd7IedfTcR8Y2N1qEnd4K6yW+uTSiXUcZ3vUcFt
         caFBdXh11mmba1tcxMhMRwnsS01gXqQOQGBoxFcvS1oMlOHwxdhZ+bTUQPXj+Aya/0vk
         +4w109G3qYHsyA9oDG6tB3fNtmMCRbct7dRYarZlZ/1qudK19m6ZdPB26VJ3ZIF+6T58
         QH5g==
X-Forwarded-Encrypted: i=1; AJvYcCUAAb2FjMhH2CmYUNgBVOiJ6TKS3BlYklJDbnyLsB1i3ULclbv2pCR6QerJKKon/BT7w9VJa0nZ1YfDNVu7wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwnNECu8/GClOiqz4xZJp/VUb83lQ09/PLuDQP9WtRsBLp6Eix
	nsUdhlmbMIVOEg8D5F1wzlFD7Oh+R30tNaUaQPiVlKoJUY3dQRdt6woFLC6LIEUshw==
X-Gm-Gg: ASbGncub8bQDzBW5+6F1rAMDATSZpk6JJ4Bdl9v01ZEiKyqXt/B6j+Wsa4JQGfkxpdE
	weWTHyHwwpN9iLVtY/KJjI7JTQAkM74Vs3110BUzlXt88zJZEZf+nWupXpWeeyBrKHHBtD73IlZ
	LvuhA3eQUn+48zm9E+Dl7BFZONdrLf+FH5WW89uKeZUIrOA/gSNPpUxRGt8oBMB5K1kXDBuG4Vd
	DjlyKWAnlyXRgtFfwBlKFrLUGnZcw9cbYoPBNbRXvDDQ6d6hp9t9PDHxi52A9C612rc++I4mbN/
	D1PyWZxFi1E+xUsntUDN2VXsakdfv4TKLIMA8CgMTQduYCmeiF4BjVFhhdZc+8eFTf27zFSJTzQ
	YpM2P5O+1RHrwsQXrhfIAhbmKE2wub3phbF8AyF2fZkEJ22UN5C+/0WXHm66zJBSADwcc1DqamB
	Cbn60Tjf0t84YNhP/4/DldfH371MVbECwWwQBxCPq34IEBo+eXtZ/qOBCjWzqtx7Bjf4d5gLfPd
	5F+V0bJj+yS
X-Google-Smtp-Source: AGHT+IH97mFpX6vkn5k3kmggEKIvqJUqfibsUdPyEG2j4lBwcNaDIWPJCF4ZwWtIuqHA6tfn7bYwdw==
X-Received: by 2002:a17:903:380b:b0:26a:befc:e7e1 with SMTP id d9443c01a7336-2902768ec26mr5731185ad.12.1759942455563;
        Wed, 08 Oct 2025 09:54:15 -0700 (PDT)
Received: from google.com (235.215.125.34.bc.googleusercontent.com. [34.125.215.235])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b62fad52676sm11009753a12.45.2025.10.08.09.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 09:54:15 -0700 (PDT)
Date: Wed, 8 Oct 2025 16:54:10 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 3/3] rust_binder: report freeze notification only when
 fully frozen
Message-ID: <aOaXMrGD1xIGIHkP@google.com>
References: <20251007-binder-freeze-v2-0-5376bd64fb59@google.com>
 <20251007-binder-freeze-v2-3-5376bd64fb59@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-binder-freeze-v2-3-5376bd64fb59@google.com>

On Tue, Oct 07, 2025 at 09:39:53AM +0000, Alice Ryhl wrote:
> Binder only sends out freeze notifications when ioctl_freeze() completes
> and the process has become fully frozen. However, if a freeze
> notification is registered during the freeze operation, then it
> registers an initial state of 'frozen'. This is a problem because if
> the freeze operation fails, then the listener is not told about that
> state change, leading to lost updates.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> This is also an issue in C Binder. A fix for that will be sent
> separately.
> ---
>  drivers/android/binder/freeze.rs      |  4 +--
>  drivers/android/binder/process.rs     | 46 ++++++++++++++++++++++++++++-------
>  drivers/android/binder/transaction.rs |  6 ++---
>  3 files changed, 42 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
> index e304aceca7f31c15444cf67bb13488cd144345e6..220de35ae85ac8de2af717129011e0ace0677b7d 100644
> --- a/drivers/android/binder/freeze.rs
> +++ b/drivers/android/binder/freeze.rs
> @@ -121,7 +121,7 @@ fn do_work(
>              writer.write_payload(&self.cookie.0)?;
>              Ok(true)
>          } else {
> -            let is_frozen = freeze.node.owner.inner.lock().is_frozen;
> +            let is_frozen = freeze.node.owner.inner.lock().is_frozen.is_fully_frozen();
>              if freeze.last_is_frozen == Some(is_frozen) {
>                  return Ok(true);
>              }
> @@ -254,7 +254,7 @@ pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader)
>                  );
>                  return Err(EINVAL);
>              }
> -            let is_frozen = freeze.node.owner.inner.lock().is_frozen;
> +            let is_frozen = freeze.node.owner.inner.lock().is_frozen.is_fully_frozen();
>              if freeze.is_clearing || freeze.last_is_frozen != Some(is_frozen) {
>                  // Immediately send another FreezeMessage.
>                  clear_msg = Some(FreezeMessage::init(alloc, cookie));
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index f13a747e784c84a0fb09cbf47442712106eba07c..2da9344397506a3f6d6b13411c45d5ded92d6db1 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -72,6 +72,33 @@ fn new(address: usize, size: usize) -> Self {
>  const PROC_DEFER_FLUSH: u8 = 1;
>  const PROC_DEFER_RELEASE: u8 = 2;
>  
> +#[derive(Copy, Clone)]
> +pub(crate) enum IsFrozen {
> +    Yes,
> +    No,
> +    InProgress,
> +}
> +
> +impl IsFrozen {
> +    /// Whether incoming transactions should be rejected due to freeze.
> +    pub(crate) fn is_frozen(self) -> bool {
> +        match self {
> +            IsFrozen::Yes => true,
> +            IsFrozen::No => false,
> +            IsFrozen::InProgress => true,
> +        }
> +    }
> +
> +    /// Whether freeze notifications consider this process frozen.
> +    pub(crate) fn is_fully_frozen(self) -> bool {
> +        match self {
> +            IsFrozen::Yes => true,
> +            IsFrozen::No => false,
> +            IsFrozen::InProgress => false,
> +        }
> +    }
> +}
> +
>  /// The fields of `Process` protected by the spinlock.
>  pub(crate) struct ProcessInner {
>      is_manager: bool,
> @@ -98,7 +125,7 @@ pub(crate) struct ProcessInner {
>      /// are woken up.
>      outstanding_txns: u32,
>      /// Process is frozen and unable to service binder transactions.
> -    pub(crate) is_frozen: bool,
> +    pub(crate) is_frozen: IsFrozen,
>      /// Process received sync transactions since last frozen.
>      pub(crate) sync_recv: bool,
>      /// Process received async transactions since last frozen.
> @@ -124,7 +151,7 @@ fn new() -> Self {
>              started_thread_count: 0,
>              defer_work: 0,
>              outstanding_txns: 0,
> -            is_frozen: false,
> +            is_frozen: IsFrozen::No,
>              sync_recv: false,
>              async_recv: false,
>              binderfs_file: None,
> @@ -1260,7 +1287,7 @@ fn deferred_release(self: Arc<Self>) {
>          let is_manager = {
>              let mut inner = self.inner.lock();
>              inner.is_dead = true;
> -            inner.is_frozen = false;
> +            inner.is_frozen = IsFrozen::No;
>              inner.sync_recv = false;
>              inner.async_recv = false;
>              inner.is_manager
> @@ -1371,7 +1398,7 @@ pub(crate) fn drop_outstanding_txn(&self) {
>                  return;
>              }
>              inner.outstanding_txns -= 1;
> -            inner.is_frozen && inner.outstanding_txns == 0
> +            inner.is_frozen.is_frozen() && inner.outstanding_txns == 0
>          };
>  
>          if wake {
> @@ -1385,7 +1412,7 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
>              let mut inner = self.inner.lock();
>              inner.sync_recv = false;
>              inner.async_recv = false;
> -            inner.is_frozen = false;
> +            inner.is_frozen = IsFrozen::No;
>              drop(inner);
>              msgs.send_messages();
>              return Ok(());
> @@ -1394,7 +1421,7 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
>          let mut inner = self.inner.lock();
>          inner.sync_recv = false;
>          inner.async_recv = false;
> -        inner.is_frozen = true;
> +        inner.is_frozen = IsFrozen::InProgress;
>  
>          if info.timeout_ms > 0 {
>              let mut jiffies = kernel::time::msecs_to_jiffies(info.timeout_ms);
> @@ -1408,7 +1435,7 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
>                      .wait_interruptible_timeout(&mut inner, jiffies)
>                  {
>                      CondVarTimeoutResult::Signal { .. } => {
> -                        inner.is_frozen = false;
> +                        inner.is_frozen = IsFrozen::No;
>                          return Err(ERESTARTSYS);
>                      }
>                      CondVarTimeoutResult::Woken { jiffies: remaining } => {
> @@ -1422,17 +1449,18 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
>          }
>  
>          if inner.txns_pending_locked() {
> -            inner.is_frozen = false;
> +            inner.is_frozen = IsFrozen::No;
>              Err(EAGAIN)
>          } else {
>              drop(inner);
>              match self.prepare_freeze_messages() {
>                  Ok(batch) => {
> +                    self.inner.lock().is_frozen = IsFrozen::Yes;
>                      batch.send_messages();
>                      Ok(())
>                  }
>                  Err(kernel::alloc::AllocError) => {
> -                    self.inner.lock().is_frozen = false;
> +                    self.inner.lock().is_frozen = IsFrozen::No;
>                      Err(ENOMEM)
>                  }
>              }
> diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
> index 02512175d6229535373f2d3e543ba8c91ecd72f0..4bd3c0e417eb93d5d62d9c20daadde1fb0e4990f 100644
> --- a/drivers/android/binder/transaction.rs
> +++ b/drivers/android/binder/transaction.rs
> @@ -249,7 +249,7 @@ pub(crate) fn submit(self: DLArc<Self>) -> BinderResult {
>  
>          if oneway {
>              if let Some(target_node) = self.target_node.clone() {
> -                if process_inner.is_frozen {
> +                if process_inner.is_frozen.is_frozen() {
>                      process_inner.async_recv = true;
>                      if self.flags & TF_UPDATE_TXN != 0 {
>                          if let Some(t_outdated) =
> @@ -270,7 +270,7 @@ pub(crate) fn submit(self: DLArc<Self>) -> BinderResult {
>                      }
>                  }
>  
> -                if process_inner.is_frozen {
> +                if process_inner.is_frozen.is_frozen() {
>                      return Err(BinderError::new_frozen_oneway());
>                  } else {
>                      return Ok(());
> @@ -280,7 +280,7 @@ pub(crate) fn submit(self: DLArc<Self>) -> BinderResult {
>              }
>          }
>  
> -        if process_inner.is_frozen {
> +        if process_inner.is_frozen.is_frozen() {
>              process_inner.sync_recv = true;
>              return Err(BinderError::new_frozen());
>          }
> 
> -- 
> 2.51.0.618.g983fd99d29-goog
> 

Acked-by: Carlos Llamas <cmllamas@google.com>
