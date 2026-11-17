Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874433;
	b=PqZ6fFyx7EhAMabtASeG0ttYgfkDOkFM2ILkmDJCTi3v2JaGrwqOvDeoskNa1x/Tmi7S
	 RaK5MnqQdzgemO0H7HdZGmyJtzAFarRvcihvwp/chxCGk4IBGnRv+s6ZzYQnb5VDlZORw
	 RuuNdZ7YzAW7ATdtWQ0MDLZJUYA68qeVtghKTAlJueAqxY68dIhvwPAPNvEJg6MkxKPWw
	 mT/4E0Ihk7/6Uy/hb3am+QdiP6dPqkWMJDYlfkSC/g6B6ihpNXFwCR7ZB0bk1lOlQ/LSH
	 dWEk9HX9rTIfp1oPZkq7q87cxokK7jjujELeeHQyDC9JOBi2YXpJ3DwsFuO0VQcsXmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874433;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XVo09sxxh0tBmx3yVVO/fyACtpMXW/ZeTIbSkdS9UIE=;
	b=G7CQ3Bevcp3B0lruEh0d8PJIpCRQnBUpfKggks8BpDjgtdmYQEANyToaaS46o4LAHzCy
	 pFnAvZg4ccn9kBVcYeDXoB9PSPYDvA8x+aHejQwm2zJCnI+8jMZD3MM9djaaXP4CLi5zl
	 0N7t+xmbB9Ujc6OQyOh6D2xU/qPe3YzxWQXNvKFiIkJwri4ig/kcVKmD3r11WkH48lj0j
	 3Ldy/EgsTaqDyjZ1dn7jI2rx3314Ed+k2LFzmsK5EyXint2TyneD97PSzs7mTotB8yZqR
	 5XHvj4NRdIiNrjSvl0SeX/Cy1x7FOskzv87E/TPgOfph/8PellMlAw1SEv2383fazyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IOb0mbyJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B376606A330
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 00:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IOb0mbyJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA86A1F000C4;
	Tue, 17 Nov 2026 00:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794874432;
	bh=XVo09sxxh0tBmx3yVVO/fyACtpMXW/ZeTIbSkdS9UIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IOb0mbyJ6Zpf3675Bki3SsVd9pKF08EYuXfo6Gl6PZMLltTgKfYQWgfHpp5EsopJA
	 6PujDHeLd2jPoc9NhnPes4e0tjdGfxyV/p0SjAY4F+BTwe4wnB+sAX+1r2joJDTOz/
	 d/m+wuVV37GdnXjbLGSGk9wEvBM1EoEH7Wn/km7acfrCxTrHasyaWxmbPDgXHbKMAb
	 x2AlA0QcHphxtOVXIawnwZNpt++w2teVdhT0+HkxZDW+WgfcX882dlCxXMpY6Jmvki
	 c02crd9qBkZ8+QfmN5b2hU7A/vKBUUAKTGS1SBuH6DigQrTkcGzmPJaY0kgwtgy1lo
	 G0vSEdOSXfs/w==
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id D83DEF40067;
	Mon, 16 Nov 2026 19:13:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 16 Nov 2026 19:13:50 -0500
X-ME-Sender: <xms:Ppz7aonjL6K1uJk77U_8yLq6vjTcFnWlXCDpq-UrFESlHENYFSBs5w>
    <xme:Ppz7alBOVbtl_hZOm1XsVAmlRpml051VibDNGQDSeFdVJktam8-b2Ya1RvBTsRRcQ
    yOJr70OxDrFlFg_Yebv7Ek3qn_tH6fh98ATrmTF52Wi8yfeWgUWdQ>
X-ME-Received: <xmr:Ppz7arKwJfFJ4Cr055e-KoBn5kgEamgvpIosfFkrx7SLnw8k0QmU2om67J9nqWAoCYT4CCED9QjLhDuxK1lyP05LNihT3bXr>
X-ME-Proxy-Cause: dmFkZTGPCh64XdAD5hVH7IS3FJe9LUYF5q7vq0TeCrpvkwesw13usMNbSu2kdx4d+j+BCl
    /+UD2NXBMqVDoGANLMH+B0uuNW7rzokbr9aO5izKddQZOs6wEvRKlNwYAk1gTHFq8/rAAl
    7ZfZGiR9MBAZX015fB34lXfCtqEw3uDmqwkGdTjeUoNLDNHlQKgEnMVW+0CMV6PnpW2UVi
    NTkmf/i0fe4oJF2juBmRov6yxUFfTfVCx4OvF5G7eRBKDrSHogHeTTZcBbUlMn4UpeLliC
    ypXQUrjS/jP7L2JzDaflfpvnP0zI8eT6CRa369BzNy9e0VtxfuzcKFOBVBbYdQQ5bE7QGC
    GTwhhDxDQpcKMyAE47LrbtMpFe6QbJsiEXU6RgF2F0ZFuNYnBrF8WSNvVvwwtC3BivNEGf
    ZY8BtrvB5h19rMfsHYMo3zO9rkZKMRwLuhEXSop6xRdtbWbpZeAYjP4mwsLAGl++AoaI97
    Ugp55LUtIYoDLSkdyRUgPo2KpOGbac/I19/Z459QSfpiPPYOYDQjMRlfmJlXl7SlONEN5T
    0eMAJ0lwfbLraKggwiEORKcCBjpptEperBsmV17mKzcqV0ScxCUri2FovbXu1XaR+0g2oJ
    x3U+Tvq+7lgboP8IO4dK4GIvOLigDlbbJLnALCFcZWdrzrnMgcFksdXUXYWQ
