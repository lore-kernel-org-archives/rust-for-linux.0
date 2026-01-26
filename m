Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF631B6D08
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 03:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769397229; cv=pass; b=HGl7xUh5p3tEcfX/tos8r9cqCYlJb73a3l5Uzp0DtiFHQfLOhL5soSec+ahpohJ4wJJ6CxtUEW73YhW/OxOf/zJatyR9rzAcjCUXUMLt9jcEoJrYSI5X9ja3ZD5EnBOCHDdeesh5S7TFmLz8AneUvnfFeHumacFqluLpFj6UfrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769397229; c=relaxed/simple;
	bh=/whWBNm0ykiD/YwGXH4mYk7hHVpAdvEIyZb82Q6oYCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSOcp/aRg4X/CWxdj2PgRqz01NbzYZ5ADohlkrzpQUzKu+bYpmJT7toaVkzv3TgcRbG2TepI0fQFtHd74+7vltLf/Cnc+SChCmFuMBxuYU3YuV9+urk+5+1Tv5GeSKVqj/lPdlZnx3Ypsfzh2ND6rtDXSyzCm/rtCZ8+OqypBck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjKND/Sc; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjKND/Sc"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b72b154883so119340eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 19:13:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769397225; cv=none;
        d=google.com; s=arc-20240605;
        b=HNn78mG/IBDhQ934IUnu2jsc9oxStsa1F9N4P06vnAKlkPAPxSjRkRUXVaEbx8DYlJ
         YnT/2pFUSs5+nzesoL2NIINAeSr4eJHJWKsyBDgy/ofMJF0QM1NzTIOG1/AQFPSM92l8
         4N4ApbmU/jA2O4LqaAQRVu4TgcOGKWfuU6/tKiaq5d2FdOqXO0Uh4uJEhMxj50kaEj3V
         i5X8y+6R6umjhzME1E4LzQu+ZReqlxsjr/TmoqNMf9/t54l28pk7NleHK22VMQGr9iK/
         HZQ3fD5d7y1nm5O1y7zsmAh0WkjXdxzAzf7YVxaE6E63pXxbM71f7d5iA5YiEfLzc8Vm
         GjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/whWBNm0ykiD/YwGXH4mYk7hHVpAdvEIyZb82Q6oYCI=;
        fh=dcOpm9mR2LWyHz1WN7Nxcy3Tf+1WI0tCctxdQsgW7bU=;
        b=R51Yz08ttzUaNOnSL5S3QbINz3sCTjW3RmW1YkI7yxfGfaahyucJBmgNZqeAioaGXT
         Zs+OdjB255WAVttH0+ZjNcYZmj1qbAdAno4HSYkoJ7pmizf+7xnkJ9YbZV8CuuA2CpBv
         49kCAtzmvgslCnZ19+3NJd6uarO+FAUud/QpXEw+JNNYVcdXOXt2+UVejb9UQhaqoRsk
         3QukqJNxxOfi5cFJM+d3yrgywlEnQI2RTN5c1GyEPs3cwdcJq8u/aHm2q3Xwtll24xa+
         VPJGa4/QuBzFQFnd7bTo+NwLDbpR8xcVxlInZ4YnErxJfVKXQt7Gh4YdieZ9MuluWUkk
         FOtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769397225; x=1770002025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/whWBNm0ykiD/YwGXH4mYk7hHVpAdvEIyZb82Q6oYCI=;
        b=YjKND/Sc3qSccuGJU9KZPy69HmfseyousoGk6wCyQYfIq9BZl9s8PljsAn41BJDj/u
         ebtgyajnJxNSxsqNX6ulgpVvidpdsp/TZCyeyJR6SlZzKl0yBJ6OMR4Q5zNOaBwtS0Ap
         3uf53Pu6K8vYvom4+B3fAVEwtR0aG7IN1m/fD/Mp9CYeUzSV3+gyS2vFGmrWSfMnZGta
         wDeSK2b6mHy1eCJAAl8EK02967ZBzbCRjerx/JY4hQpNgNsqjshla0dqtVsiYlOaTahr
         37jemJtpuexjJiyDLFMJWsDQgLUv0WHHBdQhL77IgWyQnsBhf3S6S+Pq+i59D6WJpw1b
         clSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769397225; x=1770002025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/whWBNm0ykiD/YwGXH4mYk7hHVpAdvEIyZb82Q6oYCI=;
        b=BgR086v76s1xEuS2DAv2gLwOlJBJtqeAvgtTOICc9yoRxKlsya1dYdqrEnXo9+Cz/0
         JxEeEm34UTnoJoIAvU5u3JpUBTni0sNr2VkSgCf7Apz9H4FSu4p5+I6YWnPMqhPc7G2a
         galRi60ZF9ekx7u+Qwk9PQ4b23jTQYGI0dFCjDFoWwkQoYRiYd4HgyHIVOB99jq3XhsQ
         c91qFN7lBW05p3LBJwNuSI4frFjQ0Y+mimSOmmk/rndJkmIab+jue6HGnSVQwzhDj4ZW
         /dywHKdvKqhw7mDQdh6MatV9lZDegxCXewTsWFl26RcxrZM7g7m6t+PWFSix4vjMMzWr
         Ejdg==
