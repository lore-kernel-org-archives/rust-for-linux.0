Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795430521;
	b=jZ2F/436O1XafHD4EcBzrlYqmonBe/bOBIeg/hgReVKqN2i+eHzE7EFNGQVIGY5M43OM
	 4iETNpbDjm3QbSBSzZis+mlTysDKoqi5Nov1gVp+bTitrnx6jy9engQL4gIxYqusViECH
	 wAJxZlRmMORgcdR5AxuxVfaEU0NaVldCNDrQwr/ws6BDgpUB5fYQwlmp5FCfxDRn1cVEY
	 s8K+56L5HTSV/GPnNM9s/+YSwj2rVA0vmONlEZJGfJdA8IZXxI3amFoKxUcy6goAftdLW
	 i9UVAHWO5mF+uM5lX/UAFsYll9YvsBJb5yub6y2qXuo3lNtV35b+eJ7ivCFQAiPQN9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=XhoOrqJDbQt9SAfQacKyOATjFJfF+l8LSMbumVFvOZs=;
	b=XAvjyIxI94Fw31um03Dpw6gukvfyWFIU/dJnhZt3CCqiViyoiO11tEFRBUTs5BTzrLFE
	 IAaYo5kYDtaxNbv4tldnXNDlL8uO1BG9ZZBRkt/qwGVaJGONCnox3wh0COvUyLCsHzTTi
	 Ln2k+CpQgO1TlPY3DebhqY8NH3pRChnYHWptwbs8KOSZf/bmiseUbO3IaQJJtQ8AiLtmR
	 ZSFSBvKrnE1YSyIUU9gkUhH8ThVEBF2psMS+meRq0DQIwfeDdrfrM4q/7QgGKUpTfOTGc
	 ilhBUexjkBHJrbAY82QCTHrTM43lWt2KrQwNXQmpOVDWpCMHfXsZrb6dwXYdTsO+k6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5CxacYG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4DA606A31A
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 10:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A4DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5CxacYG
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-9213f004a14so38510966d6.3
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 02:42:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795430519; cv=none;
        d=google.com; s=arc-20260327;
        b=Da4M3NVSbdXJukF6emqac1IG2oUzqfJZEi24ZbsQcrie+4hjCBBd3GBEVQbZIftWnl
         CV3gWp6faW8agMZcOuS7db5m0H9trM+w3H7JRpcU8isLrMxwGaIeXZuoPa2NoLwUy4is
         IjoPaBkZCKtNnBr/dviGFCuaQlttHNo7V2GjqL+0TWXJvoZEpg2fBdm430lck1TkZ00a
         P4WW+sUX9ZjrZ6pgrK5jZ3t8hyXA+vw8azB7eXz8V3Z7ckLKvob/89iFRMkub6uKzvkF
         iSvw+6HbWwRp9V2rdmkb/T/Zls8szPgD5TCcYr9+iulfwpRr/2+d9h/IdNpxZ+kxW24c
         C9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XhoOrqJDbQt9SAfQacKyOATjFJfF+l8LSMbumVFvOZs=;
        fh=rc1WIbX7RNe9yf3HUYeB92kFvW8TMDymdDE4q4rUK/U=;
        b=VruZ0E+eCCX7rD4a7yV0KzHJE4JvqPfPHjjG8lnQ6uF/rjO4mLPjJZZoAJq2af6Dan
         3HZhDE3LDRcQzJuTbsmYkeS7QPEbndpDplu2VkwdYKaJFRAZbVyh+J/AdarP6UVd5o7B
         9EBLX7wg+GaNwiYKcbRbhYmZdMf/bMaVR5wDR3ZNJpzV+G+kKB3Oi1YC4Q8yTorofH9e
         hAXOdHxBjyrJJPG6dMspf3Re9qwYTN39GSWz6BD9JB1gnxMYzMt67CWFdRn8aQ3fPw9g
         rHS+qnKo+uItrTxaRrXA2g1IL1kEXN+vKFFQ9qDlOe1OKK8IeTXaLjsqcbtW9wFbUjsh
         4CkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430519; x=1796035319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XhoOrqJDbQt9SAfQacKyOATjFJfF+l8LSMbumVFvOZs=;
        b=Z5CxacYGLdDZfWQi7Wf+MgYhdyZwtmj6v+wKj/cqXCivpLpznNmXgFehz7Nwh0xkGL
         gy/sbiTOkNoGikmc7ltFeguF1ea3nBF7BVtCMzhCUDwZBysjy2O0+bQRaSQbvyG8bAwS
         zCKJVjAWUU11ttlfwdD4z6pIQayqwJBY7ETjR+tSgHAe26t5FlXmCLb75jD4DJSkQeZJ
         94dw5RbjhZ0rJWXd+cO9nrMnNVx0K18luGQ2CTciDORvn6jMcK0tUk0Grb0IYcK9EF0i
         h0aRnoa9s6e4Q0ULSdg/bXA7exHruIRgSZEku/Rs/BpK+0Nf6XxuWDC4+r0BQZI0L7LM
         ncWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430519; x=1796035319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhoOrqJDbQt9SAfQacKyOATjFJfF+l8LSMbumVFvOZs=;
        b=HMmCaptBBknPQOJLrVoOreVv+zbd0NwklNBRjsCQbkQpW4PomV315rfoDu0ucd8IOW
         otKIGkEIRem4fNfBDCm1JEfAzW/WiR4Q8GEchFwIb6IT943mCQna8ns8Yes08f5KyOMc
         +5LHdR2/Be8PwGdR0q9T2vWn/+xi7BIln8Nx1PLKC4WyNXs2W4KNLLBcLxpsfYMqPoxi
         MRJZpVoVusB2/m5bdxkSLN0Boxz/y3BSGOT232v4gwo7s1VfH8t4YFi89FJ8fZWJ0rS0
         TqGCF9tEoc6gzP/na2QFyUdkGHGJ+KWC3YmdcL6xtjHv62ESLFVjMKg2qcuEo4dI+SZn
         uJnA==
