Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A298154458
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Oct 2024 11:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727956261; cv=none; b=uAAZtu9Nm/jqRs7WvNRaVlQ5edPJMZyi35BBwwgn0nQjolZSjM2CNZWZnxGtebH/LfQ7WxwbCuO5K4+MijViTtjTh2aUmnro1jLNZcOdrEqkwM+UxJV4rvsK4A3AUN9JxY5xuHJtINCJuJdQKGJwYFig57L2Tl7+Gk9EOvavwRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727956261; c=relaxed/simple;
	bh=fUHTQgG9Hpq2LOpYncGvcml7DwKTEMd6jne2HUklpU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BMe5FDuVeVx3sggqBm002zpcE2XqS1jELygb26D3BtRKS/twCipQuYCqeUtAm1yGo11PyUgwQ54PwUmMhv+lEXcAtB00HIsoH9lTZwtZG1BDZiTHVgFOBT4EyfC56D9EHQ16B12e44V/SoI1mdR5oUszZrqvbI2JQ/KoXTnhRpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3epgwHfY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3epgwHfY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cd74c0d16so8530775e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Oct 2024 04:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727956258; x=1728561058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0vqAMMcwtut0432kgNd0rtwBnwcNwLnp/2kFmFRgPo=;
        b=3epgwHfYDlcMqpxroViNWn6mfXbDX3K86CTgbFgq6MUYXTwx9FpamnyMQOmVvYEx2u
         MzR5BNI0VgdSEB8ixeMeyxYGzSvIViV9JUzoFAhpgaL30IyTqvjlr19W0Hif81iv/b0p
         NsBvP5PIRifPDfiAMkzSlJTqT0JLhKDZ8AFXzubduSxTOvKuqOsBO32qfmLSzf5fKpE2
         B9hzDPacN02sbokKhSsGi9CIF0CRqVH2hqQC/BhXHaed+QDAkhW4uPjYQCaNh1BS8C0i
         t6+EXNpYHGDSYeZeo4CZDri1y1MEQxOK0huUXOL1EKYFkwYkfPZfu226GpoyYyftCgIp
         9AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727956258; x=1728561058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0vqAMMcwtut0432kgNd0rtwBnwcNwLnp/2kFmFRgPo=;
        b=mA8A7AE2pN1FRmynTIMYuqfh7XfHopTyjsoynXe/nl7FhccXsbWlKKRt+/gM554u/H
         sD4w47InDCuQhNe0RJVnldJHkt7CdUYew74/4PRR3hQQtBW9gze5xOthXBfvtA90Zi+k
         CwfRg1PLEFJABqZuG7+AG00qH1bN7wd2f1UicNBlac9pRL8OBmWicPRozwwbKAdA0xby
         j7+6kbteZ6VoZ6plgnTTvJpF2qFCRa9AlIy82xMyZt1UIe9/H3iOpI+fPGkBwYJyDogU
         X7dFb99FmaQ+Wk+0MFj7x1+fDgfaVrMpjgniEcZV0GTQLBHCkcXlgHrnmza243iXChOv
         ibOg==
X-Forwarded-Encrypted: i=1; AJvYcCVCLR+1qFwhFvNRUZlKwHebkajzoLL7HDdgrIRtHieaaVz+ZvX73DIQLiQnr08RtM+vbWVxkNTCN2oDISG+mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd3OR5bIjebKyjH8Hxx86Ayh2s83Ww7UP6CIkvUIPZwugR3ZnY
	7+YmUX20INZbTtyA47jFvW9kkvMJ5MM0hw2BZDHVlHc+YviJvP4SCGQTUSzi2DcSIm1LrARLqTG
	+UljutRBGGAnIHmLJFuy9XbemkNtsvhFSL03g
X-Google-Smtp-Source: AGHT+IELUkt6Ao2C18l9O+EPp8uEq8xeC82LkMyymn5j5F5+Moy/XTZa78WYto4zsTZ7k+uPk8Bt6gSKaGRYBGL/BAs=
X-Received: by 2002:a05:600c:45cd:b0:42c:df54:1908 with SMTP id
 5b1f17b1804b1-42f777c31ddmr51476685e9.18.1727956257668; Thu, 03 Oct 2024
 04:50:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <BL0PR02MB49141A172569679932EBA20CE9712@BL0PR02MB4914.namprd02.prod.outlook.com>
In-Reply-To: <BL0PR02MB49141A172569679932EBA20CE9712@BL0PR02MB4914.namprd02.prod.outlook.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 3 Oct 2024 13:50:45 +0200
Message-ID: <CAH5fLgj989mYqHmfTqfcAfuYjhOw-J2mskmC-zwF4yrMGjAFjg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: optimize error type to use nonzero
To: Filipe Xavier <felipe_life@live.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, "gary@garyguo.net" <gary@garyguo.net>, 
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 1:33=E2=80=AFPM Filipe Xavier <felipe_life@live.com>=
 wrote:
>          // INVARIANT: The check above ensures the type invariant
>          // will hold.
> -        Error(errno)
> +        // SAFETY: `errno` is checked to be non-zero.
> +        unsafe { Error::from_errno_unchecked(errno) }

This safety comment would be correct if you called
`NonZeroI32::new_unchecked` here because that method requires the
integer to be non-zero. But the safety comment is not correct when you
call from_errno_unchecked. The safety requirements of
from_errno_unchecked are:

 `errno` must be within error code range (i.e. `>=3D -MAX_ERRNO && < 0`).

So your safety comment should explain why we know for sure that it is
in that range, rather than explain why it is non-zero.

Alice
