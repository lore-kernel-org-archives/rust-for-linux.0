Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26D7322B77
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 13:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772111976; cv=none; b=hLGE7j6BglZ69KWjRfWyR9YL4YVDDrNRd+MAsiSNrRtAO10wH60+Wwe01dT4XVAhU9EoVRsmVgX6e8DSJS13BnyZYLji3IOmKHwBmluTaze/mrAwU5+O+uNrPhZ/ozpegmd105e5BOWDG/gfaQJ6HE4cpwHz9kH8Iqp3sacQNa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772111976; c=relaxed/simple;
	bh=r/ZpQSR4z6YtBZ4S9aKW0jXQrGvHyIvoL9GY0WoxQxI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=Oe0L25hqvLtl+sjNbi82XMF+eYbYrn+WZgbqnLX+QbPu4V4eL0h5mT6dPIeIatBNLae3h3/TivUNMEnX0beIm0Af6VGdk2PsSjX/8elA57aZj9NMiT/AdQHtsj/JUEd6MYQHK7Vi+WpUwxFikLzoPoeyC2wvxg3jp9GQIaQ43X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkJSpJC0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkJSpJC0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC534C116C6;
	Thu, 26 Feb 2026 13:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772111976;
	bh=r/ZpQSR4z6YtBZ4S9aKW0jXQrGvHyIvoL9GY0WoxQxI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IkJSpJC0EbOV14Y6sJdZAnHGVLFpHqC5ElO8gTTo8Wf+NfJNF1AuI7ynClgGN/jcE
	 2aAGVcCB1CcaaR5Z3QjYM+iKRSmztHvzwxQABfKV4ukZkecdZrFLI2s6veL02l3tjU
	 hVMoV4z8kmgimdccNtRcqOFNqcXfGv37hPAYbI3CNYi3qBIlnBzKk247iBflN8m0UG
	 0M0JhYKvBCzQ0sVVIu0NT8llIQAYgjI4/bd68UipIiJXGqNsnkhXyTv5oqtU1wYK9D
	 m0zDw1dDfLW+oZqn2EtZxmVrzHzib9wXXIaprIbeE50GIZDczGh8xfQzPbShNk2x2k
	 ylhuHp/AEjxWw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@aliasing.net>, gary@garyguo.net
Cc: tomo@aliasing.net, ojeda@kernel.org, dirk.behme@de.bosch.com, aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, frederic@kernel.org, jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tglx@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v2] rust: hrtimer: Restrict expires() to safe contexts
In-Reply-To: <20260226.215052.2040587083248816676.fujita@bee>
References: <20260226.215052.2040587083248816676.fujita@bee>
Message-ID: <1772111941.36504110-faee-4088-a465-c0faad81a43b@kernel.org>
Date: Thu, 26 Feb 2026 13:19:01 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

FUJITA Tomonori <tomo@aliasing.net> writes:

> On Thu, 26 Feb 2026 11:42:39 +0000
> "Gary Guo" <gary@garyguo.net> wrote:
> 
> >> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> >> index 856d2d929a00..78e2343fd016 100644
> >> --- a/rust/kernel/time/hrtimer.rs
> >> +++ b/rust/kernel/time/hrtimer.rs
> >> @@ -224,27 +224,39 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
> >>          self.forward(HrTimerInstant::<T>::now(), interval)
> >>      }
> >>  
> >> +    /// Return the time expiry for this [`HrTimer`].
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// - `self_ptr` must point to a valid `Self`.
> >> +    /// - The caller must either have exclusive access to the data pointed to by `self_ptr`, or be
> >> +    ///   within the context of the timer callback.
> >> +    #[inline]
> >> +    unsafe fn raw_expires(self_ptr: *const Self) -> HrTimerInstant<T>
> > 
> > I guess the signature of this can also be
> > 
> > `unsafe fn raw_expires(&self) -> HrTimerInstant<T>`? Then you can remove the
> > first safety requirement.
> 
> Thanks, I've updated the signature to use &self.
> 
> Andreas, this breaks the consistency with raw_forward. Is this
> acceptable?

If we do this, we get to argue that the NonNull we have in the callback context
is convertible to a reference. Either way is fine with me.

If you change this to a reference, then I think we should rename the function to
`expires_unchecked`. The `raw` usually refers to operations on pointers rather
than references.

Best regards,
Andreas

