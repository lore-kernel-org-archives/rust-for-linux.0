Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6D536A01A
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 15:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612635; cv=pass; b=H25H4H7q0t/GGnRzA2tidGUlgiGeYLbvVXOtlnIhompX7DoE6/lUj1Z3SpSB/sfMQ0nNcFgIIlG3mf++KK0nRyVWPpKMVDNp9nAQXzwxssHTBss5RupipafjLHw/c6NkXNe4XkJEdAv9x2HCtRCC8log5SWEj2Uk/7C3J3XSxOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612635; c=relaxed/simple;
	bh=VO4Ky5HY2RUmCUcmhGjhcXyFbt8pVYo4+/XtVydTuPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWAaPKeVZUX5kfJoeqoAu9I1rELm6rHNp+X24d87y0gonI6JAPvHOs4oechQjUNyz353WeSwdPJ+wvDrf7+2Qoq+m3zJxVRXnsrtbqWsHZZhUDEEWvEi+mQodSrzOjSk52UcXHkVNLurPYrkAG7vTzdDFUMh/DWtyIs0HgF/cyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSkcKTjT; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSkcKTjT"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1233608c7e9so821554c88.2
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 07:03:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769612623; cv=none;
        d=google.com; s=arc-20240605;
        b=RUhebE7VpHbc89dU5EpZif58O76ncbFHzWW0MSsfR8UnzQ4CGFZdaSzqN8NY8AoImI
         keDhRc1vgjbuwzJ4mB6ktpi78cIC96QyJVE1JQvuHlVqCdFRvbFuos2bW5SQNx+o7PwD
         EVTwE/gY0JBeO6zuX3fCKvYCSvEXP88928g/Ul0crjjgGI4aDPpNWRphaX7+Ksisfgz/
         twRV5e5UkItPCRPR3ozTdqlpoSYZLWTw63tlR7W0EFTSogEncfHqSoxJAYxNvQQHDab0
         rx9dNrJ1jmS+ra04oUhAPHL42u1zRNvLGk5mqCVRFm6gNdzl5d7PLiE2d1GaDVJuGHKc
         4avg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VO4Ky5HY2RUmCUcmhGjhcXyFbt8pVYo4+/XtVydTuPU=;
        fh=6oW4PB7KL+uqErDBTxGqDhJEgEdimWi8pNyE2CN6vNA=;
        b=UgwRPKuyOk9d10aAte86eCU/GVCbg2yP4Ohw8oeBJ71kPZxNMSj3DOXJPE9I53NgwB
         gcPljbichbM3/06agiz3g4nCLkn0Xdc3gtVZb4cqq29Sws8uB+48Mvaauey+1B6C2tlu
         SFPlepVhwks8xiP/ZP25xgLAx45zC1esq+E7ILI9roReMfFA6fWa62/91ClAHtYnyDAx
         v6SWHo92AaC8AfZGMY2gmXM8tWUGlF54iAzK9p26AcbsFwA8BzgSHA3sAVIEcgz3fw/z
         hWRCblbNgGdwNGMTusHPwE+htTG3wqJH5Ccgmsn+3+aYxGUDWISqdtBcDUe9fwdWjAdM
         IUBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769612623; x=1770217423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VO4Ky5HY2RUmCUcmhGjhcXyFbt8pVYo4+/XtVydTuPU=;
        b=KSkcKTjTUvGB303UA10JIQu9xOxD+2aevLzUF2D8DehuiSmB0XGqhVRUX9biE7nRka
         VtRaYxxnUG8NuZkRaUEEsEbOBeH7iQGW+HOi0jsVMw6r8/1RTUQCZ1kRlg/M8zddNSDP
         NXoYad4zw9VttggD9lfhQT8qzMgL93Z2/sXbY+8KcUyduBjPESVRecQrTONfiKZH8vX3
         RzZGFz5OhIj6feKs9Hj69EVqcPIpZZ28WHL/e0/8nAv6/fEzqwfNAOKTLXih8WBBcOKE
         BUEVVZDilG7koswMbpoFW0eOqH7hJcKSHgLcRNmymsqNI3/0z3edA6p7/B9MNwGneg3S
         bH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769612623; x=1770217423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VO4Ky5HY2RUmCUcmhGjhcXyFbt8pVYo4+/XtVydTuPU=;
        b=NLjUDi+hPcoEGcZJwpCEpWMNIYL/rRpJSZToB5vFJ+A+mGwvesgleonLjg278Z8KHq
         ysg0W74XzF4whhXqJnd0ta8uQT748cmoHGkvX4I2GgCdsCDTBt8IeTzdULef/4X1Iu4k
         /Svp9qZGDPk3d4d6e27ziYe0ljavW6VAZGP7mQFc0wZPZ2/Hkb71ww7J7Q48WSZ3aVYP
         P6sa6WTW3m/eF6Pg1OfrAldwpxJXqJLxQlj3UpXMl9L1neKNYsBIZ7xgarqJUqK6vygR
         I3ShELkSTESumacSEAu42a15IgmXeqNHNlEdqkwD6DKAgooKUZRxRrZl/OfgxPJh/kXI
         vzkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK25c2QVkzevLmfHiVXL9ofXt9umzmD7e0mfNbHnWRfLF/XWaJaHcsK+QSERf65FnVv4xN9fysWlyJUIdHgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YymzRmP2Be+6A/h/bDmFxgwOJVNlCebgIWwtMBjcQaC6VbIJSD4
	bq/YUncfMzep9h7TPf0TymJFDEZQLYzzYNjC9YsztZqyP4oUeXgZLKbT0qiV8odel8tW5s/QYXQ
	5t/SMZ4aanah9VvYgdDxtWUrVVz8wWTE=
