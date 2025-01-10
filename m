Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059A420B1E9;
	Fri, 10 Jan 2025 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736505886; cv=none; b=Lt0ucMWuBs87ttRN5a45NcRdpOa8HG0NFUTn81+Ku0k7EYIhSMps2YQC4LB8BNeu80PIv3IvbEke4cqIPR2Fx4AWC4zddDAr+LwJtA+CUcHyuexxLncF9J7+xBSjy5EJ3weyPuTrSUpfwjlo/q7bM3SOvdFUYSodxR/1HE07SXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736505886; c=relaxed/simple;
	bh=apaSsDlajYXrbZl5767R8Vt/ZIAnyGYrQWSYGxJzByc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdzcR7QWv3CTbz13f9s3326LTJduYi//DWCYwmSePLZO80MDqOnHVFClrRf/e8yMz0P9IQQC8b393MNCeaLj7sryKpWi9Xfg96+N2Ey0R+oKB0JH109LKMjFS2D/iksL+SOSAUQtoyQzaSygXdnX4l/uhH9+3KXbzfo2fk/hfks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyMOzQAH; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyMOzQAH"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ee534d6800so389816a91.2;
        Fri, 10 Jan 2025 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736505884; x=1737110684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apaSsDlajYXrbZl5767R8Vt/ZIAnyGYrQWSYGxJzByc=;
        b=RyMOzQAHbctNlP4Yb+J00X1oCZ8JdU7Xh7t2c5hmaRVRi4mw54FjzcY+Z8llQlhzv2
         YIT+Xd8tMre2hqBaRSQiRRtnL8BBhjaVN2T0UOirNIFFzqCcSC6Xtc2JkN1MreJQgX62
         8ZWPrMZCssOFwuhsR5gUtvYQNtLB6plcKYokvHdNZFpCNyBlcdPbAR/sJNkxzXNK1rig
         125EDnfkFwcoKYzBW2QWXjrowvq7IB+Jc6MbL0p0O6wkz116qtRfhnSPC4yKNaIMObVT
         XpN1c8OKLGCnTk6rk2G29vp1DbcWUQsaKC4KxGK+qysh3DvQp2Kb41MyV6ElpCPf2DpH
         xtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736505884; x=1737110684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apaSsDlajYXrbZl5767R8Vt/ZIAnyGYrQWSYGxJzByc=;
        b=M2am5ndW+HjhsjEOgGcm0iWfsZT07X4e0Xsjv/7FxXZRgtoXzzVsfZRD4Zyyi1dHmO
         0MqFcDlEAvggWBcFCYqI7BILfoC9IDFOTxIVi6D8w2cHz1ZQBjWrldB/cGCW5A4gkBBk
         JcyjggKzupeNKpc4xDc8RInYsMxHwnbOB6SNHGQTt4G8hYAIPrVDk9hnQcLCX/ZqZ65T
         NvRlHc0D1B6GtqkrUNCrTo94b2QhA95F5SE5EvaJTGpKVV+H+TsvME2KFv5cXkouMfMJ
         c0OzgIaZAvW+ZGcml00Qulj2oCfpMMYIj/br/rgdt11xz7l/tsfyZO//oANi0sI0xJ03
         n9dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx6FFETqU95yGBJFyVv7K8nw64c6Eihmj/orOGFMPr9g9xsVw2RFrCJHPIbVyDx+6pTHcLTcCql0YwdAYaoEg=@vger.kernel.org, AJvYcCXXhdDlTKupysgfyuwTLeV54Z9uQmDeUugpYou013+A4pUAkJTUbCHJOq9eXghk01dI+c1ak9TG/cEJJKo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0njcjOO3vxWVoUnBPvccJEBiCwN/fB4OG78g4Dc3ANDadga8W
	0s6Q2bZlyEBnJMraCvToUsQodL1bFn4CeLD3AzQlXFXMEO9Bl8qeB6jfFvEveg08l4n2UPhoU1k
	V/yRm1UwR4eVckZIJxmD9z9rgFrI=
X-Gm-Gg: ASbGncugEDLWHCseHGxhNxopfgYPArTajh8FUzoZyFDbxutzmFN4z5P4qZlLqr9kH/i
	I5fRZjBuvalWE9pp/JQ8wuUqlkAOeidWGLTVfFw==
X-Google-Smtp-Source: AGHT+IHxuK/S4kHUOpCjd2bexoRn9sYk0/qvrZR7fXgjrU8ti29XU/dEB3faBBBUPXK5M7wDyzy7xK7OeE1MubNg9aU=
X-Received: by 2002:a17:90b:2545:b0:2f2:a9bd:afe9 with SMTP id
 98e67ed59e1d1-2f548f055ffmr5779092a91.2.1736505884313; Fri, 10 Jan 2025
 02:44:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209212544.1977065-1-ojeda@kernel.org>
In-Reply-To: <20241209212544.1977065-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jan 2025 11:44:31 +0100
X-Gm-Features: AbW1kvaHYeTBaUvMv9ak9NAyteWj06n1FXMZjLMaTEuz0GUjFQTH7pDQg7U0T80
Message-ID: <CANiq72nvHB0W_MexaJcwa6h6_n4iSVbJJBjH-M6MwOCJQFfC=Q@mail.gmail.com>
Subject: Re: [PATCH] rust: document `bindgen` 0.71.0 regression
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 10:25=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `bindgen` 0.71.0 regressed [1] on the "`--version` requires header"
> issue which appared in 0.69.0 first [2] and was fixed in 0.69.1. It has
> been fixed again in 0.71.1 [3].
>
> Thus document it so that, when we upgrade the minimum past 0.69.0 in the
> future, we do not forget that we cannot remove the workaround until we
> arrive at 0.71.1 at least.
>
> Link: https://github.com/rust-lang/rust-bindgen/issues/3039 [1]
> Link: https://github.com/rust-lang/rust-bindgen/issues/2677 [2]
> Link: https://github.com/rust-lang/rust-bindgen/blob/main/CHANGELOG.md#v0=
711-2024-12-09 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
