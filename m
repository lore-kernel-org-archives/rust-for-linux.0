Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CE43A453C
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 08:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775290232; cv=pass; b=HjoXvFdiyKHJZURLegU0gRwKmVdx745raXq581YZyQnbDj6/1I9Av0H6yxuEDmHRZ5GWPS1Oo0WwPlv8eQNudxX8grcos45bqZhPY/+IbG24vsKeiOtH61RrYly0re/pDtlvYQPe2Ec4t7iz21eGDHwzgPS2Ftsi408HZOLB8I8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775290232; c=relaxed/simple;
	bh=DGfRE451pnw7NyOGNMyrn4Imx+oD2bBNkpJX4gxeM0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CxeZ52DavQbMoVVEqTAi8lUlOSnRfZ69Ff9RHjTfXTk3i5z9ZsmPo5awoSFMcAOSc9YmmdbcyM13glS5rWozcm2VHfN7Ko83519nggruFgaOVFrv3YDuPbqX6Ppn/5+z3wGoa1Hji1KeGyv8WoN7GdUq8c6juAtDCH5j4ACxmtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GRffffSM; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GRffffSM"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so2426887f8f.2
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Apr 2026 01:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775290230; cv=none;
        d=google.com; s=arc-20240605;
        b=aM7dogsfoRjZBxmY4ZVPQYufxCwhBm0DdmvL5nZ3IQaBXOyZyiTi+qsKqZespgqKzy
         yQxlIHQjpjcvy2OGsB7fjv8QMS+r2h1LGGpKMslP7VrTuKqDBwQu+R7NYVmul7Wv3h5y
         CAlvbkq2955Y9Zk7KKCHjMKz16bM3jcdUssdae4tp+NAcjGxRPSo4R+P3vVkBaAC/KkS
         GyfdR0re/0AtgW2cn/lf0kaKcaJJTh+AVhQBftRITdTo+MTF/qrlASD3/PjFNIOe2kQb
         ylKGXzu7SwQSckFGMQtCeUzopx2FgZYuXtsQzU8Z3IKbH71jUsymXRadfvFK2A5pslLP
         jd1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DGfRE451pnw7NyOGNMyrn4Imx+oD2bBNkpJX4gxeM0w=;
        fh=wGluuJso9eF1W+2CZpiWheloTis3+bavu4dt7orVRYM=;
        b=iaPIq0BgOWlj904Fn//USV70AEOdZIixEI3rVHapLP1eEZO7UPr7nTvhx4UxWfSQLX
         IE0jDsU7ZZXcW3aXdDqPhgZ/zxLUTQ7Q+et6KKtpBdclvICg3O35b7NXkOftdGsdu0nw
         VTAmA2PpMGXQbu2iXQE+Th8eLXCBlKSyhc4EYvQMrw6elZJDghu0GUIwf4hLKL4kWGfB
         sjkhy/Y4GK6YhioLwX01xLGrg6v1zzbKhS5XXZu7hBj0gFkkv9C6Cl0va9FAZ/RiOKkL
         Q388K3mhLdZCiON/X6ChKbgjS1zk1lyqXqU7RqaEB7tptHYuZYc9HdHRD60wZCEdPe3G
         Stdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775290230; x=1775895030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGfRE451pnw7NyOGNMyrn4Imx+oD2bBNkpJX4gxeM0w=;
        b=GRffffSMuhhl3B/4hgi7A2dPpC+ASB5mbylg+PMOjmqR9eV6Tke/MVML6xYt0PPbrl
         KNXHgeXKeLejB6G2LLXg/toonYFBNh8lg3mcLQbdTNMPY8hrPzOTgQIhYD9kL93twugD
         SHIrmnHuXk12qoz8YyrMN6wCK3JUV87KWUsxwQpep5xuaOI9Lh3QM8eWs7R2svXdr9+S
         P2PwgG+GBGDojw162xKpgdt6n3xSYLXMIUhWVoMgv+IVG7HHX8CosnPPir1swK1qWZHJ
         7DcnSyv4ltO7ukVDQ6aKmbGUeyjyH+ZoCHxYey06JwZOr2p+vG7S0ySaRIRgJhtXhrdy
         /7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775290230; x=1775895030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DGfRE451pnw7NyOGNMyrn4Imx+oD2bBNkpJX4gxeM0w=;
        b=jjIDJ6iZwNactFdIZ7upJPAAhts2e5QNha7+W+opore1WJxG89RfUNyJoAjhCZWehJ
         /3nOAeouhgXGts9f4LxND4ATxGMdHNA7mlGDghFOtBm+dajHPPuZyOlLPrkGdMctFKfL
         BFGrJFKP5CCyiZnJ7oK14c3C7VtydVJAUXVFz7EC3q3BrScx2SQ0c1skpLLMZujWRDQi
         zsTBO+shN5ME6np77mqdbYidMxs3so82M9OcmZBNlWrt7ZTKtwAN5abPNJ9sWCOO8HT4
         a53UU69+wI+XOcsOKCsCXQBuUl67IA7cGwL0N7NUAZYfUixWlrjabSFtCRIxL2f0uRiO
         YrUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDfZMKueqixYlSbN/igFvL+D4xJWgeHX0evwz6l+QbvW5uZICr3DoPN9YTFFkUy2BWrCbOFvhDCtuEyAKrYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlcUG6Hbm4//f/hBoBid/cYM39d2bsVIt7i1nukhtogIvoPNxT
	fTrd4xUGqzeiQqb+d9wqrwUYsVC1N33xvRw+9HBJKfM1BQcwannl9s4pghW1QCtOHNYbJ69WpmV
	bLlYq63hwiwQrLFvDXad7lNJQ+aVxREWbn6outegn