X-Gm-Gg: AZuq6aKd0m/my79Ec3z0zbmTDZnnznr0IpTJqHpMH99yJlXPR6U6H504w3oEgyNlXqz
	/+Um+mjrnQElcjUJmynfYS3jML9C/tv253ys7Of77MiCbMKNLkvah6C40VZbicGTAmoVDlZIk+b
	mlZjLMBNl1r6TN3CIH0h1SI0K1AF2LXnojTmMSZd+NaZHpd3Mty1XkX6g8C48FUj4BUgb/3ZNGm
	QUgv3NqGWGurKPT9C5N9sNrYSAC3oz68HLqcX260LqluTQjxlrWbSYptBtaUSwyemvCDtYUmbse
	01q+C9SXmlGhYJgklv1QzBwFVTEIDucOEJkejXCVjLY4WqpOtXylvt2RIMrw+8PpqFZWVb3VbuD
	xYR4FhBTrcZPxxKKEjSTwebg=
X-Received: by 2002:a05:7300:e616:b0:2ab:ca55:89cb with SMTP id
 5a478bee46e88-2b7af7b668emr94842eec.6.1769612622868; Wed, 28 Jan 2026
 07:03:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122101027.1427972-1-lossin@kernel.org>
In-Reply-To: <20260122101027.1427972-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Jan 2026 16:03:30 +0100
X-Gm-Features: AZwV_Qh5rF6oB2xMkYu2rFQ2OTjk7U_rkbwFZAsCUezmVypugWxDfO20Bjqp4sg
Message-ID: <CANiq72mb0s4_gAW2wOQ=JBcpzkLg5tHA1TQ01V9WoFUqv7Pi7A@mail.gmail.com>
Subject: Re: [GIT PULL] Rust pin-init for v7.0
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Tamir Duberstein <tamird@gmail.com>, 
	Alban Kurti <kurti@invicto.ai>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 11:10=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> Hi Miguel,
>
> Lot's of changes in this one, mainly the `syn` rewrite, but also some
> smaller changes such as removing the `try_` versions of the macros in
> pin-init (the kernel still declares its own).
>
> All commits have been in linux-next since Monday.
>
> The first commit in my tree is also in the `syn` patch series from Gary
> [1], to avoid problems it should be merged after this tag. There also is
> a "phantom conflict" with 74e15ac34b098 ("scripts:
> generate_rust_analyzer: Add pin_init_internal deps") in rust-fixes,
> which you already saw in linux-next [2]. Otherwise no conflicts
> expected.
>
> Please pull for v7.0 -- thanks!

Merged into `rust-next` and Gary's series (without his first patch)
right after that -- thank you!

By the way, in the PR message, it would be nice if you could use the
imperative, since that is nowadays the style maintainers should use
for PRs. I reworded it a bit to conform, please take a look.

e.g. instead of "'...' now support ...", I wrote "Support ... in
'...'" (and so on).

Cheers,
Miguel
