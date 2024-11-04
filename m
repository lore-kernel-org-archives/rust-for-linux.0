Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADD770837
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 20:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730751498; cv=none; b=epi64pkmvafzKCzISXkCV+4+53IEKdfQHGaAutblo8/nk85vKBF4UeIHPcd1Toniq2y26ocS8vgJT27dPdhjn7jmDRunk9aRAJys/sik/o9jv7Exq+s1F9Abkta4Wrewx7zU2VzuPSDvBF2VJQlwG7Hwe3hT88/BxoejlMBgOIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730751498; c=relaxed/simple;
	bh=Xdrxv2W/sXpcq2ASiz1FR7TgnF3SD9rSzs8ZNteGqiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWxDbFNTNzff9wvMpg2d8hRiWI7+09KNDmrXb8eT8HXCsHBrZrEjBSacs9Pg1niw71DAl8JUVkKYdQeaQSeEr1waRAgf1qRdlmDCkE9gW7LReJoHj2RBM2lPcS7G1cJKjZVWm8ImIv/DLxw4EeUbA+qk9GGYQubS8Aan8Drn08k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEKWGpBu; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEKWGpBu"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2d83f15f3so432432a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Nov 2024 12:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730751496; x=1731356296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSzCsMfED1b9KwLlny/kvLbMmfxe2oaOuXpMRkCUdJo=;
        b=dEKWGpBue6I5RIQ5+jK8Hb27q7geXbY/q12YXxA1BtRaFY5csVqqj5DDsFwnXK3wkw
         wLOu4ioHSmkpIhU7xE5e88rdgXa34qxltsZ2SnuZ3QZFQUutx06d3dNk7TFTjdjy0Bzx
         WPf0jqQghPzFqrI/lSJvsEmUvbrUkJl7qm1E1uKEqg7s1UylzJNGRnMOe0ZLTR1SAUxi
         yF5AJCzcn4Dq7rI1c2HDlACX2piviT4uk1Fn1IZ2Gvm22S11Q4MQgxMy+E4aWNk0IwSV
         XZytecHQz4K4ZaU5JEt5CNkNcUTSWwZpIJing5Z401UtmLUU8HXsqqsucbzYrFbmhKwv
         /rNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730751496; x=1731356296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSzCsMfED1b9KwLlny/kvLbMmfxe2oaOuXpMRkCUdJo=;
        b=nWfBPSkdwjgYwVFiRntrKMJlDGpMI8IP8aM7l6pWvh0HQc3utJ6BlnHcgPIiTHm9/a
         5jnxaadPV6fPipPW15ELNeGjoldhwaOw+Qwj0u/ODCpOXqUcAhRFIQUKi1QvnxHoMjKx
         gcKGWJTIkeXxfQGFqtT2DxbIEGsrxOz/YMhG6zHNDaflVusQVl7r3WzIuAMRoRjBPe8o
         fqPgHUMzltfFa2S0Xax17YlhXQhmmm5O1EVqobxtRSWaVyTkVlVyfnEZXewgwhgNOREQ
         aeOwyQXQunEN2wmlkBFnaf4pU1yWkQuTGgysmHfsT4ehNLtrnOWFcOPJG2H1ST/Wfnz+
         Et5g==
X-Forwarded-Encrypted: i=1; AJvYcCWN4FYyJhI3dhkc44KFFWeyr66AxQ9bXLflLZiTMHEaOB5ewL+MsCxYQqzVqFtH9lyQ1XvG8b2pr/RIpeXTLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQKmXvIEvp0lFNKOjyWAqLub9qZ7qgt40RKUKYVfuIVc65AuMG
	sYy7gyz/0xdr87HPaCaXlj2ePWQRAsu9zPv0aNH+bs/PRtGuUYhlpHDfixUaqzrvn5tCRImPZuD
	yCWX+fozw171PaoXYdH6L56yiCUQ=
X-Google-Smtp-Source: AGHT+IHgwt5zYbaDYAOWQHoSrwVkhJrEz51Hekjdu2cIJiOyo8xxKpiV3BId8sqyVP9Uq7JEOBG+eMN7mJTRgWcTK3c=
X-Received: by 2002:a17:90b:388d:b0:2e9:4a0c:252f with SMTP id
 98e67ed59e1d1-2e94a0c256bmr7118297a91.1.1730751496554; Mon, 04 Nov 2024
 12:18:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104185135.18974-1-daniel@sedlak.dev>
In-Reply-To: <20241104185135.18974-1-daniel@sedlak.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 4 Nov 2024 21:18:04 +0100
Message-ID: <CANiq72=q1_BypA5rJAYVsRAk3rMYpePALyzGVUL_WEVrh5eEWQ@mail.gmail.com>
Subject: Re: [PATCH] rust: error: make `from_errno` use `try_from_errno`
To: Daniel Sedlak <daniel@sedlak.dev>, 
	Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, Nov 4, 2024 at 7:52=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> wr=
ote:
>
> Thanks to this simplification we are able to remove
> another redundant `unsafe`.

Please describe a bit the change, i.e. the "what" (this describes the
"why", which is needed to, so that is good).

> Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>

Please add the Suggested-by and the Link tags as mentioned in the issue.

> -        if errno < -(bindings::MAX_ERRNO as i32) || errno >=3D 0 {
> +        if let Some(error) =3D Self::try_from_errno(errno) {
> +            error
> +        } else {

Could we use `let else` here to simplify even further?

Please also see the discussion about who will finally send the patch
and whether to have you both as co-authors at:

    https://lore.kernel.org/rust-for-linux/CANiq72=3DfcjmDqqYT+wLKNr1qQRgco=
maBcaedUxzLXmiLvU5hrQ@mail.gmail.com/

Thanks!

Cheers,
Miguel
