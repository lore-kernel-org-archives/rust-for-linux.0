Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F8B2F12BB
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046881; cv=none; b=HRSiOpu1aXLE5rxrp46ZXgT46V9LKCVN2QCnZGeLP22DKyeBIgbiLhc5UYIGTqeVjf/Vi/g2mFz4bXrMspdEMGPfoBcLsu6QRdl7Atb2fuq/uagcB36H/M+g8B3egjWJ0m+VYXeWLY3+PkIOXb8aF+s2tXPoaNWh1ZHyfp5pfsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046881; c=relaxed/simple;
	bh=Vb+Ng0gREXlf1A8FX0bk0YorGANceUA8GYrcKW2eJC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFumn+4hQ3nx/ZElr7yBwFYQHMAW1JfErJrdOuK+4fRwkDRKXmv4AZmTn8kmlhtUBmWibPuIy4/RhtHuKxzwfnv4RhBijlZxs75FYtixSmTI0DQGmxWnqYBZfNTHCa1MnwlxDlCyeYThCDm8Hje+UVScQQUIvsAZ6KG0IXhHYN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c7valqeu; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c7valqeu"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42e2e77f519so185322f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 00:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766046878; x=1766651678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Akpt5qBA5gisJkXMpTiWRQ33Nd0T4uXKjgwe4GkqHz4=;
        b=c7valqeu39n08471asiayVwJg2gTIkSiP4v3H/Aw6AWQWPF9NiU9ctAC2Keu+m8zPy
         Idorn86oKonJ58NpqKbKsZfPtt97pBTlsF3DtfevPVT+Qs+S5hp1UO5WT1Lp+pLYkx7Q
         HoZw2p/zC+JHfjKLB7H+PwRBCmnkGylkcvK7vdMEylY6DeIJUTuRb6qZnegb05O6aBOY
         WfavBK6NHo0OdPtYX1dXWjC3XXmhzzhfawyTKPHQaYBDr+noXoHIS96U9Dkj3q2Bv20O
         IzOr8hoHrkz4Ew9KRLvy0eg5zNTgTjhOsp4pkKDCiRcQpmbiYLcJCUWExzvapqvo57je
         g4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766046878; x=1766651678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Akpt5qBA5gisJkXMpTiWRQ33Nd0T4uXKjgwe4GkqHz4=;
        b=HUOOOYrK8WZx6/Mu6UIsA0gRwBT2Qh2Ypnntsryj3SMoNASDLiGUVdeWmM4XQquUON
         xW+z/A67LCfKnv+osmL3pi/nI7r8+dne45dOrk/jMNJhPYzDfs/zIySW8N7OQh1XJmfY
         SJ8gwo/TDPW7+kZNWNSYfDjqtFNVVkowGa5epX0Cm6phBafofJzN3DdjHFa3+SVhv+W5
         VFJ4D+aNu5YTbGEFWPdZE/X/42Sp33kW2YYCBrox7M3ovESJErMpdqq4fDDunRs6j8Ib
         j4c//z+SHq78FHLlbUL+85LsJTfkHsBRB6PlymCrFwHBdjXBVSdYQmeFXFTS4aarZXvH
         vMWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuigNEQIWqREHC8bW30yAoznpFt4BzVQLpiU8ZTsf3oMckXZr4bH+CEdcbAGJ2hQnp64ywPFVKKvgbJtbWHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9nqHIa3mkGPTFIyC6lJAoGKcojtBSLF70XyNYlE0PSqt9UhIu
	zU2q9baOjmBt/A97F5Ai89IlZXJTTji7nNoW4Y9b324dcMODwB5nIwONCEejYZn/fUeL2PibXPQ
	0TZFwiM7IfWOuwXuENlD0yP7xZy4qJLD/jV2SlB0R
X-Gm-Gg: AY/fxX5Cxg+Uecxb32vtjCoJ5n9g4vBSEwrHQPyI2R/0mOzq3OLaT/6q3gG8lSwJM8d
	urSoGRxkiemqrZeTTJreE3MLMGhQmxfKAG0Lm15+dKH1AjUpIMWdcarSpeYpu1Fd2hpUSWDqc4X
	9Yy1Zi5CmU2aDauJHYbHnmmvIpUq5qG9clOAZAnNFWLXCrJQf7Ky+h7i6zrOkNpORSuTh8kbhpE
	HI81mHXDNJwMmeHWq7UJbngIhVhR8NUS/A10wi1hMBQb2DhL60RF7aWC/fE2wQIBRtWBVBSmPL3
	OyWRH2LkSjqAH77pPlG7DdNhSQ==
X-Google-Smtp-Source: AGHT+IGlnHVn5s+Pda2HISoYfZXrUcGLwPAxwzFHenRb5eHdDLWCuGlM+jBMvrK4U3CPujzI2SmzM/oFIneosZJ2jag=
X-Received: by 2002:a5d:5847:0:b0:431:266:d14d with SMTP id
 ffacd0b85a97d-4310266d740mr12233342f8f.47.1766046877323; Thu, 18 Dec 2025
 00:34:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217-unpin-for-aref-v1-1-84711b747d02@google.com>
In-Reply-To: <20251217-unpin-for-aref-v1-1-84711b747d02@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 18 Dec 2025 09:34:24 +0100
X-Gm-Features: AQt7F2qwilJrQ56XQc788LGEes5ssH4P6a3KbiKEGK7fv6zqA8zUCmXL8-ZwYw8
Message-ID: <CAH5fLggn_xwfoyct5b26PkGgWAhad6y1k5NUCsATP4f_0+_RzA@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: implement Unpin for ARef
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 6:37=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> The default implementation of Unpin for ARef<T> is conditional on T
> being Unpin due to its PhantomData<T> field. However, this is overly
> strict as pointers to T are legal to move even if T itself cannot move.
>
> Since commit 66f1ea83d9f8 ("rust: lock: Add a Pin<&mut T> accessor")
> this causes build failures when combined with a Mutex that contains an
> field ARef<T>, because almost any type that ARef is used with is !Unpin.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/sync/aref.rs | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
> index 0d24a0432015d09509a255df0a4f114171ae9fb0..c4be6f5d4884ddd6cbfbd7c27=
d396310a7cde30e 100644
> --- a/rust/kernel/sync/aref.rs
> +++ b/rust/kernel/sync/aref.rs
> @@ -83,6 +83,9 @@ unsafe impl<T: AlwaysRefCounted + Sync + Send> Send for=
 ARef<T> {}
>  // example, when the reference count reaches zero and `T` is dropped.
>  unsafe impl<T: AlwaysRefCounted + Sync + Send> Sync for ARef<T> {}
>
> +// Even if T is pinned, pointers to T can still move.
> +impl<T> Unpin for ARef<T> {}

This needs an AlwaysRefCounted bound. I sent a v2:

https://lore.kernel.org/all/20251218-unpin-for-aref-v2-1-30d77129cbc6@googl=
e.com/

Alice
