Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14659481FBE
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 23:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653057; cv=pass; b=UoD/tq6l9MLe2ED5tOqO55wNU5P7gMBpAPtteTFPuJBhEs/JNYYe25bhG3Rq7a+a8zUVLKt0ouFzQvntd7St47P50VTwS5HoWFblCO5wwVGVzMfY4sEXIMG0SpvdR6j2kV7UlXvbX2mmLeRJkeDMR9P4INMkfro2DmWhiXvFBFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653057; c=relaxed/simple;
	bh=jtwlRufVYznWUtQgRFKXO56VVGrO9wQ2kvkfE050WwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4DUpqjzyIPaooH2ezS/swveMtry/8kMAm6nJtsaSwLg2Khykdtb4oQwku8hPjMIWnifLoJjPtUIANSeKuG2MPrYun2sfvtNSq+nYxWHWz3j39zqSgmttJA0DLx92aoCjdFd0wyZs9VivJcU6BPAQUAYlWn1K5URhi9iUMprSMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djWqg+KY; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djWqg+KY"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bc5fa5a2aso91315eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 16:37:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781653050; cv=none;
        d=google.com; s=arc-20240605;
        b=ahUqKo6XfkIDIh62VR5HKk9JBS/90S8dVfyZVEk9Ymvvq+a/Xnz/ukvDyevGyuCJOp
         aVd8xjE5VpVBVCE6u+SdYoTF+lpyFzxgu6VjnOuhigJbk4h9ZI+Oy+IVUWDVKJi7VF1V
         If/X2IqzPADCDvN4M8OWcfSb1+76OKW6vieyaEmgim5SyuJtxEgrKebW05EERj+TnegZ
         QUm3M+wzct9rlMaVB2icOEKr0b/LmNmYvSn1LIIhRl4PFlIyCau3bj1UsgsUhQxXOxug
         7BrPPbzNJcGHnHlz4HqrH/TLo7vEIrieDRFLTZL60Lwix2gB9GMQ+opBPuHWi3vE/W1O
         Dq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jtwlRufVYznWUtQgRFKXO56VVGrO9wQ2kvkfE050WwY=;
        fh=sKa8MInmBHkBE52qY4Vtw0uOr2GmLWEHOUUPtth6D4k=;
        b=N3smGJui5/Hnv83jFALLczy8rUHsoNPqApu1eeW82vLtLFfivjHSNzhnRBR9VrDl2M
         QbxCa5gQx7Qqu8X9ip3ztmYv5FMAsDih34E05WoiJgIF8ZfJ/nHH/veHz1uzICWohyhV
         gTdyFeqQyzlwDZosrzAgcMwjnSiP9VnejBxvxWIICrVULSMXzPFMMd0wxTsPE+GZ9lT0
         tcN3r58U5f2b73hlPqsEwLP2Hr7QE18mrFLz5PxBBYm+cbVi+ndRONnB0XqMGRTlxQD/
         OVVW01Ft6xhchsJ82u7aY9aAuWlTa5y69vZ2wlRBvrZ9owfI5fF+UjZLwlh3lkFgwkqn
         DoWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781653050; x=1782257850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtwlRufVYznWUtQgRFKXO56VVGrO9wQ2kvkfE050WwY=;
        b=djWqg+KYS3+7GD9tHVJg/0mvDMzuvUcb8tuuqt3djUzDmsPw2nGbStTh4KZMhZ1dPv
         ZS9wxb6YWNo+BNbZeoMZGOFwg7iIOXsHxE6QHm8UfOmHEE+IWS6MQMMh1EREMrAhesi/
         E2TBqP2bUyPSS+zDScE7m8ZSIRyZGPwY7zu3onanWZgVriv19LwI2J9r+iSN099NOsy3
         otqawH2i76reZPZRzISM8EQJtBuma5IzV7WTXHv3goQpDMLhQ/3ESDsoJFLv0ff0i+8a
         tKBjIBBDw28+EjW38GAYVpbc/rv8TlMTnOYDnM96lVkZA2xShOxfnJPmVIFlITM3Ng+m
         Qgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781653050; x=1782257850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jtwlRufVYznWUtQgRFKXO56VVGrO9wQ2kvkfE050WwY=;
        b=BgzM4dNr0zE28DH6TZzPbT3xqERV44H7/HAmYJr6+uNLfyGcq0a6jj4625Xdro+h39
         Rb6/SxWb9PSpwz/HiI/LjhmwODyEeZvEPtXFiBzogXzZBdeq8/XdO6PDkVlHJ3YiC7sn
         B31tnPok6btjNq6XxcfQGmdQb5IFJ6sY5wzNhgagk69GwxgmKh5XTsDYpJ6JTIddRNiD
         IouMP/idYsSKCCOleePg12H1WhiQBP+XCm2JvkhYqX9544mfiT7p274cUrLIZgib6Ht1
         3RmOXBe8x0cJsX1BLvBCDXyIRrJkMVFkYqjprsxUQrXFpIYfBo9Mr5jXlQY+VGqIaAv1
         Nfzg==
