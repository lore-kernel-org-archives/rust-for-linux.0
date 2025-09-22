Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AF31FDA89
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Sep 2025 20:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758573088; cv=none; b=ScU34L350cbIG8GeiINFgMNste6yQ0rkT3BaPSnSKTXS0OGjlER9nKiGw1mZyctnwcP/4REySrbQU0R09G/p/OeJ1UqoTpf6BIUK31xlG22eE1UWylpRIPtqaQtD1hg47GiArJM5DnV+rzbIDEFvOHQl5gL5xfmb0lkHDbdq9xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758573088; c=relaxed/simple;
	bh=qzECjrSg6UJUCmOe/6ytZN6/xz3QNtSpSkJM2t4IcpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhU5NAh71ospPi5CGM56//ZtjEB2BoZU3kP45foEcIgC4uRCLPaIDddEYKGrik39mKUAFVxeEbyCMXzNUTgOMUjDwxoR6sj9C31frxy3d3vr9pgz8kuAOsuLPPoDxblaa2i87Cp7Yl5P4YHivM+kDrYmuS7Z5EoN1tFH9t1jgn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kip4jHbj; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kip4jHbj"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-26808b24a00so8691755ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Sep 2025 13:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758573086; x=1759177886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzECjrSg6UJUCmOe/6ytZN6/xz3QNtSpSkJM2t4IcpM=;
        b=kip4jHbjY0rYhdDdX7vgNr1McT+4WIyUGafU5LKIH7BD9KJTv1Cvl36ZtXhzlLA1GV
         9yNlSB/WweOibiORYUFD/kyKSrLKTJz4j3s2rHRDs/3E2jZM3Os/gHg+ROtsl7pV/EcQ
         zqmL7uMoudDdcfuK9PBn+8rcL0RFfksx66Jv6qwl9rc/ZZQpD2FViV46gBrigb5jOC3f
         xJ/wX5UMtCbzL8tBsv+3O19AsgCW4O9JFFIIQ6HHGN5PXYzirVL/0VlLMW1HaFNGl08k
         gaIJHwp7NpJxJhM/OpjvHEtLzSv2J5DxqOMPDesSCdqBGO2iPMvmQj17cVYgLy8B5+Uo
         rkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758573086; x=1759177886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzECjrSg6UJUCmOe/6ytZN6/xz3QNtSpSkJM2t4IcpM=;
        b=G1pU89o6pqoDQ0WW/UhxSO9gRoFjz/0y4GFce2yE7hO4n+ugLtpd3Uh1Qh6aXwpCNH
         X84hNEGG25K6X7DWQo6P0KJjqpvF+/oglMBaJxUXBrxfyKcb/pPQ/NS9CHzShEBHtMpG
         VDqqUIFePHqOLllKeip4qnW/plBGpBuIN18ypinOrnbGHAwpZ7EpoqeuDQKGP76dFqbM
         hY6+AnX5+xSxrA7TqWTLAma3yvjw0c6DQff/PpoTIQ3MoutvfoakUoecht6czgb4K83j
         +y48YQEfDr/fLF+pcWvUlVSrJRsIdwc3eonzKOQbMkYDOJhboISKyVv6xlLFM0xnZ3T/
         aY3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzmJJuT+l/IjOWN8kAG9OiE/S85b//v52+emQ0A9GyR4ZuiN9juo0QM1/HwYsW4dMf+5NpZoh2giX5lyLAkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv/zCjTWr49jW2rUnmwcVQrPyH5nAJdm0GHFrKxUaZBIQ36pof
	J5BPOB7J6QODFYJT8vY3Z3XDQxTTOhdRJRuqVvfJyZPj9IcNt+ARH3AJXUPxdhzsjFmoRn4nvVb
	VmmF4KsB6U55NBbuTSyI5kHJcYUz3uxc=
X-Gm-Gg: ASbGncvMutv92+YAOACRhkYEW77q2nCsTmEVOWGsN99+Arzio407YEKJAiV2kDIzzrc
	hUtqUT0/kWGjeFOOlac5Kk2WjbTPS36hkzMB/IYLEAzWwVVzc4hnkWhe4RW99jqQSHIXpJqiz59
	TUDs5vAGv7q0rxtMtClzNzVOA1lVGD8KHZzl1CNXpclyDu41wLkBaEqz6Z8w6e33mPfnSiXYYhE
	C2gWg69TDpvWZ9hWieE612j4mjpcT0/DnuOst5mrv0waBKvZ+yjwEg+YNDJRfnOcuCNXRTu4aTu
	U/VeJeVp309Y85yA15KOqvE7vw==
X-Google-Smtp-Source: AGHT+IFYTlExsKdcGBZgOxaN/MLDTB8PBiDmwMp9ZvPE/sbGgjGw7pHn4tjIz1wIkQPp3o3rzEXg2NMs8SU1MEqAVow=
X-Received: by 2002:a17:902:c407:b0:269:af66:5e70 with SMTP id
 d9443c01a7336-27cc8f03dfamr737845ad.9.1758573085987; Mon, 22 Sep 2025
 13:31:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6r6wtq3.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87o6r6wtq3.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Sep 2025 22:31:12 +0200
X-Gm-Features: AS18NWA5VJOiKZHtpjGKzVx_TPWQ9cO4aNP7YevdQbDoJzPpP2zk7igqr4JYKsM
Message-ID: <CANiq72k3A1hOLbt5OS=O26JLB0Rqvp9Y1RbBk7rNEzomX_K1=g@mail.gmail.com>
Subject: Re: [GIT PULL] Rust timekeeping for v6.18
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 1:46=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Please pull these changes for the rust timekeeping subsystem.

Merged into `rust-next` -- thanks!

Cheers,
Miguel
