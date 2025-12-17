Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE2B3624C6
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765977762; cv=none; b=CEI95e712wH889OnoTUdBc33Eqv280g9uGm9cuYaCKivUANQM72FHGnqm7f7diACSHi8EGIADuBD3WkzUXdhr4d+sX3PO5Yt9F51UeohWYIdePTOaLGwiZ2KAgpmS8s0peSz4Kh6crPERijSoJnXzZgg38SIzf9PrevUdLQz94U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765977762; c=relaxed/simple;
	bh=Vemxxn2wnJ2dB6wN0oM6nL/TrgxFo8x81nC1tczki8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZ0YixLzi76akSUk0rAYnQguomGQTSoFSxQ/FxqulymlYYzInY1/ij2AudXLBFfp8zrNWiZImzIlGa6CibDRNw6zCYRgxGmF3AUZJXLLWsfQaYRHNs2uemE2p0sOSnF654TVQR5GFvyre98zsuJBb1+vcuAEB/HZTqm//XIg5oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1YVRlSRj; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1YVRlSRj"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb3801f7eso3024375f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 05:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765977759; x=1766582559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vemxxn2wnJ2dB6wN0oM6nL/TrgxFo8x81nC1tczki8Y=;
        b=1YVRlSRjH8U+3YsZfkVDoyE0fBDkwyoz2D8BrLwIvq85VPK7726Jqlh8mrxMonHLpV
         5OQx8/Yumek9yIWoxYxA+9iBWqjP1ekuLWNBrkez+QtAdqSM41imVmaEpHjXobSI/I+Y
         G3qt0hsEy3xIRyMCXeWELYzcJHim9JH2qFSKmIfkMK8zZ9dixOWAEsSNlG+WOzMXKfy+
         e/dWVdb9Cmi4gJkCnUxg1/U6M5gQMgOackDVbCLeHPJLdtBHNHhwAzT/QoR01PvskU7l
         H2oYSnWnAO9gy7+ft3JZ2H39148TTj2aGesOHeQcrw7g2h3OnqOcIyDULgy/hfJgmm7y
         Qy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765977759; x=1766582559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vemxxn2wnJ2dB6wN0oM6nL/TrgxFo8x81nC1tczki8Y=;
        b=Bm/Co+cfN64GZn+BOQQvHqfsMAsk8nSOTs0IdHYYAkUVnpwYteN5m/Uk5Bx5+wH4gY
         hBu3zo+KrolalKT9E4vYmeiT8JbIRQs8V3F/wNqolraFCdE1ZwhRuUkBIeZypQSCYkqq
         WE5BWwrjORCj54Is6fZziuwMU+4oLF4n8XjEgaK9AFO+uQGJkUzerwBEknK/mNmQRbVH
         kF1/2JQQfELaZdlTsCJ/mfD+7pPAyFnWYe6d6XWWlHpf5Up44HnPg5TWKdrhaobejKjT
         xpa0TopeCvXxnABV5Fg8GpGU4sRYOG4srN3aqFmrgrGXvG6ClG0mK+PsYTZONQzljssq
         +Xdg==
X-Forwarded-Encrypted: i=1; AJvYcCVrJ2OhdZoJ0PW0gn8LK5xCPiMhuS/Jy6luAq6qDEnXDAsRjAQojs1Vsi3ZB/MC6X+ieQxcLtclGedp8Bp1zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj//WUcXo4RSn0MM2wZ80avdXbd8yRvh5Xg27QkYfON+Hjoqoh
	pHviUBmliQ40qtsZ6h9J6iGW1DgcGXjRaS9c4Vi1h6vMG0S7nYZ2NkMhHL1a2x+GYM7phZN6WHA
	sanspvW6uAa0J+uOzV03Nx7v9tT3EINVOHAhOdo+J
X-Gm-Gg: AY/fxX5fexJvC25dlsyguZN5lQlxonQLOfip0PuOl1dRXHFXvCwsbeJxDPF3JfYVh6V
	3GS7UbnMPmvlVIRyj7rHOctdCQLHft6aMTwrfxb7cF8ckFKJ6dbIFkSDapFEFI19ROnymwBr/WJ
	PtBt7mn2X+XkcTMJ8kEeqiCuDkgCa3xvGM27uz02ZPWwo4azMOgTohy76i2bN4fe3o281c/b9ck
	Y0rZZiQk+xj4UdhNIXU2eBBfpZkV3FFFLy8PooXVZgjKqlTddFllBoGCLxWvxts02veEoCsvZv/
	358Br7cJfLeo8IU7VYrRgL9hJg==
X-Google-Smtp-Source: AGHT+IEEOhL2UIRPSeErwn/GAZzoRfA/3+bDRcLELYOn8J7VBBr42hA0NHzZpzWrYFT4ORTKEuOlD84EpSUQuSYO3Js=
X-Received: by 2002:a05:6000:200e:b0:42f:bb9b:9a82 with SMTP id
 ffacd0b85a97d-4310ea7d6b0mr1483250f8f.60.1765977758549; Wed, 17 Dec 2025
 05:22:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-ptr_assert-v1-1-d8b2d5c5741d@nvidia.com>
In-Reply-To: <20251216-ptr_assert-v1-1-d8b2d5c5741d@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 17 Dec 2025 14:22:26 +0100
X-Gm-Features: AQt7F2pdQh9bQDMybD3KhaC-EX5tD8fJyhYUZ8BkuBxOSc4E3F1nmH8qPR7Sff4
Message-ID: <CAH5fLgjP6O0KTsm+dioy0VUm791zrktLTkAtQsG2uN3JSQFUVw@mail.gmail.com>
Subject: Re: [PATCH] rust: ptr: replace unneeded use of `build_assert`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 9:25=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Since `ALIGN` is a const parameter, this assertion can be done in const
> context using the `assert!` macro.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
