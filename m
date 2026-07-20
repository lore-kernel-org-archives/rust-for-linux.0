Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1278C3D45CB
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jul 2026 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784540059; cv=pass; b=WGowuHTgiVo9UFlUAyhQinIpsEU0E5jX+dEdXa6e9wOJI77cWy55P2+7UQVrGZVJzHYEjbrLbEK9kVMuYDtvHQn8qjo0AW7ReWcxw8rYSPkXnzhLPIzgdhFuZsg0mS82/Dtx8UP1cmT2xLGFwrpatVzYrxd9fvOaYfm7zeCHlu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784540059; c=relaxed/simple;
	bh=dr4qfbMyt4AJdVNDfCa8YmQASSYkMRPSi00fA/CGMT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXw4Zknj9q2J2DlItxk3fA6u2tAMvEY61NzotXdv3of3lz0j1L/n6TeSXmadgs3HEui6YaHTY1+jLCSVTx8HWVhYn2PEA/yIOkMiBXZOrw0C7fZl9AKlb2/CcrTwsqQzh2kxhId3LzMwOitwS6pjn5obtWqudRwLtV1lmzi7lMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaHLmBE1; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaHLmBE1"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9d1fc053e0so5698106a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Jul 2026 02:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784540057; cv=none;
        d=google.com; s=arc-20260327;
        b=FUaXH6RNfvoTv15ChxMg1vUD614l9x1XVakJY9GBwT2SABYdJUPfRslZeqyYlB3tPI
         cVyDkLbGVdnDHXUU9BMGxWRDABKMxNYXdgen56i0SJPTH+Kz7N0OhFr0i8gUjeVlDWf4
         xZXkzvoe1+AdiCa0mYdrAYnh5K1oobJt0f8PIn6zrZRRYJekspELyFBsdqxf1gRzcr7Q
         Rrj6Er8tp8O3pdbQSGgDItGmaXnRRpaln6KOeu+kv555d6KynSHQbQF5ywwMdWF2DiSu
         SCcjoeXu28GMFN18Nuh836FCQXDAs+HOrg4lOAvoTjiyzozbYa/EVKtx/sEhUjBpVdiN
         MfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gyj+RcwfmEnCfNK9f3rzkn3WhFS0bFFhxR7tuPYWpwI=;
        fh=AlX29FYg4zJqXAQJ0mEC96SkYrQtQ8uU1BckEfG6sWk=;
        b=MovZujuJdOjC+nh5FU1JAuUCF16N2WmA8RYUCC7itEQ34H289zpiKcBNcf7MSGybut
         0yX7DqQdOwJDnGJszz66h2501FlTQf+5QuF89vAOgbULpFAAM3QmnJiNUpu5YU2luEtf
         K47gVTKnk/L0Ray43/XiUJZiEOP721MdyCvvbM23/3KWfPZSRxMixg8wbRrJCIh95V/V
         XWwPf3JHshwQQdjrIzN6NOrjVwhdU+/X6llZ/PKXOD/RTRgq0mpd8Y4YN2iBAAXodGf/
         g1GenPduhla18LAtkrsD/kuqO+4kJ/XUyzH1S9xTGlPWjMF5IlTBwMPVm9MFkTPmwSMF
         WCkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784540057; x=1785144857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gyj+RcwfmEnCfNK9f3rzkn3WhFS0bFFhxR7tuPYWpwI=;
        b=TaHLmBE1tQUGRVp7oAlncSVpYLRj5f9RtIaONQ0bR3fvOB/aorHmUTP5/0MHQIo01j
         J/DflGbL1KlfJ44opWUdt7LEk2Y18AwR84OYekpF19QmeZMPUXBhdQ7yvtPJHXvwc67+
         3tW4HAoHsICQn83MXlbIb5b+x1VLbhHq44n8RC8ZukSnslPKq9jz220dRJ9zx+n6iM3o
         Rn5dVxBRktH6kfmgpMV4WJOhXOzvsQ/jmIDHAkjdtqoj/CAsXazsHBxVIVGUHmCoSKCT
         F+G1Q1VckQMbSV7IYZYh75lX8r8e20En6/ufEjmv4pUaVFSks0xQFpbkbiFkrvS/EaCQ
         kRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784540057; x=1785144857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gyj+RcwfmEnCfNK9f3rzkn3WhFS0bFFhxR7tuPYWpwI=;
        b=kCBjj93hGdusg56wytYyA6qE5vDwqWfy2hj7JzztduOl6mBSYhcY75jmRFv05+Vj4+
         0CApDPL7acVxOpFPdB9c1tnxDJc+7ph77hGXfqnBJX2913Lh1qPaNrMNybJUMIMH8eEk
         /Fx/iZAwBt5rPXNQ6bCfF0xA1mrtwz2U2UwMDd0grTD0qUeFRuTA4uaeYT0jEqusZF7L
         qKA5RyD/3voqBqcUy9JUYDTrPj+0XxY+Ta00X1ZyclWejQnx0C9yuQaFiZc4C03amaQY
         7bXtgZxguIrAm993/TYgoklbUKWalWaw1FE8bOJMjDMJDg+abCnQlkm5DWOjRaR8cZGg
         eORg==
