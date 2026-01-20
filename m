Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121C7296BC1
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 21:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768942962; cv=pass; b=UnYcBQVkYxXHVdqSzLSVC1zhk9ZJBvtNbPwta2anX6w54UlZtWGP7Kif1qwc4Nq1uuyo2MKXqRghc0MysJ4vwg1QmnE/nI9amnAfbUzz4xVWIKeTJ9rGdzs9S5kMSf5V3k88xF7bwJ7CUvxM0oUgJ8ffKr7TQbm+AYhKVbjenhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768942962; c=relaxed/simple;
	bh=hxtEvCHyRDAhVIcUp+uBh5wl2Rj8HuQ+rEyrJpy6jAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enEmdLA9SwLfDRm8rXdKvQ/pC5YeUqpvN3ScEnFIWYlKBcv1pNMLzN9vA3c286M3KmyAayGxQlXJ072dvw55QvgHh+xAEuY3Vn82GkE0a6rHpc3oeoMREN+qPoH0O4HuQVck7qXBOEYFGsuj1vV4E/8/nM7MsN1uCPkPH67fNNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9d6NHst; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9d6NHst"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b6c1ec0dd6so421774eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 13:02:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768942960; cv=none;
        d=google.com; s=arc-20240605;
        b=Yav0Y8FP3nISHULJDcifms9SEvQzwZftuQigEyqL7f3P1NAOifdMtN94GcC/bXGvAy
         xBUXDorYvFu5MycIjMeh6jZ5LissrYL3B1Q6EjWY4tYjOGkRrqVqAbmwRiGn4LL9riHO
         wJ7TAN2LikQ7cjgiJSQn0F5ssBfeZgF6Gmc90vyehJ+Ei4vZCOjwfdYQ6fjq2/z6X7NH
         HVWvJPsDP/9Vzp4+iXtAFYX591HrQTLgxL/NT0c4i2hEaPZRJD21FHCdxEDHcBusVNSg
         5h5eSRRuD0t40CBvsJIEqnaOKTYD/dgpG+qlISfTAsdl1B27sDhPjt7HEQykFyMt6Uwe
         rqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hxtEvCHyRDAhVIcUp+uBh5wl2Rj8HuQ+rEyrJpy6jAg=;
        fh=MLi0uKophlgyxaPbOqGL1WU1wx+DbEaFhsGrxvSa+9c=;
        b=WXMJetfr8J75QFi9lvu0+9HBPezVJUPrjZ7H2Y1pmmgBXO8n5xjvnVrj7awgCV6/Bw
         8SpLGUPjm4pA058utT+VwfC7sD0/zjIesHhsbfY5qwCgZ8bQr8pRZJt69jzo5k6z8BEX
         UkEkQ9LonaDg5GIKXcy4YBEtecfJD9/3z8Y/Sib3Qk0Tiuq7wmezO1rbN6ArED1IAhku
         mtfVmUr9jZW1kYWrS6Hj7RWcT5NZN9acoIaBgd3ohnkhx6jwrNjPinGsYUi+xqum5znv
         YZTMiDzaUR3LdU5E0CCbQdb05w0sUlr8BXTUw358CMSJEGmoBomCXlYIUx9r3NNQokwP
         2FFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768942960; x=1769547760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxtEvCHyRDAhVIcUp+uBh5wl2Rj8HuQ+rEyrJpy6jAg=;
        b=f9d6NHstbzMmMZysZSkxREoL8LzvMnGq8NZSV47IQ+G0vlGhgWNzqlAe6M4lcq8zbR
         U8P1IudVD2LJW6xc0FcMt+Oo/98xvesytppgzB4o0E8FzEfm8cD/cJZs5Xg4ewxKMXRp
         e6HX9RbK0xI6lgyXKJq7W4EmgBo40YdCBY15LGJm3j5x7b2MIANWQv6YCNzfJ0hnj6Fb
         WRZEANpkKmYBZYLbp01vgFMLIrOKB7666Y5DR7ahjbDEGx33GDH8bRiuogqM99a44DUL
         i7pcBuetm0bfwzhTMml4pMQtaj03U303a8WctzqQappA6bqhqP4avr3xDjqLBlxup3Sa
         xIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768942960; x=1769547760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hxtEvCHyRDAhVIcUp+uBh5wl2Rj8HuQ+rEyrJpy6jAg=;
        b=Pljl2j7lK2izmC/rIejhVanZFYabuBH+Jzps2VetI6BLaiJp/43bQI6Bomt1TyoQwO
         m5rkh566Gebd4trHtvCuzCUSbevdYRfNCPtqBgN/1iM1L1p4DitBMfloVLVUiQVVYX+7
         KETjs+ZQaVwSYzTsY+bKVAND20tu1DzOpnxNLyvpDsCoT3h07r+/WkYNJg9X86NRGZ4+
         KJBZeU2jteJg+XxvmxNNqUN+u3FA8JDPpSmOiAE5+YszlGZjzVcISNAHu8aciPUFfJUW
         2uxBosOVBS6cJmEcCdfvwzQNVI4DGlWJxPt/d9Xrj4hWI/tMjoud3LMR13KlgOulVk7H
         D4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUafnkvRDYIChiKTINKe7ouTbhsRb9X7HscM0fwWEHkJ6GmRJaEHvGw2NmI0CWYbuaMZo9vgqE26dhuNlHAlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNQodFjWgiXmN3mu9L6b29BfdTXL8HYjjjtIfzte4egAgGcFSg
	m3fT4iV+0MRQAvODSPniiPpTON1/uB9CVK1ySfm6g35umfe5ID1zWj3fby4BB07SwpPGIqxoqeN
	uNaZC+gTrAat9DUejSSnNrdtoPPAzbCw=
