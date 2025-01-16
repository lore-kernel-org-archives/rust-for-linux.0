Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D143433DB
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 09:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737019980; cv=none; b=FgS24KOHK9fq/JwVA513LCKdrWHS4DGUH7yl15mnBaH9p62BTmV5NYBLT4i/sS1OOXf3mn0qEJ8B4llYZPaekKSBiAWh3/hudyzbxFex7TqssMCjBY/D28E9T2gYvCO8+8bYdrFLcRX+IxxJIvVemuHxCkjDx4pDodw7VD8FJyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737019980; c=relaxed/simple;
	bh=V8+QvPpARnKrkJb8595G+XtmIKFpdAON5phNCpj3p4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsPXYe/fX3C9JlzOB3zAnzZ79axaas7RfPuFd9EFFh1BGkIbjdxQEoUXOlnNwvWXXYxKZGVOfYE7seg4vIbg27Pv2X8Lri6Gj2hN8mU0lCX58Jt0CRs+tsTTIhAVO5rRqZ9SO/6dIyduGo/HqxtTHUGGqE9r8aoE5Fr1LJv0D+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yXMY6IaZ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yXMY6IaZ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385deda28b3so491045f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 01:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737019977; x=1737624777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AphgVzvfaUIVqVYPr6fiv7DOFwwK3EuZo7EKsczRJA=;
        b=yXMY6IaZq6hp5fEyfkEVFk7XSizEHcqHXRen7CmWB8pZB1ZEgnua5n6EOFUYq4UcCC
         ivIXUyd3Q3rsBszqAW5v+48A0JOQ22kT+2KMYU320o5ULeNmcGcAVUM36BS1u4VQoDbl
         iBHIgEy1JihRXoruDBxIX3XvcrAiuVWFFwgu8GGRotd91m9c9RmALCOXATPPx7EN4e+T
         n11pB/9m4fVwDIAApqptcigNXlDuQbTFDFovPhjltaE2lKiECJWv+2GO9cIg8meT+O3r
         1UGW+WO8FA6KeGcXNw3pwrqz01aa0nHdqc13+i0DUkh+1Gvd3yRxrP2UhgChMcYRlfLq
         Qi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737019977; x=1737624777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AphgVzvfaUIVqVYPr6fiv7DOFwwK3EuZo7EKsczRJA=;
        b=Ab/O1ik1FU5U9LhXKbCQJAYuRmn76Vy6FJ1Pw5ACnWkiwPvLesQHNggT2+dLnOVhcl
         4Ra9lO2GSULuR27KQ0ZVPFRnS91XLS5Kosdqh11jgcwggs9H7gcuBJQUnOebTqSlLQPj
         VOKH6nXbGUL61Qq4oHpiio0uBBGFp0a6HgqfS8S3ctMkzSW+0a17D2CGmnSly5sL85Az
         8cd5TcN1JeaIBincpydPUruIjJszoWs9+MN+Y60cNMCyUe+O5dgocZrtRBIBGoF2G4NA
         FlcgAYrn/wA+e9wuri7pf0511hfgkisjHk2TZUnTLol14hze0k/Bg0OKo92b4qR9+is7
         NuLA==
X-Forwarded-Encrypted: i=1; AJvYcCXE1RokfoLC3RDKYO7+gM4MbN423FZ0Y5CJ0c6d34gL/GAJckPGsddvVdL2CarHKhcZG4gtPLgf6Dz7a1zl2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsZVlmIj1HM+JfQ16TKXRX002fUWLIzramaOzP8DWjs804Qmpo
	VTe5U7r+RJbOJgorzcV8bsveDdqXrHck1VOpf0qxaoB9wW4U5uLaIUzFUdoNinGDLTDEZpG5izc
	KE81f2kZXFo9uKUML2lsl6lnL07qHIicqpCZa
X-Gm-Gg: ASbGnct6+j+K5ICzZ4eJv7qklKrkKr2jEiY5qdEmCEHxtaENI3ZEPZmmeeFUbEyxBR4
	WC6dJEEtuAjrDcUUeZphJ5/8rluv8R8zbSq4IrPUQMMt6m8d4+D2gJIsQ3WG+FjhTwGE=
