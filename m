Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063051F63F9
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874362; cv=none; b=sh805T+c+pWSYIgu8QBqBxqTEOev5h96IsC7QSygfKBOhs+gJJILFY+KD3x/CwqLQrvQaCmbMbAy3bDyqIKFrLVhYxfPoYs1MHnLta6/nxfSQTUg5Er9pWkbuHxdvs7Be7jhDbElB7Mv/MPisrpJOrDErJWtbuJli/kmI8tORn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874362; c=relaxed/simple;
	bh=U4/vaUKN2Te2h7fsu377GWSWFLADA2axs/lRNpRR5No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i374MxzXtQEZ81so3r0SspUi7w25AHHiFknSN3qSB6OzNpWcdK16PgAkjNv2xDqVVtO/SrsGXsIVOMIkjDQi6wUG9aP04mZiEK54/61lQYk5ZfhBHEq4T3jI6JyTtjEo40opl0bObbLAFG2avTYQUbbBUnwdhZQucKTP+Kwj1J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=ZD2y/sTu; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="ZD2y/sTu"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ef60e500d7so3537587b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744874360; x=1745479160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uw/gFd53a9BS00FfUSh4cAYjNxPAgA33lFveIhVyB4I=;
        b=ZD2y/sTuw1kXhGA8GgQXI7ZB7MCmGWc2BEnNvdho7r9nxiY4+eTdJkHHr4vouoILQ6
         KCXJYGHFhUNgKMvhxOzdoYvJIIePSOVQ1hvb/VRYWkteweOiA2e67KALUMju3sZs3hON
         7vWMqP/hU3mOk8znKB9yof1wSQgcGNVDcnzPqQ6niQ3ovICfgVSFlX7n+RYMuTdjUH5M
         eTLqqXwyHcMkaDlyYXF7m+R2uryRzoQVV80fCI+pZYLvpZIDoIHu0xx7LLLRKKn0qIPZ
         CNaPzI8RmLYvUT0FmrWBqIozIt6DrvNmjdeFyte0vgBgieGtXyEpArG34P5F83KPULC8
         M4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874360; x=1745479160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uw/gFd53a9BS00FfUSh4cAYjNxPAgA33lFveIhVyB4I=;
        b=rbF+HhSYv8ezR2R6puqleTOVN+LgfYCS21SqzbMDmb/fQmkHkgLmN9ps2hRcCPadYS
         0S1RT2pbyWkqocA9eMtvJLX9py2ovW/0Ibk1/OizNjEtLakKpiNrratkrs23h2uwG1hl
         854DDwh0ZH5xJ2qlvs2MVag+1UHvFZsZzo0FVoFjr5X1SfEz8lTOSVRTxUCUKB2mFi6c
         av7/icj7kdgj5G0qkhXBE1EsI4nR1XRu3mcvaA1cnoEF8vWqpWZK94Vc/cANvSCigam8
         sr5RWiZShHedm1SHbf1aWDft6OQ7D3vGg1+Vs5sfdNJoXpXKuDkLukJWqay0Jlbgg1JA
         JIWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc3jIQ2fWEqp8/9JyxpreEPkfBJdDgU2t6kd9Md2lSbNcLkRk6HVHuQtTNcwTiEPpEhGc/SG727zu1bOnoSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwOlzLQMP8ssAmKfx8bhRF6zxXu4etEU1oY9jD21cWCMU0ghNI
	/in56PjFNJTRM6JDc8uvqg88LWFH2Rcbof07nuk/32SSGTd4ny3MsaKR2JXipdxTBjfweb+rqxM
	0cNRfFjWJ9LsJcfRRihyeVzFuIBhS/eEws5oVqQ==
X-Gm-Gg: ASbGncsOpPCXSG+E4ONmhtKN0uzTJjgsoRt+B4ddAYbGCyZ24MRKeSS/HeyyzVgk/ok
	X8YImeO+B/kypY5Udl2ajJQpimmhgv6DboinRyjj6utPbCFnp5MYFmTwBCs2Vwn4yIt+P18ALhP
	gd+Xfr3meT5MdHaW9nF0BJuQ==
X-Google-Smtp-Source: AGHT+IEXB6D89bWHNnoXFbnwrhIOjGGlhII4xSrRflgd9ac9ibMg9LchRCS2RzJyKlWy86S3cu4WFYghsKhj3BzJt+s=
X-Received: by 2002:a05:6902:2b92:b0:e5d:c11c:3494 with SMTP id
 3f1490d57ef6-e7275f1774cmr5305566276.30.1744874360020; Thu, 17 Apr 2025
 00:19:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-10-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-10-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 02:19:08 -0500
X-Gm-Features: ATxdqUFTdUlY5hT2E0MA0TIp6LfUHIWhb6GFzQWkdokya3jjzXX_XuCczpM3MSI
Message-ID: <CALNs47tQi2UoFNiU7hTa-fPGwoQ0HN_SJG4HJ-rjoes9XE7-kw@mail.gmail.com>
Subject: Re: [PATCH v5 10/13] scripts: generate_rust_analyzer.py: define host crates
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Define host crates used by the `macros` crate separately from target
> crates, now that we can uniquely identify crates with the same name.
>
> This avoids rust-analyzer thinking the host `core` crate has our target
> configs applied to it.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/all/CANiq72mw83RmLYeFFoJW6mUUygoyiA_f1ievSC=
2pmBESsQew+w@mail.gmail.com/
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
