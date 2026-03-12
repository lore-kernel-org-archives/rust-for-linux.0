Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587C040DFA5
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 06:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773296254; cv=pass; b=HNCPzx2qq3z4fUHwlJOHxo3mlImAIw5rLAvXWQlK1zGvIdzm7A/UYOfeOma0hdrFLtpUQItvIDgA8M1EuI0L20YUO09wMy3BT8fXYKVykS9wHKvGH84LipAQPVuzjLzhCyf++acuXFahq0o2KCfZnUPF3zYvUsez85eEfwBYxvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773296254; c=relaxed/simple;
	bh=RX7N24y863oYJrl9zA7NFk/TZvcg7d7M/s+gfvk/o/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSrHSJOcDU47LoNQMUDp2CBmiQi5foLxNCTWLGMaqNZhnqybt0GEwP8iBZx7ETha6JmbGeyokIIsurrej2ATKVxOvAp9ljQ4AOO4Y7m2GwrGqpd2bkEmMrr4jDVzH6DTs3/AgwLPzTYFhYhG5QE+v1rDGUjWTMXeppbceiakqyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMVSLFnp; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMVSLFnp"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12714f01940so15229c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 23:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773296252; cv=none;
        d=google.com; s=arc-20240605;
        b=XSzk8sgII9BrOEbI9W2Gr5WIFtfqCcyQxCIjRU2n4cSFeym/IXm8CoFQIFhqwb+/9F
         gzcumiQgm0yCWH8hVUQewXvw8eEEQhz8X6z2fprkvWrPI6ZiIHoFwLryD30bamITdXOb
         ChwGDPONhY6nXogd5NaWAhSE+MlXYudQHDiX7Ixr10cBxy6l7d4dv4fJZ0z7fnDWhPEx
         ey856iK4N4aIRdg3ZucPU1NAqY/Oxv1W44hldIAMnggpM+ysBYt8v7XGIGfCGBnLUrnA
         vf7dMj7fpS7wY3oCkha7LBzMdIaywx6tS6INYzQyw8pGpNTpE5Cl/bkyRTvLGQEvQHDA
         2zuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RX7N24y863oYJrl9zA7NFk/TZvcg7d7M/s+gfvk/o/Q=;
        fh=FRH/ehjpCyYg0kncPtrl/m7wWcDKFT75fcjzot1eEdk=;
        b=IY6sBkhFqBqvnle66+okje/MzaD3iOcVyyU8kCxiMM1ZkdVgTg9W/8suWDK+ArEIJw
         Om1oVBNsKbNUwL0rQ/MHHb1XJtW+DOT6jAg4GIhZwvwIzW0ezlGSJG3lABfspI9FTjSV
         textv9NrwnWb7+HrVzS7cO/fGLtl+vUUDfZ6RNggXfRAK4BzYHn1s4CclDBLO638tYFT
         kB6eWsBACjfEuKIDqDBoYR+EBQRJuAe35vS249I00cJR9rYbQc8h2vtgZcUWgnRUzNjY
         sbKwyLZ+ZfPKVHyVbBfAKt6yeQ4/+3NJTT67l42hTM/2vaqXpYLbWBm2FkDaiSQXWuGU
         b+Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773296252; x=1773901052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RX7N24y863oYJrl9zA7NFk/TZvcg7d7M/s+gfvk/o/Q=;
        b=HMVSLFnpCEVMIM2ixJyHtQbjoDF1+CvR9ANPoh8pc9d7wbuMX0XlX36gk5MTPaZr8d
         7L6UxUN/InZNyud/8LCmB+h+OGSEFFJ1h0aEmI3H6YMDgvSaCJyJI/jIs+zENefTQt57
         wj+ysc0NYIy1CgMj/tDjX5Pp5sA/1oxW8qITg02/Y053oN1fDA+IIdekt0s/QVbtdxj7
         TwAIMpQa29d2SMgG3OcOeJkL/X6OIRWs0v6SjfxiixjVraKgUy02eaLZliBq6og/3uZ+
         J0VbcZL29f/JU92cw41mk95y80tYvZ7cUzyQITynYsNzaa6/wscsM7dMkacT4UzMCpyT
         +1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773296252; x=1773901052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RX7N24y863oYJrl9zA7NFk/TZvcg7d7M/s+gfvk/o/Q=;
        b=O3LWlwiwO2RugurG8x7Wm4dDDmsH1ANeFcy9s1P7XQIsIC8IB0VUDrKM/E5mzS2aYw
         0fBKcdxZ5S1UTP9N+zZ4xU5uuJ/ojkmuiYae24xn1apMcnMUzfAJTjFH1IQrz1kI2rdn
         OYXl1jrwjwpnYNatj2KSbtb23FYKQOoB0VPNkthSigI50v0fEFWA0PDoT1YN94+j4d5Z
         tNN98NJqOwqLdx+Nv5XgH2mWPJeUgnIoXMGWdfADkaqVjcqXOSjCaK13BqCnfwQRvkP0
         XvY/IWA8B5X07FDh9f1hJTSo9VyrTitEu8pEsZFEnvDfQUWwArkwZeWvS7ViL6UYmKLr
         POgA==
