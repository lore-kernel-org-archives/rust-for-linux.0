Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FEE33345E
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 16:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605569; cv=none; b=goU9LGffBeLugC8M+Qv0bkLB6FAZ+7zCNY6KymscpD2Lh0rdBiI7g0DIx+xJ7vDRRhsH3jdOT8Nc3sbsK2EuOFkMAc+ZWrzGz7EyiVF1n86aej8fQqaUiV9RWc0db6epnJRH4u2pNFVIR8A5ZlIl47CkixB9Rbvxp92Vlm+uCiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605569; c=relaxed/simple;
	bh=DZ4a5Mgsk0Inq74+8Ce/y2QjH3WhmBqWp4gygHAwsfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWi63nDWJDob29Q4iui3d08uEdfKYssFy4A/U86R3E/uvoW/VIiv2bNmZppEc6cek5HsYUevbkoMmJhHrYeyg5MnwH/2VduxPcoPmmo6V0bHXsatq8ZbtRS8SY04XgobdCpo61EjRF/I8ku57XAJYO/YuQo4wic2xwNliLQQxXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBS5qDR9; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBS5qDR9"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b8ba3c8ca1so595981b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 08:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764605567; x=1765210367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZ4a5Mgsk0Inq74+8Ce/y2QjH3WhmBqWp4gygHAwsfA=;
        b=fBS5qDR98z1egtGbaOb3vd3G/wa1ew+6I5GYnajt45bJjMXMhbB1d5J9g5DWXAgFP5
         SCilVaph+zJbwdJUPzXx2BZFpQ6X2FhU+cyAqngPYzVTPrXn/fyefjgeCQQPd+Opf5oC
         vV99SzIwj5AVbIVNzPPKsePNoz9hCpJY8OX87dOmTIB2vpRUnZdBDclT+TBYLf+xhH0j
         9hNfLZry5aCH+ld9xqg48KtlmvLN+dtTJEA0bwOgnXfEaf9YAtiZMd6sbw/o1wsbEb6h
         6Oiy9ezNiCk3ah3T/3JYKWXzK/iMBqn4dZ17nzkYK+jPE7VWNWqJ5+t4DOXRUBZPDJUv
         h1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764605567; x=1765210367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DZ4a5Mgsk0Inq74+8Ce/y2QjH3WhmBqWp4gygHAwsfA=;
        b=utoLlH5pmYlbF47MqHHqUKgtcMhCBAhWzvG3N12p0O3P9M77J815J2zmb/CHnvn6gB
         jZ8ANGPWPz36Y1aqFIJDCjCxOOeiDW1fizPXqs5np4bsYOrEPeM+DN4EB/HXCGmQKeqZ
         P3j6hJTL834xwTaHwR8zcxfccRUCTfjEvEwQ7XJjcEF+f7prbIe9AjDdhrgMlWtPOLTg
         bp97hxMDwhrU/rvFNoVtBrfrG7qUs895uM/sW4LkmtDCAOy7YWKJ0pmdwRIAcm7yr5B8
         iIH1F7B/eJHmvaFNKHgllvWp8huKZpbodk7AQGPaaIUbHRNvFAGLAJmuu0eVroFBiv82
         POQw==
X-Forwarded-Encrypted: i=1; AJvYcCVPBnNSiIfc8Kh/OBcpOb3dfpLJVILLlneV1Y+3CXGYwhqWjtWFsA/JGPiiAmN08KsMKtybjp38YiQnX6pGpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ScqvD9/BwOXIlcLgs4ft2Jt4lZhW/NlhNVCX6nftadWCNfbK
	B1Q9glya3L4JZD6fumBQYGwS0yIBZ7buqD/jmIwAm3zr3cQOILSaqDk4tgncJrOwAN/gDDDeEnK
	L9ru6dC6PjGvepuutWQElqmXSo12JrkE=
X-Gm-Gg: ASbGncvEsuXpWPHndpkkVc6eY8UE8DQHIlxnXXI4JuZE+8ou/J2Qr4lmEieNxxMY0xH
	tnr5YIm2UjPKbEsTzPmZt57GXR8SXYXfNyxUsdh+ZRKBVTAoAcU5qCawuO+EW+6pH361XfFIecm
	FVSuCdulxKb7lpAveLu3OJlA99g/U41zJPl6FhbRFd2+IKuwvjs/C/fnAL1o92Ffe7TaaFTvYEe
	AIbdkSPgX2GzKq6dMcY3p9E5s5BAkW0AlNbZNaYebHTG1LBeOLvSi4XIkKJZQXTuvw8jVusDhnt
	9MOSWIifM1PmxgjHzPl4K5m019TsHGFuuBDQtbn8jCTuE4J28TiXZ3zjxJw7HIpbYZhkaXUpU9j
	WxIZ/asOhcdt2wQ==
X-Google-Smtp-Source: AGHT+IEWCgvoW29C6lraSygmlLxaGq2K4p+d036CB57iwT7yzUYhr75XzgP0unYGjld5Hd7tkwjRa+eYcf6JgYf3mIo=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr26054872eec.3.1764605566715; Mon, 01 Dec 2025
 08:12:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201160715.25991-1-atharvd440@gmail.com>
In-Reply-To: <20251201160715.25991-1-atharvd440@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 17:12:33 +0100
X-Gm-Features: AWmQ_blYKMrOp0Wk60-V6aN2rk3ZcC5_SXQaB1xT05YmXwp6hcPmw1yrdE4fDsI
Message-ID: <CANiq72mkzeDTHuwdTSL7cy+z=nzEHA6bLYUUFOSU7RwFurDq1Q@mail.gmail.com>
Subject: Re: [PATCH] rust: rbtree: fix minor typos in comments
To: Atharv Dubey <atharvd440@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Charalampos Mitrodimas <charmitro@posteo.net>, 
	Yutaro Ohno <yutaro.ono.418@gmail.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Borys Tyran <borys.tyran@protonmail.com>, Daniel Sedlak <daniel@sedlak.dev>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 5:07=E2=80=AFPM Atharv Dubey <atharvd440@gmail.com> =
wrote:
>
> This patch corrects a few small grammatical errors in the

s/few/couple?

It is also not a grammatical error, no? i.e. it is just a typo within a wor=
d.

> Link: https://github.com/Rust-for-Linux/linux/issues/1206

Thanks for doing these; however, since you already did other "good
first issues", please do not do more to let others pick them up :)

It is why I typically write "...to use it as a test to submit your
first patch to the kernel." in the issue text.

We can take this one since you did it already anyway. Please add the
Suggested-by tag as well.

Thanks!

Cheers,
Miguel
