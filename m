Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6679B1F4700
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Oct 2024 21:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730322889; cv=none; b=rNTDmccWqyZ+ns+xQSCv7/TGSfLjR1sDqhDh2mssD8wkMY8O8YQOZ8WLO7HgQ2F2NU3bBo7AJ9dlwdajy28McPtfrsjfEScv6q1Gb7zZG6S6wBC4b7CBgt1i7rLJtKT0n+EnVwKXsyXvlMTWZTLsFBQw7v9NGS/x5boyhySHvWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730322889; c=relaxed/simple;
	bh=o534AfqHtN7RldxfitzK66PsnDX4NhPFj12yRB4Rmbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkQSAHJ731HBkuDtYvauYfUzou/nDZRyNQBX6p8iyaPLABUCGD6uiYrW4wc3YmK5HgSM02NEevdEVeWZ+ILfnpmx8SiHB7gIuzH23oKzhxrKMP2OsDWss2vIdYEWcp/pj+ZGapu/FGntcQvMLYB0/6XErwL+T+VsPQvSIXi5Yog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ry2af5WU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ry2af5WU"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315ee633dcso33265e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Oct 2024 14:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730322886; x=1730927686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o534AfqHtN7RldxfitzK66PsnDX4NhPFj12yRB4Rmbs=;
        b=Ry2af5WUv/skSRNxT+7siplCwQWDhKtQfIsMjY9CKz4eMhiDaZX1feC5lYAe1PYbNz
         KNoCsxFUr1uBOAwYpDz8pWMPcz/SQtxG339IHGWDwqYztGZqfo22sfw5XoOMvVZJsl+f
         +twacZr2LJZsSmJBtLqUo4nwKOY8IxT/enb/U243vHrgZuhK6ZdUTMg9FPxNHD8lWP+K
         riMozXWSdTIv1OQR3UtxZU/nF3JvE8oOoKSnTlNpAMZEYs87ED4gijbier9TavT5e2pP
         XCwBYmqUx8tfgOtIIX/fLhhgI2Jfk1fqWyDYH2f32yzgDByNWx9UEjFSvRQbKWTsKg8E
         aABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730322886; x=1730927686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o534AfqHtN7RldxfitzK66PsnDX4NhPFj12yRB4Rmbs=;
        b=NRsNDD2yNd0U41pa6HHehJxV7CPW3WzV4RCeIalLS5YyWGnUt1cBTQZppxTPh2msYa
         iBFs5QwNM3dDKMImIrA83qCxUvuYp1aETJjsRCnnbZ0Uay96g5MRAmGQd/Wqq41sUkWQ
         9KCpPC/BILC8xWlXMcCYCUpYHg0bSJMxSZ67KZf7o9awVHF0qy3tR6MGsj7zK//Da5Ci
         ZdP2z2CGp5W9FgvgyizEBTZTFJd4PBwIqmrR5c+JGykjkXBmg0HNS1OkrkrzfXhkbJTj
         GrnvJ0bZyA/99gCyEpklLKHfhFZkWV3G4+6nwfPru/8Mf+gmXlzhhx48qVKxMguXKKCf
         PRqg==
X-Forwarded-Encrypted: i=1; AJvYcCUrpKnrevEaI/KvjSi0H6W3m2wv/pgeuCpji0k2uOQFoMsYvIbRCU5+dMWhs4SI0pt4qUfp30C29OrhODF2uA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuZeqr0RFfOt35Qfnunnq0fazPVApuovrxFA8c4X9dnjV7W+Eo
	5zZKkK6W0n5MkP+v3T/jdM6F8p4ije5PeVk98Q/mnZ0uwXCsTqATYUGgLnWKPC411qsMW1Wzi1u
	MwKdPBKatU96WLD8qWsjterj1DaxnScE2Up/txWyar8sdvtOWak4v14M=
X-Gm-Gg: ASbGncsWovlOaDMz81AzXljr+g2lL0lqLvMpksZWsok4Y82fHqOjuqS4uqhooEL1V1s
	PxaUYBOP4rLPMgQzSjnayv/6qZnTyzj6hLVO+mQglpHQxwpmX1EgEuOsrCfjDnQ==
X-Google-Smtp-Source: AGHT+IGpbeaz+5KppTzbcYqEE1yAqTgZJWcDUhQHhbTL7VnBBuh5AYIfWrbwLxtiZ4nkFcdHa3790grpJGu5v7MdZew=
X-Received: by 2002:a05:600c:c8c:b0:42c:b0b0:513a with SMTP id
 5b1f17b1804b1-4327bdca213mr1401735e9.2.1730322885602; Wed, 30 Oct 2024
 14:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com> <CA+icZUWTdgM7HQrnR_NzgZZQE3aXXk+tAqD3srNd1Eyjr5d7EA@mail.gmail.com>
In-Reply-To: <CA+icZUWTdgM7HQrnR_NzgZZQE3aXXk+tAqD3srNd1Eyjr5d7EA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 30 Oct 2024 14:14:07 -0700
Message-ID: <CABCJKuepGSFcQa0F5iO4aa4V2UbhuKO+tyfhB3_ODaTGs3sM5Q@mail.gmail.com>
Subject: Re: [PATCH v5 00/19] Implement DWARF modversions
To: sedat.dilek@gmail.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sedat,

On Wed, Oct 30, 2024 at 2:00=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> Hi Sami,
>
> perfect timing: Nathan uploaded SLIM LLVM toolchain v19.1.3
>
> KBUILD_GENDWARFKSYMS_STABLE is to be set manually?
> What value is recommended?

The usage is similar to KBUILD_SYMTYPES, you can just set
KBUILD_GENDWARFKSYMS_STABLE=3D1 to use --stable when calculating
versions. However, it's not normally necessary to set this flag at all
when building your own kernel, it's mostly for distributions.

Sami