X-ME-Proxy: <xmx:Ppz7agwvrd8TyouWUVv_NgBFug8Ka4qzAguWtgTko6utgq4eLAHq9A>
    <xmx:Ppz7any10wKw0qpjHH8VzbRMJUXBsh8fgzWVrBRqYnbzdUgl_qtrFg>
    <xmx:Ppz7aq1UkwXKwL4J5BJyziLoai2A15SumovdHkYJFjxg7J7LK_SNCQ>
    <xmx:Ppz7ahUYRaH9InQmREwiHWLvigeXErQjQPjwnDUq41aJRKpn1FpXkw>
    <xmx:Ppz7amcSuykigTGubtL4Xa9ZELfE3voVs70abwGvo4Z472QaurF1AK78>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 19:13:50 -0500 (EST)
Date: Mon, 16 Nov 2026 16:13:48 -0800
From: Boqun Feng <boqun@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: aliceryhl@google.com, arve@android.com, brauner@kernel.org,
	cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
	ojeda@kernel.org, tkjos@android.com, a.hindborg@kernel.org,
	acourbot@nvidia.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
	daniel.almeida@collabora.com, lossin@kernel.org, lyude@redhat.com,
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v10] rust: sync: condvar: use Delta<Jiffy> for timeout
 and result
Message-ID: <avucPFPNm5jAkM6j@tardis.local>
References: <20261104235929.1282640-1-tomo@flapping.org>
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
In-Reply-To: <20261104235929.1282640-1-tomo@flapping.org>

On Thu, Nov 05, 2026 at 08:59:29AM +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> wait_interruptible_timeout() takes the timeout as a raw Jiffies, and
> CondVarTimeoutResult reports the remaining time as a raw Jiffies. The
> type does not show the unit.
> 
> Switch the parameter and the result fields to Delta<Jiffy>.
> 
> Delta<Jiffy> is signed, but schedule_timeout() prints an error and a
> stack dump for a negative timeout. Clamp a negative timeout to zero, so
> it means an immediate timeout.
> 
> Update the only user, binder. It now converts the freeze timeout with
> Delta::to_jiffies_timeout() instead of msecs_to_jiffies(). Both round
> up, so a short timeout does not become zero. They differ only for a
> very long timeout. msecs_to_jiffies() returns MAX_JIFFY_OFFSET for
> 2^31 ms (about 24.9 days) or more, which means an infinite
> timeout. to_jiffies_timeout() has no such special case. It converts
> such a value to the matching number of jiffies, so the wait is long
> but finite.
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Acked-by: Boqun Feng <boqun@kernel.org>

Danilo, feel free to take it from your tree if you need it as a
dependency for the WaitQueue series. I'm also going to queue it myself
just in case it needs to go via tip. Thank you all.

Regards,
Boqun

