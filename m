Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A98313521
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 17:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758216269; cv=none; b=mIjVEBh73VtlEkesOghf3Gj6MFG/W3iLq586AHlbhZg8qKzVU8zBdDMHFspY5XWC2uBEX7hJ4B+/zUq1jtdBOIQP7LQ4n7s55c0LhXeIbST3rEw1iFpkdHJcUmafjrjKDOIVG9utf9rfmsqW3BZPMzMgjqiWGJvASacG2A2YNXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758216269; c=relaxed/simple;
	bh=VPVaLq3mEhpTLnLGgFBqDthQx4v4zfVov8m51kTdsRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cTKsAukjBh1/Zuun36VpaCoc3MHZ9X2mvtQnj3lMIzqywQz4H2FCoXMGTWNLZYaP3m3Jx9iZZU+3cqo2NnIgqROKR6JlsWpV3DPt5oA9Vcww0h3TsgP5lQJGiZpiuqtkXIP4LMMeJMrV3jvEOecI2lNDpqOF3A58syTG/JTHccw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K96h17TL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K96h17TL"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso1249381f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758216266; x=1758821066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epDoJHvLYqW2JL6NNPKc53wLkRtM0zeExMM8c9t1quc=;
        b=K96h17TLtGLiQ+jtYwQXqYRBF+MV55l8OrAIg3e+N/O9IuSoCcFNL9x+q1kO8Kaowr
         ZBmL2CMFuZPoYSnhtRm5avT0VEDbHwbpWoNFAAT5cqK4v8lJTZ51fLPJWze4iE6PuNA0
         jEYnrT3lTr2TV4GQGFBZhVC4TpCXfXoVansGkOpFRBjGmjTHGBKT1G4m4rzpVC4KB/Ly
         0LNtxw1/Hna0dI6tJ9L/qmRdC8FHfG3IFZebW9EqkZdFd4FyRBfMwHG6i4Hjzr0y0eou
         S4CRlEg5/eJ2/QbbbrrE3lTnMZKfzcbMaa97fDgHPySkLl0rYeTeyngJPum9UUqEgeRS
         iq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758216266; x=1758821066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epDoJHvLYqW2JL6NNPKc53wLkRtM0zeExMM8c9t1quc=;
        b=dqXRPfRFT8qREqnE/IlXeVrqIH9U5d067yNi/Isq943GwnWQIYBN7WD8W1zRoF5X/f
         kpnzOzk9x3ygdEkOLPVP9Hg9/0ceJrq/t6mFIDlg5LKYOgMxl+yPW2SoQe4BtTNrk7wU
         FFZ7OVzCIrw3fjqcbiE7pCM9FZMSw6M/IXnE+dUNpJEItr6JLQm1dkOdHSsSISrPyYZM
         4Hy8iLkINGVcbxMgdeBfpmdLKhjwf4TC+0/eJ1YMqd2nE9z4X3EGHsGgZxV1eS+5+ruq
         ssJeWpOy2r/R8HLf3VxFubr7JE4lzUYAWmyUcqpZM3830gEExGQyEES4uXq/22+PB802
         hNTw==
X-Forwarded-Encrypted: i=1; AJvYcCXXjSfY8a9ZyuJPE6/Jy+Mm6TeNG0SghvNY/pk68a5QS7KRvrFp8TZsYCBQn731q2+qKDs/3V6OiJbsatHLnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzSvc2Hp8YNGpG3rvVLN6oEoR2IVfY2XA3lcMjy7pt+qu7IcIj
	xaB7NQhp1KBsrk4751Vt2nN2uypkvAaP9R2Yh1DeR0hodiKs5qKxTglTYQUexT4s/IVQUlrLg3f
	IKCwKQhNHVilYxaCzKUl4LQiix0bfpBzbt1B9qma5jSkdQFcCskJfkhStMv4+ow==
X-Gm-Gg: ASbGncv1kx7ZaejieV6l3lrdTjywGvYpn/keP/tGQtqvptMC1yTdyaoHuUgWr+DCFjz
	tupgGVpa29itrNisWnMduPRXax27lCNcgzuXAw4gB/pzTIOGwSonHVtWDacctJsbdkGutzjGXHX
	2gdKBbVbWQ7VlcpKqvQvSOylEg8QW/JS3vIT9D+i+r9nvWx1KLY/wG2wsLniSbEXIEDtDJDut7G
	nFdY48qIpuQyLdz7rgF3dJPMoa3i9h2kzsukEsmdNxYcGw9cDpW/eHR3/FNBoI2
X-Google-Smtp-Source: AGHT+IFOw4CJFmAI9RamLzW4T7p5y68pw3l7sF7vN11tflJvFcK2DY7GQts5zPIH7DY4olKyRLU0HJAAK0jICO110J4=
X-Received: by 2002:a05:6000:2301:b0:3ec:db88:bf1 with SMTP id
 ffacd0b85a97d-3edd43c02fdmr3984418f8f.12.1758216266082; Thu, 18 Sep 2025
 10:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918144356.28585-1-manerakai@protonmail.com>
 <20250918144356.28585-3-manerakai@protonmail.com> <CAH5fLgiDJbtqYHJFmt-2HNpDVENAvm+Cu82pTuuhUvgScgM0iw@mail.gmail.com>
 <d90b10f1-2634-481a-beec-ce9f31aadb74@protonmail.com>
In-Reply-To: <d90b10f1-2634-481a-beec-ce9f31aadb74@protonmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 18 Sep 2025 19:24:14 +0200
X-Gm-Features: AS18NWCJ-KA24BPiLVdZMm7KuWsn9wKB2ov2s7U4hMX9LGAaLcStRnnsDeNwjmk
Message-ID: <CAH5fLgiCzcTo3VF5Of=_bHO0H8+_uPKYwD_aG_Q-oJc3sf+bTA@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: miscdevice: Implemented `read` and `write`
To: ManeraKai <manerakai@protonmail.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "arnd@arndb.de" <arnd@arndb.de>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 7:22=E2=80=AFPM ManeraKai <manerakai@protonmail.com=
> wrote:
>
>  > We already merged read_iter / write_iter functions for miscdevice this
>  > cycle.
>
> I couldn't find it. Can you send me a link please?

https://lore.kernel.org/rust-for-linux/20250822-iov-iter-v5-0-6ce4819c2977@=
google.com/
