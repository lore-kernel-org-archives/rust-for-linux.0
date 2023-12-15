Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB344B12C
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Dec 2023 23:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uddi5lCX"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5e4f221d7abso4816417b3.1
        for <rust-for-linux@vger.kernel.org>; Fri, 15 Dec 2023 15:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702684780; x=1703289580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJC/Ncm4/slgAA94RagM4gMxCU+4fsKXlcSqRicbCwg=;
        b=Uddi5lCX7vRW/KCNeMgO2elR36IjaqCBaLr2PtbooUKMmBUJgjGRQU9QItF1vY0eYC
         GeybeW3rQSSpHQrll8rV2ce4aebXah6AVm9C7otqeFz/0aT0Z4N965TEJYBB6/3q1PKC
         mbXcZjqoaq7ZPbIpHhmwisfnc3JmuGGA/dz7BGdm/ts8cmwQd8INlfBwA4a/fAd0z4Tt
         7SZcev9WkLMfR5MC9A0OdIOAlvaD5oDoc9CmxLx3z15MExrenIELjc/TgLZaL7T3ipAf
         NaGlvUvAuLLa66jd+Z0pk3EJILp6Eu1ZRYzTsKrzOEznepkFSNDfuSHsOMR1ds96DJXL
         7cIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702684780; x=1703289580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJC/Ncm4/slgAA94RagM4gMxCU+4fsKXlcSqRicbCwg=;
        b=w/klUu4lMY3whOdJUbNw4vKZZ6iGXn6a4g5m06x/EhXKCfw/LYy3gNMC7h0Zk5Ledk
         mNKlC58kvDq3qWmQuOr9o7l3Bm1X1hX8bsW9lv424Y7q04qmteu8kT6lCw7Jry1T0vpf
         eqyOYLo4Tk/7N4TAAUwSu0lAMviATpJb+uD9lIFZfH+i96iFyotyiJAKRzGMxlaoCjz9
         Ngk+D9v3HoN3e93RI1XJjXOy/fQ/VyG++QLXavfCsv0Q+LErmnQCk9oPzGcCQo7gf6Q1
         8x58wuXo//cl1tWXW27z4HPBVd1/r73deZFSzULVuOSc+YkQ7SI6ZExnJcl5ZHQ0wCFa
         Y3fw==
X-Gm-Message-State: AOJu0YyO8gz/fQdp6PSTpeb9AmjFuts2TYorI6e7x5RlIv4QyqlNFOb/
	JwMVp82gPlUFm0WVez1k8V4YVkFMOwOJ6joBoTE=
X-Google-Smtp-Source: AGHT+IFT+4gR/G9TDXH1TDAwh3gcNKTSOxCcTAUThRn7ZeRB6ZLPxpVWQ0+zCgDr3ShfSyMfu90gvaav2aXqmKdNW+Y=
X-Received: by 2002:a81:8405:0:b0:5e4:cbec:dbd0 with SMTP id
 u5-20020a818405000000b005e4cbecdbd0mr1160539ywf.81.1702684780346; Fri, 15 Dec
 2023 15:59:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231026.110919.517001374342898485.fujita.tomonori@gmail.com>
 <CANiq72=dAYc=EQnJOuBvV5cKLo85O=A1AP03F9B6nJdDwdAT1w@mail.gmail.com> <20231026154525.6d14b495@eugeo>
In-Reply-To: <20231026154525.6d14b495@eugeo>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 16 Dec 2023 00:59:29 +0100
Message-ID: <CANiq72mt8Xg4TwcgUHgxJ520aP7rS4urG+CPUGh=sV0jF8qViA@mail.gmail.com>
Subject: Re: [PATCH] rust: fix relative links to kernel header files
To: Gary Guo <gary@garyguo.net>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 4:45=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Would it be possible to use source-relative paths and then have them
> fixed-up later when generating the docs? It's quite ugly and not very
> maintainable to count the number of dotdots.

Yeah, I agree. One possibility would be:
https://lore.kernel.org/rust-for-linux/20231215235428.243211-1-ojeda@kernel=
.org/

Cheers,
Miguel
