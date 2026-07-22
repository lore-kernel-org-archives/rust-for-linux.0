Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762114399D3
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 18:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784744059; cv=pass; b=lmhPawTB0LELUYv/qGphP4p5aT0Ow1Vav63YnqcevH85jg3M2m6qH1/jneiG/RdZl2YNIp6QDJJ87EWBVI2Om9uPkAl5s3uxdI+1/EDEGGh3iv4ZcjdUjzIpPmTN2pP33XQJUWOYwQon6Uftk04urhHMraVBrYpfQuEoQ/47HZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784744059; c=relaxed/simple;
	bh=g052wtHEHlGEqM37+11WWyqyxfxCGZ8B8ZHHH2Ka2LI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BaxVlG0rkfwxucNLST09ZCqYUtvMBJ7YZ21Nodfg2b+JDkvpZE7lFkSdA/U/0M+ZNtCk94PX3WutRlKYCwBs9frK1rkUSgPBPq2GPBSgyCCODaFy7OPu9prcBAGfCLqOcB5tIFnhdzMlnB8QlvocliU7shZFr0bI1oGKeXtVmrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LN2dEWl3; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LN2dEWl3"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1690194f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 11:14:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784744057; cv=none;
        d=google.com; s=arc-20260327;
        b=W+shNhGQJZo8j55wICV3zlWXMlpyn+QOgttKsBU4mzMQJlOhZ94c+8zQWUWnnGonLy
         UTJYvvn+ILtNEddfRnPf7ZUFk1hhoQ0KuJG0qTjcjJGyh9RAR0dKIa5NBk0fyAi+mvfr
         2KhUGVenClacyiZtFiqUQ/R0fVO7ilrq9G3dkFZ+Tlbn7PNc3+os5SMIBA01ze5ID942
         6/m5iRbX7IdjxrN9uMX6qXhF52IKtUiwltL+Ncli1HG9MnDqcgSlII4gN/NnkSOMQQ60
         pclEIdQxovqiZ5pv4wgFaiB1p/P4nhVZ0SYq4ulVLDivq9Gti6jQxJ7lZsNxRay0Zwbq
         JeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g052wtHEHlGEqM37+11WWyqyxfxCGZ8B8ZHHH2Ka2LI=;
        fh=U6dmpMvxdPLjr8UhXSrjkMhMpyRkAxKFAnt8AvrKnUE=;
        b=kNmQMPJDPstYElpsFuzXKOp8tVrF3tWcCBVlzU7UDlraSS+9aLY6vMOxfA4auaCm12
         7fYeZEjymRy42ELJ40DgQjYRaRsSzJg9I9JUXKXvbMVI3LqBgRMGCEvIuhujgdUxXSzS
         0ifuvDzLqN5zx2ZEu+IFLmvpahQHCCC6E+WyctPaEZ2FGkETBsiMug6UlMGaKFplOuvA
         W+tvnPVjCndPs+VMLf+i24T+3p19gKKxT0l6pFgrRqszYVYgd1OIRVyGQjCBukWeT+zG
         +egC6pBnEjex8diBvdYKOGc5DPNIa9dQdcQWAeOTGNgx8IbaJouY24oss3IkU79i/eAg
         qDOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784744057; x=1785348857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g052wtHEHlGEqM37+11WWyqyxfxCGZ8B8ZHHH2Ka2LI=;
        b=LN2dEWl3/JuC7v9sfb4vT9E/dZBUt6Bgp4ykwr5Lx5tOXvDLlFugVWJ9lwqjOdCzls
         cuHWpjrOX3c79BvlAbx4oBfqCng3iaqCFHhfXswrJurk894Du+df6aDY95GMId8Lyj+N
         T05+20dBYxLuyJMfHhRnssS3qnGJY+oMr67Vwgrmy8ja8OSQ6tJbbXKIyI18VgVlfqav
         APzYeUTSJuS2bocEy9Ug6reoJ8NMJcjjMctDOvMG06QTYLl75GynHjmE0vY9eU2/gNh+
         0CeDlkAYNxs0afdtFIJnlWFC0fmXRCkT1NiMEOcZS5mf0Q3t+6JYvB5qzPDo9YFRx3BG
         rQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784744057; x=1785348857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g052wtHEHlGEqM37+11WWyqyxfxCGZ8B8ZHHH2Ka2LI=;
        b=iGlZeww1ZyC1G0AU7HYiUS5zUBHJhIea/cM0Cu5EVKDwtMgrPZAOFOjC6tVcV2SGrp
         5sqk67StYe7dmsDyUYWyd5jXtEB9Lcbr49dva3mXqb64ptGdRwqFxBT0zEaN521UHFa+
         NMP1nbtDFzpYdoE288TiWRGxuijcKU9z+DwEkBlyP2hCraX+IptINEZ1CV4BttHQwKHc
         cMeGpvALR4JDgtFiDEtTOohdBJ+Pl4Ls0Np3RL/EWoocZ63aJdDdFh5xRR/IcNDGph9x
         VM6cT++yoeaD/CIS8TtChhozX6vHoNESBxnaVs/wiXAbK2GnX9kS6bYWAxNFx0sUqIdS
         ng/g==
X-Forwarded-Encrypted: i=1; AHgh+RrA5N/lMrffZ7mSYRyjeC7QyYJin1EsZ3hzZlxBpGO1b+nHFZClyNL5dXGeKeg8v7DgCqjg+ff5su9avTZemg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/hWHsS6N7HqDYl6eMOfOO514g+himuY53mh62CrAcqfJVv0L6
	W0PM5eaT+/9Cq/7BvsEUDawEHm3nHFKHuteKNDfzvGOf8WcIb3vq/YW97uH3wXk/glOYCIe7WRk
	CbY73iksuYU4rXW5M8/Zbggc12g+U/qrxGEuB7PgW
X-Gm-Gg: AR+sD12g03wWhCbO56tnQqpwJRREwKjppIMAN6nRfRm9dhKnwdKSlN9w70nbPw6EwcR
	ay5qwK19kAVGQHPQ35Jr/1XmHXH4/N8iHxnLem4KBSYj/l4vAVaErPWko/ocGFvKpLFk+sbODz7
	XP7FVRs7JD+vZn13ap90aVFh0Pfxpgup4bTQFxt8GK9N3pIKnvEjM37ajT6qFbka/oWH0fWTaas
	yrVSWTGO79TvUNgdKifNhh9B3FIYuXreNFZFAtdAh1xaTXz9/2VMfnURPEPTM4us/wFutudAADR
	NztrLiVCa0Nzghky
X-Received: by 2002:a5d:4903:0:b0:475:f0f0:9ef1 with SMTP id
 ffacd0b85a97d-47f62338225mr23937062f8f.54.1784744056365; Wed, 22 Jul 2026
 11:14:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716145536.3681630-1-gary@kernel.org>
In-Reply-To: <20260716145536.3681630-1-gary@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 22 Jul 2026 20:14:03 +0200
X-Gm-Features: AUfX_mz1Zt86DaoJjgUGu0U7Ccb86ZywK-8Q869WYZGNuzTfJdXwujJCphAbCgE
Message-ID: <CAH5fLghAcfJxD=F10CV6Gk20GSqbP5S_v2gy-yqWWOdi+aeHtw@mail.gmail.com>
Subject: Re: [PATCH] rust: revocable: use LKMM atomics instead of Rust atomics
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 4:56=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Kernel code should use LKMM atomics. The existing code is `AtomicBool` wi=
th
> the need to use `xchg`, so convert it to `AtomicFlag`.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
