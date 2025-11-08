Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09A41E47A3
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Nov 2025 03:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762573902; cv=none; b=WUf3mi+OIunqX6GsadQ9mNJa7N6ANrMcYOaXOWJq8x3cIlPpWq8PWnEDdsX8qj/+VEhYTqiigCeVMZGRHsLLC+doCd8N0CBAVeyfzOZvL+B1hKjzmdEx3cMRRqmE8SP2M8QmFgGNRRKHcE/QOm/g1SY751mz5+EOUnJwADKF1k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762573902; c=relaxed/simple;
	bh=q0snDR8xQE/MKs8/cvlLIB/+XXsMPIC+6i7g2yHZzn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lErsfA5CB+E1uJ7OjDNtHFny6Xym+PUblwxjIu883QR3Q5+Dx5xFr1m6cGjAVNu3P+fhMVj2LBUF72cND0PlkuBKmPyEi5vq+d5RHW0fHiAwCuqzkpqy24pzs2cpJFMfqMEDx6U4+97ZJFxLALxR4BBF260EwscL4US98NveE4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JL1EyyCj; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JL1EyyCj"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a271fc7e6bso199281b3a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 19:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762573900; x=1763178700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0snDR8xQE/MKs8/cvlLIB/+XXsMPIC+6i7g2yHZzn4=;
        b=JL1EyyCjAu4FD76MI62hxbiXz58ajDEwaLHhf9AvdWC0YzucChlJG9HGdw4gjhqpqS
         oK2Djh/BPstXaoyiofO7PAMu+GwSaZWrpRVEs6wlEQ6Kh+MNzS+PlgkxLFLm92fzv+b9
         Q3N5Uk0qP0zwPYQKamnXOC+YQQ7ANjL192xrKpqexPI/KBj3hmnq+BlvS1XWD9p3twAS
         TDMYgYV7H+I7A5k88u/gU2MKLMX9L96+EByOpbk4vJMhj8urZx72ZKZHlLgUpB7uNqbk
         QneJP/dF5ONvfO899/FjmMeNNg5wypeAyIaMN7MIzKwhkrwZ1CCNwDt/XAmfxGR+S5wy
         +TdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762573900; x=1763178700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q0snDR8xQE/MKs8/cvlLIB/+XXsMPIC+6i7g2yHZzn4=;
        b=RhzQjwN76WV6jX1B2Bws/x7kUgpSdWE7S1isbv48JhF15tdkinNQUW5pVT2QWXPA1B
         HYrZhi0BUIr6bFDCwTp6rZYVsEocmDjRElu+Pvg47UOhQ8f+Vgu2nC3Iq9hHsNBJ1Ksj
         zhRP1QmtfU3abbYTQdaFqgjeKjLyx9U9mjZYvd9M6ewsrnN/AwO/5rsCxcqlz5QFFXpu
         OcpnuhIPzKZV7uRUqf7bLfkfhm004FVcjNK3/t8RRBG6iMcsBD9nsGjvVBStTFa1Aqrk
         QO6K2ART9XRmYSRISNxaE9efWU2mF48Amk9WZ7Z2ArttKsrL++flmZsWFq9cvIivv0DC
         2nWg==
X-Forwarded-Encrypted: i=1; AJvYcCUCYvbZynzZ20WbHFaq5vZ0MTPq29Qs2eBZ07JtvMgiuXqrsw44GruKMiaa9aysA1qXu5MzkF67aZEcMe93Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy39lvKTn5xjuHfHdtwIX3OG56IUqTxBhwoeucJ4Ke+SWOmlgXr
	0/zyzrOd1r+rqh6L0+vrr0cnv/V+XPUjkNUAiubmulE3L8HB2hOjhFn4CohW2b49PoAJyznMLXN
	yCLgQ5zQPiNr7whn5/vhXPY+WUeZkLH4=
X-Gm-Gg: ASbGnctQDK9XDaqdwxbdPZXbHq0PF07NchW5yiXzBowJmpBxXV2ZcSQsWTKWQyb7u6I
	w1ES5iHYiXwMRNKN1OX9UjksXx11VL7t7vvVcpLf59CgE5ZWL7sTadXbFmscEK2uB9SdKzFU+eF
	mVc8PVaLx68iNoXlEX5agQUUFgi55TUb5o9Pz3NrTeEAnsLGSsn5n4Ju74c+rGFksg0B4HG4pGJ
	CpOHCz5Gam2YnQl9P8Wp00cMIgisae3R9Qp+ioLp4vfHG4O9JSrsvw1ecwJ6F9HkI0XO+VUFVt+
	PqnPOelVqggM5N9SSRbBFgHh81dRHzMB4lmXZwvRRKampkTmk8fD39L5XUkGR8UZrw38JmWtIfU
	hDhzYV9NVimvYWw==
X-Google-Smtp-Source: AGHT+IETjy/Whs2XDm6e4xWFe1uDWjZVP1XuxrDCcYFXxquKd3GRTQOQIBFqHWaGhyeM6BjE/k74OlI4YppE1Fy6UDU=
X-Received: by 2002:a17:902:d2c9:b0:296:4e0c:8013 with SMTP id
 d9443c01a7336-297e56d8ddbmr10595185ad.6.1762573900080; Fri, 07 Nov 2025
 19:51:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
 <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
 <CANiq72=OFO8fBpJ6xvGunYrx5hXfcjQJ=YDqFxtMPWDzfzwpKw@mail.gmail.com> <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com>
In-Reply-To: <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Nov 2025 04:51:28 +0100
X-Gm-Features: AWmQ_bnfSsY-GdPkrVyW1DX6qGnfSU4n42VV7Dd3nIzx6h8i36w7aMyP5XChm-I
Message-ID: <CANiq72ncHgjjJ_c2fdTgOO9LxmmotRS8S6pwyckLmPJG_4GPNg@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 3:40=E2=80=AFAM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> Technically speaking, bindings.o still exports ~1500 symbols even with
> newer rustc versions.

What do you mean?

Cheers,
Miguel
