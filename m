Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96711F9F6B;
	Mon, 13 Jan 2025 23:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736812377; cv=none; b=qFHOB++ixhmY3PHIOsWzvBygjXlFDHitaa13fFHhDUxEHDh3dV3Llskd4YEPt/4uSTfpGMJVA8eng1IdjTlzeYvgl1D6Dqa2VM8sI8Yne0zNR/RzXg2Lbw4yFuHJJM4efsH14ZsnfSpInwZDZKCgdR4n8b5l0BlvoTDNx6lwfcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736812377; c=relaxed/simple;
	bh=MUfRY74hb0Owj+yHcQF7vzMMco+asybLaSMHTudJ860=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kbrc1qidTmF4Cr5p6DtYG4xn0ChgqUJ+TMpyneRNU7HXZwKESSYRgXeJcM884Blgv3hzMgn873WioaXUs32Hv1qpHY4hzHgCQb0Tr6j2st5PvgG0Vsel0a9ZMcZXUtguQ1HH23HJcZhA+pvs7dLKxvhuogjZCkDhHZ+swnNL5MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANd3yaVY; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANd3yaVY"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f45526dea0so1125686a91.1;
        Mon, 13 Jan 2025 15:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736812375; x=1737417175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUfRY74hb0Owj+yHcQF7vzMMco+asybLaSMHTudJ860=;
        b=ANd3yaVYHwc9SmAWefUoVmd0IXL7zs5c0vfZfk76LOCaMrA55Yw/d+sakj8/1Lqbqo
         My70Me6hOt8rPDbqDb9Z+ZgfEcph8sDTtlYqHnpmPC9MB9n/RO0Vy2fL7s4oJeSzeSuP
         sZiwjWP11dkZJ/FyRjZBA6ZsSmdlCAONy6BecmVXpR+4kVjfRlXsBvhTp4U/+qckukeK
         ORz39fGPuFL45SZDCdKPpKpPXY0hPvZS47M4ZNRNdZ+mBMyfpGtxCmwNkwvQ3QEEdKBf
         gCeWslQfFqob7o28wT2wekGCMLbyvlGeCEcrB0sbYFeVKukhw11wb0jJFN42aHQZ9d2l
         2HYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736812375; x=1737417175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUfRY74hb0Owj+yHcQF7vzMMco+asybLaSMHTudJ860=;
        b=BpnvVtE0Xb6du8BokmguIO5zd45VCcwg8kjNnE/nZ+5BpOQr+W5wjNdvQhJfhOQeAJ
         YVj0xHMow1Fo5Y1NmqeE3YzvrlpQbhIK7aKliNeOcdSh2aP40+8aVlQW2g0mil7Dm2Z0
         9BUm6tjniKv5L2qfF2+NCJHCLiV7dYzvBAx6dPOQ0CWU046GHzd4bt56bmXF6+pwBW7c
         Rsp7ZXUPUXr027/FEoWGoPNXmnVT2ObY6DjyuP2uioVoLsyAt/qx39LbVcs7nppet2Kw
         EUvftneY0DLhEclNxr5c3/qvbynK4Ox07XLcvBS6M0Mf+fX9iJSlqaiPy4TweKbBAy87
         ffzw==
X-Forwarded-Encrypted: i=1; AJvYcCWDl0d5rQNpt7viC2DFl0ugGeZ1Upc9OGxj4dpu3ZDAyOQ68kl5g6GehZEDMsuc6764YoaEDg4o1BeGr4LwFOg=@vger.kernel.org, AJvYcCXeLHS+CDFe82H4nf64et3m02DZ9d2rq/W5Bh6UGteHKPLRLkLkK4yMhTxihokPrRKbfEe/7lChtezGl40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa7PLpCNXk6K2MUDC1q5bWG2K/3xLppM/kHeVtSDXzkQb7bfzV
	75cbLTNKCQ3mURq6HP77BeQpd+lXy6FNursOuYYhG1xOUi65YIZNRzvxuDqcy00WvX0ePC3eHVQ
	RHQhcfSdxtjE/tRrvr+4efZGaXzE=
X-Gm-Gg: ASbGncuBIXsmrGxQNmT7SpagZgSHtCUnTr2pA8L11BpSs8nm3M5kkAumMWf18vfFtgL
	eX75dz3bnL1yBrX5ziCPQ5XEZZ31H87tfijzFHw==
X-Google-Smtp-Source: AGHT+IHlSJ9EN/gmY133NKZBtL/8APhwd7SZyGjuFtfyGfKvJSzy36l2yF9H8tqmQAT9l0zTQCPAW9YvOAD6+oteTpk=
X-Received: by 2002:a17:90b:2545:b0:2f2:a9bd:afe9 with SMTP id
 98e67ed59e1d1-2f548f055ffmr12603839a91.2.1736812375068; Mon, 13 Jan 2025
 15:52:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120-borrow-mut-v6-0-80dbadd00951@gmail.com>
 <20241120-borrow-mut-v6-6-80dbadd00951@gmail.com> <fc667065-6951-436c-9329-77e94a64f614@kernel.org>
In-Reply-To: <fc667065-6951-436c-9329-77e94a64f614@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jan 2025 00:52:43 +0100
X-Gm-Features: AbW1kvaduvlFtx4dFAl1SkhJOWcn8h469MqXYZlx-6Ah8oI0oFTRHfAXpkk3NW4
Message-ID: <CANiq72=WPRpMOOT_nLrmD02K3B1Q5B30mEJngv1CzmuVufs_9g@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] rust: add improved version of `ForeignOwnable::borrow_mut`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 2:18=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Thanks for the quick Acks, Danilo!

Cheers,
Miguel
