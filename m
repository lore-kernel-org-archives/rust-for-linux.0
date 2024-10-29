Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C163C205133
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 11:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730203162; cv=none; b=sRx4pSCIY3P2xc9G19R4mrAx4s48aYza5HQVQVgcfuu8hhXQtvu4QVhWkvitGFy8T7mJmFLgU1upFT32BMtIKOxvEdiVXl52t8+aiQkzBAX1uiAUwXGKK5pBH/K5QbIj+guacEGtadoRCRK61tQuyYS3K0dTc8mfT6xGBK1QjUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730203162; c=relaxed/simple;
	bh=KnVUXaVKB5y0TG2yLz8bQXQzHlldf0oR8DEfxOVn/Co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qqi5LHr/NFP/smvuHwKwjVMH9me04VLGkgtKn9q3p6ZWf/PS718naSpiWh9b3iqAstTeVKBhfeAoKIC4S1AxCahnM346xzzfJMgHfTZakaoEVXtqjfvKFISshO5rDCCbO4/htDb+5lkaLp7AD5S/Xp3ro9OhohffPY4KWBBIBPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q9HVOxQP; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q9HVOxQP"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539983beb19so6334803e87.3
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 04:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730203159; x=1730807959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnVUXaVKB5y0TG2yLz8bQXQzHlldf0oR8DEfxOVn/Co=;
        b=Q9HVOxQPEIysoFbSHzRVMaF2EcU9lSoSDcXUMaFrcP7Wz4JbME58ESZK+ayfVaYOM+
         tlU43+k0f3Bt9N/VAyQoGBrWjC2NRgCcMmqrVP+EUn2P5yA+5e2YJH6nVcAp5u/OeQQU
         ruAC3cJMkMwa+ZaMNfvlnZB4YEqBVzuinGHp/tx9rnr1ogGiiUSGHHPpx/5UKQiV9txn
         WiZRqz7pkGxQnuaBockNBydX+QoEyNoovT1gfj5N+YivNTqT3rMLwMSuOlsCyBTfZHyp
         a/T6M8wGi5ieHnB3nx+ga3Bj7nUAaryR5GtWNIlR4IoYqQPoZQIoxv+PvxQDJ7Qi0pR1
         JoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730203159; x=1730807959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KnVUXaVKB5y0TG2yLz8bQXQzHlldf0oR8DEfxOVn/Co=;
        b=gGxo6VxyYnAj2DzSnax8P+zdxtPuMQRVm/oyITsgrhrpGAcL7DEoAyvrIZLP19KyGL
         DQlHjs8L0dTiGWl33XqrAYPWq9NlVdYv180OaqBYd6g/ru2hxBeLCJBO26skI0a3BWB9
         1DZmegFQ2jPDWcNawl3gia4LE1XrxzXN7Vzu8KlonnWH5y10+rM4oRZp+Jo89OQgSe4M
         urWhgvgLgHy+mhslbuWXmbtWQyA14Jq8dbOAUnOjHNY9F2k1gC+SQiCufcMw+owomYY6
         kyYShqECT1elFtBMH+bJ7fZkO6PnJ8d3W97Q3WUpo5MymPOFSZ90G0P8fIQjxRKZRuq5
         SwUA==
X-Forwarded-Encrypted: i=1; AJvYcCVmtaVxNWWRJ9Ho4L4VpEoOL22OdXR30ORLT5U0Rw6N2BybELfql/dTv741WwGprBIlxsHcLikwgtqgrv/G2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOWaUDjbSM9vZz9iEVUwcXayg3njFwBmVe+8iKi1Z6cmVgNGaO
	3uzEQ5SSIASWOAs+IbJLnQYdnOfIOZNCGlo4nKQc0rElZSi1zpjCD1YP1oAKdD8Q8ly8Xwv5wcH
	VW4pcq2kjVcvQr41P/FybGc6DAD4lKrjGnZZEDRkz/efso7Q8mg==
X-Google-Smtp-Source: AGHT+IEXIWzFCFMjjrHGrHTNAb/w0zyZCb19ulrPIZWWw3Hxnr8q0Cp+66ZSr9KrOfShicv/GQzC/wNYgN3ZdxtSuEw=
X-Received: by 2002:a05:6512:110f:b0:539:ea49:d163 with SMTP id
 2adb3069b0e04-53b348c8a11mr5903365e87.21.1730203158778; Tue, 29 Oct 2024
 04:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
In-Reply-To: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Oct 2024 12:59:05 +0100
Message-ID: <CAH5fLgjmfzTU_88H4mGiv++CbBj0xB5AoiimULCEx_b0wsMmMw@mail.gmail.com>
Subject: Re: [PATCH] rust: irq: add support for request_irq()
To: Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 4:20=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Both regular and threaded versions are supported.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Why implement request_irq over devm_request_irq?

Alice
