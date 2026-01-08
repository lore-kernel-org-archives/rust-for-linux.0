Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5472D38B7BD
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 14:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881248; cv=none; b=XhH9PFwUN2tvNsHEWJPrqr1AdbWwgjXOK0kbdJ2nYaF/TXpm4fqGp3sON48oLfleoxtbhG6Hkdl2Ia4c5d0NN9iS98zeqgSMujmFFCKZHmY2rzthBdEk9v04oNf+MFSdC+Kt9IEmkG3LkgGidbMoZmbocy/fpeEHCbW3N6OBjqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881248; c=relaxed/simple;
	bh=jY7usSNT4rTyKQgdFHMP8USgm6QByHELxYUKyGll5EQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0RQ/zAfSnsgHbIda+ydTmi+ZpUzz/SXwRrPxCQ1LDNiAXbd3MI6jJ0bPCwr0lDTOAVy21gr3nZvMq6jOp6pnsFu4sJfk4ESqO1UVagpCnFoNsgg+pjORDdrR06rzkUe5poYQbOfbMbsqlBT+kv+lryIDCH3Q6OEYgP1mgZqMh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y+oHFgWJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y+oHFgWJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso15375095e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 06:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767881243; x=1768486043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jY7usSNT4rTyKQgdFHMP8USgm6QByHELxYUKyGll5EQ=;
        b=y+oHFgWJSFAk+Rl8Fk3DhgMKxaZxafAKrnIhyD29e0Tl+kcrDfNL2gFLrNPWt/imXN
         EY6db6meTD6uqMNq9WFZ6fRA/KxUwEYIYUXFbp3UOYBr64oYkMCc4mcYbvqh5Zvgl86M
         J0RQIUTlpYvxx1xLu+agHDSXSbWEugb4pBN3gNZYuhsHT7TtWvBAw6sbaqBrtQ4Fjp2t
         gwb4RG8U7vnVGDgT7fN42NBxaV+9Kyr2IQ1lGfMJNImL5iuxk3Ub0T9cUPtp9R0xWeDt
         zc6Dqi7sG0L2l1XFyNSsw01CyxM4ub3rbsA0mgIzO6SQqTKgF+4WfetSGmew/b6wdmHs
         kRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881243; x=1768486043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jY7usSNT4rTyKQgdFHMP8USgm6QByHELxYUKyGll5EQ=;
        b=DX6BsJ6d0CcmVIOhUOU/huVlxAj9aHImHBis8UsEQomLv/CIQJd+36jiOwUSz6Bo2H
         +Qevl+5lSU52N4CGbNsgHFxX2dvomOwtjeA4lBqd2Ool4k7AWOdoadbc8NBz3UDbHG6E
         zNAc4H6BSgeA/qr7Af5zv/E4sgCszQcluKkFZ4AjezXBUMR9gma1m8fMdmKKSU5/w7mG
         vR30DBDhImD7rhH4lcz0Uam4tWyLP1DeZ+3vjRGnPbNxwc08tEKR+svcAyC9e0IO2k4k
         q0QFoczA405KYc2juOg2ET+MDluE0YkCUiS/a/iN5EKJ7LGtOw0tPALXKMhIhzVWCtZO
         bEaA==
X-Forwarded-Encrypted: i=1; AJvYcCU0Zk/PRuK1wYXpG0oo9TntdLz5+ebCrxLbBiQZtuKSUARGn2CQsfVfSFg86kzp9uw65alfGEy0L33DHc0uwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUkXNrpqYKNCNn6E7awRiNGz8k3grejQrI0iw6Mpt5ozRIu+ls
	IisPt7BLck3zbLqYE2XJoquFZ1MjMSrdW1Hr2907ovwj14DiFVgvqD1NrWknzXxIpAWq/jzv86l
	LJRWpfelwRrZQbfLUXlsMrdNHDey8zaf3T7yT930d
X-Gm-Gg: AY/fxX7LX5b7JzdU0hrjc+sLZVcxi+BT2jEtgamOriVO2z/OB0yX1VZD3AaN882B6gp
	CO+p2Bl6B7yUEuGgUhiNGtuXE/KFyJxQfYYxGdg3uwQqInQAtDeSHDFDkkFSOMqfhJmSe/llf8c
	jE/s+ZH7RknycySKIZisjaxgQn4lPAyiHdupY27ZYcWUfKRnOcY6+qkk+st3+mySn8VBmEnxpzr
	knBgordByBT1IFLaU3aSzN3uSuP2EOTPW1wvAv489aIK6AsGt8PD4scENjcg7uwBHl8BGv5h4nU
	2UjPQFRLULuRU2GOhxDBHeLMn/ziTUeVIyEiVhbub6HTXkpdriVwJnGoYA==
X-Google-Smtp-Source: AGHT+IF1237WYc38p9/B3qh2Aqyfcy/bNYXZ3uChDeYed9WMB0aAYkPIHqxXqRrs+vItXWmGNjDcidgrfb9Q9nJNXg4=
X-Received: by 2002:a05:600c:3114:b0:46e:1a5e:211 with SMTP id
 5b1f17b1804b1-47d84b32f3fmr78790375e9.21.1767881243403; Thu, 08 Jan 2026
 06:07:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201155210.22710-1-atharvd440@gmail.com> <CAJZ5v0hvD9T1y2uGq1MtFafQTRUJf2oeKEj11hAZ8gv5J5OM1w@mail.gmail.com>
In-Reply-To: <CAJZ5v0hvD9T1y2uGq1MtFafQTRUJf2oeKEj11hAZ8gv5J5OM1w@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 8 Jan 2026 15:07:11 +0100
X-Gm-Features: AQt7F2qJ2qTAy-Nl-YM9N51CbNtXzqrY-DauEClktNVvNl_fSY8CekNAAtqqceQ
Message-ID: <CAH5fLgg1zP50iTZpOHkObq5HLQt9y+OU_=3+aaxCK4XX5HqbCA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: acpi: replace manual zero-initialization with `pin_init::zeroed()`
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Atharv Dubey <atharvd440@gmail.com>, Len Brown <lenb@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-acpi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 3:00=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.org=
> wrote:
>
> On Mon, Dec 1, 2025 at 4:52=E2=80=AFPM Atharv Dubey <atharvd440@gmail.com=
> wrote:
> >
> > Use `pin_init::zeroed()` instead of `core::mem::zeroed()` for initializ=
ing
> > `acpi_device_id`. This removes an explicit unsafe block and aligns ACPI
> > initialization with the pin-init conversion used across the Rust tree.
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/1189
> > Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
>
> A Rust-side ACK or equivalent would be welcome.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
