Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A6F3403EF
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015228; cv=pass; b=PuimdG7B1vSB0QXFYr8Dmcmt/p26pSxYjBn05KYIUly1vcppNi0BdoscWekFRVYCqQo6d2noi9Vc/SpuS3c3pahirIGwzQuFyqI+Tvj6GYZbwIk07L4IaA+LM6Dp8mE0cfs++l0g4QeVfe3d0hPLmQy4hSJU8QezjKJvA21dJ78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015228; c=relaxed/simple;
	bh=DlYsWxwPaSBchNEbLU5XBl007Xpz/RPygGJ4eGi78Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKy3FjhWlfrROZ48AfNAyHqiUJmYziy1UhMycMJ57jNfxBA2tsQDG6k/U/IQhjtPKt8VItAkZBxYYTeq+7SrzVsrjJdJFH2CtlALPdodzPEoHn1MquVcGX9SfIgzh7zPQtQFmMAe55sc+cVHgAYDQ/2b+Mv9V7Ll+fg73NaeQzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBxgYXL4; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBxgYXL4"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304eb0fc233so480527eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 07:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781015227; cv=none;
        d=google.com; s=arc-20240605;
        b=GK5lBDesZJEyr8NCTwPtTT2Sgu0Rk6yOvMVWIST3yTfOuV63t0PEJywrq6i2FdbkYr
         YU+fV01srkXC599+q+5IMKXYpdkllhHU8Hq7cBut3Crl6qonNQRiCXcq1osJsWItxyhx
         BnVCH1kh6nQu07aA+QwRhvzgvLxTH1f7dCw5eVLi2w1hPEv+0w0GR2kuMIwqOpuhv3Yv
         epsgtLR3PABL1+ZSCsN00H9sFt346PLglYMHzqfh0QY1/GH5u3PMol8j5z/iQQc3knjO
         krw/yRmFThrK/UhQL23cN//JcXi7ohftaJVJHquiFb1zpn39nn2h5WMz91jvckB/FfcQ
         ISBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DlYsWxwPaSBchNEbLU5XBl007Xpz/RPygGJ4eGi78Dg=;
        fh=x/DNZN6uHqxyBBUGg8bAwfUq9SKp+hTTYoGBcGN6RLk=;
        b=eOefxkwJ/0DMxDxoQe/+JIWrk6CEI40NNMO9UXxHSp2qknWJxblmJkuuhMTKiKze7M
         Em+UvZors5ptJb0h+b321MTktezGcdF8bRkeL/7RJvwmN7mMy9dKzS0ZuGUVXUZ57yoY
         N1Oat2XolI8qgSv3OMFYm5p2rHCiFNvXK29uRpMeG4/jji7akVyVPZaUUgM/+NFjn9TT
         ZNABnjq3DT/vLVfmAsUOz3fqJLfEASbYHJeSxGz1Y4gPwTEJeLRrSGZM6spXEbbWJXKf
         bo/hgBZEgg5gUA931qyU/Icv9h5XT6au0N8Zqf2wzmjWvmSXZ2GE/d60FOSGtaiT1jk7
         6+iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781015227; x=1781620027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlYsWxwPaSBchNEbLU5XBl007Xpz/RPygGJ4eGi78Dg=;
        b=kBxgYXL47vCmtYcaOr59hXz7QWQEUuVqHiSmgkzQcQSAEy+s25bFNFgQc/ebrOHOxb
         bQPJIHT0S+tlYELjngp7rUAtOavW3mgIu8aWtlODwN18tI4D4+6uSMLWRxlEVJWS2SsF
         YJZbcPpK2oyllAfbVbwgF/ubYIhCZ0YGbW630ANXUpn2G7TVG/zjT6YBhUyXpLLc9xzB
         CzhXwq9Njfq6H9pGlT73JBk0NYRwaaH1f2tmo8fckXzvVWoi4Gz8OnZcrrHSMzxD8n0F
         XqyySE/7WtsrzCACmVe6Se7FyDOO080t8PjSI2CAjGDvv7kGW/9mrbcPDUvQ/Cuvrt4C
         8k/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015227; x=1781620027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DlYsWxwPaSBchNEbLU5XBl007Xpz/RPygGJ4eGi78Dg=;
        b=VEpwTe7Ef53pjdehsv+PHRT9CVgfTRV97AGYitsOMNza1z3c2SdEQ5pN/11jEjpMdE
         8SoqDdJLE8l5UoFmhxglmMCs4EN9XSK9LMJwKYNo6Tfc3R2vsDks2AQNDOxvmgiLlOAa
         KIlti+cdrv9IAmBkyGwRwgwk5SfSpo1HhP/cMStdUKlnuWhob63vacMas/uIN8BMypoE
         Qqdv363xlm8SO137HevQsQ3xR4d3rz4avNhyx8y8S9S3TCLTBCZ4IRRY5krDYUMWWbsT
         DlgtLZLKRwpKhN3sbY26Ocyz7ZdM/aFBumwUDHOg2uaMBfUSHVmKvR8UCN3+GYDCnI1d
         z9aA==
