Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C9829ACF6
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 22:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764629922; cv=none; b=YJ/60YrA1B6SZiEQkbVpkU6U2aAxyefHKIVrdDaU2SYhrrjDsNC+hjE8UtDt4sZiLdM5JttjIrMQl9JuxbMsOF+9JHFQhInNxEBogoQm7/6gYDRTK38NRpAJSS6JI1L1hasrDSwgXaMB1DoDCaciGMjVt5yzGgBRc1rLU8HmhkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764629922; c=relaxed/simple;
	bh=a1pdL8EYMo2eswZyriHACheqxubZbCfaF1iStJizjuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvbzY8X4GG/mlRLMcB9E/52GckUsyJW8nPlYhgu4+eEOQbLU+G+jsax+AIo1I/45YCccckKdI+4pKtvS6etZRU0R+oIgKiwfDpVouUwMQdNSLFv55JiY26MWxJ/mp9zyIEl4ZxVy7Mu5oix7iozfGXMNIMhkuEj3+wuZOZ4mGzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/rhy8nI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/rhy8nI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7bac5b906bcso549370b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 14:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764629919; x=1765234719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1pdL8EYMo2eswZyriHACheqxubZbCfaF1iStJizjuE=;
        b=X/rhy8nIeTQdK/Y1MnflRVp9Eel/+ZuFLozA+w0umxbyG9WGXYlqI2l4X/fC5pKofH
         jELhUCHZYOofU16M6Ni0W/rUtLl7Ljm6iblZ0B9QSsIGQ79C2dH0erZzkSXWs/4e2liL
         wsPkQ9p/EwxqP++PUaPfqYFSglXsF6e+aRz2oJ4YlQh2DnD6JrqGlztLTiRbVyG57K6h
         O85R0fT7dZRI4Mcy/tGzZ0VivJl7AQULGehWLn9fb3uoTkpvagwJRTCUnVoprfJBLTC0
         h/k/BUlDUAOuvwVPfnAWkjqSsQNty/ETiY1icmCA24ujhxgO+9zhzMg4q/wsNIZcmuVw
         2yBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764629919; x=1765234719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a1pdL8EYMo2eswZyriHACheqxubZbCfaF1iStJizjuE=;
        b=jnRUNIV8CXjbkGzRXpZhrKQ9ZfZkuA+ifIWvjz5mFOaqvoQjWedJLr+FJUDBb80O6N
         1Y/46oNjC3wdUEp2dw3o7lfP1JZZJosx+EIWlaHaFq8OnfMQs7hf3e/g5PRwELRU0fLj
         AvHHLAANuoI9ePsxrI7Nl0YnZcs5cxWkjP5DpTvPu4b4/VJmQW6OhPfK94J0fJx0aJZh
         Gt4ZkaYr4A9CekeGzDSGKGT/m6j3rswlNrTPQrThySLCkruPWdN7v28RcvwvkD60Gg5Z
         oWL5wLUlWumCZUC50LC3Vmyt+NCXoda9iqylBotcPCffnBl9ENvZAK2M0JfbfEwCzFdw
         sGQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ZogQTW88SoJOoPUaSzG98B8GU3up1FB1g6Gz2aK/eYfcIqBZVJ7C6OZMgOkDu/lm4eGmpntf2ANTfVjU3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUt0MK9Rdjq/VhjZDHKWAm1kbMugn39xyr6xzk7rfadtwnn5bH
	VHSv2Ok+Zs2IZOVfS5GdXUJ+RJUUB/CQKi9jJxNaew3BILenq8Jsb7AKpTsmSXsHQIWe6ZP2XPv
	rsTWJLSuosMt8dvEDWzHBK9jlQhH9PUQ=
X-Gm-Gg: ASbGnctBEq6dt5sS7dxQmIsou4cpZXaGXIXO+Zk/e4R1FLDpS7utbVeZZJWHgB5KanG
	HVLg99VjjApeEbECW2CU3MFECmuNwNU3tv7z5y6azxrrMTOALXB4CQZvZFIrN6KoUd14iTsf1tK
	KtXAF43FdkL261ZSH7blEGXCWTKE2KiYR1fsBbedVVCF4TcWINfmZEcqepYRU3c4UYD9FSkPz5s
	SulQ781Ydt0CTxB+15yHm4OvYYyX9j6qZ/KgXTkVTrplcWsiDOoAvKtv6hiYEjfWkfzl+OIcD8W
	w/cXUAk8WZVW0xA5Nhe5+rNC2Gg49hPWqGeiYcj9pXZPpw7+W596Gleht98keCWXPiDCqle3zOo
	Z4D5VL9YLvOGrUXVOop3EyaEN
X-Google-Smtp-Source: AGHT+IFfuN9zEIrSqZ4UfzyHrOAWhLG/2/sm864P3ydB1iuIelR7Cpw9LcULJ3uSXFJitdhtK2p/ltt0ZFQOQNh8uwg=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr27204611eec.3.1764629919416; Mon, 01 Dec 2025
 14:58:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com> <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
 <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com> <2700c827-d3af-403c-857a-30324e0d8502@nvidia.com>
In-Reply-To: <2700c827-d3af-403c-857a-30324e0d8502@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 23:58:26 +0100
X-Gm-Features: AWmQ_bkl2DTKJWfF5AG_9aZv1tTBUZWM-ImMGF4ZqdhUPDiYIUQE-GRQbnKTx8c
Message-ID: <CANiq72=wGCRrZGvsoqs5jZQ-n23H9chxpH+dwo=jomhEjCsrZA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>, 
	Dave Airlie <airlied@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Lyude Paul <elle@weathered-steel.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 11:43=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> The documentation clearly says "doctests get
> compiled as Rust kernel objects, allowing them to run against a built ker=
nel.".

Yeah, there is also a Python script that KUnit provides that some
people like to use too, and quite convenient to pass certain configs etc.

Cheers,
Miguel
