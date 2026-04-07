Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43C93A6EE0
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Apr 2026 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558411; cv=pass; b=FpsOZwVTaBBREoZOcjXg957voFrnjc6uOO4CrCyUued2iN7ZI8Mtw8YbPumb5mnlmWPtM8Bg3J6whGQZ/g/ckSMslNSoSpqmV0afL2ITqsU6vnqb2ETaC6PzHy9tWGQX7Ae2arJq8+z35nA+IK5ubacCPyzi6zq2O5CMBQr4PJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558411; c=relaxed/simple;
	bh=yXegbUoQZYx3SEeGwfYBNqgRNZ0CfKIaltHU2swuTyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2MTFHKdCk5XVbXD75XUuVJW34e1/Ggq1v0RqSwNW31bKJD8naB7aXtLA/DKTUr0nshvkV1jmVI4ZEcu1Eqr+4QfiGS7MeMw7nHscl1g8p2OqQ75ell6cRMGoMDHxToweHpoCPFpvuG3Aqhe346i00q6cBXh/D2c9mgi2UMKCqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7KlBllK; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7KlBllK"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c1161232dso122333c88.1
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Apr 2026 03:40:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775558410; cv=none;
        d=google.com; s=arc-20240605;
        b=ddg281LBheFgz0xVf6S1uxknQdU9FpgcVYfSIbXelbdCxGAGRh00oim4WMgi4I21uW
         f7TNv3qeKbO1jLAuE8Vp28z4P5D9xBJPILC6C+Xz2wuHFm+digr+IE9X+Vx1TOT6a9IQ
         7hjcQ5IcDZ1qJM3hr29itfWP1AXtGZbAoq6TaYqGcBqenIx/66y8VFF/H208EckyNTt+
         qPFP7asCuI1OTs8GiFplGA5yjk2wPE7ZLpKX3nA2HfintJ8o0L/U9ckcJbYBSsgjz84A
         t1CCCFPog+Jhr7BKTf3I1n7Uf3hBp8on26T9WUG/fYmIYosDhR6W9t7f2qX+wUFrf/82
         EJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yXegbUoQZYx3SEeGwfYBNqgRNZ0CfKIaltHU2swuTyw=;
        fh=l34u4SKeJkCr8qDZW1CrLrff+Bf4CFdqHaWHhGMrn3I=;
        b=UBZDRT67XY0EKq3LV/SACRCbFeq6Cp6+JfHs8N2aUGoXaRU68p0Dny0Dnvbtx67XZm
         rXIhWzYEp9sHfl4QYIlNrKalom9qFm0+BNJrbHgCSUZqvjx38/0viQ3CSnkVvvwuxU7d
         a6vJBMhbstPJgfRO1q23NpO4vFHXvmUUMUO4SEj4noupEXrJowK72/b03Xj0lnv9pSsz
         XkrvMsi2wP76VLfLX8a5xGgw46H5INrudF7Tf/pVQU4ehhpZhoHGHuYm6udks1beh5+z
         FWQ/m/icS0zSWwbdqSqh0fsUOugf76famPi1UoONZCkk6ZPwt3sfsyw9MNrvxGlCzqVg
         Vsqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775558410; x=1776163210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXegbUoQZYx3SEeGwfYBNqgRNZ0CfKIaltHU2swuTyw=;
        b=d7KlBllKAPjRmFja4T+Yy8gm2v3lDYEB9BtuM8moR4hXbanUyQ/2sVu0H3GkaQFx+E
         Q/w7cLhJH6SCQ2IzhYikBuOtF9p5gfnyJPQb22MePbgNC8vx1CnkXLWnikWykZWibkcq
         +JZmnGgWI0I7iQDIaM+mctVa/hywUsDlEew7zmAHP1TWMVvScEV5XVYVz33IDTdDK8D8
         iUWNKv1HkcCNcZR4908/9JDLZb8wOS6HruaFZm5MagqN1NgvlCb+tVQNvcRoWCriwqNk
         hV7kxF5PO1ne5WnvrkTs8Zr3EmA1xViDWuvPjtqPw3+7he8m5plWAHIWSEyNHShA20Ig
         nL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558410; x=1776163210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yXegbUoQZYx3SEeGwfYBNqgRNZ0CfKIaltHU2swuTyw=;
        b=Qgf22+/vHhAWDQhv//PENPtz2pjz47Gss3uzwt2YKqaKdxkaAdBebBusqDbWzK38/I
         XFRBBNdMi0PlZzBqvUzH0r0OGQ8DBujdCqI1bPD8O4EPq+EzZpkGstDArAOIzHfDaDhz
         7iNlo1EoFwEi9PhZ8XDZiki1OuvlGmwsyG4O8mqzto1JowGVV0Ggy1IfA+iAkPWpbWM6
         kOgWDqUs7IGJ3viQDxh2SCGJPknfSl5lcchmVseFyNpPTx9rA6ANPEAxblAgycBIwXtu
         iUvdRVtGf7KIMDAPBgR8cz54YVMofF4Td6WH9LZr3KznHmY4c5JMq0iQUpw9g1XFG5hP
         tJ4w==