X-Gm-Message-State: APuU4Z/3nw1a6IJ81Oh1/cdk3zgjhhAUmzh5XT0hBoHLGHi63C8pPMB9
	//TfKF1zNbq8z1+AJF01rJoEjrqVvvGmjEFgLWHyfQss4Jk/rA4Abs9eJ4khRE7bJJePF5ep3He
	Tbb0usEkyqqdJxOow21iMu7nJH00Yg/DnnyUNN4qfiWGk
X-Gm-Gg: AZFdTZdW72gw53JORytkQztCA403y0xwzyl71Fq4u6EN9uGLASV04EtrV5YOmaCOWw3
	P15z4SiQdYAutIuyep2uAakrUDQFjE35nh6ruc+lXZw6F2mmA5t3Tvp1UBlwwJyK7JT1VSAqa37
	EY6l/WKhToJT9tBrmCZy6PEYw4oqDe7C0u2CPZVOGGKiqH68e1TGqKxNovcwoTnxTKbflTXj1wM
	0nGkoI7maHcFZoG/pPvLI/rtwtUg6foayEOOt9sb7rWILQNBvfFL9KWJ3w3+3yaIRC+TyDeF5nf
	+8BZulWYGYPHKWifzZybv7S/AdlontRcCQIH+RTpR++MxK0Wr3Z45s1VaZYVKMBRCTlEpBzDIc0
	bqt06DUDlRwd91vW4vCLOY7TBkZHh8mrkdETs
X-Received: by 2002:a05:620a:2b85:b0:93e:722b:1f79 with SMTP id
 af79cd13be357-949bab1bf5amr1751787985a.53.1795430519485; Mon, 23 Nov 2026
 02:41:59 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116195011.24156-1-mbkchelofficialdev@gmail.com>
In-Reply-To: <20261116195011.24156-1-mbkchelofficialdev@gmail.com>
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Date: Mon, 23 Nov 2026 12:41:48 +0200
X-Gm-Features: Aa3M54pS9yahJSWNN-tmF89We6qpc300mvM1QgNITUbjosx0r9KSgFaBXaiPrgY
Message-ID: <CA+YDrKDJDWT0Z=iNpnjtTFQH8VK811XJf8KFyQ_QJ_j_gxaATA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: sync: atomic: Update safety requirements for `AtomicAdd`
To: rust-for-linux@vger.kernel.org
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Gentle ping on this series. Is there anything I should change?

Thanks,
Ivan

=D0=BF=D0=BD, 16 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 21:5=
0, Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>:
>
> The `# Safety` comment on `AtomicAdd` contained an unresolved TODO and a
> broken sentence ("...to must yield...") without properly defining
> `wrapping_add`. Remove the TODO, fix the phrasing, and define it as
> wrapping two's-complement addition (`v.wrapping_add(delta)`), which
> accurately reflects the behavior of the underlying integer primitives
> since `AtomicImpl` itself has no `wrapping_add` method.
>
> Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
> ---
>  rust/kernel/sync/atomic.rs | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index 6d27898add42..5f6491fafd34 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs
> @@ -127,10 +127,11 @@ pub unsafe trait AtomicType: Sized + Copy {
>  ///
>  /// # Safety
>  ///
> -// TODO: Properly defines `wrapping_add` in the following comment.
> -/// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`S=
elf::rhs_into_delta()`] to
> -/// any value of type `Self::Repr` obtained through transmuting a value =
of type `Self` to must
> -/// yield a value with a bit pattern also valid for `Self`.
> +/// Given a value `v` of type `Self::Repr` obtained by transmuting a val=
ue of type [`Self`], and
> +/// a value `delta` of type `<Self::Repr as AtomicImpl>::Delta` obtained=
 by
> +/// [`Self::rhs_into_delta()`], the wrapping two's-complement addition o=
f `delta` to `v` (that is,
> +/// `v.wrapping_add(delta)` on primitive integer types) must yield a val=
ue with a bit pattern also
> +/// valid for [`Self`].
>  pub unsafe trait AtomicAdd<Rhs =3D Self>: AtomicType {
>      /// Converts `Rhs` into the `Delta` type of the atomic implementatio=
n.
>      fn rhs_into_delta(rhs: Rhs) -> <Self::Repr as AtomicImpl>::Delta;
> --
> 2.56.1
>
