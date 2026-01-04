Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC3B275AF5
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 21:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767561102; cv=none; b=sO0BTWnqlSaCFYu8cgfAClZMmtnyOGM9BgwXKMrrKXGX3J7bCKEYJ5A0cHFI60b+8Eu4bnnhGiSn8j1D9awMjn5Td1bSmYHCq0GXDqUOsoLdYvB7TW+txY9JAf8zX5+9h+McTlDyKrg8/YhsMEl+owNNqZLZUTd/QLTgXgM08sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767561102; c=relaxed/simple;
	bh=UAZZ7ISEae8NHARwaBamg7vRloSMyUJihQQZZsw2bUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzihVnlQ3O4Dn2jv/8sv52mXyKBctOiZcBe6PytTsQ9PGiYwE+Foxv5pOZThLZ6SFBPDqxrIWRVfJyhoySKaiE/jVIVhEZR/FHy4azJX5cNxKFKh+3XVDUBWo0FQcct9lGoRP973XQV5IBBN2BYOTGpBHsep3BcKoRI2ByLBDe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evrqXFVg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evrqXFVg"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29f2d829667so27173355ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 13:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767561100; x=1768165900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOfVQDZfMnACW2GnK+1zhP0jUkKvyuDruQMJNqL0tiI=;
        b=evrqXFVgUBpL2ZSL6jhmVtnDJhC1/LUVfCT0d/sMYuhJJx4Clot1Ij45Q4d1VRV6Ul
         Baa3hns7hNjbBECyJ78uPu0117j3Q5NUzhEnnCCXifMxbaBe/Ue/BC9BOOP7S+NNPWue
         Yj1ln8khso7IObe0e/V+bWoAWLYDTtt7rxuOVElA4/RLJJWZ3/XdCr/UtsdQlEh2Iwa6
         rRETDTwlcpBT50XwQum9P/QbbdxrJXm8wIarQKmGIV+6ejPDfeeBEQNApUyt//dRjeCd
         sYN6bfqdd6FyPVejHEQA3Py3vLb7xnYkvj3hYxhpmiIsZlPRSgJU4LzsmA5eV1TZigFL
         lpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767561100; x=1768165900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zOfVQDZfMnACW2GnK+1zhP0jUkKvyuDruQMJNqL0tiI=;
        b=ArNwAx24dGbHuYizqPFqjJv4nzgEqAWGHFiWXxUzsONXu1Sk/EgRLiO0ij378fkDqr
         wW6PwkSFaLDIp+mY6ofF5hZUBbSqFyoini2HVMNqSmXyKqag/uZrYYfvtrJdmqbxc5lB
         YyE6EGOnYb6wa/eGZ2jkwNRiW+4ChmJgzfKfmT4Jiir348DYHVt3oK+EXh9/FVXEHyF5
         niZx2pQmucwTO1RokRGKN5ASS7Jz9Hrld84V0jlhdaFNHIGJzq75HtznJU97DHHwbkdP
         BFUWLse/ezMyInX1dR5Hs9JqC6gZ1a7mZ5hgH8KI69j6DwBEmZBlya5G/PuXe+KjqtY9
         NxTg==
X-Forwarded-Encrypted: i=1; AJvYcCV8gUGynC/+O5zIycOEaj6vzCq4sdfOh5uOTEzO6q3aWEPuRrPpBDBMJFQ5USDzR+sHEo86IKi0woi0pWKYPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGjON6Q2Qivuj4ujGO0koR/5x+0bgqGVA/ZxA+h41EQ0jIEWyr
	eGHh/2xumGMA+A4zZPpkjcXrTCn5A97Jgfc8Z85gbtnc3H9LAm9V52IQhtZE4Ebqm5IIxSX+igz
	rNiDDlgbI4Dwqym77GzZH5Al6C2vc74k=
X-Gm-Gg: AY/fxX5YsbU6geKRZYO2zNtnxk9e9NZ/d6dFrMxUHsZxNz4ieX1yxO5fhaac23vKeDU
	z7AS/SxOrwpxJGyjifDj9I9yQ3OKncr8yU7N0keK2394hUpLvz0YkgDDDe4TmbzbVZpE5SPC/zJ
	28/qHAf8hFod/dPk/GyqDo+51QzdvMCys20MttgMs7o+ixOfQILhnFyvSOLX9GQ7D9ifJDReyLt
	C8cGikdw8COOZlfuJ+CgFBL/seQ3YD6PtDNxRrtcilQP6QebkP/L6QUzFq8k9+04OxBEJiTX+RS
	B6SDthoI8B7o9Z4+8xUlbUfOKUCeDExV3CHWBoFdacjaTnxLqtnN59CYNh88T3M+Cym95JH5Wmu
	Q2iu/gokLfoQS
X-Google-Smtp-Source: AGHT+IFcfL4MO75LHGMyWzFdR5U3IRoc3Ao4EgFMYnjikDF/8cJ9w0YTzUh/mq6pKQ2ZT4sjKJm++yjN23gR9Gf9CSM=
X-Received: by 2002:a05:7301:4090:b0:2ab:ca55:89cb with SMTP id
 5a478bee46e88-2b05ec45daemr22786518eec.6.1767561099925; Sun, 04 Jan 2026
 13:11:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204033849.23480-1-yu.whisper.personal@gmail.com>
In-Reply-To: <20251204033849.23480-1-yu.whisper.personal@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 22:11:27 +0100
X-Gm-Features: AQt7F2oRV45qT1v28AlcmwfrE5FpY0LkUFo6QafXOJWISd77TqtczujG8czAu6A
Message-ID: <CANiq72mUCUh72BWP4eD1PTDpwdb1ML+Xgfom-Ys6thJooqQPwQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: num: bounded: mark __new as unsafe
To: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 4:39=E2=80=AFAM Hsiu Che Yu
<yu.whisper.personal@gmail.com> wrote:
>
>      /// The caller remains responsible for checking, either statically o=
r dynamically, that `value`
>      /// can be represented as a `T` using at most `N` bits.

I will apply this one, but I think this paragraph is not needed, i.e.
we can remove it, since now we added it as an actual precondition.

Also, it would be good to add back an `// INVARIANT:` comment, but
just once, inside `__new()`, when we construct `Self(value)`.

What do you think, Alexandre? All those can be done later.

Thanks!

Cheers,
Miguel
