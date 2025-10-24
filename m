Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196FB343D7A
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 17:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761327557; cv=none; b=I95A4OEAfpzeMcH7OVbV3DSnI0DBkYkRvI18Nj2GKwc/h0ei3q81uyJQqVDT1bhbCi+VWkAvQGi6sR+KeEiSkyFK2XV3vWrAgRyJbi0FPYTaP03320PlEjG5vDs42nDStIvcnFZwiQbSPAci2BM6EIj+gXNqukYJwIGjCYw0bmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761327557; c=relaxed/simple;
	bh=joAJvp2loFKjm/U5Cbq5rKJ7q2/HATCZly6nzVlN9hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SXlfRaJTZi2WCDgmdJDUBSbtb5yW3KE44bqxAScWoFXROEL1uoONvtiqx8kuHpkxYBvHUsiK6lUvTYMFflvNXbUxy/UeSQq7iSO61ekL/gvDnMQvE+iqsnVL4/QbQP1dWnekMXc+jvtv3jcLmlvVBvHG3r6Kqh2fWfnQF606mTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nn5eoBEp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nn5eoBEp"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-290a33bfea6so2942325ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 10:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761327555; x=1761932355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joAJvp2loFKjm/U5Cbq5rKJ7q2/HATCZly6nzVlN9hg=;
        b=Nn5eoBEpJA498aevo0t7Lflp6E0Gwtb4fKPYu2mJeLcyG/iJLGIqorI1v+XYEdiWs3
         xDZ/gBF4enfryK/eYi6MZlhrdaBXnpq7WMwqIZMCNueMOrJpfTIQfFejUUILV8iBp+Xz
         Uo4OlfpgR74Iwm/MgGN0vlPap0Fy+eNOMQ/ldq00BDaO+zMi/KXZUu4IwPeai573lL9Y
         Jp8Dxu0AVtvKnKcCF8+2Uv/ngftCqQtxy5kUiucZj0h0RDQGwzYhhCpsQfThMifq+gZO
         /Ir7nD6+dFTslbh+ruZdrjySYSWvgs89/nmIBaLI37OZntOkK+crajGcmHBAQwWiiQBI
         hZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761327555; x=1761932355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=joAJvp2loFKjm/U5Cbq5rKJ7q2/HATCZly6nzVlN9hg=;
        b=IigocJihSQpWss8k5IC2U7h4prFfdNUZbeZ//Lp/VdMfamCuZY+z3HrHF+j1hVvMuV
         Vj2RwWn2zMM8VFJIYD88NeJIbk558eIZqSdwQzld5bPX9LJ/YO7ajBxazjJHb6GKORbW
         0O/0DBXU5qGdBsLp6DYmmQsOz+IitYidPoFQVsHrhoZtpDPfrgmM6tMrf53iFPznoORN
         Tu3/P0NkAdcc7oeuRBvkfHz5OJmd1n+Itvy8TvvQszHvHFU4/woZL/sQegzkyRn7ks7S
         PI0brfcR4J3I2zSYX1t1BU1Aw91N6SNP0xGzWh2di9FMLD6JxXyS6cKkOsmKJ3cQbBrT
         4X/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMLj9b7Ce0+RqBQJ79/gOamzOCWjHb12stbTXh8Y8MnJFIir2vV2G66sFw0Ud18qAO9DIPRHh0aNp1HUHChQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8k765TK1QEZVgjLRY9CHJVejBd0+8F608crSS0p6aZfd63gmu
	DpKIvWjvoxtlLsNUh08aI7spoJikaevetvpMV6iXXXvDirq3tPZzMEvei3fPO2mJfE2KDblEzbb
	VYcR/tnAzdOcMX4A3pp8SiM2rNG3LLVc=
X-Gm-Gg: ASbGnctXrLVfGM71672bwM6Cnsl8XQClglmvoa9N47LKgezuf3LjsVCsMdMZTdAOhYB
	UWRNdInosxSZ3wlAFmADQ5WSw3dcVETlludD7w5pdKzWQOpTeN/uwBDeQRH3VPyzkXR6Ly1gCtM
	tOSLwwErw03QGhkrFnb0sKAt+6enk3/gI4oTZNv4JZD4yOdlL9DGV/8jSj/d109BzmfPSwTtBCO
	ojxx3eolOB0mOjeNuCQyHGzcNfsOb2e0bUST0hMXp6UXUmTsbElxVYQhrvn3PU3uZsyxYXK6UI+
	JQAhKXznjsmy2FBM6swMGlp+OvXiYPn9rCz+ZuTU6X4qBva8scJVDwe2B7AbZnVXaxyyULdrKIl
	2kkyUyfO4ob63Cw==
X-Google-Smtp-Source: AGHT+IFEt2hbUYHBszY99Yu4l5V0rr2K5r0yGPuNwplUsRLx+Ng9+gZWVZnNUa9MZwfrnud0uDi1EDTiWXhh+43792E=
X-Received: by 2002:a17:902:ec82:b0:25c:b66e:9c2a with SMTP id
 d9443c01a7336-290cb757692mr210666995ad.6.1761327555182; Fri, 24 Oct 2025
 10:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024154754.99768-1-yury.norov@gmail.com>
In-Reply-To: <20251024154754.99768-1-yury.norov@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Oct 2025 19:39:01 +0200
X-Gm-Features: AWmQ_blXSYlIZPVN-NCsjwHVckUMrPSTltu8AaeFN_4CJTIcrnQs847DTDcGsTA
Message-ID: <CANiq72mDTjNNgEvMEvNWWg++1aUzry+TW2sizhhK5mTyOfEZTA@mail.gmail.com>
Subject: Re: [PATCH v2] uaccess: decouple INLINE_COPY_FROM_USER and CONFIG_RUST
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 5:48=E2=80=AFPM Yury Norov (NVIDIA)
<yury.norov@gmail.com> wrote:
>
> - * rust code always uses the extern definition.

Hmm... my copy has "rust" capitalized -- manual edit?

> +unsigned long rust_helper__copy_from_user(void *to, const void __user *f=
rom, unsigned long n)

Looks fine -- the signatures could ideally be formatted like the ones
above ideally (`clang-format` can do it for you), but no big deal.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
