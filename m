Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CCD2D061E
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 17:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762451683; cv=none; b=XvuiVBjTG4zUnr6LAdXpPpfaFsCYuidEkOPZxD2D80XXVui5oUXT+FvUNtB8JLIerlo/CTznW1VN8CEuMkUkccbHC0vtIwbxouFdngR8LnISKr5kpJYXmM3br8bMiXzQLrsb57f111hEUPBHHavx+CPvw2FKb3uvZxymGJYpo2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762451683; c=relaxed/simple;
	bh=Ksw1O2ILTa6nbNkzQ8ESg5jM935Th6BDveZ1S58oGbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ek0P7LWIQOWT8IPIM25pNQwgNxHVmgVrL64RxbIVQipF9+9gcpCUCe1gshRC2FyEo5kEFzzhrFGJpvxGoMlH2qxPfj/63JxAeMqk36Z9AzpSXtOnuMszx0uyRiX10pM5TS6J9j9avaBQNOhnHzAidf8jimK7qEggSu/xW8zoemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UicaYoie; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UicaYoie"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b9da0ae5763so103545a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 09:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762451682; x=1763056482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Okn7qpZREP/wLijgmlrP2ZX+9ZeLo6Ylcde08Z9eoeg=;
        b=UicaYoieNEAJldATNlWe0ilE0H5q6doUqvzQRLUzKckS8/tstHYz4ZtbolnwwnxLFZ
         o6L8yrQN5rO4Q2sGf1NjnqfedRQmNqLSiSGto0ZHXDv1bWTgoRKn1IV/HO1SdSGMJehi
         LdH4NZm/LHGR687OVH5Bo+WAgafDuVf7suWEoohtBdMZPy/qehl7ogLH5zAg9e6Ktn6L
         sAxm1gw5yw/HlB3obsATOCC5/Fh9cCm/CPKIdpN4Bc/mVolsaTeRxANPNYM7FJmtbofO
         r1kHPbCCxGSGd9zPj2HEU2i3h+a0cxHEsIc6RZNBYjKDvAWcA7Hf9U1OSiy3Ee8Ww9zd
         Ng8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762451682; x=1763056482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Okn7qpZREP/wLijgmlrP2ZX+9ZeLo6Ylcde08Z9eoeg=;
        b=U1jtQqJc0abH5+kyM4orUOJdNrmNGX7HLmp5Eblc/JlWmIqiJcOKxVVC/yNsvuMt7L
         al10akTrKOaXbt36IIzZiU9xZDY+2Xec6iA5c2Ui2OyJQXweO/+3O6n1rrg5DS7UK6dY
         DyRRqpxcaIptmbvHR5qwyvVjOV9nKmLrzPRxaU5X/tSzVHEADLR9J4iPtqdQx6tpuCVk
         VYD1sbsAP31rxLglKnlfagZU5wyCZ+/3BkYvoBitg/VpeK9k9WH9hyVF1OdW/xRE//Ek
         b4fjJjh/66Fd5QRNnkzOjBLGkFLRdNyl1/sH7Vc9mbHLmr0Zr7UCIL2unLaQf77do55a
         8NbA==
X-Forwarded-Encrypted: i=1; AJvYcCWFVUtFlhvcMsVYFae/NzB/fivOuaxwLdh4lI0q9dCc2RK6LF91ez0uXme2JmalmnH1y6ju4+2ueEavB5Limg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyOSATAuRQ8rDEFedGfQh+E8U2lUf2m9XWGPLHI36dQ82z2qTi
	wCwNXSWTvqwklRTi1U4Khj5qka2f0/3D+UbfySoQDpq6Vv8Ks7GdHEGnFQd5jtJs8uvYO99NuBY
	kjn0MGw3QnCETlcWn8E0tpZ9I6SMkabI=
X-Gm-Gg: ASbGncsoUQRwdR6GRvk8iRLA35RtjSm75k58auwkAuT3MrGasdtOCJgcOoTGXVhYw1g
	a4JamVWbGD1Y6ApjTXtOSsUAYlYz21AsM1hvVN+eWoOKnqwqjNnDX5Y2ajXmOS45igqZDC4cZzs
	/oVEqk9Ouj9xQ9fD5heOSDrboHdMYDaANHj+cdfXfLLVb76W/s+bJcppoEOTZlxrJLrGuuYs1ej
	qKmIzwh/zXDg7bezmrOxqdjkLrIUU0GurqQlz1l9GIPKYKCTLOwRlFXE/70D8ZFxPSvADQa5dRc
	puAYIMHam1j/inn9LEtxjQzDISIDMXQ9W+c1g7qEk9NuTdLsBC6I74N+KLhDb25g5mvcIVm10Jx
	uiEE=
X-Google-Smtp-Source: AGHT+IEQFZLchjDduH4qWmZhyYV0o5WLbi5+ttwHSqi4gQaN3BU7nanFdl/mHX5HfcqMUadxoGA3i7/M5nE2rROJQ8c=
X-Received: by 2002:a17:903:1cd:b0:296:4e0c:8013 with SMTP id
 d9443c01a7336-297c045d1ecmr2192335ad.6.1762451681522; Thu, 06 Nov 2025
 09:54:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
In-Reply-To: <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Nov 2025 18:54:28 +0100
X-Gm-Features: AWmQ_bnB7dF3A5p5iTsNbh6uHhgvWv73d0_f2Do54xO3WHnB4_rI1cr-bP8T2Fw
Message-ID: <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 5:07=E2=80=AFPM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> I can reproduce the issue. With rustc 1.90, rust/bindings.o has
> debugging information, but with 1.91, it no longer does:
>
> $ dwarfdump rust/bindings.o
> No DWARF information present in rust/bindings.o

Same, reproduced as well.

Bisecting nightlies, it seemed to happen between:

    rustc 1.91.0-nightly (12eb345e5 2025-09-07)
    rustc 1.91.0-nightly (9c27f27ea 2025-09-08)

Cheers,
Miguel
