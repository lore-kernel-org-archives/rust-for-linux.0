Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C02BF3EF
	for <rust-for-linux@vger.kernel.org>; Thu, 22 May 2025 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944619; cv=none; b=f0sKN71TeCzijH0l5j7ssTpHS0I03zVs55q5X4vsSxBEbscor1ecCponUoFa/T6q9/LkOBaBane/uMUGpK2O5BULPpvO+9l/KEoNSIXYKfuvPHqCEEJs447CJkKOHq6h5f+EXkNLm4DzK/SBMMJNID6Z26AG/5ehSNsgXjAsQMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944619; c=relaxed/simple;
	bh=u1d0amzEQMXWLc+O6o+EmY9H47Q/ZLgRR2P2wcViHWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8IXQei1d+oHg8yvjRGUHHMWov3RX4ktNj+KfVhUrxML69f6aELJH/7lXEO/IMrp7S791qKnaJisf8AXfIaWhIf0OkBG2T5przei3M0cwrV8VPHQ6n+imGDkeIUYz+v7dLSIU74y2RPuSZpvSTNnSblFhkr0T31bVPb2pLR7DbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fl556fUl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fl556fUl"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-440685d6afcso90036905e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 22 May 2025 13:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747944616; x=1748549416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zi6UK63Kniro/hiv/vg69lXNbuiW+Rc4uGAFOEdYP7c=;
        b=Fl556fUljacUaSLGbWtgKpbXHUXrH7uPQgGPfrjX3KR0zEHB/4GmEqMjK9OCeqq94z
         Bn8oiIWpZT6IoX6uJDM4OyfYFDyKDzEEpM2eAu2xd2ft+Img4qTmPLAASVD6X1BE37u/
         aRF2XK9oZt7FJiAAMy44KmBT0wW/s+jg0kxLFZ0cG1WQ8goucEU3TEMV+x3bNujiOK8v
         cUP5MaZlySPFYWlvxBs6uA7XO/l2SsodAaYTQscV+ej4fVnWH64606/gis6bDQxBRojM
         csCO4LwkEohVkZ30yoCSUBW4tBD9JkLYqC4amEwjjeqaWWo084R8Hneq2YK7REzztQpy
         ukHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944616; x=1748549416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zi6UK63Kniro/hiv/vg69lXNbuiW+Rc4uGAFOEdYP7c=;
        b=n/yhE8zjt7refY8xTyFBOcMBfx05FSSXYdQAQkKWGs2VbNYFLfhSxKXuvOaEGRsCTM
         JKuFyVOhIfHmSrdX5mZrJTFg0N2T2tujAgUocew1+fZ2/Zm9DGJPY3fbrGhr3Mksoe8q
         h4/g8Pq46gGd0TFOVw2UAkYf42LYR3glXzx1bLa7qJtdlZ0QF8nWaCzGFS34Bqq1XzTe
         l/ECxPV5CNEPh545v+10We9eVyXrKEJ6wRAgFuyXz9HV67mRXtNveGgDoSvIfCXOh5lc
         atac71mEwbJWZmLvHsMDnprv0+uqlcTvGTDHsEugSGODFfUwEyEE5exTux503WRpLpNM
         NH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6+/6oM55/5mGLdBvuMKePQ3Vin7f1cuyhEZXWEuoDuBIejX3VqSi4/WPBF52DmGf/dyccAnqd081DG55dsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3QXiPsKp1LuJKE2e9VAKeQAAvzrgH2PlINIRKZ0IowhYdFvKf
	lwU5FSqayHOKbW+U/FrQwlsXrevyKlg6lOCPnIOyAvSeY/TNfFDUMJjbqs/OQN5Q5qmrWYz2sbL
	AL3w7a/Dy30dNHi/4/jMwJZIfI1a1kDiBxroa+3nD
X-Gm-Gg: ASbGnctX+kRxq9HnlKuNnXg9BWsGFdAd6F8cBHDoxMUoE713mLEUTuBGdz5J7ruzvBu
	azluRQHR3TTlpYs+a6jfLG8sVk5SuWRsW3Jr9/IoiQWHaUXfT/UbfoYM9E/1VXdnB8xo4rg4toH
	I6odsJTd7vJ0pi60nW5ekBnzFquBWONUtlvhR/t42ygDmWT+hmCFPrYboSfrNK4PLEfJsKDJ09g
	w==
X-Google-Smtp-Source: AGHT+IHd6YqAoxYw8miBcoEkIf/xB+HqLUuOOhvJRjCeKRZF7C69+8RuD1SZ5w0zECEw6IKhFE00IUJDA7Pw53bTrRo=
X-Received: by 2002:a5d:64c7:0:b0:3a3:6584:3fa1 with SMTP id
 ffacd0b85a97d-3a365844ba6mr22936770f8f.44.1747944615640; Thu, 22 May 2025
 13:10:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413005650.1745894-1-ojeda@kernel.org> <CAH5fLgiF0kZdOYaQi18_LTNx6Onq-5PBomA=bwS0m0z+C0wtvg@mail.gmail.com>
 <CANiq72ngfTJ5PTYaJOOQ2NedERrLYzA62hL8Fgw5C4QkuZ2R-Q@mail.gmail.com>
 <Z_0X8Z9M2H0mmcK8@google.com> <CANiq72=ttuQYrGNDqNZDmBN5G4TUpna+ex8eD85HvOP723frDw@mail.gmail.com>
In-Reply-To: <CANiq72=ttuQYrGNDqNZDmBN5G4TUpna+ex8eD85HvOP723frDw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 22 May 2025 13:10:03 -0700
X-Gm-Features: AX0GCFsS36Reksqvi8aRibe6a18Oz-bTGUW4k34hhUquW5v3Uv-Z43TgekyqjRs
Message-ID: <CAH5fLggfFJ3TmoDbVa1SqOPywOHKDy85CR5pz5wZ8VpZj+Cr6w@mail.gmail.com>
Subject: Re: [PATCH] rust: add C FFI types to the prelude
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 1:05=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Apr 14, 2025 at 4:13=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Hmm. Maybe, but I think having it at the end is okay. Could we catch
> > core::ffi with checkpath instead of clippy? Just search for core::ffi?
>
> Sure, we can add it as a good first issue (Clippy would still be ideal
> -- it allows to check all the current code).
>
> I came up with this, which puts the right way first:
>
>     Rust kernel code refers to C types, such as ``int``, using type
>     aliases such as ``c_int``, which are readily available from
>     the ``kernel`` prelude. Please do not use the aliases from
>     ``core::ffi`` -- they may not map to the correct types.
>
> If neither of you are against that, I will put that in a few days,
> including Danilo's tag.

LGTM
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