X-Forwarded-Encrypted: i=1; AHgh+RqaRDAbgYtvoMJ2X8IXIcIhOVdMhuqdzInTtSBqKYST6GyVA2jfnAXH1ej4fP3xPtDa61X4/qa2TS1sD5oy1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJ/nHrMEM/XJ8X2dWbmvpbR84SlTu+0dC3saOUDs7PDfEvz0k
	aqhVtEmhRE/KeoZZYB48KTJgYoJ3rJfQ27+YWh1tOmUVNpg8WF+YsUFr90tQmqN3cffeyolhLJH
	Xq84HGdwWMFW0ZtXTYKXyygMA7mL6GWQ=
X-Gm-Gg: AfdE7cmG2aadwVxa0YXz7nZ3pZnkVAH5X+oM76/YJpmfH6EkQpc+dBk98aNG4qZtjLr
	vaXRdSbz00QD/jgWxAeo0diBz1PpZ5tPFTYDaMXC+eF09P1Z2tk2s2ab0SzfhYrmxgK3AN3Gjom
	Co+MxJshiaeZV9xDTXOrlM0qzfupmFepTBa8qM7WKMrERzUUjN7LphA29Tw0I1hTcA9N7I6w3Xs
	lVnUKkb6+B406AaII0V20TpSr9R5aH1Q12BbtAS2YYUHFaW6xQMQPE+3q3QRM2DyG6hXWNutRtj
	aORi1yOZ+li+waCUVF5S+oRe+wrVMCVOixv2iA+c/Ysxpujj
X-Received: by 2002:a05:6a21:512:b0:3bf:bcef:fedd with SMTP id
 adf61e73a8af0-3c3ad8e858bmr13905307637.39.1784540057150; Mon, 20 Jul 2026
 02:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABwQupNfMAJOGqRM9ke6tj4f53dCCsBDKU7Vp+zf8mwk7bqt8Q@mail.gmail.com>
 <CANiq72krLhYi_vQJjKcEhiQP9CHwc-+d=iMZocW19+MqfW3qwA@mail.gmail.com> <CANiq72mj+A4PujCsMCWErASkQbG-ieiXqUpQfozBwhaVgWmV8g@mail.gmail.com>
In-Reply-To: <CANiq72mj+A4PujCsMCWErASkQbG-ieiXqUpQfozBwhaVgWmV8g@mail.gmail.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 20 Jul 2026 11:34:05 +0200
X-Gm-Features: AUfX_my5Bkd0rfEa0n6i1CEvX-iixPX2d89e-VePCT4hPkUQgeGnCKVZRscfwAo
Message-ID: <CABwQupNjJCX3DqTjyG3o6wK0NktgrgwSPCWe3YLBx4BsZ+FwLA@mail.gmail.com>
Subject: Re: LLVM 22 needs bindgen 0.72.1
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <alice@ryhl.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Miguel!

On Sun, Jul 19, 2026 at 2:18=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> > Updating the toolchains would be nice.
>
> Wait, we don't ship `bindgen` yet in those, no?
>
> i.e. we discussed doing so some time ago, if I recall correctly, but
> it is not the case yet.
>
> Or do you mean something else?
>
> I guess you used the instructions which pick the minimum `bindgen`.

Yes, exactly. I followed the instructions at the bottom of
https://mirrors.edge.kernel.org/pub/tools/llvm/rust/ , specifically:

cargo install --locked --root $llvm_prefix --version
$(scripts/min-tool-version.sh bindgen) bindgen-cli

> Maybe we could add a note there, or simply remove `--version` to
> suggest the latest (which could also be good so that more people test
> the latest).

I also think --latest would be a good default choice.

> > I think we can easily add a
> > check on `rust_is_available.sh` like e.g. the one I had before commit:
> >
> >   ae64324ad5c1 ("rust: rust_is_available: remove warning for `bindgen`
> > < 0.69.5 && libclang >=3D 19.1")
> >
> > I will do that.
>
> Done:
>
>   https://lore.kernel.org/rust-for-linux/20260719120514.159914-1-ojeda@ke=
rnel.org/
>

Thanks for taking care of this!

Cheers,
-- Burak
