Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ADF1E529;
	Tue, 14 Jan 2025 17:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736874290; cv=none; b=ne0YlFnZIFN3ofxgQnzaqNqE25yQ6l5QXfpR51DAdZITOOwjYXVV/olS9Pnqhi1g/tIRxXMntEA2MIwDsUBo0NEOHxsafzcdyxphgCm2VMiSZM1dKt8V4DMwnrF7MFssiCEhNkCSEYAX4YPshwZdzxYGyeck+wbxsgzD9go96Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736874290; c=relaxed/simple;
	bh=erU1c/KSHyKWmFtCaJlMk13iJ0ijAFLV5JJN9zQIaJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j3MnqQxTR+xtKpzA5f/Em/EYMpcAinqbQnbHNSfVQDR/eP4iDelst6JRtixwDBhkuQv+MFKjfR0b/ZV8J2PeThOTTbX6CupAKDR6iQ94Oh15jUkllX6UwQTAO4uIsmxV+vtMrjoPb1lRw7yk/zCbIT6/1klFatiZ1ZVmyFVaPzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRbiPDV3; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRbiPDV3"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3061f1e534bso21596181fa.1;
        Tue, 14 Jan 2025 09:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736874287; x=1737479087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQBCDSAfVJL5JFoiPM+aYcMPlG50D5F2AQTYLu9KJTs=;
        b=DRbiPDV3NiYPnEAK/3lQI5ATp9L84IUfZn2w3VhyIHX611LqgH9vCdWAndKrfiUHhF
         CZq7Osb1QRVBDylb2gauMTyuCBwd+aazRGq5TgrwYt8n84pZrJWD+h55sdpO1zc/TRNz
         vQ+0KeNDXORmzt/QOOokDhdt/HRb48/tRqqXKKyxrR1c9M4H9QlpNl/rmNZ2EEdrX8fn
         N6zJ+XvPFCounAjOhRYinKp8hNsQKR8aFYMF/LF3nnaMtU+x65cpxJIuq6hf0Ufr5JBH
         /T9yd5Tjp70vGAlIpFO1mBxI0YpRl9gQT0/roy7qY5tTq2owrrI4teKBs/I/XpughpI0
         I7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736874287; x=1737479087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQBCDSAfVJL5JFoiPM+aYcMPlG50D5F2AQTYLu9KJTs=;
        b=ihZ/XTz1PFuEfU7R6cZvzl38kqBg6eTfsxqtTl9fu35LyAhJH+RMLdgeJFcTPLgGWm
         AGFI8g8zVWUtuaDvAM44UIWsTchZQ9oXg8zwynJgTCpf9HpO4V7nRmdPwz4JvsiJg0uZ
         H+jLE7fbw4M0PVyFnIfQXVEA3Lg5xacsKsL4byYn0olEQbA7VRXwexrqQPxaSbM/d5+h
         exMcZ8rrjajtmB3mSzvPdYAo6k5VdCW2SC54F0d8b6X5sw67UUnoyqDHU4uAc2kryvLx
         pRY0JMMJPLtldRhRGHWA8Q+McjfBq/+rQCfu5/ZowJ7AYx1Hi/SlzjmAecf5Usip/oi8
         VzWA==
X-Forwarded-Encrypted: i=1; AJvYcCXcG1fmq8wwNEEQEOsuCOjY1aI1izV/0TVbCfzDRxwJdHgzWnergKAxMWC7VblxYnTH1fDyoaUoUDDyuy57hgM=@vger.kernel.org, AJvYcCXmn43SQiLCxIj7L/XsmYVCGm7EpyNcyI+5C6UkHz7Wup4uIoJz7sU2lobyOgIbvzMiRpRDIjCvB+DvVLA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5XDA/dBZzOjo87znOMK741sNHwCxYSksflyk0UgjR9RHF0hNm
	QB7E2UNYuFEXoTeOOrhPRF4o0CbY7AqUZFvHwQYgrPqfkn8KfN2cf25fVLm923GBKjKGv0ICUSP
	N0HII4LX9ptzHWmpmklpHvBa8/B8=
X-Gm-Gg: ASbGncv+7nOouI5ui7ZRzpFSacWlgArO4x1EwsE4d3InRYGmQzsf8l2oH41QaJu9hbu
	y69G8Edyf75JnCfFRqM49ArVGtZjDtiYitqYKIwXRuXVpb27aXHuAD3WTk3tsSZlFFBcHdxg=
X-Google-Smtp-Source: AGHT+IFFH5cNcO3yqqxCuNjkdP2MQBf1u50X8yr0+6euEKiuvwOs0h6twPS8aUQqbBQKHbdt07qMgl9wt4cx16BUi7Q=
X-Received: by 2002:a2e:bc04:0:b0:302:336a:89f7 with SMTP id
 38308e7fff4ca-305f459ae71mr107065491fa.18.1736874286875; Tue, 14 Jan 2025
 09:04:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org> <20250110-hrtimer-v3-v6-12-rc2-v6-1-f71d50f16482@kernel.org>
In-Reply-To: <20250110-hrtimer-v3-v6-12-rc2-v6-1-f71d50f16482@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 14 Jan 2025 12:04:10 -0500
X-Gm-Features: AbW1kvZB0IG_6JrK1_iWkP3L6xinb0A1TDUqJ2gxYpr7to9fTFq2Mlh92gGDAEo
Message-ID: <CAJ-ks9nwiWo0T5rQdQEMGg-9X1oEQVfTa6HY+Jan6aTwtsuSFg@mail.gmail.com>
Subject: Re: [PATCH v6 01/14] rust: time: Add Ktime::from_ns()
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, Guangbo Cui <2407018371@qq.com>, 
	Dirk Behme <dirk.behme@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 3:20=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> From: Lyude Paul <lyude@redhat.com>
>
> A simple function to turn the provided value in nanoseconds into a Ktime
> value. We allow any type which implements Into<bindings::ktime_t>, which
> resolves to Into<i64>.
>
> This is useful for some of the older DRM APIs that never got moved to Kti=
me

Missing period.

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/time.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 379c0f5772e575c9ceacb9c85255b13501db8f30..f59e0fea79d3acfddd922f601=
f569353609aeec1 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -8,6 +8,8 @@
>  //! C header: [`include/linux/jiffies.h`](srctree/include/linux/jiffies.=
h).
>  //! C header: [`include/linux/ktime.h`](srctree/include/linux/ktime.h).
>
> +use core::convert::Into;
> +
>  /// The number of nanoseconds per millisecond.
>  pub const NSEC_PER_MSEC: i64 =3D bindings::NSEC_PER_MSEC as i64;
>
> @@ -63,6 +65,12 @@ pub fn to_ns(self) -> i64 {
>      pub fn to_ms(self) -> i64 {
>          self.divns_constant::<NSEC_PER_MSEC>()
>      }
> +
> +    /// Creates a new Ktime from the given duration in nanoseconds
> +    #[inline]
> +    pub fn from_ns(ns: impl Into<bindings::ktime_t>) -> Self {
> +        Self { inner: ns.into() }
> +    }
>  }

Should this be called `from_nanos` to be consistent with
`core::time::Duration::from_nanos`?

>
>  /// Returns the number of milliseconds between two ktimes.
>
> --
> 2.47.0
