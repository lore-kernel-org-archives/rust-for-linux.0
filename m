Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DA62F9D98
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762179016; cv=none; b=h6u5BwOgA6713kq5io0Rytgddrc53C+qi6JJrsJSPfdU0fbort5+Dz0A28q0kuZ8wC7V6EHHxWMsfoH01YMsA6+vjTIqxOkzXMKEg18N0PfXjGCuKk1V52VTaDW8yPlQcIh0J9VRl//JBfgjrxg8WszejAC7bmJOLiI7MedfRDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762179016; c=relaxed/simple;
	bh=/MSFS9mN161JdJ6hiSa2/SgnqSacyhFr/nNU6+KwahY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bio6O9R1FnfwYwjOJvJ6lCFSvxpJ9SJ1znQB220pB6hYH3Hh4eN1v6ITyBHqt3m5DZlBXxZU5G+xlSMY9UvKIXj3HaMYVediILOfGgidhplaSIGGdXJNmGEgUL0GtWsIxOn0yGfsX980QrKlKKWLs3BPLafyV06snRPOtoaC4jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDnnWtQs; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDnnWtQs"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b63e5da0fdeso678032a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Nov 2025 06:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762179014; x=1762783814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MSFS9mN161JdJ6hiSa2/SgnqSacyhFr/nNU6+KwahY=;
        b=mDnnWtQsFb7VhhmJjnaQyHKkRmqtLLoGSuYi1Hu6KjDt+Vt2J3twNs7xkYdzeQIuc8
         8kSeYrlgYUOHNFV4E9SNOJBTnCEGWaYnnf6fKIcuOcKc2xwnlREWIXkZdAvahcUx5JIX
         lbaEOSpkXhz1qcgS+TuEA4oU464Wz3SmFlIcxAYaXcS0YSxC/OXHq5B7fiaBCbKVXxyT
         yegzvoWYeUb1Nl3Bhtg9Imf1n5Yeod1YjxjgJIt/5qH2bUQmbzg64/Rub8vqex5f0k2+
         4rPgXpBzd/DiDxhQ5UQ5joS0x63kq4/E099IwqKPJk6RQcmPSphs3y975TbYeu2uR6A8
         t77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762179014; x=1762783814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MSFS9mN161JdJ6hiSa2/SgnqSacyhFr/nNU6+KwahY=;
        b=wOclaLo75WxF6/EUvVZyLYwaNwogK46Nk19dGTRHSrrhu2PEyZOVsdkeykzKk3WxMr
         9NeUbT/ZIjMCor/nhjJg5LgjCE6tBgEj8aF3A87K+xfg0HEbngU69b9W79fcSI2DQG/l
         k5j0uKIneBltYzXsWk1S1DoWwbeDxrTOwFyDDEAvK6kjJ9XEW3tfuUddTv0KTppTgkjG
         l8pUXePPBHpqAYQhaGE71fyxRLrfMsKjqvNh30OZba6YBlE5spfEJVgNXI7xSz9K6zHQ
         YWx8to2hm1NsLaiTXEFVvYCltZ1+Y2J+o3TY3g/hMiYMBD9AhxQKzUQ0XLwM/+1gnCUq
         buNg==
X-Forwarded-Encrypted: i=1; AJvYcCXVoW8M0OHIeEPGeWgdfPPN4hB6FMufBH+TO1pc5USgTErujrI7WalRyImxZyNINGT+NeimZvt6YJDU7xRyCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1nMIBwvBUbJiG3R5SsmPebjV1Egseh7aDASN54fhTm2NsCmdk
	bsMd4fiBB9WhZyEh6/ByUkW75dk8bhu9AM9Ny/++oF35Zk8BnX9+RdDMEr1jVu3usZLqtKZVT9Z
	xj3v+4GeZirpaNt0x9BokltmuXaJ9eBmglAsCAz0=
X-Gm-Gg: ASbGncswAux4vOHsGc8Tc5F1eghSNnTlF4ksvwZuu+vVJjWmaEnLL52qtkuV2A3+3Pf
	qz/wxfGyijxvIGF+cccH2sTYLH3EVJVdT73XI/OU/VJNetq9nXLLwwrE5He/AJ9+/NyBBUtm7Fn
	dFlA7iOc6NRT9MWpRRo27vTKGdCQwWzdSwrMDDzgHmshJYEPjb1vaAo9pQJo4EEdNdIk7CczqN7
	VG1Yn+8LPhy9Qv82KwZfY4thug+2JlmUQfpn4g5xG1MItYe239zwXKc3OpzvAPXPigmyz3GWZvn
	8tg43JW+vktP9FKFIpqPx1pMgRJBcgJz6m+iN5PfT67lSAvaM9CeeOy9xfo2sgD822z0yWbw0q3
	T8xdauRNz64upvA==
X-Google-Smtp-Source: AGHT+IERZ1iyJZBPeT0YVQfb2PVMv4VFMRw0yRH9plwNDgHK1xJwSS9mH2Mrbs451CWBH4ib61IvfZSbmjYWHG0a5Zg=
X-Received: by 2002:a17:902:e891:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-295558d2f6fmr51352725ad.4.1762179013733; Mon, 03 Nov 2025
 06:10:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031-bounded_ints-v1-0-e2dbcd8fda71@nvidia.com>
 <20251031-bounded_ints-v1-1-e2dbcd8fda71@nvidia.com> <aQgQv6F0Ao4DH6U0@yury>
In-Reply-To: <aQgQv6F0Ao4DH6U0@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Nov 2025 15:10:01 +0100
X-Gm-Features: AWmQ_blqWQMEWzphBo6SNEUKCAPDaHlP1S6OkyILvvvtbDdStxg5wvCs5HYRH4c
Message-ID: <CANiq72mg-NntJLf_jbigz++0hK7G3WAxbvejRq1EzOc7GE+doA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: add BitInt integer wrapping type
To: Yury Norov <yury.norov@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 3:17=E2=80=AFAM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> Rust _must_ do the same thing to at least be arithmetically
> compatible to the big brother.

No, Rust doesn't need to do anything of the sort, sorry.

The point here is not to copy what C does, but to improve on it.

In particular, we definitely do not want to have anything like integer
promotions and arithmetic conversions from C.

Cheers,
Miguel