X-Forwarded-Encrypted: i=1; AJvYcCXnxG1Gf2THcc9J5PlLVzp9chuvtNcJIB0NYfQ3htY5cvjGgkKjErM6amVW7IECe/or/id59zRuJ89AuAevEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFhG5TWCmPPKJG7S2T5Y6J3m7GLZ1l5bRvYN5IMYJowyKgh1rc
	DQqvseNPIloz4twjXR7aOdKSNWr5PJLRTBGNnxlq0WQiw6j85iZdwYQxrJhVYMCA5FAL9aQS/gV
	ddiXSiJiuvrM+JaMuPvX0yvrW42xDo0M=
X-Gm-Gg: AZuq6aIF4ERkN8nZY46+H+qNOGvHbeb9ZjSRXsirTFMCbBYEeyg38Vpe14DJwMRnsPm
	U1zS0CktZekBv6QxoXYmG0ddQ8fLUqoDMEPayerK9eZIeY+Gcqe1G3bWF1iJKCyBUPdykBHeoU3
	b+Zjl9MOt/V+dEhsItNtPQY4hTW9PmUQtN1fGadTNJO4VnOSM/cwrUUV0HQb2C520QDX+ZZTSxs
	AOrZ+ru8K/6p53iJXLHV2XdYqZDUxd75bIXYzMXNIbUlWkBKvu0zQuxNbGUpvPCbEpIvyAW1HUW
	1f/X2mVKFREBQOm7F02AVyZpxo1EmkEiUoqLNDIXBvLfKtL/bPSLxvAwp7Fz6n5X6D1VoOguM/T
	aPJpPsdGM5BSEiUiTpq5Wq4U=
X-Received: by 2002:a05:7300:fd05:b0:2b0:4a1a:657 with SMTP id
 5a478bee46e88-2b764827c0amr728820eec.8.1769397225511; Sun, 25 Jan 2026
 19:13:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-fix-pin-init-crate-dependecies-v2-1-bb1c2500e54c@gmail.com>
In-Reply-To: <20260123-fix-pin-init-crate-dependecies-v2-1-bb1c2500e54c@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 04:13:32 +0100
X-Gm-Features: AZwV_QiU_u6IL7sJhHwR1xXPJKLIRMkFfN5LAiUZTCe4RKqL5x_Vf8Z0weWW0Js
Message-ID: <CANiq72nEZ6qaeN0y0nj_uDgTj1cjVCZVvycA4BA0W0wYCd_dWw@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer: fix resolution of
 #[pin_data] macros
To: engineer.jjhama@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jesung Yang <y.j3ms.n@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 2:19=E2=80=AFPM SeungJong Ha via B4 Relay
<devnull+engineer.jjhama.gmail.com@kernel.org> wrote:
>
> From: SeungJong Ha <engineer.jjhama@gmail.com>
>
> Currently, rust-analyzer fails to properly resolve structs annotated with
> `#[pin_data]`. This prevents IDE features like "Go to Definition" from
> working correctly for those structs.
>
> Add the missing configuration to `generate_rust_analyzer.py` to ensure
> the `pin-init` crate macros are handled correctly.
>
> Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
