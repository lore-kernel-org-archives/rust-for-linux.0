Received: from forward502b.mail.yandex.net (forward502b.mail.yandex.net [178.154.239.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E97F1E4AB;
	Sun, 16 Nov 2025 06:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763275696; cv=none; b=I6ybO0OWde0iFwN5BTur3L7jo1j4NOUq3n3IAMCMAMFjnk8jNWgahYM+Oj1NTCe8V4VOsoWPgBDuBr5bs9is8u+LErrkLsuC8k+3f+xstmH+fC0+AXFg8LQO+OWQVvKuOTK8rlnu63nLa0o5vJmFraEMJARKG4xpLWvCXJvZCJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763275696; c=relaxed/simple;
	bh=XgVZggoDykvWa8WaGag/uQuK366MnMQeHoMcc2ytPDU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a4DDzne5MCsY41KQR2fgKCcVw63BgXyK61rCTPM7W98XLa9f11EqgCjugGQ8fGNXddLZrMzEbQfZ2qV4uqqvb3cASJtZIEGspRyKnaSmJUWwIEZdNZ2Zp4TlLUZOmpFx+HTNYgiVuxpPI+wMyg3wOxqPmrMSBy/0tjJws18FsJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=lu9qx7jN; arc=none smtp.client-ip=178.154.239.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="lu9qx7jN"
Received: from mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:25b4:0:640:a124:0])
	by forward502b.mail.yandex.net (Yandex) with ESMTPS id 7314181098;
	Sun, 16 Nov 2025 09:38:13 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 7cMFPJiLVa60-twFHot7T;
	Sun, 16 Nov 2025 09:38:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1763275092;
	bh=EjF+vudCTdEmpnT+hVdQEo0GcYfpmKf9X2EWQeQcaw8=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=lu9qx7jNX7XHo2zS9nLcslGNWJ3swjBks9xzzX6pbuAmXTYDbMIqGqVBUnUWfevtT
	 DNjCF3DRwQK9or0Ff0EalW3+9mBY7YwkDVfWs8+A9s+r7ux5rupKsbOqSkMQ1uXJM/
	 WPkiKtmnsNqH+lZsR94EeSZRsLOnBdI1k0BeceoU=
Authentication-Results: mail-nwsmtp-smtp-production-main-60.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Sun, 16 Nov 2025 09:38:05 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas
 Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, FUJITA
 Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker
 <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] rust/time: Add Delta::from_nanos()
Message-ID: <20251116093805.7918b83d@nimda.home>
In-Reply-To: <20251114184207.459335-1-lyude@redhat.com>
References: <20251114184207.459335-1-lyude@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Nov 2025 13:42:06 -0500
Lyude Paul <lyude@redhat.com> wrote:

> Since rvkms is going to need to create its own Delta instances, and we
> already have functions for creating Delta with every other unit of
> time.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 6ea98dfcd0278..2b096e5a61cda 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -363,6 +363,12 @@ impl Delta {
>      /// A span of time equal to zero.
>      pub const ZERO: Self = Self { nanos: 0 };
>  
> +    /// Create a new [`Delta`] from a number of nanoseconds.
> +    #[inline]
> +    pub const fn from_nanos(nanos: i64) -> Self {
> +        Self { nanos }
> +    }
> +

I wonder if it makes sense to remove all the `from_*` functions from
`Delta` and replace them all with something like this:

    pub const fn from_duration(duration: Duration) -> Self {
        Self {
            nanos: duration.as_nanos(),
        }
    }

What do you think?

>      /// Create a new [`Delta`] from a number of microseconds.
>      ///
>      /// The `micros` can range from -9_223_372_036_854_775 to
> 9_223_372_036_854_775.
> 
> base-commit: 5935461b458463ee51aac8d95c25d7a5e1de8c4d

