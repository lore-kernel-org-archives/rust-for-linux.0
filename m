Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD9A3E5585;
	Mon,  3 Aug 2026 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749683; cv=none; b=SI+8xbrxG4MhJ+1ZPMWLF3RgkkWwezNJ/+FcifSCSmEYho2UNhUCLqfKGNjpcy33cH8nt+9gBpGpoL0IleylI4U8UdjbBepAXLjvAx8VQQjJ8Clm+HRZs96YUXZT2tWPJK1fwuV+UXqLfkobH2iLjP6g7yBrjC3EbbKszLCnzi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749683; c=relaxed/simple;
	bh=Zu/81nEssvAK/tSxHLvbKrWbrum5LP5OI+GjBHqSyPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRx+huenDXDFEzpnchFutSJttjDepKR6m8hfdPAcTyCoQ5YDupWallQbjumi7cIVhPF+3J2CyLOdP0548LrwxfPyx26hKzHb0+fkdS83X4UqcFBCwr0j4EVLTlgS1rDXFYbKRor/zwHVcTigEKK2xhOw++hAxb1X2Ejjp8zelRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=f4WDZHIk; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="f4WDZHIk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t2p+3bhoDrDud7iU6bwphGdeYQ3+IsVgsXV5VKrsjXA=; b=f4WDZHIky5hxiXPYzZo3G49qkw
	TZshdKf8PFuD0GToS7YYOyfSRq5xg3J3qB88S4D7bE/HkVXlQSWOLnQIOUtLG6EpiLDIy7/43Xvn0
	1L+5zOHB9HwzBgj++5VHdUX7nozUkZS3ZN+0QNzGTshL5J4LFBKp4qA3x/7z/N35O8tJHgc+8flYE
	4LAIZj2my7uMlDDeK2vUhUt5X3mRrSQ23pZrJ7U/RJ0bju1wg7StiOtXGpJTwYhoOM/169aPM+pas
	tfRgSO8XlYOGZYVIuJvGCNY2sBDYvD7cwwE2Mpn9rBVuvrEWMfKmCb0WCu9e1+4KMVVt6SVZJyTtc
	wYAA2V+A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqp46-0000000CzBb-1wbg;
	Mon, 03 Aug 2026 09:34:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EC0653012AB; Mon, 03 Aug 2026 11:34:33 +0200 (CEST)
Date: Mon, 3 Aug 2026 11:34:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH 07/24] locking: Switch to _irq_{disable,enable}()
 variants in cleanup guards
Message-ID: <20260803093433.GE49951@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-8-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731203031.13679-8-boqun@kernel.org>

On Fri, Jul 31, 2026 at 01:30:08PM -0700, Boqun Feng wrote:
> From: Boqun Feng <boqun.feng@gmail.com>
> 
> The semantics of various irq disabling guards match what
> *_irq_{disable,enable}() provide, i.e. the interrupt disabling is
> properly nested, therefore it's OK to switch to use
> *_irq_{disable,enable}() primitives.
> 
> Signed-off-by: Boqun Feng <boqun@kernel.org>
> Link: https://patch.msgid.link/20260121223933.1568682-17-lyude@redhat.com
> ---
>  include/linux/spinlock.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
> index 3d405cc4c121..a9d169dad6d4 100644
> --- a/include/linux/spinlock.h
> +++ b/include/linux/spinlock.h
> @@ -572,12 +572,12 @@ DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_nested, __acquires(_T), __releases(*(raw
>  #define class_raw_spinlock_nested_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_nested, _T)
>  
>  DEFINE_LOCK_GUARD_1(raw_spinlock_irq, raw_spinlock_t,
> -		    raw_spin_lock_irq(_T->lock),
> -		    raw_spin_unlock_irq(_T->lock))
> +		    raw_spin_lock_irq_disable(_T->lock),
> +		    raw_spin_unlock_irq_enable(_T->lock))
>  DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_irq, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
>  #define class_raw_spinlock_irq_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_irq, _T)
>  
> -DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq(_T->lock))
> +DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq_disable(_T->lock))
>  DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_irq_try, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
>  #define class_raw_spinlock_irq_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_irq_try, _T)
>  
> @@ -618,13 +618,13 @@ DECLARE_LOCK_GUARD_1_ATTRS(spinlock_try, __acquires(_T), __releases(*(spinlock_t
>  #define class_spinlock_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_try, _T)
>  
>  DEFINE_LOCK_GUARD_1(spinlock_irq, spinlock_t,
> -		    spin_lock_irq(_T->lock),
> -		    spin_unlock_irq(_T->lock))
> +		    spin_lock_irq_disable(_T->lock),
> +		    spin_unlock_irq_enable(_T->lock))
>  DECLARE_LOCK_GUARD_1_ATTRS(spinlock_irq, __acquires(_T), __releases(*(spinlock_t **)_T))
>  #define class_spinlock_irq_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irq, _T)
>  
>  DEFINE_LOCK_GUARD_1_COND(spinlock_irq, _try,
> -			 spin_trylock_irq(_T->lock))
> +			 spin_trylock_irq_disable(_T->lock))
>  DECLARE_LOCK_GUARD_1_ATTRS(spinlock_irq_try, __acquires(_T), __releases(*(spinlock_t **)_T))
>  #define class_spinlock_irq_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irq_try, _T)

What about the _irqsave() guards?

Is the goal to replace _irqsave guard usage with _irq and then remove
the _irqsave guards?

If so, this should probably we mentioned somewhere.
