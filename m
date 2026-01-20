Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB89044A72D
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768926244; cv=none; b=ghMeyn41Qci9FYlvJ//hQLWSgn6HW+fgcTQRT4bq/9T5KEKIaIxxS3ywSpVC8fbho2TbFMA/IPngEOmKxBp8bQeSBPotg3rby3/72tupfPVfXd9aGT1Re1Je8JxZD7NUSkkmqDZ0XJ0z/CKPkMB77QUjPThXbc51bATSwSp4Iec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768926244; c=relaxed/simple;
	bh=+ucFVRrgpEefO2Jjg8KKYYHKcBFgPjaiGNJQOyBpXkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYNOda4EAv1fTlbSxPUCgQUoadSWJoZzgNMRDGogP515F7u2SZnlTDa3b5uymL7Gc/HqE7Q+TPwV43/u6bblS4Yx1dk0cxXhvUPKmO7XO0DJ67J7t4O8YEvWxbrN8970W5/88ER/ZtVvHoBsWq50pG2xggCuyFVDQBrAuM5uBcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hw1v9fFM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hw1v9fFM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so35755325e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768926241; x=1769531041; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNTcrrXAP9aiDb63ILRilIlxrZ3yFdWvD8IViTWFwuw=;
        b=hw1v9fFMpGsgpXG3o+k1YfvkJs8x5VO9S39tUwwv545XSCXZ3vinSIZMt+bCEaM5ka
         i/zCBeqpHjohCrEMlgTww5AFHv9VvQdR7GmU3tuuAN2IPtrduvBJz67CX3ZUDtRzBBtZ
         1CiPxwikHX4xI4qp/gQb/Rys+qzHZ9Xw5LAyRmPVNDy7jcmqBjLxO1zEEZ0yKCLge8VO
         jGNZcN5Wk2bbRjgbg9LjLPUVpAY6359mj5DYASjEqISfkelYbZ7ISeUthuWS7Sph/1D0
         Be4F1KOPqnyl37RBkwqAE+RfrnVFzGwE67pTXAd6c7vPQ6aOrUCEwa5fzTv3FidpYg9q
         MCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768926241; x=1769531041;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kNTcrrXAP9aiDb63ILRilIlxrZ3yFdWvD8IViTWFwuw=;
        b=RkNQ64Edqh5Z40dNK62OllHt43CkxPNUm5qUqDFTKz8X8kO8XWyxNGaVxRhLPZOcsn
         1gKuImSvI8QuLFO6F5roS4gXj0q5VmWmwGWqKtT5pREBE4YZR6pwrfrHlesWbrkO8YG4
         ktO6NKCHxSN+JnXJlk9coeMfoiZ0exxFn+87BZUdCuI+vJe0wL+esTqzTnfRi8ZEhwX/
         S9BneXOw1V9N5Uz+dKdhYtcDKXfFFosxZZDKEzI3l7VtC/4g+2nM7JjtMoaGnB9r+e3Q
         keNFb+tAWgDDWlemyBkw5ClEsEZZOmzkUGZUl3D/BeQlHDf9xY4jGisf0izL9+RkG2jr
         hSjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdFkjZykXhO09ixCMdgg2JF40fI6DI4YgAgJdy+/h4BZrU5u1k20D4xrdxLjCmNHb8lpJ2Vs2fAOFtJLQoHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEAoTXsfeL/qNUVCgy5AAVRvmHu/zaeElSwVpBe3vDIw8VV1P4
	pimynh10kka+mgCkyXHyYyc/PaKaYGdl9ESi9iFgbI8X1tgRxMBFhMCQGN96t7BBDg==
X-Gm-Gg: AY/fxX61LP5fGyvRx7w0gUCGd6p15/JV+54xIvKik/ysWAf6OsUpjtZrJ6ybxkzPA6L
	xNQP+XcGJEAsy7qAjQ6N9Z3ZcCee0cZE1XXqGxQgQR57CZVfdc1Yy/iba+5zj52xVkJSFI+v1mo
	6zhXqQ2CospCWs36tvfZt4mHX3FMvCOtdkbfilEoY98XBU78UT5ol1zuC+iBZrY/9tW9q33WBZd
	F31UTiPxeEV09hdJQ2E0ry/E2nsHjCVoEivjvtNn89uWON5kLCzFHtY8Wd6WKtp7fBgh8OFx5Os
	NkHoVtvg9Ee8RCyXvoYCfVgMTLVgWe1Hu9au76iuj1ltEdHyfmSe13aq7oDuG6snJNeiMCvWcMV
	jTXDIA8//0Q0jO7BEZ3j2l87t3FGfcD3GGPhUGgoewQ6O9dpId1+SnSm6QMmBptofxywkhCm3dT
	YH9gYsfB8bDZ8LzWxC+AWu3p7hF0b+LovMijizFSu6PywovtI=
