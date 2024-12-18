Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A743C0B;
	Wed, 18 Dec 2024 06:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734503565; cv=none; b=M7xykXBStqquvndy6DA+4Kq3kLcStllltqU5Uj9jc+adt0Aa2aT6NV0SzSMuOE88wGqwD9xSU9L3s+TFn4LFTAQ195Mhu47lBzKswIU86deEQ5UK3N7gnAWZWZTNHMKrKayrfjnA8zoI4sYw+xHCf37hSUuyK+fhPOj37U8Uad4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734503565; c=relaxed/simple;
	bh=s1EQ3BekPXvQtzGRll+1ycDxd+2WcsyPLM5a3ZArwQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owAraaFcZF9Q1Wsdwm0xXsFo2jk4dPP9jvfUgiHAXE8BUsfh8CJKojI3IzHRt2mTSVoDFFr8uZazOJpi+KTFBJOfZGmvRUgd4RM+P5nzVDbynICLYjlLq+3o0FJ6iWz5ERVBr3t/MExli4Xr5WoOYiRaSaEDB2KMbUqgKErPYdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=es1pEF5U; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="es1pEF5U"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85c4557fce0so1347464241.3;
        Tue, 17 Dec 2024 22:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734503563; x=1735108363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1EQ3BekPXvQtzGRll+1ycDxd+2WcsyPLM5a3ZArwQU=;
        b=es1pEF5Ur3mNuet1m1JPMiYkdKB1Dl5q0CyrBq9M78So8BM7sffCZIe+vwQAegEf6b
         /gHRXPvcSpV03OAyrJeL9LP62nvLwsoUoZ0TWhM+p+5ZSY2eGMQ+iaznMLCfdMcRHG4m
         zI+znV29Buq+/luLDv0S28nG+Xenh2Pz1tD+p4eg7bvnI9og+/NqpLdaUj9kw6yL4rGg
         YfJaxef0CMDVekEisf0cLD/PCpMGRUViMdXB4CJFWpFyz+xZqxW79iLPXv51Nrm4s5Kg
         5oSKREGKuz+aZHlXzphMPvcAjb/nmI1/G7VjULdKR7BZHvw3D7jxumcsXVit3R2QSoc/
         aGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734503563; x=1735108363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1EQ3BekPXvQtzGRll+1ycDxd+2WcsyPLM5a3ZArwQU=;
        b=E/uSxtbvnD4q2d/jnggMKGSPfwiOKJD9AV1l0JGX2SdRdU9KgA0ro55XgeW0o7VLM7
         yImzc69vzSglEgdJnUKrsAqeK8bxEmnAYB6cp7pbaWRWbUApyBTcSvlv2VhJNCAvqegu
         e4Ct1LtYACxLf4CTZAA27H9d1X2lIAV6mzeM+R5LbAherxuKu0lJY8CWxHTribMqUktS
         3GthA4+o+keAUGM0PZb+wzPkZtMEl1sA4TjqAlcT40h6YUXkcNDwUWb7VPtSatgN7bMC
         c9HfjuAXn9xP0JbOCXoSU1YdGdILbg5BBy5JSUKRnM+0+eQFF5veblrJh8+Omt85KfiK
         kf1A==
X-Forwarded-Encrypted: i=1; AJvYcCWG5zuPvUcj65oLWdn+5DFfQ76fNal+0Yb0r67PTJfNiUsV7rsqsgFTY4+XQewo9m0sktlfd/hSgBLlRNTbkn0=@vger.kernel.org, AJvYcCXyTSoLLnePAfmebOMJ32gYK/OWDWSLDOgMUtRjU/y3bFjVjq1h9XlR9m4r4jmRcb9/28GQFnfzsxqlvHU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6PnUSwM8e88UWApItDdUqXi2+EFUfWIFC6bqRHOUxtv0EknoM
	2etY0U2Z7LQh4sEMBn62XFfvFZg9v6mwzJmu38641F+lVRJ5QjmMl/ztWbPl9EljUFfOAPXobSh
	DQBIBBw8ZwC+SAuJTXYsMnb1D9Vo=
X-Gm-Gg: ASbGncs1MHC5kOikHz5LHpzlZnebxgWMQULFaL8MBa8PT9uAUgI9z93x40I+BjFljng
	TNg3S4aRHWaQDxxiHzE/fOy+98xtBhHctzgUUVguh8wUPeTblH8EvVrCfnhjnCEneB4e8
X-Google-Smtp-Source: AGHT+IHmt1jR+pXZCwzYqU7BgTha7+a3M+duTzZrVkjBiSyBecKkjI3jsIZE09e/etRr+I2VKjHBnCTiEcqdLF1lzm4=
X-Received: by 2002:a05:6102:41ac:b0:4b1:ed1:56ac with SMTP id
 ada2fe7eead31-4b2ae773f21mr1530397137.12.1734503562904; Tue, 17 Dec 2024
 22:32:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <yZdXTg82eCLGHsaNBfAwwYZTGa63yzxI2YXoaTndUyJzyVN60hPrWoeQoXdrrh2hnRIeugFXvrb3nbq2bpD6Ag==@protonmail.internalid>
 <20241114005631.818440-1-alistair@alistair23.me> <871pynfv5f.fsf@kernel.org>
In-Reply-To: <871pynfv5f.fsf@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 18 Dec 2024 16:32:17 +1000
Message-ID: <CAKmqyKN7dP=UFjP0c88wq_FMgaFzPU+5GRDz=X6H-fkc1v1Hpg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] rust: bindings: Auto-generate inline static functions
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alistair Francis <alistair@alistair23.me>, linux-kernel@vger.kernel.org, 
	benno.lossin@proton.me, boqun.feng@gmail.com, me@kloenk.dev, 
	alex.gaynor@gmail.com, gary@garyguo.net, aliceryhl@google.com, 
	alistair.francis@wdc.com, bjorn3_gh@protonmail.com, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 11:14=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
>
> Hi Alistair,
>
> "Alistair Francis" <alistair@alistair23.me> writes:
> >
> > This series adds support for bindgen generating wrappers for inline sta=
tics and
> > then converts the existing helper functions to this new method. This do=
esn't
> > work for C macros, so we can't reamove all of the helper functions, but=
 we
> > can remove most.
>
> Are you aware of the helper LTO patches by Gary [1]? Can you tell if

I was not, but that's exciting to see

> this series will compose with the LTO patches?

I think it will still work, although it might take some extra effort.

I assume my series isn't going to be accepted though, so I'm not going
to try and get the LTO series to work on top of it. It's a lot of work
to rebase this series as every new binding causes a conflict and it
seems to have stalled

Alistair

>
> Also see this Zulip thread for discussion on the LTO patches [2].
>
>
> Best regards,
> Andreas Hindborg
>
>
>
> [1] https://github.com/nbdd0121/linux/tree/thin-lto
> [2] https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/t=
opic/LTO.20Rust.20modules.20with.20C.20helpers
>
