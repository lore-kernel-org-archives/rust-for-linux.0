Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C65434E46
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619259; cv=pass; b=h7+08p0DnR7nnzm0nGd4dGI+FAwFFw1facFspSqtqpo31GuGJJkYvg8iKy/RPi6zn0qO8fOMv8bmb/qbJ5RCBDUaCrmtyetHH0+oThEBKH2NECD/2MrQj8baJUmLhYyPQwNq96U69X78/5DRfJKsXJ8S94z84n0QmYnBHeuyYfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619259; c=relaxed/simple;
	bh=FTY8/Tzy+d6FtFvB17rx/ZuoDQx8rtI4pzaZIK/pZ94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urI8doYVeg/fIziRNeWYjvAlJURIJH/QVSajn+W9+Ddi7u4mYdA1FroZqTdU9nYIECVB04iVUxjkNPl816+AABq/K98pIweI4XLdGx5PPIBFFlehW7wvvTFjvfaY2uZlAGEMSOIiR3cAZ5AMYx6LIVKKfPUVfnNcGSld5ScI3GU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XFo65CnT; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XFo65CnT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49558ce01afso18733025e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 00:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784619255; cv=none;
        d=google.com; s=arc-20260327;
        b=kIeulnkNHzbevYGwd9b8hGG91mFrgvzLIYioa3MEWrWnM7TO217DGlovA4WujPWgUH
         WfTwFIUJBUAewOZCi+X+S/u1Nbpk7FVIzIWD6aegK1VmqVAHwwqlpxlNogRtbfzKpL43
         ij5OdY3ww1hk+kR6MwW55PLzn69ToZ2WlxvfCvTzgW35bQcXlU3JcDOPfa7MQHuFlInr
         xRXYVGAnOzzfNwk7DdQOtuRgqpZyRUZXmwUp1rM5YIBRFjb6RXuUkTY4DivHhLG6Ck2g
         y9CzWYpIGHZn66j40dnD6kro3MszX8gKo9Ymg/IgmNYXj3GI116Zm/9bkvzd3sAittqm
         7g1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FTY8/Tzy+d6FtFvB17rx/ZuoDQx8rtI4pzaZIK/pZ94=;
        fh=/uuV7csYxXMrXw3CHXkYZzS/N9+iG9RhB6ljrnhxFQU=;
        b=W7hsR/8c1AJYO1HM3x7B+lUSYWmZ5VnATn+ybaWxkoH2SGe5GFUXmmsY7WcrUGaZyv
         GSUsmIvE/QOOK0lWIjnCqQ8HyMyHr1afDE4bxfC4NaadBWpieejbXf1ryQe8ZnvTxgBx
         9G5R6bIsFr1x0umzQaBbN67xhsgDV7bhfldlGSUbTj4+gA6n1qjAqLCw2Gwxv98xFb4G
         936iusOJ6p9OTsytAXPWkwJpSQAExGBl2roBM1NlC8RDpdZ9fG5EaOr8M+xBSObf2Zds
         sFBlutCc5bdZ+4UWuN4rmuzf5njlFswLTQS63TzNKMNKlJjL7OL7L5VwRbHZY0EQck92
         7gsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784619255; x=1785224055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FTY8/Tzy+d6FtFvB17rx/ZuoDQx8rtI4pzaZIK/pZ94=;
        b=XFo65CnTCYDBltfOkEba8mu/PKY9tA0d0lHVyff50P+mXGlYGHYBNpKw52U2nx7hyM
         whIEoBNtF7D1TdmMTZxOl3cIxpsg+tjCqntq7M4hUu6mFprq9iDhk2X9AZSUrhIGl9MA
         59EF/0MUJXUlJ48+6VhTT/Zxbc3I0e/+C3SdBJeUEz9YhPPze9g6XmPj2uxXyubnMHHd
         CLfhEiJ3ZSB55xrKHesx8C+5VembA2mR/KNG2i1ZTfkvWvtCzhNLboYdQiMISoCLj/Fc
         PVwkJqqLKyEfed3Ib0hhsud0S36T3wln81uEehMfIp9yNCW3HMVnJnlp0HNpcftCMKM4
         c2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619255; x=1785224055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTY8/Tzy+d6FtFvB17rx/ZuoDQx8rtI4pzaZIK/pZ94=;
        b=qhhPb8vm1+6HaU9sWBDQKYYZZmSXx8JzsCECBZDk0tH+k0fbL7ZMkMiyb0N/7x1AC5
         AXIoMeI68yej9dwCjIcywl/ZvL2/shlHs+Ues4A5vrgwJpMIo3L2dhVajZTLqvEDYyBD
         UI2mmeYpfMUkke4eL4rkp1ds2j8d5PJb4DcpJRuPtVuzTYEXauj7WhOdPkizrkTBj3Ys
         6yjnmGrKvJgkKAUcRO208aDKVlCHOwxY/hT5MRXNYvqP2Gpx36eYfhJ05md6ZcJ2NcqH
         kBeyRNsKGdOmy4b4/vxI7/UD7ljB1cA41ZbpYcz80eGLN8wmBb9HED+YG8vmHiK0ad/w
         L1sg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5oT+NzWO7+AmneGXcNtaUhvCH0ozU9yNaf1bie7gNvmJ242Ntx59RT7Exr6/CpfKu0kNxjSIN6+TzgfbH+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBxrRHaeR9RwCevYwj/Nzwdaj4SQ5mR+m/zgCtMTe4ZYQJoml/
	Xn9plzp0MwWjv3lOBW8nTe/CDymtgpgTgvWtvwUO9X1iDBjofBCoLk5MR16gA9XHHaOODKk7Y+U
	r3tu2aZO9kfhDb9lIxT3YBKNRDOwXcbaT5LJksk18
