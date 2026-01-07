Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8E018EAB
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 01:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767749129; cv=none; b=eVt3vpLh0LnNm48nqWybJx09LpRTIwtuy0EYJjxC2CH7SkrMI8C/zuEJE8hIEYAZgTgAevD9JuPKiqEe9qOOKB6s98ifx4Jn2Zc2iEVqK85F+s+/UYwkZ6801RZ51+bzmy8PyBRfvWrsAAGA5bHaspotly4D1JKXvqdduQ/UmmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767749129; c=relaxed/simple;
	bh=Zx95EEstrW+K0evq+lvfYaLZ+4Ggu8HsiKPBLKnQBIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzfNFRt3iDn6xdBk1Unb9ZwzrrfxP1B/jedRQCZ1TkMaHvf6rLZ57UFpj/MZyHKDHTbdW4Ll0sw72Mk4ktcV/ZJH7a3VUMovbKE96EPcXnqlDnKHFkhrhmJRLAIzYwq8/2U3r8n37uujvkOG6tQ98fabBd558IYopSJooOvkiWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=TzuxxAv6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="TzuxxAv6"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a110548cdeso14740925ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 17:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1767749127; x=1768353927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5Hu28hfraDHp3dTfCwhoss9csXL/hEFjjAE3J1MRqA=;
        b=TzuxxAv6wQWxfIQekj3DKt2GOOcN+xmLw9nBeQZKQ7FOGK52mnzBnpCygyIVHZtqx6
         0k0Yb5qC1fnq34CydXa26dI2N5wq28s44czz26aGcz5Kz5zGvtVnUHoE6CNQ2jC5xW3p
         8qZuhdRY2OSwKw26KiyUJ6V3nuP6sy036xCnXEpB5Ue4Pvi9BHWbRlahsTH5d/UCc0Ir
         C64wtucitkzujxt8bHXy7+9HaPd3zWfWhXbtJDz+wyEVCM4fufjH9R3r023dZurNJKyS
         uVGSsf9k/6q6b0pwCptDlRUqtcLZQ0mAKJoIFGz4Z6oBWoaUh/Q84Cm6NXkYpO2MWltE
         v8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767749127; x=1768353927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m5Hu28hfraDHp3dTfCwhoss9csXL/hEFjjAE3J1MRqA=;
        b=DB2h2WRLVssil740g9/4gvmAexSV9QVu915KdsUj1qeYgjMRQn2qUAl7Ga3DshlU/9
         Wjo3TXyMLhN2GOj6XRNSYBsA/o1QwvawLh2vz4oc91KLVuKqjMYhnZU+yIyIhFCX791B
         eGseg8prI/ExDwiPWeqpLMKZibxFy+10QFIdmD1JEhMaUBEHuUZaSb4KsjagX16fkQgW
         3STJ+UbsQs2S6jEHgcZnCH3oOrr0WaJT3r1lC2ADk59bcamA/m+sTVRYJ76KGYUHWjf7
         Fq1GE5qf12hOi0BrGKRJsXKXe53+9w9QNwug6K9op6R8fhcqOfkqHs8lxKsHS+FVaLQP
         VUbw==
X-Gm-Message-State: AOJu0Yz30hAHD3XyTDlTaem2JYmeWitt+7g8b4baIVakVm+qnamlWksW
	S+eX3Ofw9zXWW6tA8SysIqsDRdUVZgPcoaFEzcVZq3UIqdlAHHmr9H+uvhLKTL8b1Gsd7/pVH7n
	LT5/Wj7A/B5VxhIYL/SL2sztZsWX7eNmIg3slj4X5
X-Gm-Gg: AY/fxX6YMljPAf5DJHERtPeCc3CuPqlMw2c0P66xt7Pu+K7w9FsLn5mltNSc+ImB6oi
	n2oleXLEsD/R/Syy8JJISVSxjIs8dvgyTO2J5kxcE51wwkGd6/KqXzRu6F3HzWgy0RrEMHHv7v/
	io3x/Tk9wK0SxtL6LOFRdyLzCIZ6bWX8Ygtu/Mj5j2FpuEyP9mzXpwBi8DWLJVxW3YiM0Y5iwpG
	ce+b6HUoqyqwuhKliSK3bFAtkOwIKndmvfB4ywbKKJttmGVdTB7hwBZZ/BmMZuGX500LZI=
X-Google-Smtp-Source: AGHT+IESY8RixXEfrF8833UfRSpT7APeC1lId+5K68apgrXSTtEwq35uEZwFa6nkS3e/+qIhJ9aUPsNP0dT4zdl+2JY=
X-Received: by 2002:a17:90a:ec8b:b0:341:8bda:d0ae with SMTP id
 98e67ed59e1d1-34f68c911c5mr906121a91.20.1767749127505; Tue, 06 Jan 2026
 17:25:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com> <20260105-define-rust-helper-v2-7-51da5f454a67@google.com>
In-Reply-To: <20260105-define-rust-helper-v2-7-51da5f454a67@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 6 Jan 2026 20:25:16 -0500
X-Gm-Features: AQt7F2pRm5vUDuNulUVhL5x2hSosg9LAixUgwiJKX9y7UPMX5r_6d7kny0l1pt4
Message-ID: <CAHC9VhQthnDRi3yXxnD8W_vAsxKOJPh8Zd1YxpF_fU5YGkj3SQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/27] rust: cred: add __rust_helper to helpers
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 7:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> This is needed to inline these helpers into Rust code.
>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Serge Hallyn <sergeh@kernel.org>
> Cc: linux-security-module@vger.kernel.org
> ---
>  rust/helpers/cred.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
