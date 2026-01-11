Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD45C183CC3
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 20:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768162022; cv=none; b=iYILAxkP6iMaC6Y1kSdSPSfA0UonIrWqnS6JcPcdHXJAKgLTdNSML0Yuuk3F1BOs/debI7/gKTA8YPLKBQA+LaE+6FbWxbSzk0cT8x1czjPIPPFoqz2m69hXIbp+SP1P77Pc5din+GtIRUZv3I5KMJtF5DNMfWkYV931ZHMVsbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768162022; c=relaxed/simple;
	bh=jMW7zyYnxLuzyB+R/aK0KsLzX1soO3HJg9iDwBQypyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYVaktSU+atEl9uYx+WzUAQrJrJhAT3IAlLdtJM/bP8hZMq3N7cpqsZqMiiWn6beVgt2zzateyIw06HVN+b46y7XKq5QEPHxGPPvQ/XqZ12ePkD8Bz88XbZ6psp1sdXj/cVJodtUUK4hxQaVHenLuFMKbo7pOSUEc/VHVAaIr/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqlagMtc; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqlagMtc"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b175c4bb64so328230eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768162015; x=1768766815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMW7zyYnxLuzyB+R/aK0KsLzX1soO3HJg9iDwBQypyY=;
        b=FqlagMtclpbzuHHJjFeFf07qhAi112GAfUpROwlH18Y2VLGXAx5oyHS/XORumIUnn8
         arqr+NZzaFhS5kXMZpy7kel46QVHe8Y0OdSEJSwvY+9YDht9GbtWfHypfwugdmtqffks
         L1CYoko6UymH3PQ6SJFyGKY+GwuLuhKgjUEiEreWeypnOaM7Om+zsxOBQh3CBP4Vcey0
         FPpBmNZ0GBEPJEP8vn1psEOWlOpEl1gSfRpXB6Xh6xYOfVVUGljr2SJVeZb0Esrtdm+G
         +vMv8wEysDqTFebxmbuK3vLoOuHrtYQVPmKZgMbBX/U4hbaWNazcnCat2F8/R/1X6Bor
         faxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768162015; x=1768766815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jMW7zyYnxLuzyB+R/aK0KsLzX1soO3HJg9iDwBQypyY=;
        b=Wb3a6ApR2ZlEU08PpW/gSaFOBxjH6PtC414WdKhoGj9addyVElsUnCfR9rvkMd8JCS
         l1HcWDgjbe4gUflyoNK5gKxdH9J+hrTKeJbl2bZimvWn5OvHXtntJVOZEjXWjvE0h4Dm
         irW3jNSyxzPn1GSj8j2A+UEtZZxys9Kr8PJ4B6YcG+o6GoQsuDMXWHXAITuhXHIoMlkB
         hFJPAcKIk5E7HMEE0WwXOLdWxI+Kv5d/HGdgWAp0y0ZWx0sbXhz4bw4x7+/9VeMPBE5X
         0t8coYBjw6PIXYddoaEM26DTLe+g+lotYDeW6k+5zDJPGBN746UTX1DNpFIXTN1Mp6o0
         0DEw==
X-Forwarded-Encrypted: i=1; AJvYcCXUSQVTNtlohOjQXoo0bIEHzrZdV4DjvpR5JZCy750bmOMzxUgQOl0X1VBFbguSYx2NXYx9eJNWN4N0n4aNFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSR76g4FuODwqR1mJSHAWmLeiFpLqEEhdh3e/aO6kOoUqIV3IT
	q1HEKQwnox6YN3d8LzUHrOdMkixH4/D0zUwNZv+PXOwUcU2QAwn+PlXm5vmJg/IgJyQ3mBOLVjh
	EPPshoIC07hymrRK0/4Lqz9Fx92hrJd8=
X-Gm-Gg: AY/fxX58jkjseg2/gHIabd8yz7wznKqjgS01TBDthUMDpFsKZccAy7nbriZ6nmQ0rt+
	TLxAJOtNxhRw98yCCtU/kYp86xonCPDR7vcTIJo2SyJQU5lwgBIYl6zsBXjzJXHVBcsmHQ4htjF
	m1RZ7YQTscre3gGFTKhRDtMvy0U/qZdJiWMenr71OJ9Fi+igampF49z0gM2tx+GXnrvTpfEXmaE
	8L/aPt8uzqqt5eVDWpuVyWIh9iOP1gq4ezvE/8fCHHXhhH+FYbOkfJaqZ2O8rEVlSNr+LMRKShZ
	3Cuz0028HTyJTSvkncle6bcgR0Ih4XKJ7DV+I4EwJjx978A+ItZ959j79zahzI5pQlTfxs9QbWr
	JQojPcZ6CbFWy
X-Google-Smtp-Source: AGHT+IEGsLhQ3wMt9dHC0r5Py/dF961LwYdVUl5KygfMr9Tq9SYWUZcOecU49ubzyxc6YhhZNdyP8oGJZ6T0OfsWVE4=
X-Received: by 2002:a05:7300:2d15:b0:2ab:ca55:89c9 with SMTP id
 5a478bee46e88-2b17d310ca4mr8187553eec.4.1768162014773; Sun, 11 Jan 2026
 12:06:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com>
In-Reply-To: <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Jan 2026 21:06:42 +0100
X-Gm-Features: AZwV_QjSl-fXBhGJ2KqL_pK6o7mT8pMI6SyisqSKHqxteVRU9fUxBC8IlbZtTNM
Message-ID: <CANiq72mXjEQd45+U7=UOfmdiK6zX_MFnnTT2Z4-a3ENF888i9Q@mail.gmail.com>
Subject: Re: [PATCH v8] rust: add new macro for common bitflag operations
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, felipe_life@live.com, 
	linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 11, 2026 at 2:33=E2=80=AFPM Filipe Xavier <felipeaggger@gmail.c=
om> wrote:
>
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Common helper for declaring bitflag and bitmask types.
> +///
> +/// This macro takes as input:

So I didn't mean to convert the first line to `//!`, but to add
documentation to the module between the SPDX line and the
documentation for the item.

Please see how other files do it, e.g. `rust/kernel/slice.rs` and
`rust/kernel/irq.rs` are similar cases (no `use` blocks between `//!`
and the first item).

But please wait a few days in case there is any other feedback --
hopefully we are getting finally there.

(By the way, in general, it is good to reply to the feedback messages
you get, to confirm or not whether you applied a particular
suggestion).

Thanks for updating the docs and being persistent!

Cheers,
Miguel
