Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BD3210185
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Nov 2024 20:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730838915; cv=none; b=bC2ZIfos9emsAy+QI/y7qfdmUWDlbjUUcMcSFkgYc084Y1dT+i0Jm8tEsrq2XUuUR2N58w/IhCKFTVW1JU6hk9yhVnRLRL9LphoYAUT2mN58/xoOwEhbqf53CRUSp6LbAqqEHsbFUrMApSKYlzo0eCUowFFCL6w4hyzfBkJRP78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730838915; c=relaxed/simple;
	bh=KcKe6HiC2vE/ZqlLzKF5ofprcrd8rf4lHVJTpPKcbw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmE3oeJ6yymfZug3z1fq5fLwex6iycY4skXok5THwCH+6Rda9mokdJqRuTwd2OKhT0ebulKZPB2gORsEc+Mj9KIEeTrYusJa/xTleSizIrYsD1Nsj2xQdwrIrlxnyCYUCchrb5wAytSMW9fzEaeOEXd6Kqhm/HglHv7H+jm+kK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZ3+pIWL; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZ3+pIWL"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e4eb91228so472867b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Nov 2024 12:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838914; x=1731443714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcKe6HiC2vE/ZqlLzKF5ofprcrd8rf4lHVJTpPKcbw0=;
        b=MZ3+pIWLwiCh2TCdD5MCGv06qIvS+JeoJTJsDlggCfuK69zzOfmihrMoj1HEqFg0Xs
         NFWAceH/i5HdZSlTsNuKpiPU7VdnFEGoJc69fN/gp8gGDDdbfg3IZVfY+O/9BsjnxE2+
         FJLXnOU2hSbGJi1Jr8VErsEgyCu7ldQELhq5USPqVIhMAUIs8fAq50l2Gq5VdP/4xXEk
         cclF7SahcVTQzXZzptSvBcMBwSXZ3pgvdz7+ww8H4D4w18lKHsjRPVIAYaX3rv3COSHd
         CWerkVwaRIZ0T6rHwIfxNwlZperEbFfnFqqhSlxIi4DPFa6LCgfvjKAHGbaMIq/sho7X
         4Kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838914; x=1731443714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcKe6HiC2vE/ZqlLzKF5ofprcrd8rf4lHVJTpPKcbw0=;
        b=PVd9ExkB3quk/z9e30VpegEkaoezb0+GlDOn4WqHXdd83hwenMJvVpnFl/nU/9UpQW
         e6Z0zoPZobZhptGPWyOCOcBx8VQTeYLEWCIiPUTequdZGegDvpUE2G6q6/MZGRRUSjh6
         8MVlUSjburwlGURitSN/vXVWEdBQHlKj4thOXLIW4+A6H09PjEY46Ho4VMK90MD97bEa
         7jx/Vbzlv1LaaeYWuVMVfmoZZxFvj1Ep8rANei+adNYMuIEGKMqx9hWId9C1IU0Tgprd
         y187v+89aEp6flBUmihAfFmDgow+hyXJFIT3sW6t4q7C7Y8l1053Nl3WCOz/lvcL3nyY
         RxCA==
X-Forwarded-Encrypted: i=1; AJvYcCUTx8EGQL7z9EHaLyCgubTBCbJxe7El1n6LZawW8rLwUhqv8l3QLlJ5llriN4kPjNZNOyhgcO67WIhyohndyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxvkUA2Ac6iJjUBSxx/yqNAIAvjZlOR6SoC68p/hGW6nsPAINu
	a0APqvPVVuSuOW0XPFec4oV+IGQNtdbrLFKf6FPI4Q6CBH0ZXxz6BsMW3LU1qUelA2nbjRUzHcr
	DvnlwjeNL/mDQOZh0YFppzq0s3Lz8BX99JFs=
X-Google-Smtp-Source: AGHT+IHqUU72e7CqcnlDl/gRXjoiYk0EMpGgo9EQQdnD6/Z3oBd5PDH8Sn7/ugPwoB8Fn+o/UWAOuzwrMHaN3hyKAXU=
X-Received: by 2002:a05:6a21:6d9d:b0:1cf:3a64:cd5c with SMTP id
 adf61e73a8af0-1d9a83aec36mr24519956637.1.1730838913748; Tue, 05 Nov 2024
 12:35:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241103030530.76756-1-fujita.tomonori@gmail.com>
 <CANiq72n3bdNoYsSo47BGK2AJX_yhREoOxfKwkMBwz4v3bR-UHQ@mail.gmail.com>
 <20241104.110803.2105992905862489345.fujita.tomonori@gmail.com>
 <CANiq72nNMM5hCMa=hDbvpX6AVR5L2pswdQJ3AN05ynHx2Z3Q0w@mail.gmail.com> <OAtDBYR--B-9@tuta.io>
In-Reply-To: <OAtDBYR--B-9@tuta.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 Nov 2024 21:35:01 +0100
Message-ID: <CANiq72kqnpt2RkEJi6zR4JppO_5mebgf5RrLvTi52syge9Ztbw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
To: jens.korinth@tuta.io
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Rust For Linux <rust-for-linux@vger.kernel.org>, Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary <gary@garyguo.net>, 
	Bjorn3 Gh <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	A Hindborg <a.hindborg@kernel.org>, Aliceryhl <aliceryhl@google.com>, 
	Tmgross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 11:08=E2=80=AFPM <jens.korinth@tuta.io> wrote:
>
> I think you both make good points. Fujita, you're right - it is very basi=
c code with little technical complexity, so it may not be worth overthinkin=
g. At the same time, I really appreciate you including me in this conversat=
ion and acknowledging my contribution, Miguel; communities can be quite sen=
sitive, and sometimes, attention to the small details really does make a di=
fference. Perhaps we could simply add a "Suggested-by" or "Co-developed-by"=
 acknowledgment and move forward?

You're welcome!

"Co-developed-by" sounds good to me, but since Tomonori is OK with the
split in two patches, I think that is even better, since you would be
the author and you would have your first commit in the kernel, which
is deserved.

By the way, perhaps I worded my reply above badly, because I don't
consider this "very basic code" (it is why I quoted it, but I should
have used "if" rather than "that") -- the fact that we had a Zulip
discussion about it, plus this email thread, plus the `once` vs
`once_lite` confusion, is already proof enough ;)

Moreover, on the textbook bit that Tomonori mentioned: it would be
amazing if Rust macros for the Linux kernel already appeared in
textbooks that we can copy, but I think it may be way, way too early
for that :)

> FWIW, my motivation to look into it was the TODO kernel/error.rs:123. Mig=
ht be a good first place to use the new macros.

Indeed, if you want to fix that one, then it would be a nice first
user in case you want to send the patch -- I suggested that `TODO`
line long ago, so I am glad seeing it go! :)

Cheers,
Miguel
