Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C666E1990A7
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Oct 2024 12:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728478374; cv=none; b=papRVfLoPw0cO1D7sNB4MFsuepFUQRq7op3x0Hgi/Gi0Wpn086s9CRub3rr59dCofjXbADlRKkvZHAwCOIY9wvA2iMbe9p4xCoIyQehckInJgNjydPtCBwRD9rVGnu58+f/b1Yg/X5eWX6DA31UlgsB1n4bHPv9l4lVgFmdWAYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728478374; c=relaxed/simple;
	bh=SCs06lfwISgbAl6dysqPzcHli4y9o5NXwiDyldWSqXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cuRJis3IDHRbIIBAkPc8G3zQDMrWGJB8+w1TFX3UeX/qs7bxC66LmCENw1F7RggtxGtOu97HeODQjagh1Zpk/TjVQXFR91k+K+lvp6CNxdYKkfgZK3OOx+hQ/pgyy5/FwQ1T5qtnCujEzJn/nfbtlJmuNdpcW1lYxb/LmwcDN7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1HLxzRv; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1HLxzRv"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e01eff868so247512b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Oct 2024 05:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728478372; x=1729083172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSc/Qq+bUA6UejdQbu4RGQAgtovd3cNA8kyAjwimp0M=;
        b=I1HLxzRvZq/+C3pGD92x1HFhKoDPv0n7JBF1Fdh0YX/0hm4YeAxlgLPwrPbylLS7yb
         Mq/vva1sdqK/ODI2tIrHcZvBMEQe9v1EoFf0tKXzLCfI2I1nS60X5U+Gl3h47o9NJATf
         kLf8xTmzOJgPRYqSzEcBkQbGsAW9HoAcSEB4BHA/82Vf1h7sgWI0sgbiNQYADF6yaSua
         5mTqI4Xqb3NghtTy5UaX4THtb1sIEIBTfJlpzK1UPsgvEd/ACtIb9FVEr4sqq4MK2Css
         YDjGGhY/O5bKdeGOqBsRDSJQQYYHfBBv0pP3QuabMzK0Frl4Qy+08VWPgoNeeu3V78jF
         scAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478372; x=1729083172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSc/Qq+bUA6UejdQbu4RGQAgtovd3cNA8kyAjwimp0M=;
        b=QBvJlxCV/45k51f0NrPS8/so8bf6qUo0g/PNRVBcAXZkLtdR8hbdvTVhwAeVODCWri
         mf72bGC9b+MwvoPKr9IBBUHJDJo9NiXEDZ5lIsSkYiu6yXqRnWEZTXuWjXyz9UQ75UE0
         QMimENp2axfhQXiledRg45wgvxRwYZ/s2LoDvZMjH5pnENoZ12twmLZIuYWfVxziwj8J
         YXxypvekuA8uiJbFuGK+HO7g6tdusmTdfuJcHvbzhrPwNRrXgFLBnOa1IQRW8qgRhugY
         d6aU/9P96RdJHjhIWBgFHN21pEpFCONFlw/BbIgviQqNZ2ky73KoSU8P4+cMuJTxq7jS
         3ZtA==
X-Forwarded-Encrypted: i=1; AJvYcCX8HpV3VWSH8Xn+kC0KjAmpT3Ql0M6RICE4EwqmSkt5XMNUVr8oWT8BxLbPaDVkL6mThCLkPtdR6camxqOlVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6WgHO46M8KluyX3SKNXJ8s+XzZtlCfHLugJOborW3b3zzgBv2
	pr6j81+1+SPZ1tG0br3NDT8Kzaq9piNm16txSRRsBoSgBR9WIETe4jNXtfSqhjpaXQtL0hCnv12
	3cXA+rxwdSFq/9/+7b8x1U/OQnVQ=
X-Google-Smtp-Source: AGHT+IGDZlk0vSxNbCEp4HYgbqEEEFHlGnksvL3nu9Tb4gLrogFMgZPPcAKSAMsknVA0x9W3GfxEWQHF/YqSRwqrI40=
X-Received: by 2002:a05:6a20:3948:b0:1cf:308f:f87b with SMTP id
 adf61e73a8af0-1d8a3c08378mr1749012637.4.1728478372129; Wed, 09 Oct 2024
 05:52:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
 <250e1e5d-5110-414f-abbd-fb002e715f32@ghiti.fr> <c4906bfc-5bc1-428e-a76f-3fb0bb8711ac@ghiti.fr>
 <20241009-tamale-revisit-7d2606c5fdf3@spud> <850ede17-6eb3-4269-bec6-2a2a0a629eee@ghiti.fr>
In-Reply-To: <850ede17-6eb3-4269-bec6-2a2a0a629eee@ghiti.fr>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Oct 2024 14:52:39 +0200
Message-ID: <CANiq72mZh+=18tWY8E5xA18E0SRQGO+ApgR9sU=+3b9jrVGTDg@mail.gmail.com>
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
To: Alexandre Ghiti <alex@ghiti.fr>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	aliceryhl@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 10:34=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> Ok, thanks for the explanation: do checkpatch and the documentation need
> to be updated then? Is that a known issue?
>
>  From https://docs.kernel.org/process/submitting-patches.html:
>
> "If your patch fixes a bug in a specific commit, e.g. you found an issue
> using git bisect, please use the =E2=80=98Fixes:=E2=80=99 tag with the fi=
rst 12
> characters of the SHA-1 ID, and the one line summary."

I think Geert (Cc'd) wanted to change those docs -- I am not sure if
the idea is to go with 13 or more, though.

In any case, even if there is a conflict, we have the title.

Cheers,
Miguel