X-Gm-Gg: AZuq6aLywZZ5/xGo8mhg1fIBTeZu4XZueeuczVxtPIwCpT7QfH9qsL4mEgJUz3HdkDD
	fNSx+2r7s8RSWNhwUBRgzFvvCQV554bIlep+mafyCuF9nHgVlUIVNQTWtshzG+7wD/uQD4X8yLM
	ly+lE62v/0g3QZrV9kt69hes7q+1EKe0hn8Tp6LG4+h3OlIXzVD1iPtbe849Ju7tEM8j/UwI84G
	rzv8ArDOFEeeMvZL+tY01YVcVs1KiK15XXYMrx1qLNoTguhh1IMzux4znFmd1yo3wkr2SWgI4q1
	/59Z5Pa/RG1gxPLlF4TTJ6J0+do8EXUkwlzoI2+c0IZqvPDnqBQVqwGTjcwarKRzKt3euhWcwVw
	NecnTI4ItO9s0
X-Received: by 2002:a05:7300:3f2a:b0:2b6:ffc8:42ca with SMTP id
 5a478bee46e88-2b6ffc8463fmr949420eec.2.1768942958523; Tue, 20 Jan 2026
 13:02:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com> <f12b84b7-4972-47ee-a79e-61e8d1ad49b2@de.bosch.com>
 <CANiq72kEVrYWbs9zOtP-h83TTmrOBBqkKEETUqSLZJ47=L6sFA@mail.gmail.com>
 <c17c1506-6ac5-49d4-b5ef-34d90dcaa41b@de.bosch.com> <CANiq72kNbBgiHHMpGA5FO5v3NvtLzJKHKiKDPf8XTPDwF1TQzg@mail.gmail.com>
 <DFTG4D3D2V3C.1IL4WF5W3H2PT@nvidia.com>
In-Reply-To: <DFTG4D3D2V3C.1IL4WF5W3H2PT@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 22:02:25 +0100
X-Gm-Features: AZwV_QggKXqFiZlljnL5wM-qem2L3-CJFkVWevK0D16dvg1kdzeS8eOK5RfPLzk
Message-ID: <CANiq72nxor1_d-b7=eH9mObddyJ5mbW5jStGSamGq+jL17ebqw@mail.gmail.com>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 2:20=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> We can avoid the feature altogether, but it is of course more convenient
> if we can infer these generic parameters when possible. But if you
> prefer we eschew that, no big deal. One can even argue the code is more
> readable that way.

As long as it builds (infers) properly with the minimum version, it
seems fine to me to use.

> I haven't found how to enable it for doctests anyway - maybe this is not
> currently doable?

"World-available" features are enabled for the entire kernel,
including doctests (this is what I meant in my reply to Dirk).

We list them in the `rust_allowed_features` line in `scripts/Makefile.build=
`.

Thanks!

Cheers,
Miguel