X-Gm-Gg: AfdE7cnZOHZ3WzhgNbBBSJzI7Xg0h/rf9uwaWJSrpsyyf3V+HpwD3egMp4nzIHnmrW0
	ZFlypo2oNS9er1KffTrYnFwlG+MH9W5pTDD4UQyhYC9WCjfpEotSyb1bzoEtukBxlckgSx5HR2g
	jj6+3RBpZbdZC629vOVLjpBNYY4SemOFqflJ+4d/46ln37BMyh2ApZ8OTXBDt3CgI92B6g1bdns
	hLyquetvWRqaddyf+eoBE5NyX+N7zeq956ECMWO5wGrVeL242wlbjWKWyg7Zhytpnb8hhxGdmUK
	DN2vpjD7JwSlNNsaapHHWnpy/33G4eP41f7CEVqnatGZ7mo=
X-Received: by 2002:a05:600c:4685:b0:495:3f99:849c with SMTP id
 5b1f17b1804b1-4954a3f48ebmr222294705e9.15.1784619254816; Tue, 21 Jul 2026
 00:34:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617222030.15189-1-iganschel@gmail.com> <20260618121202.6258-1-iganschel@gmail.com>
In-Reply-To: <20260618121202.6258-1-iganschel@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 21 Jul 2026 09:34:01 +0200
X-Gm-Features: AUfX_mwrDY5z48f9YzuAufs9l_CZBAainRJUbgiEWzbuNPbGIadVHsT4H8E6GGY
Message-ID: <CAH5fLggj_=zKfuanDSTJv2LVVCLnAJt7TD0yT8yqEDpakCh5Cg@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: check context manager before creating node
To: Keshav Verma <iganschel@gmail.com>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 2:12=E2=80=AFPM Keshav Verma <iganschel@gmail.com> =
wrote:
>
> Rust Binder currently creates the Binder node before checking whether a
> context manager is already registered. If a context manager already exist=
s,
> set_manager_node() returns -EBUSY after node state has already been creat=
ed.
>
> Add a check before creating the node to match the C Binder ordering for
> the common already registered case. Keep the final checks in set_manager_=
node()
> so races with another caller are still handled after node creation.
>
> Signed-off-by: Keshav Verma <iganschel@gmail.com>

Honestly, I don't think we should make this change. It duplicates
logic to optimize for a case that doesn't exist in practice. I'd
prefer to avoid the code duplication this causes, than I want to
optimize for a codepath nobody ever hits in practice.

Alice
