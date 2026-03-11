Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FEF304BA3
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 06:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211755; cv=pass; b=cBgflM2r4jtcqbSyyPq9E6qPMnqLQ/oWlm/XhUQeb1pODS/p/bOGBOZ5iCw3QOtKNE7BqbrFSqjTq3BHQzcwZnJf+RPfMQkQak3Tzb7Gnd0Y1hpdeyfT+1POt1RGWXVuVjrb6HHozDuVAnuZKR2bnBCcQSIhuP1QOJpwocafdIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211755; c=relaxed/simple;
	bh=Fwh/MO9o7v7NCtTYLqcTvPNYtsTkXid+IQD5AJSnjKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIUsY/jZKZF2dtjTtD0lXSewG/7kOmIhoAX0n1DKKrGrNYOhG0f/HenqQ36ROA+/rnv6Ouvq93/Pb2c9Vvc8WBSHWEXq5Cu9JGH3KV0EMEJXIaA2Cu9ZlwZtNEFTLXrpOssaleUiUM2WQKnKGXX1V+4eslAPhh51XsGmeM5zCL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=elcP7mWF; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="elcP7mWF"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439c4bde55cso5399929f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 23:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773211750; cv=none;
        d=google.com; s=arc-20240605;
        b=CnWhGlcR1vc4DWUSsqcRPJt06XvHgYS760jTsQougbBkwE/IEK6C2u0wWO2gQO86kn
         cFRDeysJybxg/9bK4ovnmH3n7XSgKgAWUB1LT/4lPTPVq/F+jS1O/zN0uNLmccIZSxh7
         ro9zf54Axdh6FAl80OIq0u9BhmWq18bfYDIWS0TdWk7QHrsdYOff0UBKZaG/vnVf9y4a
         4Ec7X4E1ikalnyd0c1SPnZIGDsdnwBjFZjcl4ETiGsoFz1P1FuBtKgtE795V8Wb6zQMM
         0T4HgzaptFw4+Q2TPANsRWL6yAkmvA1G/TriS0bQZNYBaJj26Tm3mqEkZ8pVQ8JBft+N
         4Z+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SrnqWnXBXRIKJhr9pVR4ushv0J6oSE6ak7AT4kSjDVg=;
        fh=fwBygBgZU51XRE/jDKp33EVtpqtg7JkkaKpJr+kiBXc=;
        b=EPhcBouba5YN/s8zC0tHp4xByTfPtXCo2C+bCw45UzivMcaJ2tLVRIwE1oZ1PCA0Mr
         +1/wmTv6JnrCQcInJ2LinlXXairzssKJFeWUh5HqURfxoXAIP/B0L7lrQBDHddkYIXoi
         y5sA3QBraFKrg4rANOfaqtQECR93yM0fUeAw10ROfJgZiJnLn3TydZKnzY9OuYsA3U7/
         lf+F4+4pqIEJ10Rh2FcyUej8ot8JwheoRSPJu2VdPNsekG8SNjK1VnjP8KgHJTZkseA/
         x3RCsx1Lgap1+nRqTzTmQG8FjY/BHeGZRMOGIqQjwPiV34lsMagzmnaTyECtZlumiA4F
         d4yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773211750; x=1773816550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrnqWnXBXRIKJhr9pVR4ushv0J6oSE6ak7AT4kSjDVg=;
        b=elcP7mWFqtONYIFpEXj+rVXkCEvnxKYe0ctbTINVsxP0xy0Uen9AbxrmPwnjm+uTGe
         q0qoCkMjTg3UBy5p1lZX9Cs5S48IVMHVCqXL8UOxdzotW5Vqmy0KeF+TO+LM0ng/Xq0f
         1R8mwkbAF4fAw9j4JQrI0u4/Hs84tEr84uDkd8qW7tYQFtJCSaLQuhah0AvvBpXgFiDK
         dYYkiAHtQzdLQS7yMuoPz7mgMH0+AMi+hEQdLd9/0sPS4EmXoQAVC9ReLYLJAmVO7Nu9
         lUUOoZprKXgk/rieHTmyEuZbustXKDKQym7BPWoTR1LcGPhAgjPB2Dod6ahQRwGBwzyb
         EUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773211750; x=1773816550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SrnqWnXBXRIKJhr9pVR4ushv0J6oSE6ak7AT4kSjDVg=;
        b=eX6ujJ5UJta3GLTwxttL/Jyq0ioIWl8j8QXme/BkVjMesM9ScMnGKxn4Cecdkd/hex
         AQxbZ8D0LI9CmfKOK7DFvXF6fRa8vUmIe5r6wVnwX1cJFJDKTaOIEwVZ1cC1G+QmQTDK
         hcx17bB4kBFR5+Q9OgiQ2FA3om10Uq6f+yHOdHNI0Vu9VB8Jhh4EsgrbCs9iMUprMmLz
         5UiQVxpJpj2YSUKnqrnPrJ3SDnJYhAruDDFluy/LNzNqhB+B0PneYsrf1svUHHMFf76P
         VK5SouhXIebZxj3SJiqoRE0DdTiPe3d+X6xWP3vIagaD5kY5l1xjjAnvLJawY5D4h3dA
         f4xw==
