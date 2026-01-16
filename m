Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C0C37998A
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 11:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563944; cv=pass; b=W/9n1Rp+GE+CCG6Yr4zkP05FejwqP5qzXSFWmUXtXPViBtf/Be4PiZk44O9aPqhm/R80taU3wHvxXSDtVaNCwSby60pGv2eH2LsR4Jl++3H44SqW2jydhJnkA/8x6gb7S0DQQy+edtteXhOo1qeHNPA+xWbhBr5xEPWf/3x6QWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563944; c=relaxed/simple;
	bh=pTJDT6aBf5f2SgUDw2Y1HK0c40HgHOOicrIIXRU7nrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZryYIgNeXa1lHiwYLfs9oK6xVRyDPhwT8eRt/UFWDa8zUW5OdTIJI+VdrlFvioupB3z157ZvjWqHLIC9h5C48mfyXnWBvxq5SaRUupLYZ8qF3JZjgwFB+n3bVuGRO8Fai3bq+HIid8MvKK5F4dCXFRKfyOMvSV9D6VLrX3qMSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftQZ+rdP; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftQZ+rdP"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1244bce2c17so57061c88.1
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 03:45:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768563942; cv=none;
        d=google.com; s=arc-20240605;
        b=XtKZYvnA8Djzj+lakHzcKic9+oaWGg7xEbl4HFsFhPNcnyjmrAKu78/Od4Xz4P9HZa
         vbk3X6WT24d6zkKBkUYb0mjYitkuKtVVR6e3reTAutfDKQPyucfMS1n1/siSgnSBQM8Y
         Msq09kgMhCnv6a2Q6VruC34NmpnyMTzXreiCrFWc/uFqljs4SBLPnAZ2scqt10uuI1hg
         +0XI0TyzGu97qDl3abd+HFF6dNPENnkMHAgGTTRcrd3Byn6ZxZAwV/mokRHQyF88OuYM
         dv0doP5qa6xaV+SlV/fwptjQehJN+a6InRUlCHaRL9/pQDE8ms8IDArz4MG4sA6Lbdv5
         9qpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pTJDT6aBf5f2SgUDw2Y1HK0c40HgHOOicrIIXRU7nrc=;
        fh=QH3UOcC1/hiDSdfT5xN7V0b8RFh29qFxkFpzGUkAsLg=;
        b=AizQTQZW0v7XcjZX05upWFJMdSoPO8Q6cu3k/MsgCT4fDZ7pzQI7QOMu0eWjKKKKe/
         UgyOhCEUn0TXpgGEdpFpWu0nT/Q0SiNtaTsYuLSf6J4n3IZH8lz36NYQ2DRIngnKm6gP
         pSPH8Sfu9bvAmTAKMqZqm7+gV1R+ON5TWJ01j3q+bpQQ3RjfVTZKfPYc6ih/0xIqEodI
         4mk7kFNLo3WLz9UO6Fxp5faMa7ESgfSiMubvhsne3lUhYO2mu4vA1xYgIqkd5Svv3q1c
         DpgGeUCBWzvrLih952KWJ8w7dOLsZ4KVogfiA+zCWCk3hmo7ltBF2iEYZq8UWYa/p7+a
         eQpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768563942; x=1769168742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTJDT6aBf5f2SgUDw2Y1HK0c40HgHOOicrIIXRU7nrc=;
        b=ftQZ+rdPu+KCwNQNzIyzTo88PpBHmfAC497r1c9HDY+90I1SYN90jHPgDcvxEQYd8T
         2iFlvRY1omULGhpQHu+c6DZeN3WxPcyCQp5FqS6j+Jol6nFoegbd7bpFVacrYhRj5Xog
         yyJKH+VyyF6ovifq8ELpEE83G5uxss5nQ1kPGJ84qtHVBruoDZhqbiOOv2mM425VOZ+Q
         +piydc2O1PTkiFYCmyrtzpELAMbNA+Cg0JWM8/NSkjNQP7cXrYuEN1CuEorDkBVs8/A7
         ISokM8eqO5WKn4+n73YwBCDu+Gbes/5y9yoEJtqf33s00vrKSQCmmNHKKSY2K1y2dULC
         Mgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768563942; x=1769168742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pTJDT6aBf5f2SgUDw2Y1HK0c40HgHOOicrIIXRU7nrc=;
        b=YNTePRrAh18EjCUkyC8c8HurIUb47Ru320GGzD5s53yFdT0UsvQf/Gq9j41gVmsP+M
         tOMTKPwcVuKmX4Lg8s7LCLLyCezDsCt7tX7wojHFE3Qv7oEcNl8DzBmrr4txHnwKhIu5
         CmYaLVB0ECf0A3GPPHlZUnsq0+CpjrsLHtyyhtc4Bt4+bifazaSkwmSibMFpYEJwQnWP
         NQoWWolM39iryqusn0gf7ypgjyAyhnkA4M0cwW6YPrZ2tNLW04zzZi0oxLQeMbKBo0Jv
         nZDpELqFqQoIbECLUGSqQ/VQdt0S5Z/EZ1t/prUMEOZtRkoVSFE/PZ3MIx0EqwaReL+9
         3mYA==
