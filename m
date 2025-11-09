Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA552253FC
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Nov 2025 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762681692; cv=none; b=C9UVpAo24D4qMUd/gKvkHMZOkZjp664gL5EQw3BNBaIEqOSw0jouJh8FwY94kO/OguoYbcGjQEIDuxOlx3636FutauNNjk6jbLwrCPWhDjI5chBR9tt6SEOyQLLdOrdQqbVFrcJjupx8Agn2pKaWlO5MrpBeLtwjcRlqD4QiBLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762681692; c=relaxed/simple;
	bh=7UbbWu4YJEt2N5oFO0yvfHfoZZvWupJp9/gMRHzUkU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scvXvJI1sbamifwodFJgg3GNoLRROq49f3lP5c0NdSd3KCC1rgxIGVayKtQJIdy6OMq/5j8K1fI9HLI3fg7zyVMtUUyl7sJslPkbK/WjKsw1s6dN9J1LDTczn8L30lmaQ/c+NGh6fwVlL5KBiXcdN1h3iq+Yq37RMKpOaUxsomY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIOTaenL; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIOTaenL"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34159ccb610so270674a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Nov 2025 01:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762681690; x=1763286490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UbbWu4YJEt2N5oFO0yvfHfoZZvWupJp9/gMRHzUkU4=;
        b=HIOTaenLfun9mvmLYJWA8wP8Uu0mjVwtY2hF3KT5qdzQAXjl3J/3zKVS1WRWkth4W8
         uo3UgRK9ij2ADaMNy0vEAf5y3xMUFqu8hFk3jU7mnNH3FPQoTVyMthBOHOt6TGVXbl8Z
         7yl4QBS2vq0nerwW0ygB7FqBM52h4N14OEHzXctUVvkNJnSm5Z+FRJ4sAL/nU0zz5o1F
         Rehzm5XHqZCcpZebDgsHTwTmMd30QWJGUDe5gaX5IW3j28XcCfVBiYg6GB597fw9/UhV
         eoIBWm0Ww+VgLED2c9ZfI5w299Jh4bijaRpqN54D/q4v4bbOMDXCJRFZSlghe45CnXQf
         7NQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762681690; x=1763286490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7UbbWu4YJEt2N5oFO0yvfHfoZZvWupJp9/gMRHzUkU4=;
        b=jzCMmvHGrQWdw8cvT6xAgajGgFlwH8df3adQooR2udGrzwCsq/wOe6T3xhwEMcPH25
         cq6qWL1Eekq1gWx4+i+XfYPlgjs6I/z78NgTARdtJtDBzYZH5QKVXMnJtTGBa7ALmbVq
         itqrJUlRtCXzwusLDJPC8UoEU314g8aqLaI0lfA7mxoONbLiySxe8qSN46Eo3QRRAoxV
         QllnPjP5B6BrL/Av+dDKEq4gOEPsvt+uQvyHeTy6FNuxLfefxp9pwnj4KXdj0Au2OcET
         ta53aEzDpydoPUnK57/rSTA1Cx+f1rmLzT3U8ZRo4l9qsJmRYrL9MueArFFx/40H0L0d
         +zeg==
X-Forwarded-Encrypted: i=1; AJvYcCULz49tY8IrHPpe71/if1E3/nAAlaS3Qpq9Bkyl/sT1uhrtFixVt+++jszK5SQusOiyJJB6IxV4FyHsXdnIfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMYCRZiF3uyoW4hILq7zAYwNKYURPGEyhUHG6i5p7x/pnPDIzi
	2B592uNfUB7nj8bG5wgBRj+XZW1D1QihQwSkxbBDdOiT2K1u54cYn6+KYuGTumfadxDrlH88b/f
	XbLPNRH3pFyaACUleydQJKnIJUUfsaHo=
X-Gm-Gg: ASbGncuuLZslPLtejbHg5qwY4B4DZqsMg3uUVgqlWEiXIXzrAIykvrcZlXnDUCBr8K2
	UOqcqr+c5Gi+XlOndOGVRhEQYmEKkg1/bQ6XmNyUBJs5YQcaqmWNtqCylr/0Ir1MJm+UZ7VqmdO
	MNCqlz3sgAy34yzuuj4QqgkwMS3z7FphMmQXKkY6hsHL7QdzXGesj4Bxr+SRl+wB7Yr8P3SFdn/
	SOpIT+2Qd4nEBEIBHJKMGk5WX5Jy78qPsImXmyIH43NsO6Xly0DxoSjIIm3HM3/l/QQagMncoew
	v8hC8by8We59g09OfSwryzjKkvOG2aHJuttJaO53e/+TXa2dG5ICU/Y9N9/u9cwzHBwCeVZFruV
	+JYY=
X-Google-Smtp-Source: AGHT+IHJ3X970Fz+WZG6aqfSKGTdXxfzPaNAG0irWW2OKqnIbo7IoDwLMSbVP8viSAFnVGTRp05nHQrCuUons0eLXmA=
X-Received: by 2002:a17:902:ea09:b0:295:511d:534 with SMTP id
 d9443c01a7336-297e5731561mr32609445ad.10.1762681690341; Sun, 09 Nov 2025
 01:48:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251108043945.571266-1-jhubbard@nvidia.com> <20251108043945.571266-2-jhubbard@nvidia.com>
 <673640f6b26617bc5e1f4962bc2f9f7257346efb.camel@nvidia.com>
 <46c4877e-2af3-440b-b8c5-fa9078a5cf9c@nvidia.com> <DE3AAYKKI0HN.2QTWD76BN3LMO@nvidia.com>
In-Reply-To: <DE3AAYKKI0HN.2QTWD76BN3LMO@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Nov 2025 10:47:58 +0100
X-Gm-Features: AWmQ_blUxjf3ArTwjKKrEFU9NX1RDrwQAlazu89gcX-vqWpEmM0esqgYqA4hVRU
Message-ID: <CANiq72k3gkVnkW4_A47FzAD8CwYLHj3qDUhNsT27P71=XppRdA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] gpu: nova-core: implement Display for Spec
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	"dakr@kernel.org" <dakr@kernel.org>, "lossin@kernel.org" <lossin@kernel.org>, 
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu" <tmgross@umich.edu>, 
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Edwin Peer <epeer@nvidia.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "gary@garyguo.net" <gary@garyguo.net>, 
	Alistair Popple <apopple@nvidia.com>, Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 12:42=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I think this is the correct way to do; `Spec` should be the one to
> decide how it is displayed, and from a maintainability perspective this
> ensures that other sites that will want to print a `Spec` in the future
> will reuse this implementation, instead of either rewriting one
> themselves or having to figure out that there was already an existing
> site and factor it out.
>
> Iow, this code is proactively doing the right thing.

Yes, please, avoid hardcoding inlined display code.

Cheers,
Miguel
