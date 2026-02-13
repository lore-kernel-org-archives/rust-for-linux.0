Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124282E9733
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770978391; cv=pass; b=lREvqbmmju7MdWLogwgbv5S88kWFiq/3/NTv4k8G8wr3frLkQUzsoJCztn21ifkVyRKl5KumW0/08h5CVeXayHNwyilpnsTvfUbrJUuAtCLsD+DFBQqrdBJtQj1zVozybihIphih+MjwaP5firjWgalgajn0wkO9z8LDdwzG3xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770978391; c=relaxed/simple;
	bh=B9wil/U0sbCCZ00shUgxFC/v9GLpNMK8+4AwVbToHoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FjSV/uTjQUFAbzuDKd7TI+LFMxItTbedQjG67m8BbOpXM5plpQgl8chLzMDeh17ZqcQI125s31K2VQqpJ4N7Yos4rEVEq6OSUqENiRc7BjRWhMXte57SnjfubllRuVfXFo2x3VwmA/4eJcXkc/2rgSvZ0frHbroIA+2VhFSQdc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jl8DMBhW; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jl8DMBhW"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ba85f77203so113023eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 02:26:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770978389; cv=none;
        d=google.com; s=arc-20240605;
        b=aKPzhjuorxBCuiDFG8DMkJvc9Oiv5PjLbAMTGzFIZHYs7Pa0h7nwEMS3AKxDEEn/Lr
         bsz+VVgmLhGgF3VzM0z1lqxZpsWBaKT2ZBFMAEBIGKwW59D7nOlzlSpwMKwk9c9O7vi4
         7oFOjt6rDKAvW3amQPjVp563LGLEtxqnZDx9rgfAVzP97c/h+rRUaBMGotTwRQ/UBaqI
         Wxh4nCCs+fbQF6Jk4PjbPAxpVMW4JqoeckUfxu0su0WeiMiHaJR5HjVRs1KEL3gVB1vZ
         Y8g0JRd8zOG+KeLa6gL2Zgfey3jXMrufGWrsh+bbm97f26Dzz34yZXJ9P640amFlV85w
         I9Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tWwbEaWZswTY3OTEgaDFet626t18kJ8WzoooQK8KyRA=;
        fh=qya1rpoBcqavtb3nJC3MOSmYJ9+UnFnPUlfGg4x0YWI=;
        b=KBE46qO3ClGUNwpTHsieFvwA/Z/vTb/WoAX/3DaqflhSlxOYYrSMz/nmKZb9NnHvVO
         0lL/ioUYiCskL3JaJ6R7Ju6JG8tdsYlHVPmlUQbwJUzx+Sj7IDOTDhWa3rbobRdGOxR8
         hQ5/Eow0KaNQuY6avaKlUuvJywN+c59Roue3spozvnApBbZn9v8iw6f+obfCxDS7EOYo
         Vxv/NZLZj8oUNTl5239/ARnDBBo2ciJ7AicZjHRy0uKQPVV1fsgyN66rksLVtn1FSU9T
         m54xNrhVmTRQC57+ZYQ03oDV2tFYVQ+kzHXygEJ4bRSKvqO8r2qCbR38OEMppP3TfxEh
         Z00A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770978389; x=1771583189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWwbEaWZswTY3OTEgaDFet626t18kJ8WzoooQK8KyRA=;
        b=Jl8DMBhWIXAvmRdDmZhrSXfzjrO5REzme6/jvshb/AJ8yhQRyZv6k1JW4W8srFwE82
         jLpHvM6V380v+Sngtbs+ft9WuWmjqmnfWEa5Qa3N2Dc/7XL+eyaSpaeoA2OQdjAixaX2
         RNkxh8w4pdYKzdt86FKR/LOoKCo/5ZQ3XfzLP/IvcSn2zS90vshiyABu9twrbwbx2bXQ
         lg1EScODvjJfMSokoZ6yXo7qvztyWgnqqY3Wi6o6Gbj7s7aZt8Z9AdkWPzPrD4nva3NN
         eHMCXyJTMUC/UWLjhKriLFR4SLWuMuO/BljEuuN6r2sSpDUdlJsmlSefSDFV2vmf8Qsl
         atFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770978389; x=1771583189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tWwbEaWZswTY3OTEgaDFet626t18kJ8WzoooQK8KyRA=;
        b=bFzP9RSoYQzkApfVxlgs/iX8hAmYSYKbnYMERoBgONzUI2pzlBA/bpP66AUbaEa8zn
         H2lzdS1Ld+79vNydoberPvhpKlVFaWhonGQe2dKS11NGzcCo2KVHOsnyiug0E6Vcca3J
         gwkgbUGm6Mzfp5SGxASy63r4wWh46ZKy+B2CMya7+Qpvjto1BYdj31tGjra2nvmNmALq
         3VcDeif/2A76K1qL72d50kEdjzfOGBDTZCBhweYe/277vT+SzCt/Gpf23fBaaS7kBaJ1
         WQ0DK99YrUdZxQiGuEzwwLczywM7HCxhp4VbRzVSwnW8EnP8jYcfBv9nJQy1r0V2/qWP
         3CeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG9qM9Dhc3OC68oZpPiPQCFZXXfa7y6p35qg6CojAZodZNQsHzEHVFxXUZ+iL753Ly576n7AuTUC4Nwz8ntg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOiq156tslEY2G9ScxXPhN0CQaacqlwDIsv5fX92QlwBor2il2
	8c2o6uOzzYSGJH+9jnrVZthX0GaZejoAx2pmmOU3f4SM7ShpVILXn3zyPDtVzIy58CQKRR5ZGvJ
	vpYZ42xiiltosJG3hFHIr9HbU4oc/KRw=
