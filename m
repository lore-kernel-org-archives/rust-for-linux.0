Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EE24A3D52
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Sep 2026 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438488; cv=none; b=AOSNVtF7gV27Rcs/IzbzlkSU+ri9od26AdLyn194N7mLiXMw46zUiqjZyimCHlv3kFWwcpWSw+DXcvqgyrY/DJ7FIYqkz2wLEQm073EliYPrTnVODBiIpgy7oATQ/9OL1Nl9DHBqfhHOJCCPjUXbQE71OHLsWcByFAjSzaQZ5Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438488; c=relaxed/simple;
	bh=J1iHfgTJrxvMwx0A3ullfLihFOTmPPBT5Wz1CdM9JMo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GRxd5yjDjKTHIPnOAQWXwTo8eNoW+ev647v56dGSy02r7U8FpxAb49oRfEAMQzAaN7B2qmm1WPhePj7w/yAhpUpMXnVakanF6WijxxysejF+PCpIz/SCzpY00MpcJZr97TPDhO3uUQP+kjYolvhcE0iDJQH02zrndQ2k1kfs/J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wg85vMN5; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wg85vMN5"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49b7c1dcc82so15327175e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Sep 2026 05:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788438482; x=1789043282; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8oMeUkkadw5964DdmpGPYbX5e2DZr/ayCcvdDJ6rss=;
        b=wg85vMN5fUOD17yCG8T1aWvNgfbcPbsJaaXkYZeAI1ETMj9g1sK+WaRFp3tRthcX0L
         dkMdjfb7XZ0wZ5DUgI4I2QlXhU5cfXqRPIwYvAAe/h2D0KGYy95qKgUSaA4+dZ1VC8u6
         /XEJg/GxWzcy0CQCCYeWKUdyKK4wnMhL1Dr5xundW2Zoz63bS2+R+iY/Ax5NcDJ45ugo
         IaEnJv3UY1Nduc8loRgY3WIvJl4TJwpddPHDyEC81Xg2oqTwtkmmoZtxgZe46sC//xom
         WMTYuANzWVzX7mwskoTydFVJDmehIrDbMB6MlL2U78gO8w18iAFBS8zvFUEcnLELSA35
         SGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788438482; x=1789043282;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8oMeUkkadw5964DdmpGPYbX5e2DZr/ayCcvdDJ6rss=;
        b=kLRWa30IjuPkBcdWpimLL7A/AE0pI76sw6XfKZs4bKHwR+7yKw5dHca21HlsSVfPqv
         p8+JjOLrtPe1TDBcEjSxq54QKdQXkh/Zuib1ruur8YDbnwIoq2ZR2JwQuoqL5JxNvVUU
         vbRAe+BayeGbYr5BEuwhOWAbEZlJyK4EvGvEGxW0ic+PHwP5uiXb/hAkjac7qc4+whml
         hDJehIp7xpTgk3vxUfsdXIcogOss/VFoOVdky+tymwwa7FQw/RVsZVJPXfZk8+2HjArw
         zbC6JMMeMT4atrbszzcBf95RM8SF7NmHH9q4ldao2pf79jlGG5V6J7ytLQxn/b4N9jEJ
         ABCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTdIfoF9Sask8UClQzzr6FQHAUzHHAqcwVUu62+KgfRAJkDPnyKjpjIjzFNfcA4T0umvJnl1iAHT/vRfQO5w==@vger.kernel.org
X-Gm-Message-State: AFuF++na0cEkmDcX5TrOHBdvVN8uBwws+0MCwlJxKhsgFeqfdqlKa05u
	TyciKxN6gjvuytAmNbLmbHPcQfKl+x0MlXQX5bSTm3cF0WK34JYNaHBxXSAFZ4av+EHg7vjiQLs
	8QesTfpYDP6FVb/mm7w==
X-Received: from wmbb16.prod.google.com ([2002:a05:600c:5890:b0:49c:e267:c017])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f08:b0:49c:e1ed:26b1 with SMTP id 5b1f17b1804b1-49ce5850cefmr230495895e9.16.1788438481854;
 Thu, 03 Sep 2026 05:28:01 -0700 (PDT)