X-Gm-Message-State: AOJu0Yy2e29nmKO0JBLa6PTh0VgNDzN8aIo4qfm/NBqeNv58gjJDfqHZ
	SncWsnwYnH+Oq7HIrk0p66oSP8ZWGcYxHlkpzufHBWXPZcxt4SIrGDKXh8okCBrluinAAcP363J
	zK0StLOWPiHpfwVOAjyrsvShsVStKBhruBFwxxxTz
X-Gm-Gg: ATEYQzzFkb/lSfhqU4B2fLc0C+qWhq9EoUx1UXLQjMw1cTFTPddOS9sEdakqjzIud8E
	kwlmeCIuIaBgJyh4E74B+UXGr0YHdMA8huJzJuPoqo1mbTfrhnLcQDUUeYh2IO20jvXxJ8VCAMi
	55/lSvSLmgnKtowpjUf9PeG3ZSVOZ1ejOB9YiqOYMXkT7B6ksIksSmBTDSWTuD0aCjtslJU8SdF
	RvBaQwCHyY96DxJ9K/Zmyydm+uPVprSGP/N0hSyYP5qoTgq92Fl8/N+h1Khsd92rQW+neguTne1
	LRYiUrDTPKcJnj6I+zU9FoHuCXnw2Ud0qjYdk9aVPwQRBs8C
X-Received: by 2002:a05:6000:1788:b0:439:c799:dbf2 with SMTP id
 ffacd0b85a97d-439f81f3d9dmr2811088f8f.9.1773211750085; Tue, 10 Mar 2026
 23:49:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0102019cdb4c6011-735b3e40-8c94-4c16-ae3f-80c912784e51-000000@eu-west-1.amazonses.com>
In-Reply-To: <0102019cdb4c6011-735b3e40-8c94-4c16-ae3f-80c912784e51-000000@eu-west-1.amazonses.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Mar 2026 07:48:57 +0100
X-Gm-Features: AaiRm52RB6hHkAmkJjJ7pNSI-4ccOnoHfzdE2Qw50EvTH2Nnf2GCROwwpkRGuWg
Message-ID: <CAH5fLgiQm=2YYvmG54o-MEt2m8x5V5xZrtmsqEUtuB9OZ=FPOw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] rust: lsm: introduce safe Rust abstractions for
 the LSM framework
To: Jamie Lindsey <jamie@matrixforgelabs.com>
Cc: rust-for-linux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	ojeda@kernel.org, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 6:09=E2=80=AFAM Jamie Lindsey <jamie@matrixforgelab=
s.com> wrote:
>
> v2: add missing Signed-off-by tags, fix short commit hash in patch 4.
> No code changes from v1.
>
> This series introduces the first safe Rust abstractions for the Linux
> Security Module (LSM) framework.  It allows a complete, policy-enforcing
> LSM to be written entirely in Rust with no C boilerplate required from
> the LSM author.
>
> --- Motivation ---
>
> The LSM framework is a natural target for Rust: hook registration is
> unsafe by nature (raw function pointers, C ABI, __randomize_layout on
> the hook list struct), and the trait system can enforce correct
> implementation at compile time.

Hi Jamie,

What is the intended end-user of these abstractions?

Alice