X-Forwarded-Encrypted: i=1; AJvYcCXAB17FRYbClnfhxLkweedBZrifklJHdQETRbqBg3YihJFHzvK8bI7xXnAaEbsjLoYRMagowhc6NrpAF8Ss3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1nFDh3wZMUk00tsTHAYFvicdnuSihlutpFHw/bQ7/L8zZ8Jv+
	cg0h4CAFnz2OCSr/lC8O8sStIRlUdsA6ZX8ca+BtVl4IeD4ayYFKlczjZCj7U98O2lYXJkvFCuV
	QPWmvecu5GvRnCvy5+VUAnEB3Gf9FCdE=
X-Gm-Gg: ATEYQzzV1ybsxCz0lecPomESnMomPYzfZrgukRUym3ChcZUyvRCO/GDi8RwJ+qQUi1o
	Is/T6iebKNgpCrEDBRRmmpt5zZLg8bTZnrJvJuc8OU+DQzwIjQcWZ/Etrv4M0gybAmFcjV4VyDM
	0NzfyFJruYboW0N28cuGNA3MwtnmY56xmY2zpXmzeZa1+MJeEv4SpB+zX6Wpnuel8JEazuF7NfH
	PHHMeqY7tUsvxmAjXgKwobrUuYGJtiJY4KBpaEpVufoKfkFDpWCSE/s+BjyqwHi2p1y6uf6WLak
	hWJ1GGjwjJ7L051Q30ebmYWSOoJO1fux5rB4URDTEwuaIGZ/yTDdht8T/DxQ1LzGnKCERHYGOGd
	wYliu5jmCPhSRsaVwRVEqFLQ5CdsLr4IJrg==
X-Received: by 2002:a05:7300:fd05:b0:2b6:f2d5:2923 with SMTP id
 5a478bee46e88-2be8a586527mr1139072eec.7.1773296252320; Wed, 11 Mar 2026
 23:17:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312041934.362840-1-jhubbard@nvidia.com> <CANiq72kYpm5xZ+ppWuSg1O8zFQYgmbuJHBYh4dpgp2c7=zJJiQ@mail.gmail.com>
 <6nswew4stvp3574nrwnppt7lxxp2zmijg62qdku2jqmkhdaaw7@qdesr4fe73fl>
In-Reply-To: <6nswew4stvp3574nrwnppt7lxxp2zmijg62qdku2jqmkhdaaw7@qdesr4fe73fl>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 07:17:19 +0100
X-Gm-Features: AaiRm51Qa2FudyCou76Rapscpqw4S6II41HBPf-45BcYzbFSWmhD2xbEu1s-GAM
Message-ID: <CANiq72nCNcdQSQ4GYSWU5Zdv8SKguM7bnq8xhoQ4YubFAyy7Lg@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] rust: cpufreq: suppress clippy::double_parens in
 Policy doctest
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: John Hubbard <jhubbard@nvidia.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	"open list:CPU FREQUENCY SCALING FRAMEWORK" <linux-pm@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 7:07=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> Thanks for cc'ing us. Yeah, please take it.
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Thanks for the very quick reply! Will do.

Cheers,
Miguel
