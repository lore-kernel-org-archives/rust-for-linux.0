Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E922F4A;
	Sun, 22 Dec 2024 13:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734875639; cv=none; b=SI3xim4ADky/dN0gEUoWQn/I4CsPtSuDq/Idk5BWo2clpCaNj6aSuUxxzZ6qCkG+62WcwcsVGf18DD299uu7ugCLD6xdCsxDYg7qip1ArL6xY8mUZWNfaYz/vG7634T+dYD1aCkF1WZwkCGrtrMFjowVT+6FaX7tXEyAdRCSgkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734875639; c=relaxed/simple;
	bh=QjOGT70KRUr3bayw7q8RdHq8qOfK3RUayMWJCmB1UGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTYt74ctltPCMCu0m15u6BCOtNb4C/TsOaWp8+u1U7XQYalFYAxdomYtANltgCB//YWu2IxoF9wtyUMn2gXAvRmyvtk8FmyJCwx7FzGZcvtaZA5/y841gLHN/RNQUKqDoDlxTWsgVwQv+WHTDHMJpNCjAdk/nt7latwg72ps4rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gp0imP3b; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gp0imP3b"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ef6edddf70so501525a91.2;
        Sun, 22 Dec 2024 05:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734875637; x=1735480437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjOGT70KRUr3bayw7q8RdHq8qOfK3RUayMWJCmB1UGk=;
        b=Gp0imP3bTZQVVy2ElCMk3Mr+SX4IJu3AjqOXJU2qTmZcrcpcAKW3EVG9wnYblJERsq
         GXuD/0dutFe4PpVqDH3p8N0RvzvaMXtjHEA0k96Pp5tuX3h6UFxEeBMNW7Bby12uln4C
         +0mRF65f6DE1W2d3Pa9r15UlOAl4ytRLM/PHjKnymbz8HMdmsR5p7WEuETuujjjCxaGI
         o3fkAVa6L3plyVVWA2eBzAs3aFr7+UP1G99kGEpbLXSobCNcHkJJ53ssK8U6eXuRYURi
         9FRXdBe+CrKBn6CuFPNvAZXDvZeMDHwszBT2cDXhSOzKPnGPC6+isUbnNLQ2umXgRtSR
         pQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734875637; x=1735480437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjOGT70KRUr3bayw7q8RdHq8qOfK3RUayMWJCmB1UGk=;
        b=iPONXEXnhXnWMGP25LAMPc2GF+0EbUxM6HRgfHllsdJltPlu6exEGoWNUPBL3WnsyJ
         C7h6f5vJIriUWgc/xAc3UNtXAKH7yPCM2lX4QTFapnp26jVry8nsXab1rLB1dn7BtCzp
         kxK94GiU8NE670gB7ntkjGZkCdBzVpSlsL+/M6TyidcGSBq30FtCTQZIrsUnAgyeOAum
         BwX6peYvLrjl3ZT5bAJfoAkTDkBVuz7IHW/woXWBi74ma18YcVdPM5RgOuaf19u4R18W
         vpLaQN6qSGinEO+dSbIaYqXRAZYux4985vsKYDNI5UgiEmQwpIky4dVg1WGp8YzzUrbY
         f0Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXfAlSBFSAuqknmoUZb2EZKmaR1YJ46Xrd/SN8+8EoZSUB7jLl/cK/HR77mMYzzmxM6hT4U7KX6zwoiDAs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd46Ew7JEryPr+eDHV7T2fbpAE3zOsoZmTsKFPD4kaFxHUdfvJ
	1ub1dP4zm4XGP4SvR9jV92s1WhpSx0utdK6XZ9S/NX58/lnVzys6zZu5BXr1LRxp3suiPcpZA+Y
	LuE9pPXPQxwKlTTH3KvCKgSy0MUAZIw==
X-Gm-Gg: ASbGncvaU+v9TaTK0bwkXaTUCGPH6O0wk7DYNOtR7K1U43oRMifoJ+IelaW+LPtcw64
	hqOdqn4O+ADgcivebx/cNUltTpNIGDkzYyGmAqA==
X-Google-Smtp-Source: AGHT+IFjtARAhQnj/Omns0tWrdATv/KP4GzbsY6d66USuxf0tULAgvOlPPmIoXXp5O2+cOhBADdFiDHruJLXTaSBY/E=
X-Received: by 2002:a17:90b:3bcb:b0:2ee:6db1:21dc with SMTP id
 98e67ed59e1d1-2f452de8c1bmr5749894a91.1.1734875637268; Sun, 22 Dec 2024
 05:53:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241222094658.31263-1-simeddon@gmail.com>
In-Reply-To: <20241222094658.31263-1-simeddon@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Dec 2024 14:53:45 +0100
Message-ID: <CANiq72m_GR0+k3ZybLFUg8hx1bJRQRaNqHsPJid9mmiFHbYpnQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] scripts/checkpatch.pl: check for non-permalinks
 to Zulip
To: Siddharth Menon <simeddon@gmail.com>
Cc: rust-for-linux@vger.kernel.org, apw@canonical.com, joe@perches.com, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 22, 2024 at 10:48=E2=80=AFAM Siddharth Menon <simeddon@gmail.co=
m> wrote:
>
> Zulip links to https://rust-for-linux.zulipchat.com can break in
> case of renaming the topic or channel if they are not message
> links (which are permanent links).

This is a resend of v2, but there was a v3 previously -- I would
suggest clarifying which one is meant to be picked, so that this is
easier to pick for maintainers.

Thanks!

Cheers,
Miguel
