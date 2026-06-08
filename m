Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CF338E8D4
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 07:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903792; cv=none; b=dTAzljcteSNvvYsLllgYxqfgDxqCQUUZ2Ad3AeeaPDhNwbgC4POQhdmmNkvqIBmvHwaQbMXt/E/VI4K7ok7xIW2sisWU6pW6pYhy28S81ktuhP9GNUvjQ1teAl2ssVRugwCr2LDEd7Ti+245fXZEdHwVmu8YIG6JdVv6QQodirI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903792; c=relaxed/simple;
	bh=Z3sHtoVgr5N5sinKLE6ie47tjXWmHwNCo+5LweGujeQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T6Ch14SZtnNXIgdbfmiW/j0jJkUMdbkojYtCWsPLS/2YNFfooXT6x55NbNGvqttq3gRaCpkEkWp9z77cRM5qNe8Eai8T/lfR/yDa2d30ENk8tyTni8TEKhf7/0jE3oYyc98t7OlGxCvCFkmslfG9UR6SL+MWAYwebIZa4Mq2si0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CfolGHQ7; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CfolGHQ7"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490c840efe6so14537215e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 00:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780903790; x=1781508590; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eIZ7MQAZt89pNLsUkNnmleJFvuNKGT68ArqhClWf7/4=;
        b=CfolGHQ7cdgOHCaNr2jhQJfTPcl9ugc5Z34VWG23eZL2xLjt07XuXPK9NfmEoaAmp2
         OamgF0z5kmr4tLWEL7JaK3yJbhQxaXe7fKcRK5+OrLVJXYAcorOCpJoMk/naNHVFGYqO
         80w0Hzd8Z5mrVv3S2SC8orJTSTRuSk4V/3v9HHy1cc9kBYieG03rj296KjGxJCMnsOfe
         FEmgv6jzU23uoVdgbgc4Pwx6vvNopSHJ+xRXPU27T6eu5FsdqqnvhctZ3jxPTn/7FBYG
         oSP4tLHdKJjv1AI32Ef0ypuKOGET0JN3IQsPaSsSn6GjDSKbep+OHdpjMDdvayORliPD
         f+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903790; x=1781508590;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eIZ7MQAZt89pNLsUkNnmleJFvuNKGT68ArqhClWf7/4=;
        b=VGCDO+Nk8d9HJAY3hXP9kigYJN6OIcoa6jtxH35Aw48yX9ahySilUzbEhaFCVAsJuG
         MbD/NK4CAFsv8rVYHRzYrram7vNTQH0ct/eJEG3CWbwI75Hne4ZFdt9Q2B8r3Tw+MQAU
         PkUuaH5j/oDmoDc76ELTGIs3LOxg1LKZQ7osyrnfrQa5OiibJR2YNUvzZHOQPkBcP3SW
         c+OfCK/neUTOpCkyxWpPR7GEJSHBUlw4e36dcUPyAeuqqPxiqqFLzMYtYnTTBQLWcGxS
         v1wlWD0f30pnRdO4LhDHFnbm0ycXGaz8CTzrJXk0JV/6JnqqtQcY7waMK5EYratinm9V
         bJkA==
X-Forwarded-Encrypted: i=1; AFNElJ+UokPrlCJ6zcVmrF9C8eWSGOToxXAFU3UUQWXxAv8dx+fGeGsH+TsIqZlWtJY6Xyt625RZDGLA+uN/5cDU6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx8KiP3MHJ9MVElNPBPY6iL91sGRT6D30qDDStJKinIprMNNMT
	InpT2AcBOBdvzLu9QM/Ejk+P4Rb/PH9Og+GUrm/1k43BbwdOMEK7KVlJZ3hdQJZydYSSpiexJ4/
	KCo8+HP0LENizFqa0ew==
X-Received: from wmdd11.prod.google.com ([2002:a05:600c:a20b:b0:48f:e178:4b87])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83cf:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-490c2cc3103mr178763755e9.5.1780903789602;
 Mon, 08 Jun 2026 00:29:49 -0700 (PDT)
Date: Mon, 8 Jun 2026 07:29:48 +0000
In-Reply-To: <20260605-export-do-unlocked-v2-1-e23001390231@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260605-export-do-unlocked-v2-1-e23001390231@kernel.org>
Message-ID: <aiZvbCad0DeRu60g@google.com>
Subject: Re: [PATCH v2] rust: sync: export lock::do_unlocked
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 05, 2026 at 02:57:07PM +0200, Andreas Hindborg wrote:
> Export lock::do_unlocked publicly. Add documentation for the method.
> 
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/sync/lock.rs | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 10b6b5e9b024..9c549e469785 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -238,7 +238,31 @@ pub fn lock_ref(&self) -> &'a Lock<T, B> {
>          self.lock
>      }
>  
> -    pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
> +    /// Temporarily unlock the lock to execute the given closure.
> +    ///
> +    /// This method unlocks the lock before calling the closure `cb`, and re-locks it afterwards.
> +    /// This is useful when you need to perform operations that are not allowed while holding
> +    /// certain locks, such as allocating memory (which is prohibited while holding a spinlock).
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::{new_spinlock, prelude::*};
> +    /// use pin_init::stack_pin_init;

I think the prelude is imported automatically.

Alice
