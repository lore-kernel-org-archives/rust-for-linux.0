Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B0F2E0938
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Jul 2026 14:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784988583; cv=none; b=TSFqmh07w0/SMlLpC6U+qqtkvhWDwPgUir92iR2wP0Pjom6XnxjdoOy+0MMWd5yI6pGQnzcecc23+gH2WftxBD0mOYF4lOCoar+pEXtS1fiEtX08sayVr4F1M23NYHqgBR5RNI1WxJBcmk+Ubcv9GdGXllgTMRQ1UB8MbDTSgMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784988583; c=relaxed/simple;
	bh=Dp80bhHC2pZxfWCGX1LuQb9uub81dvM8F2U5HkPdon8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMahoEdGHDq7mfxg+PGqz0IRtnNDf+aS/GhChzrgm6KVWcQy69vy18Xv3haw8u3An6ohpKzCAiAq0uI2gP0vnp7fBWzL4IGJJyA7tZYx4iVyd7xkYgmtshIHeu+Gp/PMCqP9WMNeSVB5fMSiwDuAQP3gCNJi22hLINkQGEKcyTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J26RhIHV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J26RhIHV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEF41F00A3A;
	Sat, 25 Jul 2026 14:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784988582;
	bh=r5PYm+oqvpKlxv3Cl/XCwuw8e4e6I/Lk7zvr1vH4Luc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J26RhIHVTAztKY8UhUrTGpqgfmNpO3k2AkrgPmKZNnuU3RtQrF1/z0FonhF73E+uo
	 kTdbrV6yHWV3IGl0lebPRuPu4vslVfUWJStobCce854JrHIRxQZxWSGmfHuh0ecM2h
	 OsjdHnHWzMSPYmgGr3Dl5B5uS5Rfe5juT+VftcBEoYx/0cptH4hVU3QryTsbPovVFN
	 QIStFfXbsG17MG+NIXYfO1822kfTCq+ctg3xhxtlFlav0z2QJF7uWD+aDmFrRtgSsY
	 STMD9p/EuCgnTRvqvgcyplW8Ikfivq0pAlfwK9ZIs2aFspLB8iL1uMpwqmUASCgLd/
	 pKNHsucHH6o3A==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9B5DEF40071;
	Sat, 25 Jul 2026 10:09:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 25 Jul 2026 10:09:40 -0400
X-ME-Sender: <xms:pMNkaoUPadUfnIgcIJEOH-c0wz7C3PL_RP9KRwU0MOwLAYvs7arhPw>
    <xme:pMNkam8ufm2iHmUV2OGDY4OtWy9YCQa2nVom51YAkthHQ8QJ8t3XAha8JHXawTeut
    ZBiA3UcBjHB_Nh5NJXIYCezpcEjMcg5nF5X8GahVBex259lETlpQA>
X-ME-Received: <xmr:pMNkaigfjLmkMXp7Q-rh9V1QaHJbFsoFMiNixw_LVjQRs-C7ddSchOprjwA>
X-ME-Proxy-Cause: dmFkZTE+V3F6vyp9ozQmXV+S4cQnM2PV+kxwk5oow5vH94Np1S7UQGE9YaAB7Cw6e6JmeZ
    Om1I382tv9RJaocFeSwM09JQnyHL+zEh6yFJBBnvlhz24Cfs6fvBKdM6lfHJWOWU6IaAj/
    /++tJta25Nv/Q0o0lF96Ovk7xj99iJ0CsMcCPOm9uxI3pDuNFgut9PwC9mqhgOHOVAhSZM
    bu+60WZAx7lDgZASxgAgoviHJ1bdp/+w2zXF0a3I2KQaEtW6JwS7sBucGsDAq7QMbKvG1u
    4qXwofJbSvWsztetHuJiRPfIC/0tbxdvaVk1shI3aqfIzIdKZA92ceI4mtxJ02/Ih2ysrx
    7ysVPxG9Ac8dGAY+soEPTOgi83SO+EmAQ+M/GBC3WIEvj56g9Bk6qTr3ZFUvNmV7KC8+AG
    DyJMjSr1IGL0y8SecgbSFaY4lE9jnWvWuK/ZWO0BqxsBDpCLugGM5kyFWICmu4eX3/A02t
    R1s4ixnHBggPaZL2J6AG7QL5+udWWOPiIQyi8uKisCXJicNUYyJYAjPDRBFDH/BwR4JUOU
    8j0v4k9fOOXwOM5Htzl11VbMNY5kb4uAt4flmKYU5L7a1MLTfv4F1D78sQM9seBprg166I
    2r2ds3FFO+sWfOSHPbwMUlhKncqmstqWJC2hF0FaM/ARUZt/Wfkx8XHrDWLQ
