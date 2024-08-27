Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCE412E4D
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Aug 2024 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724771431; cv=none; b=hcJQBKoOUDY1zdL/NfgEoAU3FA0hcZ0yWeXxjQ4rD+OXlpmJY9quWNdKrNByNh9gFbQ2VwSaJZ8ZNITuZhLt1wSGBvDcVZqw8aqHIsMsVIzJKIWqLlefRhGiLAuCJyrgUga7hb3xX5b/cbBZcf2/YmISS28vkU69QEDfQg/fTq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724771431; c=relaxed/simple;
	bh=jVbgwa46rHtaHIpHUFgY+4LnbzJzdHqneEGMsdgfb64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/qzzOSQDSXnuHfFreVzwBfjgHi3tZ4KUhstQuPM+Zbczz+Vkhb1hc6GBePHHjgZ1GnjVeILBUj9Ct7Z7Si+d64CEIW5qNnwx13jncbkclaMlYu6yZiJAa4l5j4sHWjkFtipI5kwy5NB6bXadM0Pj2QhW1+sblnWwtBa7t5e1ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlqCKz2c; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlqCKz2c"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d3ba4e6ad9so1020360a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Aug 2024 08:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724771429; x=1725376229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVbgwa46rHtaHIpHUFgY+4LnbzJzdHqneEGMsdgfb64=;
        b=TlqCKz2cfRn0HmdhjQtsLsdTpWLChGHCVeUySjroPEo0QB1FaDFiQfTCkiM76RD/cN
         sCCnUp7FpTH+EhelhCqk6aDxPIQ+vQhi6kqjF0csw8yBip21SGYr5+iVcGCLwX/2hsUd
         r47T1q+ZIFghhqcAb0CVy3BC66B35Au7qX/Hq1bps3WKGqUwFzVH5EW5eSeoUQr1Rxin
         oSeDNUeaE4ABP6yHnebBOZaKX9nVarfzTkAjQzGK447y+gOFYL4wgLTQiTMWZZf9fF4Y
         RBqVTVTiW2Ej6B4H+pbbdsUBxAiC3wTUEJTBA63Qxb2Z8j/jZNHp9bBABy4yZfASdL45
         5Q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724771429; x=1725376229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVbgwa46rHtaHIpHUFgY+4LnbzJzdHqneEGMsdgfb64=;
        b=P/SzbP+TcYz+WQuR+iZ2da8T+nVhkaY/KC3ouM+0j0qAmM/NxFncf7m/VjGo2VZLbt
         I9kGJesfHlZ75QlTndOF2vTtsv+idUzLG1c8Cq94nMdRA4YN4aJL9r4GvD3bS/CHpouS
         zttbwm78da28Mmb54ZlqR/4GnGiqrv5wFBO9zOgKAIKhPxDieV+B7Ret+nDMUpNxCjgi
         mYrbYkRFC304HQJaxQ9n801u31f1CgeXWMaVk8lXWj+I49dxnzuaefTF5+URgbZktk4p
         ZnZ7Ji9zoAnk4NBtcWuMLp66f2W7dYX8FhFVCOeEBAFJbG8jDpFd9DbMv7BlK2qkJL2T
         i27Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmsFDOIPwEGhuGVzkDaXgA1c8/YaY0LNklbH6qQI61VYCeEYpbKFpqHiqpw/j/m6Qar0/ngyNpNckAIJLVlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZArBcB18tYJvzLH6/XG0mVsa2VJD8HWmvrE9QeWG4jfnB3TlP
	LGj1SR80w1bznuaNsP3iwFRFFCDLfyx3iqpm4yNOkLN5hp5KfPmr5LiYzMwgYli1xq9QCks2+8D
	AsOIl22G/tyVr9X19grwL6UBQw5o=
X-Google-Smtp-Source: AGHT+IFw8TJlOe9Ee2tTkT77yEO4gPYwmOSTJ90G/AoZv8ZeODhBC4NFo5PLY1ybxDinub2HpTTFu0AwTioOgPArkr4=
X-Received: by 2002:a17:90a:ee92:b0:2d3:b497:1877 with SMTP id
 98e67ed59e1d1-2d6467246famr8535737a91.0.1724771429225; Tue, 27 Aug 2024
 08:10:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724172713.899399-1-sarthak.singh99@gmail.com>
 <CANiq72=BV_kYbSw0YV019zTAmvB5VKHz8592pTTE=P8fBU-PDg@mail.gmail.com> <20240827-hurling-taekwondo-0bffcf7dddb4@spud>
In-Reply-To: <20240827-hurling-taekwondo-0bffcf7dddb4@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Aug 2024 17:10:16 +0200
Message-ID: <CANiq72mQeGckuWvfbWez9B47aBUcRBohFrf-a1NZDH3tBUJBgw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Support latest version of `rust-analyzer`
To: Conor Dooley <conor@kernel.org>
Cc: Sarthak Singh <sarthak.singh99@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 5:07=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> Why is it not possible to fall back to the inferred path when the
> argument is not provided? It's rather annoying to require different
> incantations for the script while hoping around between different
> kernels.

Why do you need to call the script directly?

Cheers,
Miguel
