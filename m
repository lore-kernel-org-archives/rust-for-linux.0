Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634692;
	b=b7yKFYciv7el2Ax7GPYYBvhm+HpqiUigesw1PhAHeDzLUzOozWvPoqsRU1UBWWgzGfza
	 q7mUswuZBohMcDjwKCI2Qxx3XDb/nF8aj9N1Wnoi/wJ2wNmDNiXcw6mHE2w95fKSjrjNa
	 80vm2++PTL/0YhGc4zqXi6SAXFbXwpUxJ8xLh9oV5iqGaGizI+PTKLnLs0PQb11Ra9GoZ
	 z5vukpUH8dS/n0AZ/gGK+Kjap9IvKEDatCbNeeO5Hkrmvej+0AEh8FMVA6M2EhAzAJzoF
	 1hhbqr0M85eDet+NgoGdlWMAR3vU42vQfcQcVHacrZ4+puiZG3pRtH3tt12Tz+2+3Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634692;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qlIPZi0u6yOauO+OPLsKraWQniSptmtMhVHra/xvkjY=;
	b=5X7j4KoClNi2+0/0IaFXbCsLKuk/SPuLR7Lc8rvNM2aftLYGMplT0o3MpRigZokVwrJJ
	 SJUIWCoov00KMeQO3uFhRC7iipQENa64qwdO+iYxOILdcnXzrYyuJpoCp3ZseAiuV/+Wy
	 kr5Fijit9wJo1npb6jxlHR3AWgQrMc3uuS1+NhP5JI/wIFVQ6i39jsaPsnGoIMiwp5u5x
	 w6jj22xP10H30UNdS6wLH8yg079hpmmrAfAHHYqTPImIUjktGbS5f7r5/uQfcO82JjqlD
	 7q9A4XtypXAAMOGv/Prb+uucU8rS40e4lCOjME3PzIdcxk6kmv3MFQE5O4JICdogP2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oaV42w8u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BBC606E033
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oaV42w8u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D481D1F00A16;
	Mon,  2 Nov 2026 15:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793634692;
	bh=qlIPZi0u6yOauO+OPLsKraWQniSptmtMhVHra/xvkjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oaV42w8uo1sPUH0uJqUgHmeUWPjlqyH+H9/UOrctIRT+8j8Sp6L1/cbcdRuPPd/aj
	 99wR3mqm1g8dBal4Qonra8gd3oyhrZVLZJD7R2/3ny4TaTuHOagU05Cv6EhSjcY2cB
	 vC/hckZM/pBiwOD6isgtlC29xf01BA1fklqpNYsEJztH9P3pML89iZm8oAmXBnMNiS
	 F2T9mLWqk/e6Bwc7C9ZvSQrYCrvHi5QjPkVVSmSOqyp9uPFhPxcECfETNzUTgUcurM
	 QLNrWX1z4sJOqayN6A1uprAojof+9ytEB4h7q5D+hpmQeJNYPh7eXAEpijGqOTvb+a
	 dfGciQK96hHVg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1E568F40066;
	Mon,  2 Nov 2026 10:51:31 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 02 Nov 2026 10:51:31 -0500
X-ME-Sender: <xms:g7Hoahnctsw8SgU_adZrAL4B_J8KgBjswnRfud30gcrmGuTngjRHvg>
    <xme:g7HoaqCD3h6lnF5Zai4PJ7tNbuqEgyZ07K6bKkV1FQQYl9lZ9BVcbP0wzVjp-1PxJ
    ZysLIYghl-gvZQyCifz5vKU77FvdEUc9tTfdjcdIRGJDDgZ4u_sj80>
X-ME-Received: <xmr:g7HoasJDNx6GWUfnQPxERUfr-Iumwzf2u5C2MeQ_1cx60OTR_x1xR23nFJdEWlpDqykAMWaQgYx39vy64ZI6Ev9eJp0ARCvp>
X-ME-Proxy-Cause: dmFkZTF3LJKH0twQ0mqWxh7leXrMsIR+Jv5n/COwjK6/6F0101Pqf1aNy5hcgS9tLeUTOM
    jpncM6+0k0uy6U2d940TgH3C0Hnv5Ppy3QBEfFvivMTwK6YnWgzGEGv3h5g3LnxKehcNA5
    sKfpLqsOsMQ1BIqDT75c60k45roxMsHoLYqRvKYhRCUX49seDzopPAKYFeriAGRNngF4UD
    3May1dvwgLG45ax58w4iG31jKlcHQxtajETEijOQjI3taR2y7gkg17LsuKkpcVrqJ9ESBo
    UqoafHIsCWDibf2ZNL/Dz3mYaMgJKC3G86W/8s/pQfx596ZCU1M5DTDq4Pzip41aBFaXCJ
    L1H15uiFyMV640uUbJ0a6hPRzLfhcY/QD1/h7VxG8xHDse/HfjTwX32QYu6bs6GzmB0MVz
    9cMDQVR1rbQNkZkbJsU5HMAEDFKFQg6unH9rOLJo5DXH3lvsiO9JbC90WpLpUIPZvQHzUm
    X+GlKQ2FXz1Cs303dNEtTw3xrlIJJ8XanvU4qI2HKONtGROBuhqWXUyThPqER12fnHIMo1
    L3E7/093RSurR2RZwgC791EJQGw5PHgiHB4uRyTzWl2FGf0VBVWdJK3e3xEWPjDdVQ5WD/
    ZEvq1nkPt2UbbbfzLmZX9ED2V3GXg8AFNot8dvXQmXQIAA6jp+nf+7/xH35A
