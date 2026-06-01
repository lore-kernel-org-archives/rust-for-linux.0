Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F3C38AC72
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302505; cv=none; b=XsUPNayMA6i2XIUgQBXCO40KRaPy1jp8LP/mAvgjKtutthlkGq+ijBcJlr2b8twptOxCR01mu8rZ7koF+JhNpJoeTl+Eksiko+FfqGcuX6BzakPep93a18JuUxa85kMo9YyiBLSBjNYyYVzbAV4RjDFD767Y/mIlW1k9pMlBFYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302505; c=relaxed/simple;
	bh=otexNk9OHuD/6rio1mOTZPg7DkxgYhCuRlwbkbOk/EU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cTY09o+VJxNVqD4YQCXoC2quWu2HgidV56NgB8DNZdi1vTMOzmQZYH7YCzPHJl0asWaSbkVbndJUdHO6T+qqtG3aADPUt6b+OzoiFXI6fuFn21cvQIi74V7DOVVtdyGR4cJ18qmmef458LfNWJdLW2LiZDqyRrX1URj8nRyCTNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=saCey7r7; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="saCey7r7"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-68c34fda5bdso16684a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 01:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780302502; x=1780907302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNCDtya95lHSsHMXITL21ruuRscfBvAweyPJ3bnEneE=;
        b=saCey7r705gMQPTtoG3IYUuL9ei5TpfqSSQkx9qubeEj0qyABKR0VET/SfSLuDGfkx
         L9+p8Vltl60KEbPZ/Gqq7Fxp0xEx6B7bfFyYctTOrRd6nzGmGyVY05Jge5YJ1GogoQjY
         XD0Ogm7erTZ8xKfGp39mVYvdGbetZoq+8VcZ4AJXc+268rEVTAJ1F29xc4CRbep4ajcK
         U9NUECH2IToqlahqB3M+kSC5eWFfPQke0JQg/+rkaQypMutkFPoP+qqmYMZGsM997u8c
         IMr53XKFAqjH0/BIuVoGK0rUIFFeX5CoIdbfI/IeMZnhj7VgtD4uGidaS78gLTv459ow
         xGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302502; x=1780907302;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FNCDtya95lHSsHMXITL21ruuRscfBvAweyPJ3bnEneE=;
        b=rfSQPgK7Mq1GOmoOze2OCvMBcV7wx+j86/LrrkhCWZJuc830gF/hrcOD6C19/Tlw0z
         e3a5uB5e2RQMyZ9Jp0xSg6FPSX8q9RNAhpcUtFQKqAbEk9pD5ca8MHfGRqdP8MgR0ER9
         vXO9buf1HUr2FJ2kVRXicOGo/Y7va0d+LD+9JZXRbUARK0vKqFDdpnZIU72tFL1Fru06
         4Rd5Nl+ENqQEKGT3P4yQn+2xmYcpTQ1nHJCk1WgV6HOHJ/DuHeCO4zfQO5GJCW9QluwM
         MhmepMvCF073st9k3PCuj8JYuqfVElfieuMkoiP7aOb6Iq4Zo0OqreubdD2aCvZLN13t
         d5ag==
X-Forwarded-Encrypted: i=1; AFNElJ9pK8Wd4HM+uIJv27dqmzsHR1YYYWZ4VOOk6jreA0DOZoEYCL59ofFpDq5wVQPMjFBR+ogPcfHc1VOvbYoZOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFu0wfq0ZVDsDO7z5BQZeeCyhODQHljC3Weabeq59DDGFxl3gB
	JkkcVmRIhDhY7QPddr0kMnLfgx/p0kOHn6Tqsp+9rKgP4agg2uVDLKL7CDYRu7S5/ofUbBnJEui
	aagiQRvY82kRfzD9qNQ==
X-Received: from edbdk3.prod.google.com ([2002:a05:6402:1d83:b0:68b:767b:1828])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:d1d3:0:b0:671:9dec:ba3 with SMTP id 4fb4d7f45d1cf-68c07b60fc3mr4435388a12.13.1780302502114;
 Mon, 01 Jun 2026 01:28:22 -0700 (PDT)
Date: Mon, 1 Jun 2026 08:28:20 +0000
In-Reply-To: <20260529173137.303717-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260529173137.303717-1-lyude@redhat.com> <20260529173137.303717-2-lyude@redhat.com>
Message-ID: <ah1CpIJaWBiUrNNr@google.com>
Subject: Re: [PATCH v2 1/2] rust: sync: lock: Add Lock::get_mut_pinned()
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Gary Guo <gary@garyguo.net>, 
	Ingo Molnar <mingo@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Benno Lossin <lossin@kernel.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 01:30:41PM -0400, Lyude Paul wrote:
> These two functions are inspired by the Rust stdlib equivalent:
>=20
>   https://doc.rust-lang.org/std/sync/struct.Mutex.html#method.get_mut()
>=20
> The idea here is very simple - if the user has access to a Pin<&mut
> Mutex<=E2=80=A6>>, we can guarantee that no one else can look at the data=
 protected
> by the lock. Thus in such situations, locking the mutex isn't necessary t=
o
> access its contents. This can be useful in situations like `Drop`
> implementations, where we may want to access the contents of a Mutex with=
in
> a struct before dropping it.
>=20
> So to do this, we add `get_mut_pinned()` to `Lock` - which provides a
> function to access the inner contents of a Mutex provided a Pin<&mut =E2=
=80=A6>.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/sync/lock.rs | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 10b6b5e9b024f..5ca36baed34f5 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -190,6 +190,17 @@ pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
>          // that `init` was called.
>          unsafe { B::try_lock(self.state.get()).map(|state| Guard::new(se=
lf, state)) }
>      }
> +
> +    /// Returns a pinned mutable reference to the underlying data.
> +    ///
> +    /// Because this borrows the lock mutably, no actual locking needs t=
o take place - as the
> +    /// mutable borrow statically guarantees no new locks can be acquire=
d while this reference
> +    /// exists.
> +    #[inline(always)]

Normal #[inline] is sufficient.

> +    pub fn get_mut_pinned(self: Pin<&mut Self>) -> Pin<&mut T> {
> +        // SAFETY: We return a pinned T, ensuring we don't move T.
> +        unsafe { self.map_unchecked_mut(|data| data.data.get_mut()) }
> +    }
>  }
> =20
>  /// A lock guard.
> --=20
> 2.54.0
>=20
