Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C2E1EA7EF
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Mar 2025 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741944135; cv=none; b=Xq+cCKTQFe6DJ3DOtJYAYGedMSLUo+Jg9/pnLSWVOGxy5O9NAmB0PorLwYIrSVvkfIGn03yBcdLUPcWEBbEoGALUQo75uyotGxsGTLtmp+hLDI0WUx1JLD12gFQA4ztVGCsD+iHTyAiPgZZWk8dvrqjn8yO3QT3DAuHY5xNzxPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741944135; c=relaxed/simple;
	bh=wSLy/tKZRMSxZhgOPYP+lRHCiDRNfSCHCfpnD1lPsyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YoqDwDgx2g8StXxhW+rbXn/HEIfynsfn9GL/oHFQ8YaSZzieGUPXFGWB3CBlruybaiVG7GL2UwpKIsoECFkHx57nEtJq2utHk3m5ps5zLzSrAAzRGjmXaiJ9GEcssyAqpoUCMkw6COD4AmJQrhCMvwvbNihQkBUIevfiX/6qfTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ErztoXTa; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ErztoXTa"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso12314505e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Mar 2025 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741944132; x=1742548932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+KUI4Lx73PJKjwhnAttQQrPPQ9GUBTUAKyve2K4V2c=;
        b=ErztoXTa0CXzHYmlFXmwVIZeYSVv7c/q5cdi80Re4K4o/pOn5akj3PpTSCRfxw7B9I
         rE6UN2F/zdyq6bhsuotYz5fO8BWHfB2Xh9FP2cZaQQU8HCnTXy+moG/0PtVElSL3ajzP
         a15elSx6S9G6A4NwFMm9PvctX16Fd2sCsdQSREtf6jBqxjB352Q86pmYXJVWjTxinSpM
         sgJcV+8m62bQlEmaFeHmI6+tp17jeoAu6OC92sWTAaAgHuG+LShAFJNc/XjwtGA0o63v
         ARCz1lvAKc6FtX16RGnfkgXEDxOeZMGse+8mnm6zqBAYLFZfTVSEvoEHfczCkIpBQF6+
         zq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741944132; x=1742548932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+KUI4Lx73PJKjwhnAttQQrPPQ9GUBTUAKyve2K4V2c=;
        b=meDmsvoOZ8aHJ6EPOumBeFCjNO5k+Ae0boY532ivq4wablMgLW+mS8Yveb+PSALxxb
         AIPSf5VA+PXU6eeLJSJOTOyTP2h6XAWsRmI4dnSMVdJCpzDCTnUEzZVdFvVhlfL7Wiwx
         anF4PnmMp+0kpxEg24ZKLOnslYOX/xODWQCjVfvY8vUJ60pd+JMQupqyg02TTF/V90JW
         V/FKJANWCyRoFzOJSBeBSvDbIZjF6RO4Oz0p1pw7o9TnY0ntS3XjTVTb1PylSGikYMIl
         niVoWxa7xlgoQDth9jUe2dVFaHd6luhUx+oQLlHkPN181igaPGyfVunrCMvhxFTzWr0G
         OwOg==
X-Forwarded-Encrypted: i=1; AJvYcCXKjwthUMfEhgpFKq8wDau1xS7DsbUKNtCg+u5q/w9K0vMQ0Bl0A4LMlIs/nIwbOHG8XnLXQf8Dbq4oCrEmKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHFX3Qdasc7etFQr2gZAgwgY7bn8U95zZL3n2V8QkzyiS1B3Zy
	p5xhwN/f6V2bvWgurRV2pOUqkkKWfDBOmZrFoUSJ3GhpP82eRoWtjBEWRzuX2qKmcJBP0yLaGjJ
	qhHTE7Xd9wAhUx6XPs6NSGJQoWdlg72NZIucp
X-Gm-Gg: ASbGncuCwtHb6a4mC6wen47YevP54bxDOZKCzRZKenjbQIthpjls2M7RoxxQTl5ztsh
	eY3li8zJBIyq1vNBhFzY9jOb1/S0fRJJPukGtIcdZNlWyV6GrigzoKWgYLFElViR6xOENReMptN
	yzJdQwf1eQMGXQPWSWCAdfrc+QcXXLtt3s+1Rng9BnHINLNU6gXWs2zjAF
X-Google-Smtp-Source: AGHT+IFl2389eiJnSvgHMzd88pzFUgRlQu1y96idOrhkkY6/IW7t5kMp6T08rutu3B31Z91o7d44iA6hdHEiErEfyWc=
X-Received: by 2002:a05:6000:188f:b0:391:39fb:59b4 with SMTP id
 ffacd0b85a97d-3971e2ae150mr2211005f8f.27.1741944131623; Fri, 14 Mar 2025
 02:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313084525.773620-1-kunwu.chan@linux.dev> <Z9K3vokYu5osMCwh@google.com>
 <6c874a4f-439e-4ab2-807d-d0f59b9fe569@linux.dev>
In-Reply-To: <6c874a4f-439e-4ab2-807d-d0f59b9fe569@linux.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 14 Mar 2025 10:21:59 +0100
X-Gm-Features: AQ5f1JpGzEAx4sBwjKxQGUxQi3t0tVfhh5Eh8mkLZ_0xoZt0Q9ivNhpJmJHKzV8
Message-ID: <CAH5fLgjErD9r8h_tjekZ+sNNDmkU3J3kcSmCG+Mew+-6zQq8tA@mail.gmail.com>
Subject: Re: [PATCH] rust: file: optimize rust symbol generation for FileDescriptorReservation
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 3:34=E2=80=AFAM Kunwu Chan <kunwu.chan@linux.dev> w=
rote:
> > * I think it is easier to read the symbols if you list each sybmol on
> >    one line like this:
> >
> > ffff8000805b6ef0 T <kernel::fs::file::FileDescriptorReservation>::fd_in=
stall
> > ffff8000805b6e60 T <kernel::fs::file::FileDescriptorReservation>::get_u=
nused_fd_flags
> > ffff8000805b6f08 T <kernel::fs::file::FileDescriptorReservation as core=
::ops::drop::Drop>::drop
>
> If in one line, checkpatch.pl will report a warning:
>
> WARNING:Prefer a maximum 75 chars per line (possible unwrapped commit
> description?)
>
> If no need to  bother with the warning, I'll change it to one line in v2.

You could do this:
... T <kernel::fs::file::FileDescriptorReservation>::fd_install
but if it's still too long I'd just ignore it.

Alice
