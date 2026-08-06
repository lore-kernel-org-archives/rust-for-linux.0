Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06713242D9
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 09:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009474; cv=none; b=fPggC6UOqJWwWv3lSO+TFWNWlIjpu8jN9u+RTHIezJ+/YrkfgJPg/P5Yktf6BSaAE8DPc3eOo5xl46Nl+BxM7gUekYTaMSwQLi2x9YrOeQxjTiZUvSTGlDA7nRVnQRMMrK5Gpjp1j86eq8pU6NEwpPauqvSGr0nFxuEAOGgkFbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009474; c=relaxed/simple;
	bh=DdWyCrlfKrFfM7oIzAqMQzeboWlv+W/CvBtd+2lsg/c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XwYZRHV7Sv0Y/5no5+6CL255caQsmPaCVXZS9lVgUdhBiui2AwLtumlHguVvHAQtTlWjb+fZp0JFyWB8qRA1imKyUtFuAXIfLy1hiCHgtxt++tLZpSCyDP+RPM/Us0IUm7texoQRnDRx/ztuYn9ruZLDOhY6mNjIyzaSzJ4KZiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoabGSF9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoabGSF9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBA61F000E9;
	Thu,  6 Aug 2026 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786009472;
	bh=k7A2ZQmOgDgPs8v2esMf6scIu0kEFNVohGMgj4n/c8A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZoabGSF9ifc0guYvC8h4xT4NSbFvOOxuBfRFXGjW9AgBkXfcuunGn4Eg/kQdHTb91
	 17TspP5WwVAbcNvoC8STKaVVZCfrXrQrd5KyMpexsSxkCUE1LsjI/BTseYcmZkl+q1
	 rfxvBSDZXEz3qY3aJJh4FEJ184KHTb0ff1nxSl+QnXzoUaXo3Fa9Y1i9T7bIeioVnQ
	 I5naSb9AGydvbuH2nyVzVGTMYK/WeRNzcqqEilE410Sr/WGCJczKIxD3aCcbkxq+Pc
	 nSsOAxeYnjwIEIaQAg1lD5CIDvXQ0FSLr/bAhY3A3bOMtLIW5t9jA6kgvG5CWw81UD
	 BnKaQOc+crPlQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tkjos@android.com
Cc: acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v5 1/7] rust: time: make Delta generic over its time unit
In-Reply-To: <20260806073241.1024319-2-tomo@flapping.org>
References: <20260806073241.1024319-1-tomo@flapping.org>
 <20260806073241.1024319-2-tomo@flapping.org>
Date: Thu, 06 Aug 2026 11:44:21 +0200
Message-ID: <878q6j4m8a.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Delta hardcodes its value as i64 nanoseconds. A later patch adds a
> jiffies span, whose natural representation is isize jiffies rather than
> i64 nanoseconds, and a separate type per unit would duplicate the
> arithmetic and comparison machinery.
>
> Make Delta generic over its time unit so the jiffies span can reuse that
> machinery. The nanosecond Delta keeps its current representation and API
> via the default unit parameter, so no functional change.
> users.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/time.rs | 72 ++++++++++++++++++++++++++++++---------------
>  1 file changed, 48 insertions(+), 24 deletions(-)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index b8463823aed9..589bd7827523 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -246,7 +246,7 @@ impl<C: ClockSource> ops::Sub for Instant<C> {
>      #[inline]
>      fn sub(self, other: Instant<C>) -> Delta {
>          Delta {
> -            nanos: self.inner - other.inner,
> +            value: self.inner - other.inner,
>          }
>      }
>  }
> @@ -258,7 +258,7 @@ impl<T: ClockSource> ops::Add<Delta> for Instant<T> {
>      fn add(self, rhs: Delta) -> Self::Output {
>          // INVARIANT: With arithmetic over/underflow checks enabled, this will panic if we overflow
>          // (e.g. go above `KTIME_MAX`)
> -        let res = self.inner + rhs.nanos;
> +        let res = self.inner + rhs.value;
>  
>          // INVARIANT: With overflow checks enabled, we verify here that the value is >= 0
>          #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
> @@ -278,7 +278,7 @@ impl<T: ClockSource> ops::Sub<Delta> for Instant<T> {
>      fn sub(self, rhs: Delta) -> Self::Output {
>          // INVARIANT: With arithmetic over/underflow checks enabled, this will panic if we overflow
>          // (e.g. go above `KTIME_MAX`)
> -        let res = self.inner - rhs.nanos;
> +        let res = self.inner - rhs.value;
>  
>          // INVARIANT: With overflow checks enabled, we verify here that the value is >= 0
>          #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
> @@ -291,14 +291,38 @@ fn sub(self, rhs: Delta) -> Self::Output {
>      }
>  }
>  
> +mod private {
> +    pub trait Sealed {}
> +
> +    impl Sealed for super::Nsec {}
> +}
> +
> +/// A trait for time units.
> +pub trait TimeUnit: private::Sealed {
> +    /// The underlying representation of the time unit.
> +    type Repr: Copy + Clone + PartialEq + PartialOrd + Eq + Ord + core::fmt::Debug;
> +}
> +
> +/// A time unit of nanoseconds.
> +///
> +/// A [`Delta<Nsec>`] stores its value as `i64` nanoseconds and can represent
> +/// any `i64` value, including negative, zero, and positive numbers.
> +#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
> +pub struct Nsec;

Should we make these enum with zero variants to indicate they should not
be constructed?

> +
> +impl TimeUnit for Nsec {
> +    type Repr = i64;
> +}
> +
>  /// A span of time.
>  ///
> -/// This struct represents a span of time, with its value stored as nanoseconds.
> -/// The value can represent any valid i64 value, including negative, zero, and
> -/// positive numbers.
> +/// The span is stored in the unit given by the type parameter `U` (see
> +/// [`TimeUnit`]); its value has type `U::Repr`. `U` defaults to [`Nsec`], so a
> +/// plain [`Delta`] is a span in nanoseconds. The value can be negative, zero, or
> +/// positive.
>  #[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
> -pub struct Delta {
> -    nanos: i64,
> +pub struct Delta<U: TimeUnit = Nsec> {
> +    value: U::Repr,
>  }
>  
>  impl ops::Add for Delta {

When you add `Jiffy` later, this impl block will only cover
`Delta<Nsec>`. Is that intentional, or did you intend to support
all these operations operations for `Delta<Jiffy>` as well?

Best regards,
Andreas Hindborg