> ---
> v10:
> - Rename variables and fields to describe their role, since the type now
>   shows the unit (suggested by Boqun):
>   - binder: the local variable `jiffies` to `timeout`
>   - wait_interruptible_timeout(): the parameter `delta` to `timeout`
>   - the `jiffies` match bindings and the `jiffies` field of
>     CondVarTimeoutResult::{Woken, Signal} to `remainder`
> - Add Alice's Reviewed-by
> v9: https://lore.kernel.org/rust-for-linux/20261102035934.711973-1-tomo@flapping.org/
> - Send as a single patch. Patches 1/4 and 2/4 of v8 are in v7.4-rc1,
>   and the workqueue patch will be sent separately
> - Rebase on v7.4-rc1
> - Drop the comparison with enqueue_delayed() from the commit message
> v8: https://lore.kernel.org/rust-for-linux/20261002050428.2746277-1-tomo@flapping.org/
> 
> Boqun, would you take this through the rust-sync tree?
> ---
>  drivers/android/binder/process.rs | 13 +++++++------
>  rust/kernel/sync/condvar.rs       | 31 ++++++++++++++++++++++---------
>  2 files changed, 29 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index 1f4cb43f1de6..0ed6a4b1c74b 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -35,6 +35,7 @@
>          Arc, ArcBorrow, CondVar, CondVarTimeoutResult, SetOnce, SpinLock, UniqueArc,
>      },
>      task::{Pid, Task},
> +    time::Delta,
>      uaccess::{UserSlice, UserSliceReader},
>      uapi,
>      workqueue::{self, Work},
> @@ -1552,25 +1553,25 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
>          inner.is_frozen = IsFrozen::InProgress;
>  
>          if info.timeout_ms > 0 {
> -            let mut jiffies = kernel::time::msecs_to_jiffies(info.timeout_ms);
> -            while jiffies > 0 {
> +            let mut timeout = Delta::from_millis(info.timeout_ms.into()).to_jiffies_timeout();
> +            while timeout.as_jiffies() > 0 {
>                  if inner.outstanding_txns == 0 {
>                      break;
>                  }
>  
>                  match self
>                      .freeze_wait
> -                    .wait_interruptible_timeout(&mut inner, jiffies)
> +                    .wait_interruptible_timeout(&mut inner, timeout)
>                  {
>                      CondVarTimeoutResult::Signal { .. } => {
>                          inner.is_frozen = IsFrozen::No;
>                          return Err(ERESTARTSYS);
>                      }
> -                    CondVarTimeoutResult::Woken { jiffies: remaining } => {
> -                        jiffies = remaining;
> +                    CondVarTimeoutResult::Woken { remainder } => {
> +                        timeout = remainder;
>                      }
>                      CondVarTimeoutResult::Timeout => {
> -                        jiffies = 0;
> +                        timeout = Delta::ZERO;
>                      }
>                  }
>              }
> diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
> index 69d58dfbad7b..4be2c3bf8802 100644
> --- a/rust/kernel/sync/condvar.rs
> +++ b/rust/kernel/sync/condvar.rs
> @@ -12,7 +12,10 @@
>      task::{
>          MAX_SCHEDULE_TIMEOUT, TASK_FREEZABLE, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE,
>      },
> -    time::Jiffies,
> +    time::{
> +        Delta,
> +        Jiffy, //
> +    },
>      types::Opaque,
>  };
>  use core::{marker::PhantomPinned, pin::Pin, ptr};
> @@ -182,19 +185,29 @@ pub fn wait_interruptible_freezable<T: ?Sized, B: Backend>(
>      /// Atomically releases the given lock (whose ownership is proven by the guard) and puts the
>      /// thread to sleep. It wakes up when notified by [`CondVar::notify_one`] or
>      /// [`CondVar::notify_all`], or when a timeout occurs, or when the thread receives a signal.
> +    ///
> +    /// A negative timeout is treated as zero.
>      #[must_use = "wait_interruptible_timeout returns if a signal is pending, so the caller must check the return value"]
>      pub fn wait_interruptible_timeout<T: ?Sized, B: Backend>(
>          &self,
>          guard: &mut Guard<'_, T, B>,
> -        jiffies: Jiffies,
> +        timeout: Delta<Jiffy>,
>      ) -> CondVarTimeoutResult {
> -        let jiffies = jiffies.try_into().unwrap_or(MAX_SCHEDULE_TIMEOUT);
> -        let res = self.wait_internal(TASK_INTERRUPTIBLE, guard, jiffies);
> +        let jiffies = timeout.as_jiffies();
> +        let res = self.wait_internal(
> +            TASK_INTERRUPTIBLE,
> +            guard,
> +            jiffies.clamp(0, MAX_SCHEDULE_TIMEOUT),
> +        );
>  
> -        match (res as Jiffies, crate::current!().signal_pending()) {
> -            (jiffies, true) => CondVarTimeoutResult::Signal { jiffies },
> +        match (res, crate::current!().signal_pending()) {
> +            (remainder, true) => CondVarTimeoutResult::Signal {
> +                remainder: Delta::from_jiffies(remainder),
> +            },
>              (0, false) => CondVarTimeoutResult::Timeout,
> -            (jiffies, false) => CondVarTimeoutResult::Woken { jiffies },
> +            (remainder, false) => CondVarTimeoutResult::Woken {
> +                remainder: Delta::from_jiffies(remainder),
> +            },
>          }
>      }
>  
> @@ -248,11 +261,11 @@ pub enum CondVarTimeoutResult {
>      /// Somebody woke us up.
>      Woken {
>          /// Remaining sleep duration.
> -        jiffies: Jiffies,
> +        remainder: Delta<Jiffy>,
>      },
>      /// A signal occurred.
>      Signal {
>          /// Remaining sleep duration.
> -        jiffies: Jiffies,
> +        remainder: Delta<Jiffy>,
>      },
>  }
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.43.0
> 
