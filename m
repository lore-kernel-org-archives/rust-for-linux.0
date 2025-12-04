Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF677336ED5
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764858546; cv=none; b=lV4PM0YdACQyO1Es/plhqCWC4YdpOkiplXSHTzeR24D36wnc0eHj8Et/2nGSsgZ0g1tZUCFXD1lU0e/UELOr9/fNsX2c5brO7uMbQ4fl52cCDkbosqPrtmUAUkxfYuOe3hm7YuIXaGbXdSEOi2eqI/M1Q2IPYXFJpM8FrqpBaxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764858546; c=relaxed/simple;
	bh=5b3hSsheryc1omHURrJ2xQxSW8v9WxFH3SVZ+QsaB5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pmll8lwvAHZoi/qZCoDgG76ZFgLNw8sC2iWdxJJEmbaDvrPCzD0fUYO2Ir+rgXQBvZ5oXIwmpZG2AWRDo2EzcC3vkBBK/mal0Ull0g8v1MsMCO/y+H9r6MaTQj5Xep3jFyMpEeceCS0vt6erRUu3hgsQdm+SirPI94DtkYX3wSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+GGS5/E; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+GGS5/E"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-be84b64613dso29736a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 06:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764858541; x=1765463341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvlBvALnxJinTj+70puX84zt2GQ/5b3QlMKAbHtKqKY=;
        b=Z+GGS5/EgDE6dj2M+qep/wVt13PGqXbI00YcnQeNxF7ITfI2KiFEZIVogbSJR1EzDk
         LAbpZ6vTaWktEvQwC3j8fOm+PqODI66St5Ie6+9TLcQB40kc24eETKfqv3gcDUPb9AaJ
         RcOqePyp0O+VtVVUHxVPkbheS9MoVX8/NO6gSRHLu4rGbqgKH/2342TRY4neXT6sBQvK
         QNtljCJWWqMdzjhteFqLyaXknDgicf4QXhZP14VPvLNFsejUWR2Ry06zf9py4aQTAYf+
         1hTZlIKh/sWQBCmuhD1pcBQsHkcRwkOuh+iCJD+Xk7U6k0yXPy9TkVeXtF99wH0ZI4VL
         VVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764858541; x=1765463341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UvlBvALnxJinTj+70puX84zt2GQ/5b3QlMKAbHtKqKY=;
        b=LtqXMMbtj+wk8S3WA2YNgY8DLVIVydpDIit0AtXT49nl/IrZeyIbM7NeaHThBIAwom
         97KHhGuKOGLGBTlB74FZY+bZC0+usm2xMX5caInoemVJX0Qb6yAZTr6DVtJnUWqHvMbd
         ottB1e4NWE+DyjT3gnRO/JzBjld6Y6hODZAcer31aHtr2BKdiIr02eQXkM3sWFXDXl8x
         8m1FddSbQreFtMKgvxdKpD14jPI4rhL7KmMbsmVEgclfQVKOhglsaisA/qUM6yCwY1Ck
         qHdc2aDKD/qYkL6tgHgkbk1uZlStGcIzK03uJhmCbQheMNnpLkd1fxXElh/fhXwyaiZE
         U/vw==
X-Forwarded-Encrypted: i=1; AJvYcCVkvq4kE2uDciPBSejyHm6PWiLJ8wqvjTPuvuWaiBK+9eITCPVcxvIIJ6tFpuFEo4eLQ3Rj+OmThvtil80erQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh4rnnT/nG2l3myFl656E870ej0Q25EDw6R6zdhPtUrp0JZqiI
	Y4YsicAUoNz/syHuRuXNSPSl1ifYzMVimtWayvl4KhqwXoP2wslbFj9rIzu2eJSQrLguAd3fuqO
	VmaGY7mH9ZlskK5Q1A4P7Sdtdr3ec1CA=
X-Gm-Gg: ASbGnctBqI4pNeN0P+NOQy8lb2+UtjO0YxDMJoizvprQk4RCy98Lmj0Znin8ljoSpqE
	HZC3TI17jwb8rCg3kosuOPbooqnCV9BXlNqKD8urc3hyaZi4HDxlWKjEUL5K/uCvha+RPeI5wI/
	IRVrA0PKft5vIukZC3Lo5cUYnkzwv2qkqyYUiRoDYiFblsqqI7iT6kOdlYV0ovqP8AuDAfEcagC
	x+DvcQXuXV+az2/vgXeeofg1MQw0mYJ66U7kNQlOFxbL5kZShxXKQsNyssouWF2Kro3+/6S9J9c
	mNPH3+ktAt32FGinJYs/9WXtDNsi0IY/5HHRK0GfWTZgIsBe8ABwZ6UUcLFzNE7YC3xt5WK9APR
	o9SK9yUHdSuUA9w==
X-Google-Smtp-Source: AGHT+IHtUSP5Y0wYwIuDDslEVm5s578jrXfF6FezcJZ2WpivPEIlkQ8cu/0TNxZBLP7zDNKaBeN+6n8l+Z+CAbT6CCY=
X-Received: by 2002:a05:7301:1005:b0:2a4:3592:8623 with SMTP id
 5a478bee46e88-2ab97ad920bmr3757076eec.1.1764858540971; Thu, 04 Dec 2025
 06:29:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204033849.23480-1-yu.whisper.personal@gmail.com> <DEPHSZUPUJBB.2YEABTJ7OR86T@nvidia.com>
In-Reply-To: <DEPHSZUPUJBB.2YEABTJ7OR86T@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Dec 2025 15:28:49 +0100
X-Gm-Features: AWmQ_bmSUueGdqk1F8UbrmRlo97r6g_p7mBVeWcqr7lAeD5mgAdAgTKt741ddS0
Message-ID: <CANiq72kYGE_mX=rXu=SXAgdrOisELbvqyx--QuBZEc9dNQ6ucw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: num: bounded: mark __new as unsafe
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 3:13=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Miguel, do you prefer to take this directly, or should I gather all the
> `num/*` patches and send you a PR in one go sometime later?

Just to avoid forgetting later, which ones do you mean? i.e. I have
these in my radar:

    [PATCH v3] rust: num: bounded: mark __new as unsafe
    [PATCH] rust: num: fix typos in Bounded documentation
    [PATCH] rust: num: bounded: rename `try_into_bitint` to `try_into_bound=
ed`
    One in [PATCH v2 0/7] rust: build_assert: document and fix use
with function arguments

None seems urgent, i.e. they can be added to `rust-fixes` after -rc1 I
think, right?

Thanks!

Cheers,
Miguel
