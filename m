Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25C5190058
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732528058; cv=none; b=dXEoodryaZx96S5Hh9V4xopfwu6hWCYNpmbC/me13qz9aPt0wbJgU4232Bc9Wtkg6Yk/mYb72sM4+UkjrWtEZPcBhKmD9s15dNQ6cWhN7PXvtV1qTORvK85vqh7xUtY3yMICvgHdz8QyxS/VU0r3Jh3X4XCuAzBZrlh/NWPOlxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732528058; c=relaxed/simple;
	bh=GO8no/cfx72gD7oQPuPDCrFxfQFYozVCkdlLQfM8VCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGj3DH3/QPpKwrww8KtNIBDRhzlw+qXlDDjLnwT2pbM3I/xwz3kLYkUWZpNMxlolNekCLrdOAmz4ygIHa0P4KML4xwYFq2ZEDZRKtvC0hdp3j1ITa+EpU49N8tiG2X6U2Q75629xGtqKdOOYTpYiUsZfKxHqj1UKsAMP0PMIzjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YRlGmrH4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YRlGmrH4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38241435528so2730650f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 01:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732528055; x=1733132855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GO8no/cfx72gD7oQPuPDCrFxfQFYozVCkdlLQfM8VCw=;
        b=YRlGmrH4AwtbkOmh0ejXmJNhi0UWY9nEnslBTy405zfp0sI8mFQusK9H5LHiZUtkYE
         dqCqal5MIH7fxLlvYXObPKADoQzastGsZozlPJj7A1zN5/4IRTkC2qQW8en/uUPvN1MF
         eosvaqSL7OKhgF94Ry0ZAW+j2NZ6GGnsrnFDb9zAHd4cO/2Woxu1Z/ubJWB4fG0XlzJA
         LGgoSQKP6kdHO/ey2OfHa10WZET2vqtcGHzuMjmq3HZzcAmQskj9qR/XlkRnfeo9I9Lp
         Oxost0VRgWHLHPViEWO8kbgxZJMqvtLjURlTcW09T9IwxLLBNYFAaHo2JWt0bEJ/ID8Y
         EZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732528055; x=1733132855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GO8no/cfx72gD7oQPuPDCrFxfQFYozVCkdlLQfM8VCw=;
        b=YnkB2y5K0e6hSVLhl51NN3oqbClj1BUy0S+Clees+LE/8yfZBtZzkmPqEFnP1PUmWM
         1EeTEMsWtg2jnIUlXXln/sWubNY+rN6eAMILT/KGPXTJu1L99msPvUpSIUNgAXjjGmCQ
         WdnBPyRoGLvYmvw2SytOrvz/nPZ66eTiLAfDH/F6Jn05B5xEViGilVhhyYtGTrASx0ZN
         T+zOPcVRswKpGbAFBmITqqBBXpg8Q9VQwbEiS2jQ5+x5n1DR8oPSvYpPDaR1PIag+qTF
         svsgBQGkyDK5xj/jEOrqItl5O0P7u/N/NaN10vCNs/vidy9X3CB5m0XSZFmB+jAB1/xx
         vcMQ==
X-Gm-Message-State: AOJu0Yzp3SB2+A8w2ZZhPAMNcLLyl0Ur22yxUuzne2Uxh71HBy33Wq6Y
	C33Wuonzg6yusuLEY6RlZ1l++hXZZF3jpXIytK0KCUCvVL+JMP1806C/V2Ghr1xT0LiR4fiD69b
	en8lT3WxgRSwbxDVVLykT7Ez6uzDhG2KPIQJ0
X-Gm-Gg: ASbGncsajLgM2OIs/KM+k/GvJ+Cegt4TBrTEVwKI4Sbaq67CXCoUajDBthLNIcPVxOJ
	QagFl3/UJ/TBXth8zU339RfInQPWhqQCYY9fPBY9KaloThZ+Pqq8XiGjRC0E3ow==
X-Google-Smtp-Source: AGHT+IEpXTEzc4q1fzSoh9mUZqkoV/WA5KSGRw8aa52k1fi2n2O0NsLcXMm+2RXhBKUhbx8SuViQ3liJarUX078bZrQ=
X-Received: by 2002:a05:6000:188f:b0:37c:cc4b:d1ea with SMTP id
 ffacd0b85a97d-38260be5fc3mr9216904f8f.53.1732528055106; Mon, 25 Nov 2024
 01:47:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120222742.2490495-1-lyude@redhat.com> <20241120222742.2490495-3-lyude@redhat.com>
In-Reply-To: <20241120222742.2490495-3-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Nov 2024 10:47:23 +0100
Message-ID: <CAH5fLggLe10CrG-t4sQwm73nUUC_ArsseugjBGbz8tD5KLWt2g@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: sync: Add SpinLockGuard type alias
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Filipe Xavier <felipe_life@live.com>, Valentin Obst <kernel@valentinobst.de>, 
	Wedson Almeida Filho <walmeida@microsoft.com>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 11:28=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> A simple helper alias for code that needs to deal with Guard types return=
ed
> from SpinLocks.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
