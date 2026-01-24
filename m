Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC6638DD3
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 02:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769220100; cv=pass; b=icWEQ6c1qSUR97D00iOUX4VDBiS2ZxPrC41ERJJ06rGSlT3w31Y5KjqSf6MEacZM4/05lDn2uxLmK6JIpZaPDDKvScRtqbZZ75lVAoTh/7j4Xy0qL8z5G6UZSgK8kLc7l63w/qB4+rK6E0HDw75qCdlv5n6/aUlV7YBLN8K9fq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769220100; c=relaxed/simple;
	bh=jLt0PwGKxUNFP/UMurV5/9hmISNtz6t9H2HpKnVOTXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1/leD+4H+CmuR37ad9M2yiKczI9K0T4B0j5praKfGjfVoM93Asajn+zx9CO3ESun+/itkxiYeoZELjWImXK7FV+ErjkUGpdWhTmOccTAaYu6XylZSp8D5vDgudVKIwt0L/AiMVL7VLOaPbVa52Ei34TkvyXIQv6/XPjEEbJj3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EG0rLPz+; arc=pass smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EG0rLPz+"
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-8947e6ffd30so31383116d6.0
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 18:01:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769220098; cv=none;
        d=google.com; s=arc-20240605;
        b=k/XnX2ZFA/+empVQjYl9Osc5LpN2cdsSvYWIM14cX8yYRtY1R/Ax+1BhinLLVeY/U9
         0lXIrEXh7ycLWvdfuMermJajI5Uk4UAe2FnnHYqTtJtV9hKyVV6GRH9mVp2PPlosgwRw
         U1x06c/oP5AkfuMhxPzay0nq69Ia09JfRzgeedz+enYfbd+TyKl7fQFjhtmumq0d3Yes
         ThPh5mggKqYDMB9CFitXOcSGCeb3lvR8memzk4su2DVq8a3yr/MtWGRIzXYQHDMKc/nr
         n95Tt61Z7+znPXqonh7fX2DXQ+U5BjffrLaABUukb7Zo0dC/l2znPmluWuyiToc8MzlA
         Nfuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GcF2ydOy+nfomakh5Blwon1hHz6tHyuDcePaQDWXLgo=;
        fh=59x2B73Dw4DvNQNvG4wV8yV0BbUz/O4SBh5eV3K4j/E=;
        b=D+OwEvumRL8g+jPHxa+BxvliB1mKktdhm/6T/2bv4TKUPp7yoIWtJLyqmNwa09+thh
         +K3LYbMTD6iIMtTTW/KQQNKCU4km6kSsBoxKM0lZWD1Fo2cfOsB4cCyLL9YOeq8dv5wD
         W4AjofMpy0GEmE9Gb8TneIui/DWhL9BlHb2IIflXp34fczzDC1IZWYCzmYA6dztiryS3
         nwtGn1A5DrwDSNcU2QuAyPYjZXKb8JwodBDBKLYN6mVVkXmZYzTJpWT/v9IYEZ9ONcEY
         4PerxDBmnZLDj6wKgnUAwARObELwKn9eGn6a+gds47JEEZZ7KwrrdPuWEizopFIK2V4c
         R39g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769220098; x=1769824898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcF2ydOy+nfomakh5Blwon1hHz6tHyuDcePaQDWXLgo=;
        b=EG0rLPz+LZN8S8D6S6REH6p4GoDCsfaAUR85NwCduukox1DCZ+HEfuuqNbAfCJ+QDe
         CiYBXDaUGCkhddGQY0oRjA8Yym/iOdaly45K4bTE81xE8mj4rPZ8KSsN9IvbteJ+o6mv
         SRSW4SUKEhVPNKImR0azPDgFpprYsjACfbKwuA23XqfZRFcZyXY8d4fkzmcFd7AypE/w
         vfIa8phAFBy8QGBeN/AHASmAGZO50Q9k+c/9EYFCNgx/9P0z4CK7Jd3RbJKTjpuK7oW4
         xCOxlaygZtnPFg0hH+v6f8jU6Av/ONIJ5n5MccnaZOYDLc7JnzuPMl4OKQxlsc4H4PJb
         lnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769220098; x=1769824898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GcF2ydOy+nfomakh5Blwon1hHz6tHyuDcePaQDWXLgo=;
        b=C7Cj1g7S1VnIHmAkbHc7tZN8W3ek+PBF7eCRtOc2YS8M46mFT4VhJpnPRjlfCo13xw
         lt4Wv3Nugws83Zp2vUy40J+Js7VTwoagXgALP653OQJY26xiTY2gUAxj75PwhzmZpqdg
         RRr74F9ZcXUGYEZzM2mDIDVUd+m+/gxm50aLyhDJUToQ+edZvUe4ivp3kgnNjubqLpeg
         Fg2OFMxcT/Uzozixxa5USpp7qQZVTrw83J+eXeHcC66+qBG6Bb85tzDbV9wMF6HDN+V/
         64kWE9shLPhc12rsqH+zrQWhyV/OSLjLnfzB9yUe8ieuAI6D4fdVw2Hwb5y7K0b8Bvqa
         kllg==
