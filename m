Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64812C21C5
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 15:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758208564; cv=none; b=Uk6r6IMeHgRn714vNNdJuZsJWIXupHPteVZXk1O+aGiuEZywTLZ6KtUjDlUdVmb5MBeLQ3CDBqfh3IdH3PDDKpz+tm/pGWWntnCpxTdhNkoY6THNvZZe/7k2nLIAAKHkaOohW9pwAW21j4j6+A0mj7yBfyuPvC/ZfPbgsM3kw64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758208564; c=relaxed/simple;
	bh=ba1MwCUdfJFXcSWZiNzRoEiVzaEaDWkPBHTa1hTJBYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfzQyGR6BMtqedDyx4GRB9PoxKj6noPMMrs6Kle5Jxcdgxqn2mm2bxiRHDJ8lQIp5FFa2XSyo1frtntXNP4aLVqcOpAouJhZbmyjWmqLo9w+5K36wWHgmzeRGPUIWX/If+BViHA5dNcM72dwOYKW5NzZiRPSkPiwkfBtAaXTP3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LEj4rZ0A; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LEj4rZ0A"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3eb0a50a60aso732369f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 08:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758208561; x=1758813361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ba1MwCUdfJFXcSWZiNzRoEiVzaEaDWkPBHTa1hTJBYo=;
        b=LEj4rZ0AMMHZtyZb7j4NI80UbI8Hm2EJxa6ttVE3ctMkO3eWqr+UnWSfQ4nqP8XhTO
         42D5/rYI0zMcEVxNEbjxIhoq88cAPlFxbq2FFEc4clsh3lnBuF7hCjMxw/OjfOp5MOGG
         sy0gU9Q49I6bAOddDS7wA/sdZkQ6Jj7lkCrOAJUqo989hOP35bt1/tPKP2+92M3aQ34q
         JF8ByXlJxriHb97XqqGZ/hul1kc4yFpET1osP5BfKywGldDAKQqisDEjTtlHOCYhP/4C
         SmyfCmcXOUcmCg2OXNL8aCa+bug7BBreQjv5V8mQnBAup322sp6W+gnqCrK85uL/HXZP
         ce2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758208561; x=1758813361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ba1MwCUdfJFXcSWZiNzRoEiVzaEaDWkPBHTa1hTJBYo=;
        b=JbYoGSjB/PyIr0BH2ywB/jTJQEIY3860/k0UbRk6nXDKKmhN661MasJCXQLZ+dWYsW
         jRcI/2EnJS1zgEvyX+X+LV6q8bmdjjXWkv+e5YJbdEqUxaV1VwN33ib42st7lziSWoEq
         7rIO/hduolwdnprO8sV8EokcJS+N5MWjxV02dnP0cI6Jef2Mlj9I2N31bnWf4m2E5ht2
         sraZgmHFi1fhNxm74mpBwaLXsLVPHFQXi3hL4JDocVr4sd/CfVsET5d6PPeSphF/Z/v1
         mTs9tAKyxUUNuYMs/yJ2sso+2K8XAevRqolJ+PIc1Dfi52qSwaHDPri+ySEeTN8DTZ08
         fr6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsc9JSmNjLPBE65hcfTfkRm8qI0K0+wDEzaY2U6x0GLYFJHhH+oaysqq9m6pTYPQzqp3T+FVZKm9DmkRSVGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtG8q0q6CiBdBuJrbwgtyGtifNe3dpjVg6BSiHo5E+RHMyNmHR
	k7OcTZUxomsTrvrM/EgWYxRT+Uscs/bMEsWHl7R5TbGKGHM2J0Tb64eJ6W0ejP4r4IrYmYVtBRA
	ppcDasPdEWfSuBsG9W4+htTzvQGrWMZijVrhh66WvxusHar+Q1pJ2XA/6v0U=
X-Gm-Gg: ASbGnct/hsVztbca86i2FzSRZsQV6Pm73MtN02X8JLBOPmw1b5ZK/EuuShlb7OJwrg5
	u+nBLFlYiwi8T+2Hi0vbFppS9e8cdOhEtVJdJF2Sf6TYztASTWSpkW0sfpF7sMISYoly83Jarc2
	cUKpYTiC6Kcqf37KZynqF9KuCtiZuAiLGYSW5sVxY94Axa7ZmpgokVdy7vp5RZzFnepjBeb5DPf
	ydRCZ+jyac13Jd69u4huEOm0GlwbMdZMSECauzjuXfwgqRR77XMbceznbB0Qmfs
X-Google-Smtp-Source: AGHT+IFQAhGQVrc0ungSn0zq3CpjAET1I/cC3NgM5eoz7k2nl0+IyeFHuw/NaM/RjH1vzdmZSNxriNGDHHlStXtyh7I=
X-Received: by 2002:a05:6000:2885:b0:3e9:2189:c2c3 with SMTP id
 ffacd0b85a97d-3ecdfa4049amr5630267f8f.33.1758208561113; Thu, 18 Sep 2025
 08:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918144356.28585-1-manerakai@protonmail.com> <20250918144356.28585-3-manerakai@protonmail.com>
In-Reply-To: <20250918144356.28585-3-manerakai@protonmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 18 Sep 2025 17:15:48 +0200
X-Gm-Features: AS18NWDwxi2HM3ygSiKAYEcBCiKuhDKgr7oLvleUFCAaPsKX8Qf_0T36Xy0wwtE
Message-ID: <CAH5fLgiDJbtqYHJFmt-2HNpDVENAvm+Cu82pTuuhUvgScgM0iw@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: miscdevice: Implemented `read` and `write`
To: ManeraKai <manerakai@protonmail.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "arnd@arndb.de" <arnd@arndb.de>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 4:45=E2=80=AFPM ManeraKai <manerakai@protonmail.com=
> wrote:
>
> Added the general declaration in `FileOperations`. And implemented the
> safe wrapping for misc.
>
> Note: Renamed some raw pointer variables to `raw_<name>`. I'm not sure
> this way of naming is good or not. I would like your opinion.
>
> Signed-off-by: ManeraKai <manerakai@protonmail.com>

We already merged read_iter / write_iter functions for miscdevice this cycl=
e.

Alice