X-ME-Proxy: <xmx:pMNkaidY7mj6Zrzvehg8_xAt-QWl5jsemv55HlApQbb79HqE9JXu0w>
    <xmx:pMNkarKXzXo9iU4eLh6rPDHbpzld93Z8XbQ79vYiy7Ew9JVzQvFoOg>
    <xmx:pMNkavn1lWciOLBa8U88o6SG8YRjsB466MYfjMg1-7ICFtBP6z91OQ>
    <xmx:pMNkajfhRuY4LR7fIeKlRAJ3Bz_rJtQCKAEQzv1pttnSxu_bCDo5QA>
    <xmx:pMNkagwey2F_WmMB1O1hVL7dydr-BmBow5zbJ8t6H4nt0a1W87CSEgVT>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jul 2026 10:09:40 -0400 (EDT)
Date: Sat, 25 Jul 2026 07:09:37 -0700
From: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: revocable: use LKMM atomics instead of Rust atomics
Message-ID: <amTDoW2sark_jEUa@MacBook-0RXW5>
References: <20260716145536.3681630-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716145536.3681630-1-gary@kernel.org>

On Thu, Jul 16, 2026 at 03:55:35PM +0100, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> Kernel code should use LKMM atomics. The existing code is `AtomicBool` with
> the need to use `xchg`, so convert it to `AtomicFlag`.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Queued it in rust-sync, thank you all!

Regards,
Boqun

> ---
>  rust/kernel/revocable.rs | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index 2af212ea3b6d..4d177744520a 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -7,12 +7,22 @@
>  
>  use pin_init::Wrapper;
>  
> -use crate::{bindings, prelude::*, sync::rcu, types::Opaque};
> +use crate::{
> +    bindings,
> +    prelude::*,
> +    sync::{
> +        atomic::{
> +            AtomicFlag,
> +            Relaxed, //
> +        },
> +        rcu, //
> +    },
> +    types::Opaque, //
> +};
>  use core::{
>      marker::PhantomData,
>      ops::Deref,
> -    ptr::drop_in_place,
> -    sync::atomic::{AtomicBool, Ordering},
> +    ptr::drop_in_place, //
>  };
>  
>  /// An object that can become inaccessible at runtime.
> @@ -66,7 +76,7 @@
>  /// ```
>  #[pin_data(PinnedDrop)]
>  pub struct Revocable<T> {
> -    is_available: AtomicBool,
> +    is_available: AtomicFlag,
>      #[pin]
>      data: Opaque<T>,
>  }
> @@ -85,7 +95,7 @@ impl<T> Revocable<T> {
>      /// Creates a new revocable instance of the given data.
>      pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>          try_pin_init!(Self {
> -            is_available: AtomicBool::new(true),
> +            is_available: AtomicFlag::new(true),
>              data <- Opaque::pin_init(data),
>          }? E)
>      }
> @@ -99,7 +109,7 @@ pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>      /// because another CPU may be waiting to complete the revocation of this object.
>      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>          let guard = rcu::read_lock();
> -        if self.is_available.load(Ordering::Relaxed) {
> +        if self.is_available.load(Relaxed) {
>              // Since `self.is_available` is true, data is initialised and has to remain valid
>              // because the RCU read side lock prevents it from being dropped.
>              Some(RevocableGuard::new(self.data.get(), guard))
> @@ -117,7 +127,7 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>      /// allowed to sleep because another CPU may be waiting to complete the revocation of this
>      /// object.
>      pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
> -        if self.is_available.load(Ordering::Relaxed) {
> +        if self.is_available.load(Relaxed) {
>              // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
>              // valid because the RCU read side lock prevents it from being dropped.
>              Some(unsafe { &*self.data.get() })
> @@ -158,7 +168,7 @@ pub unsafe fn access(&self) -> &T {
>      ///
>      /// Callers must ensure that there are no more concurrent users of the revocable object.
>      unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
> -        let revoke = self.is_available.swap(false, Ordering::Relaxed);
> +        let revoke = self.is_available.xchg(false, Relaxed);
>  
>          if revoke {
>              if SYNC {
> 
> base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
> -- 
> 2.54.0
> 