X-Forwarded-Encrypted: i=1; AJvYcCWhxnu5E2rbrNrdht2P0+ageRCeHVjrBTgjmap76EmPCnViE+qGDQJCPMs+lgSJguUmO1bQlD0jrn7Uj+KhIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt1sW+q2KG6wG4K2mqr36R4yOF0jC61+Jl4Pn39sb89Jq6Ukta
	6ZjXDGfMkwjaA/v2kbxb87Ys0D4bKjUQtT7tFnrFtPokqt6Dcv4yv29ov/CQi5N2JGDj3pp3ZSp
	i4wxGOHo/qFiieOEvmBy8qsfY0P2mBRE=
X-Gm-Gg: AY/fxX48sZ71e3lWSZWfOm+Od+XG5Gt05Tr5G7z0Z10W0+s5H76kjGcKsu2lzGQTQMc
	n/319bh6u6DG7GIvsXdYZmoNjdS3E9zjwTlCfjYTXEgq9HgZXrd0UO6MRs1zP8yg7obc5TRfVZv
	NCDAPFRU7JGqDGpHCKZqpH/qLpmCZZFA9GbA3cACHYYMKfy/PsDcbYW8TLqo18Zgi1+e+e8o68a
	JQ8u1QVj6fkM3t2RDJkvin0US9WEj63xZ5JrJOK/w2rx9FrOB5praoebueLJPUqd2QBE2CIPbC1
	tuUY8cCUdwt43OiXLzg+u6xJpooaiU451qAmU/uf85WK6m8U9fB+z/faqpKbN3/j81r+x1TAsXM
	9ajMB/pFXwlc4
X-Received: by 2002:a05:7300:c88:b0:2ab:ca55:8942 with SMTP id
 5a478bee46e88-2b6b41158fdmr1228451eec.9.1768563942070; Fri, 16 Jan 2026
 03:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115183832.46595-1-ojeda@kernel.org> <20260116050046.GA1452322@ax162>
In-Reply-To: <20260116050046.GA1452322@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 16 Jan 2026 12:45:29 +0100
X-Gm-Features: AZwV_QhV6K-qT3UXCGRcMn9P3-NDEJ2FPKUMtsDwU-sRw8aTakC0RUNjVyAPQqo
Message-ID: <CANiq72n71Pm84F3CvFebdXumHp5xfe9+DPberh_64v_8do1qDg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: give `--config-path` to `rustfmt` in `.rsi` target
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 6:00=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> I assume you will take this via the Rust tree?

Yeah, either way is fine, but I can put it in `rust-fixes` since I
will send a PR in a few days.

Thanks!

Cheers,
Miguel