X-Forwarded-Encrypted: i=1; AJvYcCUUjmyfnCmdhExQsRSJPvRVQuBryZvDA3xdUPhI36G7IJOuyLrXM27PdQcDy0/R45bBpzEO6GT0iLEwWi7ehA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMVTq9FF3OoaNs6FrkERGKMMGnNRLofmrt2kfANx8Q+25hX+Ql
	d/JHSaKdPn1fvsB8d39yJNThEk8eS6yXoULxOn6HJy2lxVoouogrE912jnKkPuArZ1826w6kb4X
	0qMKaBX1HexHnwbyM4rQj5Wi1RYIIBIw=
X-Gm-Gg: AeBDiesSDfDJ1HpTtCEyJfiZNhCkgcjIOiGGE/XL/AqLkwSa+oKXiEpYNCUg08A5TIz
	eOkojUTTUr6FkKhBN5QqinWL8ygcC3YuZnKVxIub9l9wAwZV5OoqiE4jhNpgUc9dvRYgYvLSMLL
	6NIWy//wu/wW404PKhCMdNweXJn5idXGLDdN8ZJD76NXhPFpSO40a+OxBc70yAAC3qfq/F3Qrat
	hEviCxBpQrrqwMgnCHjY0FYFttlN4yvtiW4lFokeWmJu4WkkDOOC2lip5sPgmyxOiZbZWNlGHHp
	tVtTPUec7EG0TynOjJX/juHnjR0DIYpllQrA5QeUn9Do20+v5g5PZE5QcfPaJI+d5oGsWimbQD0
	ikb126YBMxOMa7Na3L3XJRWc=
X-Received: by 2002:a05:7300:a484:b0:2c4:ec89:bd7 with SMTP id
 5a478bee46e88-2cbfc16e3ecmr2608464eec.5.1775558409658; Tue, 07 Apr 2026
 03:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406095820.465994-1-ojeda@kernel.org> <20260406095820.465994-2-ojeda@kernel.org>
In-Reply-To: <20260406095820.465994-2-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 12:39:56 +0200
X-Gm-Features: AQROBzBbID41I3ps7X_H1z6WQZ8PUlg4rMQAsQG6X64Zc6BpO61OMxIGmlgaVeI
Message-ID: <CANiq72=mCc3XQ-fpkxBdEVkjDyt4tKzrdCuWgqMkQOyqBMej3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: std_vendor: add `likely()`, `unlikely()` and `cold_path()`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 11:59=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> +#[cfg(CONFIG_RUSTC_HAS_COLD_PATH)]
> +pub use core::hint::cold_path;

This works inside the `kernel` crate, but Sashiko is correct: we will
need to enable the feature to use it later.

And while it can be done, it is not as simple as usual, because it is
conditional.

I was already on the fence of making a single function to share the
signature anyway, so I think I will just do that in v3.

Cheers,
Miguel
