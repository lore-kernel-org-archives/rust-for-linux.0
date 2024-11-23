Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3D11862A
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 19:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732389179; cv=none; b=f+vLCALvTjjAEo4wasj8rAWM72tzAkJSImjSim+YnSD7i5UHEUQpoQchvIk/GcTj2QrnAfnY+RK4N4tiXY5MEZGcpakg2608anReoCDoaiGPdAYWNyLutvFQ8qhC9TG8klmR5cvoARLK6tgf/iAAn0yO7rhhXeLqqMAZSA0YkXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732389179; c=relaxed/simple;
	bh=lUmiM4GQsFH8U+Bldng6hoodakaDO1ThQv3dahisVQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R7wv23zsseQ3k7LVwKeBN18t68whyrRPEOev5jL9WThaLF0Rng5tzxWJnxxj/iVfkAg9No3O/ld8I4+cDtal4VCCku6X1+f9bthaQY1CGgLwDTh4FfPtecdgmspjKVbMSe9F2XNUwoU/I0Kxw5XAOOFFV8pXTH5XudkkybIF708=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3OrGd+6; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3OrGd+6"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ea2820efacso393717a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 11:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732389177; x=1732993977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUmiM4GQsFH8U+Bldng6hoodakaDO1ThQv3dahisVQE=;
        b=k3OrGd+61jL0WlSOQkEdA3F+Jue8vpCEFh/fpddVkME/rSKSlylI5Mhkeeif5SjZYo
         W6DwJWwcNxFfPqpMCifMXjn9g7ZoDrJpAuERku0yi2Huhggtn69613bHmhuZpMjvNIjx
         /IfdFqry/nAtAQmY/VCY+Zxxpd+RyJhh/UF7/STyzDM7IABH1yUcWLTRcQOldgArnZdY
         t6Pqzod3I+2S2RM1Ya6ntTpszqziXexCtk2vqsx6YeUCN91NqfzHoB19N3RyJEjFNPAQ
         GXC0Ee3BEu9+mWy5T3BzC37Sw1vEgWw5Gf7iZOys+tq/p+Yl+4zHFB5FG2euBLRXzvmz
         n/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732389177; x=1732993977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUmiM4GQsFH8U+Bldng6hoodakaDO1ThQv3dahisVQE=;
        b=fns44FhxadRAijAwxLdXuJPXuG36lAgRBOP+ldKN+b3PF9aZ5yhI7cm60EnBpA+EQI
         6DkUKypGQ+pGzxuk15iQwdTOSjEt0bXeEn3cyu29WACtemv5RoHYEH4zGGD1t31uCcj7
         /Ps2DmBYTMPwMfkqo1ZeOSbe15Dcr2Ez+IiBR5HWpyGkWlKUsLS6LiUDcMI7I22pjQpS
         I3KO6JRXO7GPYB4AY8bHOrW+czL/zIbeCOxj3E77sICTMIPIUiPNCWmaUjco+d/+toZs
         I9n7/azf5dl/PZwxRQgPvbVzpGnAUVfqa9d5d4m3iNN2qqCVu23gAV8BjdueRzdjCzmQ
         j19A==
X-Forwarded-Encrypted: i=1; AJvYcCXQOIysVd1z51fisQ+ieENY+x9Pb4Xoy9henV9mCsZTaSq/HElIni+2W88S8QvNvUI9VlLLMuOQ04yL4J/q3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdQsYwNRx+yvxcUo9n9QmmQpLqys/3jcXPcSt/EnhnFsn6/5Ir
	CfznBRx93MwedDfxKNoR+6zeegve5SFpn/gIWOsaa9gfX/WgJRQfVuZ2FSlT1g82Ju36zsqzGHv
	4ApDdSAnc9OxpBtFCg+07yCU4btd2ZXU8
X-Gm-Gg: ASbGncvfuTaWoT2BlDybFE2fJJesvAKg5ZP3nZsBv5zqLMPynO/0rKCWXLl4QoavQBh
	F4/OfwnYQsSVrA61m3Rr4HE3iOV30yw==
X-Google-Smtp-Source: AGHT+IHHhnqFKMKYrbzJUPJTcBeRVZGbllxzvA+i7s7Y6HIEbSNXyXgPTyvnLe2RDCTQTd/SS22dmQqzlmuq7DE8hXE=
X-Received: by 2002:a17:90b:3c08:b0:2eb:12ee:cf0b with SMTP id
 98e67ed59e1d1-2eb12eecfb3mr3524511a91.1.1732389177565; Sat, 23 Nov 2024
 11:12:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123104857.49385-1-daniel@sedlak.dev> <20241123104857.49385-2-daniel@sedlak.dev>
 <CANiq72=YeDPnj==btj+4ZxrUub1kLB_vgHVVQ5RygivSP_m=uw@mail.gmail.com> <9d29f9f8-f1b7-4c8a-b43b-9f98bceeada1@sedlak.dev>
In-Reply-To: <9d29f9f8-f1b7-4c8a-b43b-9f98bceeada1@sedlak.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 23 Nov 2024 20:12:44 +0100
Message-ID: <CANiq72mZWEuBfHhX7MgM0-38PA_hA3aSNV47DLuFnVX1Z43nWg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: error: modify `from_errno` to use `try_from_errno`
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 8:08=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> w=
rote:
>
> Ops, I may used wrong series of commands, and this slipped away. Should
> I resend the patch with correct numbering?
>
> Thank you for the feedback and tip. Should I dig more into this and try
> to improve it more?

No, no worries, it is all fine :)

Thanks!

Cheers,
Miguel