X-Forwarded-Encrypted: i=1; AJvYcCXaSB/8DuKi8oVkADS8TP4opBhYgQS9qkPyBLnLILPFRy71Fz1LEs5LQK3gBiZO+DZA/Z5IuyRtOelk7a4mdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztJZwPYDYROSokrysEQ5uPl+sfIeQ292d8r9fSiALWvjHWb9EV
	DzJ4paiTEH0nZR/0U/6ifjaWxcakFNLPFGKmrhezdMl8iHu0K7DH8SvU6bXR+x5i/AVeC2YtUHp
	73mBFbYqn7GinJcQ5iXOWS1f690bMLq4=
X-Gm-Gg: AZuq6aKIFZ9+DKq+eAdCeFD8RCaI3rugYYLbM47OAisfQtqBvaMiGQFVGLmogxN0vm5
	T6AqrJq+ZGp3cHal9+KbquA1PED+oDZ/DuD1ba6616N4HrRODJFFa5ZkreIg4HoQQFgFA6EXJrR
	jZVO79mjUq1O2Z0Czh4u0IEBKaC5Y4au3tn1qh6ykUv4wi66aNg65xVYDouUgp9DelWrxbwv/DC
	WdKtSDhaDWtTVZPlLvJik508+8LkmHJPemw6qYTUTJouNt04g8MPDZfN1iS5sieOb1U5uQH4sM+
	wcn00QGJkyazq8j/B0Ul0n0/qAYMcCpoCi7jWrTItLrAp5aXmwxLU0em
X-Received: by 2002:a05:6214:20ab:b0:890:5973:a567 with SMTP id
 6a1803df08f44-894901b45f3mr66553036d6.12.1769220097575; Fri, 23 Jan 2026
 18:01:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123033233.16906-1-enelsonmoore@gmail.com> <20260123181156.GA84531@bhelgaas>
In-Reply-To: <20260123181156.GA84531@bhelgaas>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Fri, 23 Jan 2026 18:01:26 -0800
X-Gm-Features: AZwV_Qihtc5vhyYPwevTdmoQ3m_JYluy6sboC_AzdDpVbJp4Phlr8m3XaH144WU
Message-ID: <CADkSEUg5EqpKg2_X3LRc1CaQ2RVFNucJbuxDcHQxvjdLq1Qg1A@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ethernet: neterion: s2io: remove unused driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Jon Mason <jdmason@kudzu.us>, Jonathan Corbet <corbet@lwn.net>, 
	Linas Vepstas <linasvepstas@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Danilo Krummrich <dakr@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?Q?Martin_Kepplinger=2DNovakovi=C4=87?= <martink@posteo.de>, 
	Pavel Machek <pavel@ucw.cz>, MD Danish Anwar <danishanwar@ti.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Huacai Chen <chenhuacai@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, Takashi Iwai <tiwai@suse.de>, 
	Eric Biggers <ebiggers@google.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Dong Yibo <dong100@mucse.com>, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 10:11=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
> Not sure there's value in removing the IDs from pci_ids.h.  It may
> lead to unnecessary conflicts later for stable and other backports.

Patches to remove drivers are generally not backported to stable
versions, even if the driver is broken, so I don't think this will be
an issue. There is no point in keeping unused IDs around.
