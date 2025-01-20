Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5156A188938
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jan 2025 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737368537; cv=none; b=Hya89qYikpruvZGcq5r3SA3JCTCKbAghXU3KU8pf7rVMZcPvn72zTjp0YBn9k64Yp5GQLgXERpOaVO7p7CKfZi3zRTGQ4GKtyucwQlPOpx19qA+snaqknyyte88GXRle0s0YUJ+9XgucKMCRwNiRjUncjj8yytJIUEEtiHA8/WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737368537; c=relaxed/simple;
	bh=X42Oi6mYryoY87gDGmRS63VpP9HgOnQt3x6UQIYQzMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSFu8IteDJF5XsMng4yDDWx49Xf1bDqXMfDd+A3aerXnutZNXRyfQ/teeFzCYdKIJ8eXAHrqyH+mFnpDSWdetBldgJ9I1fhBFvv0glL1vUqOikQSmvP0o21UBkfI1mxStS3avzRQQOeD8SoAOz1vT6ybL05neF+TS0bdDajeYA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIx/StL2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIx/StL2"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2161a4f86a3so8184775ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Jan 2025 02:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737368535; x=1737973335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X42Oi6mYryoY87gDGmRS63VpP9HgOnQt3x6UQIYQzMI=;
        b=XIx/StL2kpv7sHNiK7P1KnomXFzf+VlKU0btCSpOt/V28mLj2gyHfyVXrKyvqO9UHx
         PRnfWz0jQPSj/sf1p0vCr1h2OTKiDTcjJQSRUdwddySpUNjmBmo6x9fzZ6IZJITb2VOF
         3lVYvPAASsXN8EsN31HMvc1jh4g0hb2DExQV8TihdoC9WtGuaQs17Ns+xbYlRT/MowOy
         G/zvuVbMYut9UaKOooJ/olM6yMG7E9yB6KnaFrrB884M72x5GgZgv/9bO/88UBtVnUMC
         bbn8zs9cVmYt0DBKigH2Z8AazFomex9n5NevfCYuPylLkvigo/T0xGSBNz2u+yqvIRmE
         TPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737368535; x=1737973335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X42Oi6mYryoY87gDGmRS63VpP9HgOnQt3x6UQIYQzMI=;
        b=KdkQv6QJYpp7FcDvXgHcVIneRhvtgMI1oITlXYmY/iRZ4rwNoPhppWc172XVhegW5R
         zy8j8EKsvwYFDLpStqBZvcYKhFkPanE5ZGM25gEB5AVwhyLlQwYV2914q4x1szW7R3Br
         qnGPiBjPEp6NrwJMF/7L1Zj2CaFDZKYP4F+Zqh0WJ46xtsPReebeHeLDID9SdP46386h
         1CADiLg8yReX2jTxUobpyjhECHUJHAN+9JNzPG7Lcx69QKTmQjhSOC9vL5OfZxOYxdtH
         ZDBrIjWZIjMGJoColsxXcwNrMCNwMyWkIAiPV86Ro0s1GZhWhvVDH8iTd6PisNLKAsdp
         bxAA==
X-Forwarded-Encrypted: i=1; AJvYcCXIbkzIho17MiVI4uI166DGCV0M4jVp7PmGFcCznKt/JDc+XoEsnR6Ujb7EEDyas3JUrLItCRaE0kfCSdwfpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDGrdwRN91Pa05iGk3F6M7Sned9iH6gLEWQOKDWzUBdMQSvYb2
	BLn+C1dmBSTR8szC5UasR3Jzxk8W/NgIWEhwl06lb5QisIf7HJ5JnNocQIomgAU7KtOMPzZta4K
	UnL11IdRTRY5Yj0Oo+DQsvG51Cfc=
X-Gm-Gg: ASbGncuqfTsolcF6Cg+hNmoZzYpNRNf63pd810LdVeJwNkXye8gfDy5g3bR90uEXYU8
	6AE6UPDFDwPfTaYONqxjYHWLu1Z0hkw/TS6V6t3ZglCQw8tOWxXc=
X-Google-Smtp-Source: AGHT+IFBwilW22118mWm/G++A9VtsVa3/7hTaDUTlOafX+TyafPamDxVPdaLkp4WdNb3Uop7x0CTlFnGrc019V7aqws=
X-Received: by 2002:a17:902:ec8f:b0:215:a57e:88d6 with SMTP id
 d9443c01a7336-21c34cc5dc0mr65750465ad.0.1737368535427; Mon, 20 Jan 2025
 02:22:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120054846.3880395-1-dirk.behme@de.bosch.com> <CAH5fLgjkTpg=g=KHyw--XCqNq6M6wGFKr5t36DFYqn9HK8Lxiw@mail.gmail.com>
In-Reply-To: <CAH5fLgjkTpg=g=KHyw--XCqNq6M6wGFKr5t36DFYqn9HK8Lxiw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Jan 2025 11:22:03 +0100
X-Gm-Features: AbW1kvat7e78L6P8Km5VnwIrV9uX1Ouz2YZ0MgbzzuEjjlRlIKuMO67EsbgHQMM
Message-ID: <CANiq72mEDBz1F2w=o_ZKxpYuNhV8+gDTq9EhuyZAPZ_Gfy8uqg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: error: Extend the Result documentation
To: Alice Ryhl <aliceryhl@google.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org, daniel@sedlak.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 9:51=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I'm thinking that it would make sense to remove this example. Instead,

Removing the example that should not be written sounds good to me too.
I don't mind it too much, since it shows how it looks like -- if it is
kept, perhaps there could be a "Avoid this"-like comment inside just
in case.

> Another possibility is to call `unwrap()` or `expect()`. However, use
> of these functions is heavily discouraged in the kernel because they
> trigger a kernel panic if an error happens. Please see the
> documentation for the C macro `BUG()` for guidance on when to use
> these functions.

It doesn't necessarily trigger a kernel panic, so I would keep the
wording "They trigger a Rust `panic` if an error happens, which may
destabilize a system or entirely break it" (the latter bit comes from
the docs). Or, at least, I would say "they may trigger a kernel
panic".

Cheers,
Miguel
