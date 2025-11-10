Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAD131281B
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762784438; cv=none; b=lMyLLz5unR55TRH2fmsWKc5q7QsN+5sBzbLlkfpVA7fEFxU+McsnYk1HJgup/QSTymXGvpiX0nzuFt/R/JdCTIguUQ/k71ryWtvXeJ+HLIjVl1kxXeCra+enhMtXo8wPB8vhNTU2OVAb4/fSNKbFbcE7pvLlrsXcdPrv9GLWoOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762784438; c=relaxed/simple;
	bh=5RJhHiiCQwpWrTvgzqpoOfkmMP+cjTCBSE/GzQfeUmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ikp1pQVF3rkrhwSHRb5K43cp6LtSWrt296MssQat2b8eioKJK2IYPkJmJFHi+cGJQup44mZsz5FivJasuHCW4iGjOS16eYdp56Olu9ZLdlxNExVM2EJ5IPPVhq5xrO0zgUVRcPVIQFyOE8+USaxWAsetIVHuKUBYIrRBLuilQCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKC+C/RN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKC+C/RN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-297ea936b39so1982345ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 06:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762784436; x=1763389236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RJhHiiCQwpWrTvgzqpoOfkmMP+cjTCBSE/GzQfeUmA=;
        b=eKC+C/RNcmvF9/7kIronPyxyv0c4XMQUhOnLeLqCjVccI6SdWmDRHSFqwlx4uH9VX/
         uOIW3UyFt5hgeKdgB2PLgMSqF81ew2KlYDa8VegWS5nLBdK+kujRMsCOAj1YIOQSPfvM
         LmUjrTI8dFCTlnFKfg0+z2hDEGQwLY/U2TpVtFtCOIcjWtCH/qL6KeTcpXGbVxpkLr2K
         928OiyoRKMwm3mVXkcyrN6myhaGNLdbZ5RnUkpGFbhAY1Ri8TihqTojt2FhkpGD3vHhO
         nRNJa6+oovjzXglYDxo2KObrVHXJU8icuoleIYRKQCtubnxgLuKTQ2ejGpYSCDV4SqdT
         6r7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762784436; x=1763389236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5RJhHiiCQwpWrTvgzqpoOfkmMP+cjTCBSE/GzQfeUmA=;
        b=e8U4PhdK0fQUj/HotLT31g1NIyGGMNbJkHo6wQHYSp+0jMoDXr6J/HR3B2r4Do1BtU
         URbLvVLtiS8reUpuasjt8jcncNYflsl5fdzzepUi96bmiH5gmVymdxYvuCy34fFH00hb
         OofQ0TVl36Bg4S82Rn+mRqJePKB7u77n/4aSMaZr9GyvEKbgk9T6UL25q1yxBGvGGm7Q
         ca/wP7BMDw0hj2+8Jfg6hAzMtwyrOTmvp0Kd88awy3B799xMTv/KKq9IhLntwysULxHK
         Y7aa/i4VUsBr8WEvO0yESox9Kp6qtM0qd79TOS2BWUsljMzvjoszx/cJKXyDCcSjExX3
         8TcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfQBAjsbVHkE35hVEfsBeEjKZ2wPNLoKG+yQ7RxKtmdZUV17pPuOozIOjvpPxTSHVOnZYyniSgEotJbQmdSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVrp1n2STvxMM0UzE7YhHsPV/ZY1BTST6ZcYmz21Nux+JfZK7c
	JC6zXuAMCN75Ze+wr+2681noHE8b4PPGDi2AcopimdLgvOBRvBz15602CnDLnDvk0veTro5IEsl
	ecrBu0TYKlkoijvjUTdD2UlUB0gWHWMA=
X-Gm-Gg: ASbGnctk3ZfMHhIiW9q/EJGzhAXdfVfX1bn+esXkAlLHYAVa2yT/7QhGV6PCHeAQ3nA
	KyBHqdszB7lStReukjwjuufU1Y/aTaN4nKiISAjeeVgzQYtjFEYQva6spaZmpTbtgKCSU7L0VKu
	3e6m8igrVl7UYiRO1sWQL2sSfN40V43avngYnN0kGNJ/JKCM4KDV9uUoR2Gg1zqT4AY9YKQIV04
	FEVaSLj+abjjkfYAQPnxAckV4PJcRvB9Wwaf+4vl+NvcG73UAu7MRqFQMJbcMpv8MGyDnCh0Apq
	atNdsWbvdkSZ2PFw8j5b9Y7Xa5IQY4ikVUDzKUdS+CSBT0Rbu0YsTXeupscSlDJ5wA8c0Ld0Y4+
	FeeE=
X-Google-Smtp-Source: AGHT+IGZkiX1aUs0nv10YP1XlBKx2b0IQf5b14V0qJA2D3DBZY4ttkzgbksRaQa0wfRvU24Ndk4q5iwI6HlbKZJm+ow=
X-Received: by 2002:a17:902:e353:b0:297:e604:598 with SMTP id
 d9443c01a7336-297e60407famr37566705ad.4.1762784436127; Mon, 10 Nov 2025
 06:20:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110135927.05d83da2@eugeo>
In-Reply-To: <20251110135927.05d83da2@eugeo>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 15:20:23 +0100
X-Gm-Features: AWmQ_bm2tVFpKh5HhJeEvZYuh2tSSNBK7puyKDd5qGaAhmDUcRORxxihnStSDk0
Message-ID: <CANiq72km0fyL+ueULZZCcg+2Uc5HTtdE_C++WfigLFnqE4sZ=g@mail.gmail.com>
Subject: Re: [PATCH 00/18] `syn` support
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:59=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Thank you for creating this. I have been wanting to use `syn` even
> before RfL was merged into mainline :)

Indeed, you were definitely one of the biggest proponents of `syn`
since the beginning! I could have mentioned a bit more of the older
history in the cover letter, sorry.

In a sense, this cover letter could have had a
Supported-by/Wanted-by/...: Gary & Benno et al. Actually, I may just
add that :) And/or perhaps something about the history in the actual
commit messages or use the cover letter in a merge.

Thanks a lot for the very quick reviews and tests!

Cheers,
Miguel
