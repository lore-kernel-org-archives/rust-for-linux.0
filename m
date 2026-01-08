Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C156247DD53
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 14:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882215; cv=none; b=bkJgqfzuQkAGj1Nfjo3EtZFq2JyVall1WQj34b1MIc1mG8IbspTLbbS8a2CPxi+8Bdp9WSkRkrhCJSQsPuDCA5gLWn/1fgxjC/vUplHjvDqBvz50H8tDttGtc5So6NVxSEqUDgt/YJ8oaxKLm3r1OTdfIQa4AvhuDB6bcUcApRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882215; c=relaxed/simple;
	bh=zlRVwrdSOVY2CZZdXveBBVRP9u//BHqta1Ol/lsP+bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHwU3CkwmCR/iWsVhEoH8Rvse9OIDEriHa2O4mbklDTMN+Z0ar+pU2engdWrrXMzVVhTWs0wDVQcr1m4ZljuPG4vJrm7JARyq7MmbgfJ9tRfNp1bSHUkpiPOdloCeofUm6p6kZGYpdYd4K/qYRTSvDK8xFzElaT2xEulPTMswAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaFPbQxK; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaFPbQxK"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-11bba84006dso292451c88.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 06:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767882213; x=1768487013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlRVwrdSOVY2CZZdXveBBVRP9u//BHqta1Ol/lsP+bA=;
        b=eaFPbQxKPjfeQzoH2fyMm84zsJGsMlLadxbpA+GbZlK3yaF7YNJ0no8IAmm85EwCGU
         cVgahHgfuFg+onp1K4uJh6eoW+i6Jx0sZi9skB5/s+ceGSqZhHZ3O4/oEloXBWVBjZHX
         gUe7xR0uMOmAnnlzS6HFWhKDK7OiKWxs4lU2/GpaTOp4JiZDfCDm3tC39kMCCicBUJ1/
         J42EHotYW/1nGRnez0sxebqjlf7aegRCqgee4+6IU0C+BjXSn5mi7fo+oPrRFyhnougD
         5Tat0FPzZIQDIJbJVULVEdmyA/alW5Uewp9cJfFJ81avmAGuOUFvYAQNt2cWLiz4ip6c
         Ksug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767882213; x=1768487013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zlRVwrdSOVY2CZZdXveBBVRP9u//BHqta1Ol/lsP+bA=;
        b=f+TIVudmBjohMTGs4yfqv3p+OSlsyfCr1lQjh7ktw19Ttst8tN+8Gsg8cIq3o2j/T6
         oa+BvlkrS0v/I7F1OvLwVlS4U8m9dsUylJF3N369eqTgt5+TYxQTKH/2DetRMSrH1vXh
         9m/5MUI3aQsCZqGDiSMqUe8+xiPAChYZxKjE2zGdd/bW4kiDKjzJBdVGtHfeH0QNDlhs
         2frzSbRt9JQlB/OiFFaWN3CYETPy1xs6iH/jlZkqn/qf7emteb38nucxArOlUznlHvGT
         taZnNPD2ecm9h+2y5nYGanMJcp8a1Ya10fxAS46l1D3rr146HfG+Z9CB+aUInxCDh6B2
         SrEA==
X-Forwarded-Encrypted: i=1; AJvYcCWmiOMzI11gY7J9poOd0Xlu8yQQ+f7KIv9M77fr1gAliwvXgGGxZz2r/UP/hE5e3/i+aPy5oa5u483D623zuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9/ApWdQcPlloJJUbHnjCsF6xpCBnqFJ5hjhWQh+J1kwknhBHE
	XULH5S+Gg5PR5mVDSJxkua9G6a5ZlnWSUZ4+OoCjia1yHfLFSJrmYYIRqi4bYwZiti2zYQElrfB
	cnksEy4T+u1/VcX1boZrryqOPQsBfOPM=
X-Gm-Gg: AY/fxX4dhonideJroCZePIJwbNxTyvo91EolmFrKxvCct0H3v8ug4DQyAqBIvkGzAXk
	T2r0/va3pRqYduW+9h4cfdavP7b0ECfgdiQ0XWZ+rfJsgpGHvLnAYYyObhDct/wWLpd1Mysm+PP
	+VFpwV9TVAz6o5XDkn3SE6qi45JJdMXV/Jz4SlzGqFfIpjO5lO6TYD0dVxIap27EoJ6U2AmCoST
	evClb8RsNwtAMCjSKdBN0qhiAayRbDpCcKyaO6tKzKV5sIf/NqaWptAsGAVSBT/22Eu7FQ5gWG7
	EvBwK8lSiiqd+CbMF2zaSEnZnVNAcjJhvGU73vfqQmD3KLBtCixZ49MQxVRLE3b0oB+hG0B4B82
	I6Ytkk71E/3Wm
X-Google-Smtp-Source: AGHT+IELvdw05oHTCoWO5f2S/QQ6TUxWIQWCWu4IsDvpm54xC29qHwlL5BYupV/nF2K5C4whI2juYLIRDu9iKoVWSJo=
X-Received: by 2002:a05:7301:190b:b0:2ab:ca55:89bd with SMTP id
 5a478bee46e88-2b17d2e3950mr1768661eec.4.1767882212773; Thu, 08 Jan 2026
 06:23:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201155210.22710-1-atharvd440@gmail.com> <CAJZ5v0hvD9T1y2uGq1MtFafQTRUJf2oeKEj11hAZ8gv5J5OM1w@mail.gmail.com>
In-Reply-To: <CAJZ5v0hvD9T1y2uGq1MtFafQTRUJf2oeKEj11hAZ8gv5J5OM1w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 15:23:20 +0100
X-Gm-Features: AQt7F2ol0WqSmL0Fjmv5tDMpkcuK4WX0YIFIYb3YwUazpolDVukxJsOHTQb7jS4
Message-ID: <CANiq72=SEmPnP8Nz2_PjD_HuOV7UR5+WWJRBGoJTt66k42rqMg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: acpi: replace manual zero-initialization with `pin_init::zeroed()`
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Atharv Dubey <atharvd440@gmail.com>, Len Brown <lenb@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-acpi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 3:00=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.org=
> wrote:
>
> A Rust-side ACK or equivalent would be welcome.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