X-Forwarded-Encrypted: i=1; AFNElJ9XxH23vlcR0UPZxdJu7UvBTlwzjCJhtDy+ZOn9kEQLzaaZMCLIc5zW0oih6hkhDyu7GUEVnPa53Yryjufyjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ZKT+Gh/I5Hi6470kE33XN0SuUyNrqjj7sEsiG9L0CzeQNb88
	yTuSMCMpF3nRRprRHVTxY0iHIzuZlq6+jyd1WV9ILO3PLy1vr3OgjLCoiQjGRIjkuCl3UJ2tTwg
	NRT9q606QfICz/9bICQktUf9zFlXI3JY=
X-Gm-Gg: AfdE7ck20Hhh3J2ulYvxBPVYc7bLmNzkn9S37CHEVCRWfC8V36+v0odrNB9gyBeJZcL
	9Z0eVQvST7LlIdiM4EQthatwHdb1r1gn72nLsawQN2xtXnEv5BJnQXnV5XPKeshdqIdpu6C0Nnf
	0mKMhq6lEMo0yoglDAc+NHZJSeZnsgV9/lJ3xaKbGa9CyhIm9zNgUOSwU9u1VxYs5J4iRMF6abH
	Zli4Kzd0K5ls4YqSi5u+O6Q1j2Lo27bFWTW5lycYpjJmD/9wDRXegwZ+ZY4nGLbHh/Tu6/lvS1l
	abjuz2sRQR99+R1VjIBgUVCTeCTa9uRk2Pradc5noDwpmPR8nq+dDjzMYrbKvzEgHkFEGVIwm/n
	g1z9hLmAG2w4kJYW1tP3puhE=
X-Received: by 2002:a05:7301:2926:b0:304:2af3:5fef with SMTP id
 5a478bee46e88-30bca0d07c1mr357982eec.8.1781653050260; Tue, 16 Jun 2026
 16:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611190555.2298991-1-gary@kernel.org>
In-Reply-To: <20260611190555.2298991-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 17 Jun 2026 01:37:18 +0200
X-Gm-Features: AVVi8Cd2g1BixVyFnUCKlxWV0ITtf0DI0-MVAVPVJRT_QwyDhy4RibBv6QkfcIY
Message-ID: <CANiq72nXxOHT6_P5fqbeQoN6UyC1BRJYFK7nBCwkQo2gUAUo1Q@mail.gmail.com>
Subject: Re: [PATCH] rust: bitfield: mark `Debug` impl as `#[inline]`
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 9:06=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> A `Debug` impl is for debugging and is normally not used, and therefore
> should ideally not be code-generated unless used. However, Rust has no wa=
y
> of knowing if a dependent crate is going to use the trait impl or not, so
> unless it is marked as `#[inline]`, it will be code-generated in the
> defining crate (as it is not generic).
>
> Mark the impl generated by bitfield macro `#[inline]`, so they do not sta=
y
> in the binary unless used.
>
> This reduces nova-core.o .text by 17% (from 151922 bytes to 125676 bytes)=
.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-fixes` -- thanks!

I am going to pick a couple actual fixes in the coming days, so I
decided to pick this one too for the ride since it is trivial. I may
still rebase though.

Cheers,
Miguel