Date: Thu, 3 Sep 2026 12:28:00 +0000
In-Reply-To: <20260726223613.1242940-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260726223613.1242940-1-dakr@kernel.org> <20260726223613.1242940-4-dakr@kernel.org>
Message-ID: <apln0Aee5iXOFShC@google.com>
Subject: Re: [PATCH 3/5] rust: sync: add WaitQueue infrastructure
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, 
	brauner@kernel.org, cmllamas@google.com, boqun@kernel.org, gary@garyguo.net, 
	lyude@redhat.com, daniel.almeida@collabora.com, work@onurozkan.dev, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, ojeda@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	tamird@kernel.org, acourbot@nvidia.com, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, longman@redhat.com, 
	viro@zeniv.linux.org.uk, jack@suse.cz, tj@kernel.org, jiangshanlai@gmail.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 27, 2026 at 12:36:09AM +0200, Danilo Krummrich wrote:
> +    /// Returns a raw pointer to the underlying `wait_queue_head`.
> +    #[expect(unused)]
> +    #[inline]
> +    pub(super) fn as_raw(&self) -> *mut bindings::wait_queue_head {

This should 'pub'. Then you can drop #[expect(unused)].

> +    /// Sleeps until the condition returns `true` or a signal is received.
> +    ///
> +    /// Returns `Ok(())` when the condition is met, or `Err(WaitError::Signal)` if interrupted
> +    /// by a signal.
> +    #[inline]
> +    pub fn wait_event_interruptible<F: Fn() -> bool>(&self, condition: F) -> Result<(), WaitError> {
> +        self.wait_event_timeout_internal(TASK_INTERRUPTIBLE, &condition, Jiffies::MAX);
> +        if !condition() && current!().signal_pending() {
> +            Err(WaitError::Signal)
> +        } else {
> +            Ok(())
> +        }

I don't think we should call condition() again here. Instead, I think we
should base it on which 'break' statement was used in wait_event_timeout_internal().

> +    /// Sleeps until the condition returns `true` or the timeout expires.
> +    ///
> +    /// Returns `Ok(())` when the condition is met, or `Err(WaitError::Timeout)` if the timeout
> +    /// elapsed first.
> +    #[inline]
> +    pub fn wait_event_timeout<F: Fn() -> bool>(
> +        &self,
> +        condition: F,
> +        jiffies: Jiffies,
> +    ) -> Result<(), WaitError> {
> +        let remaining = self.wait_event_timeout_internal(TASK_UNINTERRUPTIBLE, &condition, jiffies);
> +        if remaining == 0 && !condition() {
> +            Err(WaitError::Timeout)
> +        } else {
> +            Ok(())
> +        }

Ditto here.

> +    fn wait_event_timeout_internal(
> +        &self,
> +        wait_state: c_int,
> +        condition: &dyn Fn() -> bool,
> +        jiffies: Jiffies,
> +    ) -> Jiffies {

Why are we using dynamic dispatch here?

> +    /// Performs a single exclusive prepare-to-wait / finish-wait cycle, calling `schedule_fn`
> +    /// in between.
> +    #[expect(unused)]
> +    pub(super) fn wait_once_exclusive<F, R>(&self, wait_state: c_int, schedule_fn: F) -> R
> +    where
> +        F: FnOnce() -> R,
> +    {
> +        let wait = Opaque::<bindings::wait_queue_entry>::uninit();
> +
> +        // SAFETY: `wait` points to valid memory.
> +        unsafe { bindings::init_wait(wait.get()) };
> +
> +        // SAFETY: Both `wait` and `wait_queue_head` point to valid memory.
> +        unsafe {
> +            bindings::prepare_to_wait_exclusive(self.wait_queue_head.get(), wait.get(), wait_state)

What about the non-exclusive prepare_to_wait? That's the one Rust Binder
*should* be using here. It's not ideal that it's using the exclusive
wait.

> +/// Error returned by [`WaitQueue`] wait functions.
> +#[derive(Debug, PartialEq)]
> +pub enum WaitError {
> +    /// Interrupted by a signal.
> +    Signal,
> +    /// The timeout elapsed without the condition being met.
> +    Timeout,
> +}
> +
> +impl From<WaitError> for Error {
> +    #[inline]
> +    fn from(e: WaitError) -> Error {
> +        match e {
> +            WaitError::Signal => ERESTARTSYS,
> +            WaitError::Timeout => ETIMEDOUT,
> +        }
> +    }
> +}

I agree with Gary's comment about splitting up this error type.

Alice
