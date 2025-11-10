Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F073126D9
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762781953; cv=none; b=rvQ3ySHyaDGlOrt8Imi6vJj/ay2FGkpLoBidEYuKCBPULNYaHArkIhO2rDgcJKJFXbSzF5McxpSfH5cJQAQ5/gZe+VhGXmtWm3bPd1hI3191E4HTqFkr0Vxi6/2oysgqAgXdnWqR+qSP91YhUwbrXIZyOEV3DENMGJIS/TOfqHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762781953; c=relaxed/simple;
	bh=JxxNv3zsqMj1Gs4mcPxMIFOWegAIC0ZVsqaUYW8cbJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S1rIiC7xWumCUfkqI4SW2bxjowStKXgWDPqxjqMZaKKW9b89nA/ahLCup8EyOhiphpZhGfE14s7JtsLKAn39m+o9JuiNwYGGeyz43OcoCOhCzjja+iM7kGNSmObFrHzwxr9pZ+N3vjegEnwlLhxq0Sbkp3u7Q7W9HfvWATvQcDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VA+mM9/n; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VA+mM9/n"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b63e5da0fdeso279774a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 05:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762781951; x=1763386751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxxNv3zsqMj1Gs4mcPxMIFOWegAIC0ZVsqaUYW8cbJQ=;
        b=VA+mM9/nNv7CLjjgxUpggLDb1EDI7HiIhGR3KA9rHkrX82RpM1Cs9YSYkuC74LfENg
         PmnB/mmGlAbiwlw59wlngTGJdEoVoWJXS5eGCoo2gC5EhksQHfV5+1zb59r7Gw1E53De
         trp3mx/BAuZ1UlmlsMlOfo19wzjHsjkVkCDFJqTZ3+sjPuK97GnN37n3iXfkyBim8k5i
         tVRCZuZv1OlEJY2DRKTHzokEu2kclBLLmlyYGzg6FB0F3DefJPi1LbnP/gPl4+Q6AYyA
         FoQRXhis8MhsLXLwvQ0kMbLjNkJdnV/TMQ8EqdyKsc62BLjc+z1Pm8ZtT29PBQ1qvDXm
         5hYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762781951; x=1763386751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JxxNv3zsqMj1Gs4mcPxMIFOWegAIC0ZVsqaUYW8cbJQ=;
        b=dHQqGCwDGbX2+3kRH4Czg/HpOVfQb4xurkjsKZfUF+3PADL3EjWOq1XQ9EOvm8j867
         YBhYJjzHeHdLAlVKv4TVRz49ycYxD5qXRllc986wWBVfjI8SaN+GsFhP6PCDK30OmaU8
         lYa4z0QwAC5rDvsx56Dz8n1N1LMo6QnXI566UESuvO+ZMoHJ8ev/FO3MeAxT9JPyWxIB
         7UPi6O0uIUraekVG9dPh/bGLDkQineAkW5EAhEdsMto+CMAJl3Z/Pt4jIwz7SVSkBX2D
         SlsXFenADwuwKepvRlOL9BXFyX8PS+H6Nzj9COqMJIIFBA2Xyv+ljpVI00oZwNhNJunl
         KHnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQzfbC0tM8fNACwNFQ5aotP7CsA6ic0r+3dzEeZZSfH4F/FKnIAG+TXVZKunRX1jJdtKeGNIv5LpTJvCIVdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6nSE70sSe5+F5l0rqeArywq5+CCOfxy49AQfLaacPmg5gLdEN
	m1/BnPoP+t5a5k1CBAHLuV5WTd/WcjaI8PUg2lDgJt+bhwPk2dH8YqBeStmdl4DxmsRfsa425bY
	CgDSJLulOD6lUzhxcnh11wunHe7LbEyc=
X-Gm-Gg: ASbGncv0SPyETwK7wDLNru82DmizCvga6W9kX99aTbC01afPXJ2gD37ZdowTtrW0Kgx
	msD/9ap97zusJDDFf78Z61Sb1lHKyr8krY54Wlk+Zj3u0wh1ef0yHnAb9w+dd7WStexkKPbpPMu
	+XHISG7MilpKHVQKLiilxTojUzF03t/MFDoSDC88+wM2NFK9QZd0NjbXOLI+7pYiuVN+WYPVRom
	l8pM4PYMjJqjRtAaJQp0/5m/UzdvvR24cwAsHxkHMtJwUCnSdXyTX/vphlN3tg4GxxrbxTHlXBv
	ShU8ZQ0FQP2fN03yC9aJSwpLl8uBILF4bSgoVyJl3GK0i6EfS/Zs8YmKBz8jgxSwpa4qOXDAAAf
	gj14=
X-Google-Smtp-Source: AGHT+IG/R5OD4pp1OFOM9MYMt9/Bhul+bEC+eJ9Gapoq++XiZ8PPTIp2w0OLJEaZ5ptFkMI9E6aTQfedtmXfsk2hbhE=
X-Received: by 2002:a17:902:c409:b0:295:3262:c695 with SMTP id
 d9443c01a7336-297e5646bd4mr60288355ad.3.1762781950762; Mon, 10 Nov 2025
 05:39:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-19-ojeda@kernel.org>
 <aRHRYbHIfxMQ77eh@google.com>
In-Reply-To: <aRHRYbHIfxMQ77eh@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 14:38:58 +0100
X-Gm-Features: AWmQ_bm55qKIiHG3q93w7SalH37CbhDBzqfQWzONZGIL-nfi2vUYjlTXeaaq0Ug
Message-ID: <CANiq72msN1B8c8QFuH2VK40xXY3=uGiGL=YgAo68o92LTO=kLw@mail.gmail.com>
Subject: Re: [PATCH 18/18] rust: syn: enable support in kbuild
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 12:49=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> This change seems unrelated?

It is needed to actually use them in proc macros, e.g. to build the
new `pin-init`. We could move it to that patch series, but then it
means it is harder to use this series (e.g. someone was waiting to
port other macros).

I can put it in a final patch or perhaps just mention it in the log,
similar to the `quote` one.

Cheers,
Miguel
