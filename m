Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54283F9D8
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 17:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706549205; cv=none; b=o6g4hUSH59zvMwPERmxHuTZp2qnJbOtPDVl1TN+N9ssY+av3HfXdLy1UvaHWnl+PhEaSRtetcEhB27Yr2+HYFTW0JvlR/GGxc+/YJhYpD2tnQZjzIY/kgvwbeFZ3kvVKWZQ1SemSYboDaxjcrULKbygrcv5058QimxSWFRmvjQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706549205; c=relaxed/simple;
	bh=3ZNwL4tCSvsPfQx8A1eO3VZzjwMmosOf3Od9NXM8fqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y848GJmj2OQprtRtnpCUyT92Pp4KFg4VhIzQb4WCEEMBJgHvAqVE/SRUymUkzyXxw23ylXvGZAyeFv4Lt3hINXUHM/G8xd9aaMxfuRa2/ugaQN8VkQiyev08+71TW+Xf7XMqgtYSG5GRiLPVKbfPafSrd5bUItAHHr1eciFcWCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJ5BV7tT; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJ5BV7tT"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-602cf7dfeb1so28087697b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 09:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706549202; x=1707154002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZNwL4tCSvsPfQx8A1eO3VZzjwMmosOf3Od9NXM8fqQ=;
        b=KJ5BV7tTvUVw3e0CWILjDqfJI+znzAEz14qA5mUpn/LctAPKpbwIO1T37FFkYF+XpZ
         xUauzTHBixBHUg3kgUZVgUsQxwHgS/qWEgKc8nvqbDcFNMcmQWShq7JuihNPhfYDTIeP
         npMuE4s1NOIGQV+LTRyN67jedKkdpcw090wjXOpCva8FzTyw4kJqLqvNxdOZOSEpoX+R
         fPjCUvxyE+owgm2SDOl5svm/NAT9diF1fGod8rFEwmWTHejeUdb8Ea6Hk0eIsXbq6L1m
         DcH9cTH15uroT/wrk2IAgHksxC3g/nCVklWYZYGuOmhBOnwC5seHk3GreL5Kca7JzaJA
         AlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706549202; x=1707154002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZNwL4tCSvsPfQx8A1eO3VZzjwMmosOf3Od9NXM8fqQ=;
        b=bIt1gN1WhY7mdHmw3VxiKW3Le3V6GesXWhP/oQxtXz5PrRShTO8GlKySIg8uQlYuzk
         hfM4ZuZViBd3dxVjdUtlKUguLps1p/P+RaSRH1L7OHXwsqUD5EiS+mfZGAH9XDzPYPgg
         z7HX2paLsSkTWn50Bbj++5Dxngrk8UCFTs4FAkQeMYPoAVgJLdSmZuWYEhynIvlZaTtN
         a1+ZISeCsmS/230bLgsGgSYJfOjvT7pIelIt+CMcI9WtHSU0PnlXHT8GBhFhJkOr5xVg
         JY3RK2BtPU7ZFM/l54i9XWZbFB324FPxx6C1E8uxV/F2kyNMS3WNOL4saZj4eqxTmbk6
         YdCA==
X-Gm-Message-State: AOJu0YyN+pJUV3jjHy2NWik4VPjjOLQ6gRgXr453TDC4JsPMhyvKsPdI
	8ebnPFLIiE0mpsFxkAM80PgGH19s/GaPB/nBgRAFrDCibqPz3F0vB+BncmN3kpGFXwhN0bQ3VQ1
	Of+7rh4ryzPnTmYAW4Azlq01UsRM=
X-Google-Smtp-Source: AGHT+IGqRvKEO4tLfovHnfvfigvIq+eoqzlL9x3M7CLkLFMMugM9UQUhLW8+ZgMAH5P+xe6HmVow/R4/k0rY5DHMVNk=
X-Received: by 2002:a0d:e2d7:0:b0:5ff:910c:4448 with SMTP id
 l206-20020a0de2d7000000b005ff910c4448mr4474102ywe.51.1706549202566; Mon, 29
 Jan 2024 09:26:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZbSDkm65LML4OWKX@ohnotp> <20240129121859.1099000-1-aliceryhl@google.com>
In-Reply-To: <20240129121859.1099000-1-aliceryhl@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jan 2024 18:26:31 +0100
Message-ID: <CANiq72mTN=v5Qf7UCjaT_oNWra9sPbGYyr7+7xeUv4xdTouKBw@mail.gmail.com>
Subject: Re: [PATCH V2] rust: str: implement `Display` and `Debug` for `BStr`
To: Alice Ryhl <aliceryhl@google.com>
Cc: yutaro.ono.418@gmail.com, a.hindborg@samsung.com, alex.gaynor@gmail.com, 
	armavica@ulminfo.fr, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 1:19=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> What about newlines and tabs? Those are printable.
>
> If you are intentionally excluding them, please add a comment saying that=
.

+1 and, either way, it would also nice a test for those too.

> This escapes quotes, but what about backslashes?

Ditto.

Cheers,
Miguel