X-Google-Smtp-Source: AGHT+IGavv/S+FGMzRsD+B5yFTbKHW8KU60XCAD7woJDoOOlcNj17H9fQLQvapryZJuBJhN8/kutcCVcpGlP3vhrktM=
X-Received: by 2002:a5d:6484:0:b0:385:fd07:85f4 with SMTP id
 ffacd0b85a97d-38a87312c8dmr30099106f8f.31.1737019977029; Thu, 16 Jan 2025
 01:32:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116044100.80679-1-fujita.tomonori@gmail.com> <20250116044100.80679-4-fujita.tomonori@gmail.com>
In-Reply-To: <20250116044100.80679-4-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 16 Jan 2025 10:32:45 +0100
X-Gm-Features: AbW1kvYpLLcgfXZGH-liSIppmg5D9F3z56wv2IDdFqulwdya8AAzonAHOGxg9Lo
Message-ID: <CAH5fLggz0t3wTxSNUw9oVBDbR_PSWpQysaSSt6drd7vw8AXQfw@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] rust: time: Introduce Instant type
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, anna-maria@linutronix.de, 
	frederic@kernel.org, tglx@linutronix.de, arnd@arndb.de, jstultz@google.com, 
	sboyd@kernel.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 5:42=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Introduce a type representing a specific point in time. We could use
> the Ktime type but C's ktime_t is used for both timestamp and
> timedelta. To avoid confusion, introduce a new Instant type for
> timestamp.
>
> Rename Ktime to Instant and modify their methods for timestamp.
>
> Implement the subtraction operator for Instant:
>
> Delta =3D Instant A - Instant B
>
> The operation never overflows (Instant ranges from 0 to
> `KTIME_MAX`).
>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/time.rs | 48 +++++++++++++++------------------------------
>  1 file changed, 16 insertions(+), 32 deletions(-)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 55a365af85a3..da54a70f8f1f 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -31,59 +31,43 @@ pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
>      unsafe { bindings::__msecs_to_jiffies(msecs) }
>  }
>
> -/// A Rust wrapper around a `ktime_t`.
> +/// A specific point in time.
>  #[repr(transparent)]
>  #[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord)]
> -pub struct Ktime {
> +pub struct Instant {
> +    // Range from 0 to `KTIME_MAX`.
>      inner: bindings::ktime_t,
>  }
>
> -impl Ktime {
> -    /// Create a `Ktime` from a raw `ktime_t`.
> +impl Instant {
> +    /// Create a `Instant` from a raw `ktime_t`.
>      #[inline]
> -    pub fn from_raw(inner: bindings::ktime_t) -> Self {
> +    fn from_raw(inner: bindings::ktime_t) -> Self {
>          Self { inner }
>      }

Please keep this function public.

>      /// Get the current time using `CLOCK_MONOTONIC`.
>      #[inline]
> -    pub fn ktime_get() -> Self {
> +    pub fn now() -> Self {
>          // SAFETY: It is always safe to call `ktime_get` outside of NMI =
context.
>          Self::from_raw(unsafe { bindings::ktime_get() })
>      }
>
> -    /// Divide the number of nanoseconds by a compile-time constant.
>      #[inline]
> -    fn divns_constant<const DIV: i64>(self) -> i64 {
> -        self.to_ns() / DIV
> -    }
> -
> -    /// Returns the number of nanoseconds.
> -    #[inline]
> -    pub fn to_ns(self) -> i64 {
> -        self.inner
> -    }
> -
> -    /// Returns the number of milliseconds.
> -    #[inline]
> -    pub fn to_ms(self) -> i64 {
> -        self.divns_constant::<NSEC_PER_MSEC>()
> +    /// Return the amount of time elapsed since the `Instant`.
> +    pub fn elapsed(&self) -> Delta {

Nit: This places the #[inline] marker before the documentation. Please
move it after to be consistent.

Alice
