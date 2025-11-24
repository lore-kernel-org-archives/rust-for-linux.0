Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC7A314D07
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764000847; cv=none; b=VIdAXg6DlHeAsitnOQmHDkcGC/7rZwli/cTC5yinCcYHvlye+8Wo9ANIz8/ECzpGCTFS3E7AYP6qkltCkrcMhb+fSiL151SS2Tt+Q26dt9spPxmFFoBmMsepalcCxQJ7cHajj1tTwTbWFMIepVDJpKxYXestQP057sgNn8EIyXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764000847; c=relaxed/simple;
	bh=7qYhgtR+4n/W9kawQYxx510inTceiiVmUgjiiypuHKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LSBrfLVYzHBIWrPbomS3v4SC1TicnRJ8HJzeY5zwNzdG9JzKxcU8HnJDFCCKKxz0w37Z7a2kpnkuXImZTlizG1SrdNSL7nbZf1wuN+OGur92QCovYr+/lX1BR5umhqs6xBZLBgfZeyZEBQKzLT8iUv2LenG+e00cXWrAe3lrcIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNPWvDso; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNPWvDso"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b997ae045b7so418715a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 08:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764000846; x=1764605646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5V6c5G/DyoNY0lrtaPxmJvq5+CbhmkkdvyxqfYwVm0=;
        b=RNPWvDsozcNKeQU8McqzYzLcpGnNkOCFm6CfsJEIIramnkZgu7vIQD90pgzYKtu7I6
         GH/+ZnbA6Zy+ZSGVflgItEqr1qvFp61i1Wl4xJZHeSGM7ih69e2ZSw0dM0RNUski1FxB
         rW5/Qe0LPcj0Wiq5vagYohCvGS9MGQx76lA4kR6F1XHrf+B7X2Y764AskhI5jpxzezHB
         ceII+do3j2E+NQCJdfiLsWhLLBBZLeKyswsSdNG+ybZFCR6REpkZ/yFqp1FeiXajNP9E
         nBLVkd9YXLSyR2Ozzi0ggEk9YamJKmIc5oeFFpzEQznSfgFff9+ARPMNHPxXqkUmJF8s
         Yiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764000846; x=1764605646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I5V6c5G/DyoNY0lrtaPxmJvq5+CbhmkkdvyxqfYwVm0=;
        b=ANu22aSH5UB0SQ7qL6kTRWatANr38fv1hKJjMk4Qa4vZy0midPqKqmFa3Gb9D8pRd6
         D8CTxCFnFiQ63+3boonkSUcSj5KOuJyW+3ruUTNa5hcB6s7HHpYDYQ/oDYe2Ylje7glu
         inPaRnqxnizQSwt488wT3FmKWwttf719uGmqFI0xQ6u/urycU/pYcN2q6qVrQZcCghp1
         7AHabXuxC8yMRBVxwR0MWwV01JCY1LLKN/Jvkv7sJ+c/ApoySo7azSmF485TZvxeirzL
         9rUY1StYnDWJaELdK7yHfAT3pkrr3Ov1L4FhDL44l+2MfjqD4pFrjTZ8aoTq8L8qFXFO
         Me1w==
X-Gm-Message-State: AOJu0YyDhDRzlNpTLnEzoy++60NWRi4rLf4nc3qjbzlNV5NzWjkebezc
	gT5xugoFYoRnqbB67j4ygcU7d3zONtCjXiO8LdFQZoyF5n8i+3SpF8gJUF6QnDLyyM+yhmj37Ym
	jJ8Ffrl6rrXOo99P9oexLkflB0MU2+kY=
X-Gm-Gg: ASbGncvyK9utjPev7UDlUULlvgEtXYUmG6pgjMaIH+M/+L/HFntAGYdSVydSRbprAUd
	OXqMzxfGgouvTGYq3iD1KLknnjCI0DyDDgKitCNoSjEMYuPBhLVK2J1DNW5Ruq8fCJZHdtmnbFQ
	7U1sk3fmlwXCZYQjg7OE6Aw1SgUGqr+ko8W6s5jhEx9T4DPRhgJ8Pl9lO++1qLeJwA9gSpgyTaJ
	Im9Bnz5/lltpQQ2Q53uXLgR2iyAz5iIUE2HqDv5NBRYUehEbJT6qCmzcLk59mmUtpff7a6XXAOI
	FpoBd21w50jQKxarL6Pg6OFjCZI2b/uXXQj5fnkWA1IwLgX4/SW7+T9++7+aE7BGtXnq/+l/m07
	9U2gt08OxmvhVAVQjS85W2DKp
X-Google-Smtp-Source: AGHT+IFrKBE4hp6LJnKztu6MKYCgue2aym7wpqHgzFIrOml6T5sFuJgdNJUeh1qPNaba98BAS2DHr3fwp/JPwDfVLUA=
X-Received: by 2002:a05:7300:3aa8:b0:2a6:cb65:1974 with SMTP id
 5a478bee46e88-2a7248ee7a1mr4525202eec.1.1764000845538; Mon, 24 Nov 2025
 08:14:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFRnB2U1uvg1vyZe1kDi7L3P4kTFowfOo6Hfo9WJED4qve4ZZw@mail.gmail.com>
In-Reply-To: <CAFRnB2U1uvg1vyZe1kDi7L3P4kTFowfOo6Hfo9WJED4qve4ZZw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 17:13:53 +0100
X-Gm-Features: AWmQ_bnX4OOrU2veyFISFqvnDtLJlFsrV1K5usV_xdbZoYXmwFXIquOQ4oTZJZM
Message-ID: <CANiq72nSaYSGBqX0btuHg5OUvGA3NsKAFnEqTnGTp3LYs_Ryww@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Alex Gaynor as Rust maintainer
To: Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 26, 2025 at 3:30=E2=80=AFPM Alex Gaynor <alex.gaynor@gmail.com>=
 wrote:
>
> I've long since stopped having the time to contribute code or reviews, th=
is
> acknowledges that.
>
> Geoffrey Thomas and I created the "linux-kernel-module-rust" project at P=
yCon
> in 2018, as an experiment to see if we could make it possible to write ke=
rnel
> modules in Rust. The Rust for Linux effort has far exceeded anything we c=
ould
> have expected at the time.
>
> I want to thank all the Rust for Linux contributors, past and present, wh=
o have
> helped make this a reality -- and in particularly Miguel, who really
> transformed this project from an interesting demo to something that could
> really land in mainline.
>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>

Applied to `rust-next` -- thanks!

    [ Reflowed. - Miguel ]

Cheers,
Miguel
