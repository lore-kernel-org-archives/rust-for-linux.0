Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D85289367
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 13:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767531756; cv=none; b=FuLtWSl8tL9zJtDU7jmEqtIafKNwUYnElKQm5M0kPsP05p9M7nEGqS00WQpfI2884BuqLP/SS7bkmJSe0+ukV1Dx+CoIJa1BmtoFF5yv+bc7/I1+UXfOJ4CMdr4qwZPJA2wdxQEXLqh2wtfA2zWgpvGUTeSZt8JQ8NYpsigVW8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767531756; c=relaxed/simple;
	bh=62fyjQ+QOrmYMR46EqvvqU2oop0W0wt14zFzfFVKb20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLcLmaHB+/0jg2bLbHPLPuHy6I7Tmgn4BOUDzdyhfTr6/TpfiiFhpTklaSo9VeKfK2F1TC8qnkiV+x7Nz7OcF+GNQeEfClWc5tIVnQI12k2f2y9euIRD4ZACqRjTb8wnXEEM70EENj+wQZTMDrsj/dXVzxUzL/PkA7PJmlDo1p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVafRAvO; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVafRAvO"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34ab4879aa5so1289472a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 05:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767531754; x=1768136554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62fyjQ+QOrmYMR46EqvvqU2oop0W0wt14zFzfFVKb20=;
        b=FVafRAvOGnJJvDzcY3/F6Rp9D1DpG73ximvKsQiJv+hPh6iV5jmQwK+9E7DjJNWw53
         +UBSYA2iAIwGsOaC5zyr2+jMDEXKslU4SFjv5CmEOFtata8Od0hVa2z9QKIIChhzsRzK
         /aJIkgm9vek/ktI8dVkLKl9d1XeCx/vF5ZevlDUohu2Al7EIkZFhCVIlHcYEXOBRSR58
         abNmRjcLDGFceFxlgkn+PQpoYCB8qz7ZTrpmKrFcBXMyP0jqmsaKmIO9R4ekOxW+2SXP
         oYSioKv/DNEZd/NPJNqX027Audek6Kg+gd2WAhLaW+ixd2VVeHaiHTlKtF/Iulwz0XWk
         sVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767531754; x=1768136554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62fyjQ+QOrmYMR46EqvvqU2oop0W0wt14zFzfFVKb20=;
        b=ngWtinpiw9RCMh8kP/dh1cIh0E8ko/cA1kbLJWcZd51op2S0GtTqDd+OOBOa9oj1VJ
         t0lJMXRaloHIlMIxo5ACY3b8a0loxpiaX/NGbhxSAsfU3cpmK+v9swpqx/iqJd9eVcUx
         OQx2oX5OtBjefqK0G+s+XXiZodqU/bHN4AcoFR97k0Z6Mjr4BeG8CrA8pQUCLUSDO53x
         mSm6k6KK5l+wfCHTyLp1NcPi5NdvH0Va8s6C9wtCC/D+DSGIO2banXf7n81WrKYlhr9O
         apDeDTd64jsm7SGzwUBnyORpTPxNVfUXFItapVA55Ee3/NaqShT1zZLybCNyuP8Po2Fj
         viGw==
X-Forwarded-Encrypted: i=1; AJvYcCVmfXIb14z3tzktOvNHWIqq+lHDtSbVZAb+uaX7ez3ZiLmvh48sSD+bpSB1be7Ds+6/L5Hk1afDt/Fc6vYlrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwc+qWvcHz4t+ktrw3npewBtoSuzcVPDYxFg4HVeN/mx8D9T1H
	qXP055c/uv/1PgRIix8bKYDHwLKwUoNml6L//NUa6V5W3Y9gioRCYfOWNflgwJQ0x90ffMX7Wti
	ngXIItubJ44n3sfOasxIpyiXl2JX+0WwqfUMn
X-Gm-Gg: AY/fxX6cZR5ZF4oPPdOTqn1JcnvlDVciAoW7riaEAsk0SWiIsd3YM7zvpubuGUKRUKQ
	AdzCiIvm59251ZTnv9mlum0Oz1FCE0FtaLYU5QnS2ICsQ0usI+BiRel5mwYeueQN52WvCCKlpem
	7G8eGrlsMggJ3Bpot435O7JDlJ5AaKc6rJXSRG+PYN04F1PlzJXwB8zWaJgN9+6w1BunBHd93rR
	rV5+JSL4/OWB3hWdfAerr1e3XSUrdweHl8aGwiS3Ke2CZHSiHOZR+R6tEnqpKfMULp/GwNjEfZF
	6dIbaelXYCUAGYan71L8Y20FrilKvzTTIdCIu2BqI9B/Inp1nuw2NrLLHtnIC7I+gCYYxxQRHqe
	wuJ1dgoBPw2eZ
X-Google-Smtp-Source: AGHT+IHsxFORAtj6qpH0LcJCLmWTs8Xvo2YNh4Gv2oUZjzATu2iyxuG6MV6Wxq/3E3fNRlbrBlIFLDOtBLoyWoXSE4g=
X-Received: by 2002:a05:7300:80cc:b0:2ae:5dd5:c178 with SMTP id
 5a478bee46e88-2b05eb787b8mr23205594eec.2.1767531754278; Sun, 04 Jan 2026
 05:02:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104-fmt-paren-v1-1-6b84bc0da78f@gmail.com>
In-Reply-To: <20260104-fmt-paren-v1-1-6b84bc0da78f@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 14:02:22 +0100
X-Gm-Features: AQt7F2rUj2KGxBG761WiNNJM9FcUzSK3nr-xJQFEml6VjAPrrP4cQXndwh5uew8
Message-ID: <CANiq72mx6mpJsvd9MWkSXXN3tAT59X3_-o4GnZWEw33iCC8PWQ@mail.gmail.com>
Subject: Re: [PATCH] rust: fix formatting expressions
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tamir Duberstein <tamird@gmail.com>, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 4, 2026 at 2:00=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Gener=
al/topic/Custom.20formatting/near/566219493
> ---
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Thanks Tamir, I will pick it into `rust-fixes` alongside a bunch of
other pending fixes.

Quick note in case you want to double-check your scripts: somehow you
ended up with two `---` lines and thus the SoB outside (no need to
resend).

Cheers,
Miguel
