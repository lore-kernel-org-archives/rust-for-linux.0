Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B521E376B
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Nov 2024 11:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731065730; cv=none; b=dPnA5LIgM8kZMSHL/36VSkyLHn1b0DF4lXb0NLsoQuUf9YhzsbWQX2mU11OroVRrWKUFzJAQFMIbBK57IO48zcokC3NyZ1YkqonevSLw5vOBiQJFugE+fzZP7vRggvbIHIxrUfEzozmy2Jsq/VNgN0H88Cpf/Ec/GTwpGAchkP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731065730; c=relaxed/simple;
	bh=PX77c9yHDgIre9q74xWnIJF95l90Y6Q7Shh8ZBDjjug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MytvmOaTTqrdYINDkSSXkqfLqvOvywuUW/9onHlecJ6ZLWEeUyMzOkF9NmbpPdkgtWhRBeZQ3na6SUIHGJTJPtydL/BNIJrY4tpVCk0GuEmWrJUxEaB7mxODt6VzNh7hD79kCkzVMzKQxoKZnOb0t9GjTo0NrQTM0Wcr+T5SbtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sSDelyZK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sSDelyZK"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d41894a32so1234942f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Nov 2024 03:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731065727; x=1731670527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PX77c9yHDgIre9q74xWnIJF95l90Y6Q7Shh8ZBDjjug=;
        b=sSDelyZKy7DRLtx/TaEFx23acr9fxE94Ec9sBp7YfHCoC5VPMl2/ufmsyoysx9X/pQ
         WvhrTKW+O2M6dXlE7bAzou//NnqBg0KhGxbVLAKcnfYzCYDYTny9TfYX7cTii3943Xh/
         q7140zQ27stLbKJi+fSy/NZ18BHm++0l9Uxx40Bsxk0Em5JY0zMpScardGCMKGWgm8gj
         n1mU2LnTWEJfTes2F9zNd+go7xA/S+ARhMv6VoSbt4x74GK+PoAsJaThkW7OZoeciD6W
         YuFSMUkgu64oYZqPDX1TEEa8U/8qa8Znmf30l0LKTQJmfOKA6ydWjGNWR+XfMEZdDQHK
         wiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065727; x=1731670527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PX77c9yHDgIre9q74xWnIJF95l90Y6Q7Shh8ZBDjjug=;
        b=mYS0ZH/YfpO4yp4cWeJGPZ5mdUVp3/V255ytTIBFAKd8aqWRGt6cTCC0daEj9ERzTS
         cryA6hGLrQ7FofZzUWnF0cd+BnZslCPwJZJkdQGvz0VxoTz2LekFUnh3qHk4wVUTDWZJ
         MqYwTw5Cmt4BPy5dtXC4mejs0kjcJIjB5HN+3tNeM5G904sIVY2Y9kiXDhFqIaNYdDAq
         DJvp0coJufCapsw/qG+bCZXjD6Aydq7hSEm4xs1o/iTiZepZxpfDx+GnLXxYZYhVha9f
         vL1ED9zuX0+RHyzVtcGWLfnUa6y12kNNblKMySCvLazdrIPPfyZKDGCIPUrI9nTgEnsS
         zl7g==
X-Forwarded-Encrypted: i=1; AJvYcCXIKjl+S9vgwGddkLWS0ZHZb9Cov0VDI6ZaPgbZSdE4BB3hloUSmvRqNHq50TM6L0qc27ASi4aK3zt5xIICPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF3fL7xmtvPOBCmsAkA5HZ5RXLQy0yTeypfNwZj6Vr0wivkSZx
	Xa8uvJ/Tvd94Upa21swDqV6tEQtDe+eA7EFUKJ90S51IFYcYPo/JuzuM1wSuGTK/jY+f9xIWcnk
	AYbJ3T5GE8Fusi4D/cjTGZTg1wDSD+7KdQvsq
X-Google-Smtp-Source: AGHT+IH+oDbouFhcJmh4b7BSQ0gaytMeoLpOtxvYqsOEN+3aL5UukoywTdcI9d7KqgD/hivbt1ac5lGemIQRmmC9A+A=
X-Received: by 2002:a05:6000:4916:b0:381:ed32:d604 with SMTP id
 ffacd0b85a97d-381f1a6cb71mr1765873f8f.10.1731065727315; Fri, 08 Nov 2024
 03:35:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104-borrow-mut-v2-0-de650678648d@gmail.com> <20241104-borrow-mut-v2-2-de650678648d@gmail.com>
In-Reply-To: <20241104-borrow-mut-v2-2-de650678648d@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 8 Nov 2024 12:35:15 +0100
Message-ID: <CAH5fLghWusxAnU7avBueJmsdbvpoabb3=ckA7JvaZX6iha960A@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] rust: types: avoid `as` casts
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:20=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Replace `as` casts with `cast{,_const,_mut}` which are a bit safer.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

The compiler auto-converts from *mut to *const, so only cast_mut() is
necessary. I think this will still compile if you get rid of all of
the cast_const() calls.

Alice
