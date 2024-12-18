Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCAFBE6C;
	Wed, 18 Dec 2024 00:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734483464; cv=none; b=Oi+EzXrBF0ehiT81MdJvOcAo8B+Ilr8/iLvu2xQjT3LcSfZQuUqMq9yaaAUi8U04nn9aMriANhDw2fE4DAC+0KJXgW/rpPAVTLHQ+WFC1CO8X9j4RXj8zjVwgpF0oBYJTjcHhUnI+KXH0PRGjrZK4yEQ+KVNAE3lViUjt2Z39UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734483464; c=relaxed/simple;
	bh=O3sz+aBA/DHVVMdyVO/b4OGA9UR5v4It0mQHxPf80Q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPiAQrj2NOVxFWaIBbfNtjk2YjGlXDXkCmGDB3em11wcXuoUaAZc5jGjvYdRqM6AzBHvRGtw8AozysQLeTNn3nU68pnQxO+BmlYZ3d74nq298CqhsBnoNy/gP4eKN8f+TxNyO7kY+gpniXxgIgSusSwVpSamYCHtgWXl35njFyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuQHJFyE; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuQHJFyE"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee534d6800so1008699a91.2;
        Tue, 17 Dec 2024 16:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734483462; x=1735088262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3sz+aBA/DHVVMdyVO/b4OGA9UR5v4It0mQHxPf80Q0=;
        b=LuQHJFyEz/b+tw0NA1/vBPUoW9WWQenJKEW50Lo8N/kd2SbfFztyoaWMeyJc8DbuOc
         onAS4abm3YGgznNLu01sKv22OHXyKvm1NuQVO2UgZjut2c1uA7y+/SXwmbVpKvfGO6qC
         wVxv7ycSSSuYt3BtsCZnw7dKeNn5oWtZ9+smIFoJFges4QiQ8SRlxkyX+fzT8m6bilIk
         qkwuMaTbNvWEpj40jNRa6giM5tuDtTSPeMz9hjHHESR3FaKiW1COTm4y89WGqro7uQEV
         TjTTy8pE0/DJ1RrkappytOQ2A0xs7FAetfWsT6yP4DVNqzsk6apaLRSx1HjtCLOVnJlf
         RLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734483462; x=1735088262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3sz+aBA/DHVVMdyVO/b4OGA9UR5v4It0mQHxPf80Q0=;
        b=tDaBL49Zy/mhvDP6TYVw7U579UGR42cnGUJHeFPdZa2KgeQ7j4BMpg9SjNQAZfKil6
         b4aT+ieQ463DTIA70czfgnyeejYtdOtMjq/B6xW8PJcu7P6C3v5MdDBziP6Nsqg7ca/+
         rdCA9wpdu9/gtLqEgt1EvzfGbUqt0P6UQ29Y3g9dsn675kg8KV+Go3KcStbK97wyWmHi
         hRbPWoFkHR3G/N3wvfU8kVAeD/lDELHitkdY/otO4C8wqjUesV/YuUFYxFtYoywuLrh9
         tkQj8hgTsfx0pBdB900mDdxkUAtww2de65miM7Jv74FhPrEU/GEcM3or2TNBGzSQsCTJ
         brDw==
X-Forwarded-Encrypted: i=1; AJvYcCUV3mI/uACa/Ue3fR52yYyFwD3dciQ3eJCbipWIk84b2wCA3p+GDx8Ktj/JlaBuAANnB6+CMR2KhUTLpUk=@vger.kernel.org, AJvYcCXw4mTElKkQ+hjF4BHy7T3dy21BG18uEh4evH831NFX26ptcPDloXqPaUKDVTt+8H8a8wnTatuRlPeUuI0+6oU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydn7l7I7bM+JVzZlETK7VYprSQdddt8qmcDd7OHHcZBf2RI4Ty
	c2iECGir9KuPxty3+wwD6z0wWjtpQJtpmtKJ7ENYzwxXMc7Sx5KSTD4Js0+YeQiwncf6BkOYFQI
	zETPAaAL8DdpTVcWhE5rmF2mSXSw=
X-Gm-Gg: ASbGncuZ8SCwdnSuDTms+WoC+BAWfxGWq17q2zOu/pW6pi9DGhualGG/zOJdoNny1v3
	LTHaxuLCjafkeZjqRszLUrRYknlzLNS8Ff73a0w==
X-Google-Smtp-Source: AGHT+IGexDG0YM9uewb0aX5XuLzXamRaJfeczi0lYkdina81dSVN1L5MMloUkEA3pVbDyp34dDugwMtHH6P07XUregQ=
X-Received: by 2002:a17:90a:d00f:b0:2ea:715b:72ba with SMTP id
 98e67ed59e1d1-2f2e9392e86mr516108a91.9.1734483462341; Tue, 17 Dec 2024
 16:57:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1734477232.git.jtostler1@gmail.com> <966cc6950c3e8705462f330d2bd002d305ebbc93.1734477232.git.jtostler1@gmail.com>
In-Reply-To: <966cc6950c3e8705462f330d2bd002d305ebbc93.1734477232.git.jtostler1@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Dec 2024 01:57:29 +0100
Message-ID: <CANiq72=2tbRJ6Chq02iGwpNToe4zHR-RtXq+Qv_bFzyvdyXHsA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: error: Change `LayoutError` to internal
To: Jimmy Ostler <jtostler1@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Wedson Almeida Filho <walmeida@microsoft.com>, Filipe Xavier <felipe_life@live.com>, 
	Valentin Obst <kernel@valentinobst.de>, Daniel Sedlak <daniel@sedlak.dev>, 
	Alex Mantel <alexmantel93@mailbox.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 1:24=E2=80=AFAM Jimmy Ostler <jtostler1@gmail.com> =
wrote:
>
> Add an implementation of `From<LayoutError> for Error` for the
> `kernel::alloc::layout::LayoutError`.
> Remove the implementation on `core::alloc::LayoutError`, because we
> don't use it anywhere.

No need to send a new version for this, but it may make sense to
reword to clarify that this switches the import, and therefore the
`impl` switches from one to the other. The way it is written, it
sounds like an actual `impl` item was textually added and another one
removed.

Cheers,
Miguel