X-Forwarded-Encrypted: i=1; AFNElJ9LfQjmH/pgvOavuxC8O8yav74akfT8sFWCFYzKWdUfB7akjaoxfwOaLhOuldsohRPdw7dIUYM0qOvNeqS3lA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBHpmXZjHwFl7PnHE0/o4M2xBsMKV6CMm69ybv0+GZ4qym7bJG
	HwzKgnXe3kjTvtngB7SWjhxprzlFgJwEUpnpvkW5b5mWjvHFxFiKlZp19WCyDricK1Tk6Dap12V
	dthCNDtWqSFMbJvtocmPCvAi9KEhky6Y=
X-Gm-Gg: Acq92OFlODiiZEAnhkml4n0Tu1fDfFS/od/CRBCrdBisWQTEYc/Xmj+yp7j4xZ4R4gk
	d02aTfxSSFhivEaewnmqTlKGEONBBdgMOSqGnyUXaN/3NdWSJMzd+uAAJY9wSUxLLJSPlAXzwjx
	qBTU2PKVgA1akAknyMhEg6W8Dm5Wpz4Kk6K3a2pQzNPL+qMjn3RRi6GEu5B72QpYvxCavKwBQA0
	KJ5/xP+p5RsypuZ0qA2iD8srKiZ/Z+f8Q7lEcdqwm/9Ym742Wn34uYHy6WD2scFGqs2K+2TowxP
	QCssrKEgt7KGfyu5QMWN+9Q06Ux+2wKS2EO9IR/w99HgGLj2bUii9Hgbyb2w1o63HYeE5LS5dMk
	eIbVxrkWs0gf6ZeuP1o2V4bU6bk1ALo2KmQ==
X-Received: by 2002:a05:7300:fb91:b0:2e5:faa9:ca76 with SMTP id
 5a478bee46e88-3077b437db7mr5489821eec.7.1781015226931; Tue, 09 Jun 2026
 07:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-configfs-fix-offset-v1-1-7f01b8fb9e5f@kernel.org>
In-Reply-To: <20260608-configfs-fix-offset-v1-1-7f01b8fb9e5f@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 16:26:53 +0200
X-Gm-Features: AVVi8CexRN2P04YMxXkO6LzvYHbNvupirbfSsGx1GnpAay-qdHiye1GFekZrQu4
Message-ID: <CANiq72nTu20eCAYUsx6BcvNF5OqRSi6JgbO21WmwR_i_LxtZdg@mail.gmail.com>
Subject: Re: [PATCH] rust: configfs: fix data offset calculation for subsystem callbacks
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 2:32=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs=
")

Same here: should this have Cc: stable given the hash? i.e. 6.18.y+

Cheers,
Miguel
