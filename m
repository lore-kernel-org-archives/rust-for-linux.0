Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FD520E703
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327697; cv=none; b=sjuOZK+z0ENFgGWaxmAb8diPGNTSTVQRPflH9W+y+2DnjZ5PfjFUtkMsS/PGCQkDnn8Yf+7YoB0obtBtk92aAqSEJGAB/rJpYOctbtpX3LKTLP+JVfaiiHGki6nCDQo0aQe8/BOwD4zqWsvgtVEeOiTkuio/NnvYk/9eLtGXKzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327697; c=relaxed/simple;
	bh=NMJzP+t1S5uMz/babukNL9QhkxTu9C91nbFxaiYC7ug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=au5WSOoCfholL/D+s+o2d/XYL3s6b7OrYTNtJrbTbsSbLD1c9YTZFz9bU6QE8Gar3tbhCCQM2srzWaaifNiyG1N80NxzkPA+Yt6xV+8pKRjd0RhUnNd4M4ggpywRTIBZwQE9Q+kQDmlYkh7cTyhzdt9AFXnID3RQ3EgWL6KMFMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdIyHKu2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdIyHKu2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D334C4CEE9;
	Tue, 22 Apr 2025 13:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745327697;
	bh=NMJzP+t1S5uMz/babukNL9QhkxTu9C91nbFxaiYC7ug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KdIyHKu2eCZ80hTDe0oTs79ckHHX1AqOyLMhHgpuqOnQo3xfkx9VtvMMMbXnRaZ4s
	 /VIQQ25zYun3Lliu7whFcyYd5iEeMA+/HU6jO625qNjCE7Buz5n5QVaWYcbO6JT3gq
	 GIO2QGLDSRc8mTckOVOvwbnRB6XR4XGj8z2d/NsWQSIlHav/2xHGmG8fckj/H7aVe8
	 AMzX+PTjQr+8uRLYDzW78lgnZ+ei53E9n7UW18evnM6xPAeX9wmZyda9xKsUy/pz2C
	 FFW6FxiDZhnvw8UxSwKZdLGSQ2gK7DSyLnDOVX7vTTbtRVMOOkhWnGrP1PGNgBrxS6
	 YYVaVKBFID/GQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>,  <boqun.feng@gmail.com>,
  <ojeda@kernel.org>,  <alex.gaynor@gmail.com>,  <gary@garyguo.net>,
  <bjorn3_gh@protonmail.com>,  <benno.lossin@proton.me>,
  <aliceryhl@google.com>,  <tmgross@umich.edu>,  <dakr@kernel.org>,
  <frederic@kernel.org>,  <lyude@redhat.com>,  <tglx@linutronix.de>,
  <anna-maria@linutronix.de>,  <jstultz@google.com>,  <sboyd@kernel.org>
Subject: Re: [PATCH v1 3/3] rust: time: add ktime_get() to ClockSource trait
In-Reply-To: <20250413105629.162349-4-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Sun, 13 Apr 2025 19:56:28 +0900")
References: <20250413105629.162349-1-fujita.tomonori@gmail.com>
	<j6TQ_TOATaKV1cgs9cQAor4mPf5w-aBkthx9JS9bySKdK05B52gu-27p2SRf_vmJQ0THVPMU3IhsbPWDvQH_jg==@protonmail.internalid>
	<20250413105629.162349-4-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 22 Apr 2025 15:14:46 +0200
Message-ID: <87ecxk9w3d.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Introduce the ktime_get() associated function to the ClockSource
> trait, allowing each clock source to specify how it retrieves the
> current time. This enables Instant::now() to be implemented
> generically using the type-level ClockSource abstraction.
>
> This change enhances the type safety and extensibility of timekeeping
> by statically associating time retrieval mechanisms with their
> respective clock types. It also reduces the reliance on hardcoded
> clock logic within Instant.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/helpers/time.c | 16 ++++++++++++++++
>  rust/kernel/time.rs | 32 ++++++++++++++++++++++++++++----
>  2 files changed, 44 insertions(+), 4 deletions(-)
>
> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
> index 7ae64ad8141d..613475c529d4 100644
> --- a/rust/helpers/time.c
> +++ b/rust/helpers/time.c
> @@ -1,8 +1,24 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/delay.h>
> +#include <linux/timekeeping.h>
>
>  void rust_helper_fsleep(unsigned long usecs)
>  {
>  	fsleep(usecs);
>  }
> +
> +ktime_t rust_helper_ktime_get_real(void)
> +{
> +	return ktime_get_with_offset(TK_OFFS_REAL);
> +}
> +
> +ktime_t rust_helper_ktime_get_boottime(void)
> +{
> +	return ktime_get_with_offset(TK_OFFS_BOOT);
> +}
> +
> +ktime_t rust_helper_ktime_get_clocktai(void)
> +{
> +	return ktime_get_with_offset(TK_OFFS_TAI);
> +}
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index db9a783631ec..4b9b61eed628 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -63,6 +63,11 @@ pub trait ClockSource {
>      ///
>      /// This constant corresponds to the C side `clockid_t` value.
>      const ID: bindings::clockid_t;
> +
> +    /// Get the current time fro the clock source.

Typo fro -> from.


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