X-Received: by 2002:a05:600c:548a:b0:477:1bb6:17e5 with SMTP id 5b1f17b1804b1-4801eb10f27mr172875965e9.30.1768926240817;
        Tue, 20 Jan 2026 08:24:00 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:7c8:a22a:d5aa:54db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ffcsm29599978f8f.18.2026.01.20.08.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 08:24:00 -0800 (PST)
Date: Tue, 20 Jan 2026 17:23:54 +0100
From: Marco Elver <elver@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, kasan-dev@googlegroups.com,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Elle Rhumsaa <elle@weathered-steel.dev>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH 2/2] rust: sync: atomic: Add atomic operation helpers
 over raw pointers
Message-ID: <aW-sGiEQg1mP6hHF@elver.google.com>
References: <20260120115207.55318-1-boqun.feng@gmail.com>
 <20260120115207.55318-3-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120115207.55318-3-boqun.feng@gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Tue, Jan 20, 2026 at 07:52PM +0800, Boqun Feng wrote:
> In order to synchronize with C or external, atomic operations over raw
> pointers, althought previously there is always an `Atomic::from_ptr()`
> to provide a `&Atomic<T>`. However it's more convenient to have helpers
> that directly perform atomic operations on raw pointers. Hence a few are
> added, which are basically a `Atomic::from_ptr().op()` wrapper.
> 
> Note: for naming, since `atomic_xchg()` and `atomic_cmpxchg()` has a
> conflict naming to 32bit C atomic xchg/cmpxchg, hence they are just
> named as `xchg()` and `cmpxchg()`. For `atomic_load()` and
> `atomic_store()`, their 32bit C counterparts are `atomic_read()` and
> `atomic_set()`, so keep the `atomic_` prefix.
> 
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
>  rust/kernel/sync/atomic.rs           | 104 +++++++++++++++++++++++++++
>  rust/kernel/sync/atomic/predefine.rs |  46 ++++++++++++
>  2 files changed, 150 insertions(+)
> 
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index d49ee45c6eb7..6c46335bdb8c 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs
> @@ -611,3 +611,107 @@ pub fn cmpxchg<Ordering: ordering::Ordering>(
>          }
>      }
>  }
> +
> +/// Atomic load over raw pointers.
> +///
> +/// This function provides a short-cut of `Atomic::from_ptr().load(..)`, and can be used to work
> +/// with C side on synchronizations:
> +///
> +/// - `atomic_load(.., Relaxed)` maps to `READ_ONCE()` when using for inter-thread communication.
> +/// - `atomic_load(.., Acquire)` maps to `smp_load_acquire()`.

I'm late to the party and may have missed some discussion, but it might
want restating in the documentation and/or commit log:

READ_ONCE is meant to be a dependency-ordering primitive, i.e. be more
like memory_order_consume than it is memory_order_relaxed. This has, to
the best of my knowledge, not changed; otherwise lots of kernel code
would be broken. It is known to be brittle [1]. So the recommendation
above is unsound; well, it's as unsound as implementing READ_ONCE with a
volatile load.

While Alice's series tried to expose READ_ONCE as-is to the Rust side
(via volatile), so that Rust inherits the exact same semantics (including
its implementation flaw), the recommendation above is doubling down on
the unsoundness by proposing Relaxed to map to READ_ONCE.

[1] https://lpc.events/event/16/contributions/1174/attachments/1108/2121/Status%20Report%20-%20Broken%20Dependency%20Orderings%20in%20the%20Linux%20Kernel.pdf

Furthermore, LTO arm64 promotes READ_ONCE to an acquire (see
arch/arm64/include/asm/rwonce.h):

        /*
         * When building with LTO, there is an increased risk of the compiler
         * converting an address dependency headed by a READ_ONCE() invocation
         * into a control dependency and consequently allowing for harmful
         * reordering by the CPU.
         *
         * Ensure that such transformations are harmless by overriding the generic
         * READ_ONCE() definition with one that provides RCpc acquire semantics
         * when building with LTO.
         */

So for all intents and purposes, the only sound mapping when pairing
READ_ONCE() with an atomic load on the Rust side is to use Acquire
ordering.
