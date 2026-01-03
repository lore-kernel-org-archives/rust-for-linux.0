Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D33A1C84A2
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767454778; cv=none; b=mnWvwLeixdFC+nxQdhbf1wJmC9TTsVnymP7VU8z47Tn0wg0MmnbgF0PscAs0Nj77P9RWywIvC9JTyYn4ql9hyrbjGGZMAsAOp2jdGph2khQ/zEP2rplNZjVGr8NBhGVjdEpK54AWqzEyJJHnlw+4Mcy+qVxlRar38RNBg6U6QYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767454778; c=relaxed/simple;
	bh=5DTP51OoE964av4TXHzuXB0250ODYdK6kR4s7+AnK5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOBEckm7x95LMghYT4fxg+LoVv1h7xKmLt8bVjNz205JBVNOfVcr5hNxBH+OB3YrywiXI781PHJQamA6rWzpvZBdNhY3hMV0ky0yeOjiuY09+pj72rXdAGUd7dNnNKmviBtH3atSyY+M0KdkmaDI7EwBGa/bHIllVxokGWEbxBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGCBNALO; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGCBNALO"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-455bef556a8so8730848b6e.1
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 07:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767454775; x=1768059575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DTP51OoE964av4TXHzuXB0250ODYdK6kR4s7+AnK5U=;
        b=cGCBNALOKWzIQ4FWOTbDdymwsb83BD2IDCsGDeJBTm7RaKoXSYpwWR5J9fRA1QKpGe
         +ZDMwxCwcV7X4OjwrxeVysj5VSvszi0AWFd82ekt+5cC6IfPueLptsswksh1ph3HEr+h
         5AX0HuwV9OcAMSXdsasv3kH2aXLkKlN4PjdQ3PTeSE8etDaTlHBdH9fICswIPW24QR1o
         7tbS2KEs7A+RFrSfGcJ4oaXOt7f8eXJYfVS75ygEKHvwHwnEI3HnlkHrsQ0kChAocajN
         OkWwXS5NI5YFCU40ow9K2OCl1/yHH5xyemMcl0S52FXTqfmzbgMPBnmYwmNCiaeeVOWr
         /Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767454775; x=1768059575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5DTP51OoE964av4TXHzuXB0250ODYdK6kR4s7+AnK5U=;
        b=StDhuisci3H9n8038AdBfaRCP+eAYgAgSKe/wzXOTxMv1SLITQX87BWDTzj5pVn4Io
         PwPlfLNbSxodrV7exzurQyhHx9ryiXnwHdCQvADI1rvo61SzkA3xa2aGZpEWi36pmQGA
         DJWLTKEcNdEKMi57Xn4T9TJhyBx3j76g6RewuUNkjQQa++VwcvQf2HEQbXSFDh0G6tAf
         UFuqs26vKIl+asYAuMcECe+lSG0R5ArJaFtXbyrBCt8/QYCCzBp1/lEO7dNCDJ9gCLtE
         ajhCyaJ33vAcqNrY4DaGlvoGQb75kiPpTRIHp0ivGEchrgusm9vM9EPKlC0rTg9KDC9+
         lIzA==
X-Forwarded-Encrypted: i=1; AJvYcCU0VGXKS+BFsln8jQuVmToUBv+/D2NSaFQxF12BHiel/YyBP+X/94xQ9VftQnVWSfguj43c9dTjFM5UAU2nIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwajrS4u1Yw9ne/7Pb2ISCzw/HWms8rAiWvUCty2KjjtMzG/k8u
	7ebnUks4Kfsvb7R8jj8Y65WNI9pcgWWwXcZnWsQ3BBriaI770CABC7O3P6AmkuCEHuV/213uaaa
	m+SI6ZKIoWKqh5pCxDGoQDAbj8U7viiU=
X-Gm-Gg: AY/fxX6UuIwkFhbZ/bKSd//aqhLlWhrkNDY/e5T8WwL0nqCG6eRds2JY7PJ/ag+mALJ
	YU8FHcYmxkt/gROaR3d4bDsaWzWUlBn7yhltfFUW/FV6GdVRGCwd+4u2zc20welnyLnNWoPiKov
	5x2zOIdiopW9NXC9eO+1m9VF1Kub7hRkoVLRJZ9gp8AlxZn7M2ltWU1Y9ouQHGhv41a3jMXcSzS
	VlYM7lwd9dE63KpwNNLZpTr2i/DPcYaei2gPq/XbqN8/tCbUKD9oSvNqQtzzVSNb6+Rnzl+hTF4
	XFYhqBMb
X-Google-Smtp-Source: AGHT+IFiF5bRlSstcAz55OLiRxMKY7gsIuUB9aJwmCNZSi8KHW8f/P2TP0ncCzwcFhgy2k62TT524m4brRRYvWIBsvs=
X-Received: by 2002:a05:6820:7804:b0:659:9a49:8f64 with SMTP id
 006d021491bc7-65d0ea9a762mr12009833eaf.41.1767454775431; Sat, 03 Jan 2026
 07:39:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260103-add-rust-pci-header-type-v1-1-879b4d74b227@gmail.com> <DFF1Y5LEQ85Q.V2AC0R1EFXNZ@kernel.org>
In-Reply-To: <DFF1Y5LEQ85Q.V2AC0R1EFXNZ@kernel.org>
From: =?UTF-8?B?7ZWY7Iq57KKF?= <engineer.jjhama@gmail.com>
Date: Sun, 4 Jan 2026 00:39:24 +0900
X-Gm-Features: AQt7F2r1h7I5GZG9Kc2q99Qlcmhl5gMhMKine4GGBX6EsdRmhyvaaLHFp0MwWGo
Message-ID: <CAGAB6648kOCF4GZV=wKUxEptzW_91BySPMqFSjE+L-TA3ufH-g@mail.gmail.com>
Subject: Re: [PATCH] rust: pci: add HeaderType enum and header_type() helper
To: Danilo Krummrich <dakr@kernel.org>
Cc: SeungJong Ha via B4 Relay <devnull+engineer.jjhama.gmail.com@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 1=EC=9B=94 4=EC=9D=BC (=EC=9D=BC) AM 12:17, Danilo Krummrich =
<dakr@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat Jan 3, 2026 at 3:38 PM CET, SeungJong Ha via B4 Relay wrote:
> > This is my first patch to the Linux kernel, specifically targeting the
> > Rust PCI subsystem.
>
> Thanks for your contribution!
>
> > This patch introduces the HeaderType enum to represent PCI configuratio=
n
> > space header types (Normal and Bridge) and implements the header_type()
> > method in the Device struct.
>
> We usually do not add dead code in the kernel. Do you work on a user for =
this
> API?

Hi Danilo, Thanks for your feedback.

Yes, I am currently developing a Rust-based driver for nvme and ixgbe devic=
es,
which requires identifying the header type to check compatibility on
initialization.
I sent this patch first as it provides a foundational API for the PCI
abstraction.

Best regards, SeungJong Ha