X-Gm-Gg: AZuq6aIDqKBxWbZNEidDmKMG/RretMVDW2NNpwNknRzyFunhEsiHw6HCS+5EknPhWbI
	DM9OwqZ4u+2k070pv/FLd9x8Bdm9+HP92s31eBEI4v/WJDkSbco0zBAIRmwa3iNrDm+TcBykWQ/
	vrfmVPdgV0xPIjq6IYkmRW9QvMhdftKoFENU2L9wYO4XjIk5qIqwsOHvZavKTnNn54X6GeWeTLO
	M+EAThIWJJBBEf2gnoaE79UkafNgWZwF2aRC8WLh5DxK/47okPv+ALrQuG6CAejNX2mveS3kN7N
	c2i4uXxyrrnFhGffBoDDQl2oxJMwDLkYUokev7RamHARmdqu7X7157ODHflYAN08E0RWmV1il7f
	VWaOrdl6rhaMFE+R5TJlVkLkK
X-Received: by 2002:a05:7300:c618:b0:2b7:f145:a66 with SMTP id
 5a478bee46e88-2bab9fdaf65mr426129eec.2.1770978389157; Fri, 13 Feb 2026
 02:26:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206171253.2704684-1-gary@kernel.org> <20260206171253.2704684-2-gary@kernel.org>
 <aY57Y9WorBLiJR8E@yury> <DGDPR33UQJVR.2HABXQ4SFAGVA@garyguo.net>
In-Reply-To: <DGDPR33UQJVR.2HABXQ4SFAGVA@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Feb 2026 11:26:16 +0100
X-Gm-Features: AZwV_QjnC60VDimHgNkweprxDvtzaN3Jw9j5IHjtNSeyBlRlAAJi5S81AX-ZSr0
Message-ID: <CANiq72=qOJPHJ1w-gtF+uK-DG5oHSHNhaY+FMxotbynMbkGf3w@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
To: Gary Guo <gary@garyguo.net>
Cc: Yury Norov <ynorov@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 10:07=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> The reason that I want to omit "link-time" is that our `build_assert!()` =
*can*
> still be checked before link-time. Again with example above, user can wri=
te
>
>     static_assert!(foo(0) =3D=3D 0);
>
> which means that now `foo` is evaluated by the compiler. When this happen=
s,
> `build_assert!()` also abort the build during compilation time, not link-=
time.

Another reason would be that, ideally/eventually, Rust could perhaps
provide something like GCC/Clang `error`/`warning` attributes, and
thus it could fail earlier like the C side one (perhaps still at the
end of LLVM, but not as late as linking).

Cheers,
Miguel