X-Gm-Gg: AeBDieulFezn7SzOUslqJxebBCMvMour0pGn3Pu4uoPFMKaVt3wPMxDcbY3qZrzcljq
	FKtyNzbv9JzOFs0LQ9zC/hTCz636RZ0VG0TVdGXL/LDyGw31wmEJAp2yrPIQNcfJsn0aN06aMcp
	b9B5NpOb3SBcDQMh2i5mvW1I6n8jwBIcVMKDzJ9/XOepv+hcA9sx3Mm09o9XYYi4TgAuyf8SO2g
	BNkyLvGtaC1p3tnx3eU5YMME/w1OetORteqE0Wcq021yNMXSlFNg0qxiFNJxsNcxQfqQUOToI6V
	jfMbZg5gzMfSVBrAGUtfcz24PUxMfuoedNrGXw==
X-Received: by 2002:a05:6000:25c8:b0:43c:f257:c6fc with SMTP id
 ffacd0b85a97d-43d2926adc0mr8915415f8f.10.1775290229411; Sat, 04 Apr 2026
 01:10:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403-lockhold-v1-1-c332b56cd8ae@google.com>
In-Reply-To: <20260403-lockhold-v1-1-c332b56cd8ae@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 4 Apr 2026 10:10:15 +0200
X-Gm-Features: AQROBzBU2r2t9knrpqR3DtB1YzIUeNgZ2Vu30xRIPe5hGHIT8gC7oGew3aOQIVc
Message-ID: <CAH5fLgg0F_ijK8i8XYwN4odFAQJshkFJgaw_-eEMRboS=oy+RQ@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: Avoid holding lock when dropping delivered_death
To: Matthew Maurer <mmaurer@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Matt Gilbride <mattgilbride@google.com>, 
	Paul Moore <paul@paul-moore.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 8:19=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> In 6c37bebd8c926, we switched to looping over the list and dropping each
> individual node, ostensibly without the lock held in the loop body.
>
> If the kernel were using Rust Edition 2024, the comment would be
> accurate, and the lock would not be held across the drop. However, the
> kernel is currently using 2021, so tail expression lifetime extension
> results in the lock being held across the drop. Explicitly binding the
> expression result to a variable makes the lockguard no longer part of a
> tail expression, causing the lock to be dropped before entering the loop
> body.
>
> This was detected via `CONFIG_PROVE_LOCKING` identifying an invalid wait
> context at the drop site.
>
> Reported-by: David Stevens <stevensd@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")

Thanks
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