X-ME-Proxy: <xmx:g7HoatwsCU2Z3q-_4wHs0PGKI32f258wE52kWqExZEnQQQDd7jRuUQ>
    <xmx:g7Hoagynx5QA9LJryZ4fNNbaOXBbpCX-Q5o2WzklQNAD6Gypudgv9Q>
    <xmx:g7Hoav2OOOa-fmpKVHOzTugkwLywnb-ZFRphWXp2K4QkilrLd-R1rg>
    <xmx:g7HoaiXMwtvAl9eW46_mDQr7gGLCOFWQaSePRn5QIVrEALHDaLV9Hw>
    <xmx:g7Hoajcdx9-Rv5Xy8MWKCy6PrZgBE0YO_bhpnSrdoAjwlymdDVPvSKpC>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 10:51:30 -0500 (EST)
Date: Mon, 2 Nov 2026 07:51:29 -0800
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
Subject: Re: [PATCH v9] rust: sync: condvar: use Delta<Jiffy> for timeout and
 result
Message-ID: <auixgbeSSfBWwVS9@tardis.local>
References: <20261102035934.711973-1-tomo@flapping.org>
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
In-Reply-To: <20261102035934.711973-1-tomo@flapping.org>

On Mon, Nov 02, 2026 at 12:59:34PM +0900, FUJITA Tomonori wrote:
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
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Thanks. Alice, any concern regarding the change in binder?

I have some naming suggestion, please see below:

> ---
> v9:
> - Send as a single patch. Patches 1/4 and 2/4 of v8 are in v7.4-rc1,
>   and the workqueue patch will be sent separately
> - Rebase on v7.4-rc1
> - Drop the comparison with enqueue_delayed() from the commit message
> v8: https://lore.kernel.org/rust-for-linux/20261002050428.2746277-1-tomo@flapping.org/
> ---
>  drivers/android/binder/process.rs |  7 ++++---
>  rust/kernel/sync/condvar.rs       | 31 ++++++++++++++++++++++---------
>  2 files changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index 1f4cb43f1de6..edde0ea35687 100644
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
> @@ -1552,8 +1553,8 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
>          inner.is_frozen = IsFrozen::InProgress;
>  
>          if info.timeout_ms > 0 {
> -            let mut jiffies = kernel::time::msecs_to_jiffies(info.timeout_ms);
> -            while jiffies > 0 {
> +            let mut jiffies = Delta::from_millis(info.timeout_ms.into()).to_jiffies_timeout();

I would rename this variable to `timeout`, i.e.

	let timeout = Delta::from_millis(info.timeout_ms.into()).to_jiffies_timeout();

Thoughts?

> +            while jiffies.as_jiffies() > 0 {
>                  if inner.outstanding_txns == 0 {
>                      break;
>                  }
> @@ -1570,7 +1571,7 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
>                          jiffies = remaining;
>                      }
>                      CondVarTimeoutResult::Timeout => {
> -                        jiffies = 0;
> +                        jiffies = Delta::ZERO;
>                      }
>                  }
>              }
> diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
> index 69d58dfbad7b..ae70e91eca94 100644
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
> +        delta: Delta<Jiffy>,

s/delta/timeout as well.

>      ) -> CondVarTimeoutResult {
> -        let jiffies = jiffies.try_into().unwrap_or(MAX_SCHEDULE_TIMEOUT);
> -        let res = self.wait_internal(TASK_INTERRUPTIBLE, guard, jiffies);
> +        let jiffies = delta.as_jiffies();
> +        let res = self.wait_internal(
> +            TASK_INTERRUPTIBLE,
> +            guard,
> +            jiffies.clamp(0, MAX_SCHEDULE_TIMEOUT),
> +        );
>  
> -        match (res as Jiffies, crate::current!().signal_pending()) {
> -            (jiffies, true) => CondVarTimeoutResult::Signal { jiffies },
> +        match (res, crate::current!().signal_pending()) {
> +            (jiffies, true) => CondVarTimeoutResult::Signal {

s/jiffies/remainder

> +                jiffies: Delta::from_jiffies(jiffies),
> +            },
>              (0, false) => CondVarTimeoutResult::Timeout,
> -            (jiffies, false) => CondVarTimeoutResult::Woken { jiffies },
> +            (jiffies, false) => CondVarTimeoutResult::Woken {

s/jiffies/remainder

> +                jiffies: Delta::from_jiffies(jiffies),
> +            },
>          }
>      }
>  
> @@ -248,11 +261,11 @@ pub enum CondVarTimeoutResult {
>      /// Somebody woke us up.
>      Woken {
>          /// Remaining sleep duration.
> -        jiffies: Jiffies,
> +        jiffies: Delta<Jiffy>,
>      },
>      /// A signal occurred.
>      Signal {
>          /// Remaining sleep duration.
> -        jiffies: Jiffies,
> +        jiffies: Delta<Jiffy>,

Similar for these two: s/jiffies/remainder

Thoughts?

Regards,
Boqun

>      },
>  }
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.43.0
> 
