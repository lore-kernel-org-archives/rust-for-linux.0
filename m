Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133812356BE
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Apr 2025 17:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744134633; cv=none; b=GPrd+dp3nUCTLuuBWNl61lS4bldjeK2I29wyM/XYoAdDG0JLpTrukcUDc6WyQJcSJq2T6Bs/mbXJ3dChfwCcYtYLGYnq9eMMbqgoenApRRODY8IWuJ1vOEQI9puZKDANRiTfH8GyThqoHUbTOG6ACWRcr/Yc1Bp0jd2L3Nf3sBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744134633; c=relaxed/simple;
	bh=f8/p8rMVCVvuPCu6BsGe6a4wVaocvaAGHdXMyGBWUFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEujPKfv8tDOPJ/yLD33SDy6XuKR+WIjh7sd0pP2V3fNg4ed76luRuFn9w7TstNJgo+T++QlbXBpQWxFNd88rzYbswbd0mHJfxTqPxzupx/inCmva4cuxEBWjpiPInmRSK75qvhpoKtXPFyUCn3mFK5qUD3WLz7JLCJIIJBjGQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eh+tvGQP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eh+tvGQP"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224104a9230so7392625ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Apr 2025 10:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744134631; x=1744739431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8/p8rMVCVvuPCu6BsGe6a4wVaocvaAGHdXMyGBWUFA=;
        b=Eh+tvGQPiur5ObAPGdDINFzBZ4bQZeD9dVlljGSTw9ftStDstq6SEmguX8AN3uB59B
         pktEPG2dd0x4haQtrCNwfFLS7vwJhRU7rywEJCxWqaKM8UY0ZUUz78MY5ptTUAm61w0z
         4zRrbgu16ZIlrIfyLKr/Nxune6mP1Fw/vXBP9ak5AsNqR+QB488D/abPnRYezvbeskM5
         M4P58aiWdsSRxrgr9Oz9hBpNZfrGdPiwlE6LOoVUuZYFZQXSDDgE3ofyiHAW35IRdXJK
         cAcgQC4zI8dRSVG0nM8dkz8MluxagHqTeHTmycKdlAUQu5DPHsDWwSZQpRevPqHYOuPK
         R+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744134631; x=1744739431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8/p8rMVCVvuPCu6BsGe6a4wVaocvaAGHdXMyGBWUFA=;
        b=XLPImz/mwAe8qzVtu+/kNrbDDChQp0y6+idnvFHtI934tag7zHW18KwejmQgwABJIj
         eAGJrFAGocqbbWRCK4FMUIFddoTZ6aOD6/p1d0mpsPZk8SXBVitr5Lj3yfn5ANh7Uh+g
         9irmmCaA7tl5xuHc1H5StKHP+xxQ8CESkhs4OSCR68Dg/VvX0GqsC31LXNPLn48+b/7O
         /qGOblRLGgCBogU0Yubv3wsKOQunhhITJjJzoeghw+xJWWh6rNeZ+B+c2iIr3a66PYge
         F2eA1PhT5Le8D7UIgo0Yo/0+Gqe6pD4bNjrVgvVKR50VqeNLsdVbdUeaak2fhbHxZ9Cw
         IU4A==
X-Forwarded-Encrypted: i=1; AJvYcCU/fxXa1ZTFEJLbCR0jCpAjtzJTBRUFgQCSRlpYyhI3wTaf8zKwpQjsQu7tY4u7KEt++yjG/X/wTbX1hLefQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+4mpUOK/1CbhFuXECGuMuDzrEhg7l33WiK0eObe5WxsUlIwJd
	Z6cXPt5BBCKoHDzOwhN1BJsTzPeYT8vdwN7B/knOlq6wH64VgVXInrleUQQcFiVzQPj5X2qaqEh
	cIpuWlrMPioVCyMNzaj3fjGfj2FM=
X-Gm-Gg: ASbGnctsr2Cji77sYV+f7P3GMcZJSu9GlyiBHZRrUSorOcnLs9Q5XY5z4BVCuVSOivo
	ZTyA5ZYSu0LjlJWphfShEXgM7v8MuK/F5Bqf00HhCw6QBLy8Sp1w4KFh5gkmiVFmUgbF9GBcyp3
	5eUnzEoX78qCSgib2F0bOJee2S0NF4nl6o+W9h
X-Google-Smtp-Source: AGHT+IFXferUCqrWkObHIEM1/mU23qjf4Wq8WZsk9JU92vFcsuSGo6/+hSv29fniMrX0Xd07T4DULhSfyTDGeo0PtXk=
X-Received: by 2002:a17:902:ce04:b0:21b:b115:1dd9 with SMTP id
 d9443c01a7336-22ac29a783fmr768415ad.5.1744134631222; Tue, 08 Apr 2025
 10:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404125150.85783-2-kernel@o1oo11oo.de>
In-Reply-To: <20250404125150.85783-2-kernel@o1oo11oo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Apr 2025 19:50:19 +0200
X-Gm-Features: ATxdqUG7vE9TjHIseLmsweqP4oz8JhXexir_YhcXGt64q3MJJd7crusMGeknbrs
Message-ID: <CANiq72kx4EhF_3v75H8JWa0P90uqvEjLsmki_3Biy=vcp4BUvQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: Add ffi crate
To: Lukas Fischer <kernel@o1oo11oo.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 2:53=E2=80=AFPM Lukas Fischer <kernel@o1oo11oo.de> w=
rote:
>
> Commit d072acda4862 ("rust: use custom FFI integer types") did not
> update rust-analyzer to include the new crate.
>
> To enable rust-analyzer support for these custom ffi types, add the
> `ffi` crate as a dependency to the `bindings`, `uapi` and `kernel`
> crates, which all directly depend on it.
>
> Fixes: d072acda4862 ("rust: use custom FFI integer types")
> Signed-off-by: Lukas Fischer <kernel@o1oo11oo.de>

Applied to `rust-fixes` -- thanks everyone!

I added `Cc: stable@`, though it is not critical if it gets backported or n=
ot.

Cheers,
Miguel
