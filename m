Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767CB9460
	for <rust-for-linux@vger.kernel.org>; Sun,  2 Nov 2025 22:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762122044; cv=none; b=S0p2T5JNUSKCigzTNUU0MVJSMhnAXJKUXxeTrlZc0vP0uEwn+3Dizig7A6C743+5bA67xS11gPp6fnCFAFrsM4NTVmsXPXJ8FBiyiG1NuqsvqUfVvKkbBJcSKoYJBJPGEsME6MgjXTlrIx914jjS5YmHo55O9co+KbMNq7D2CZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762122044; c=relaxed/simple;
	bh=vZO3PHgqOIKSLpT1XNcnJgC5AHDehu62cqI6I9Q+irs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdaXcytPr/vrRAupr7oKBl9tq5NcxUCfobM5l9xZdeuJQ0fX3M+iOFXnskzTXEj8Lk0nAo+gmVS4jbssJprWMawkFtCHtvFfkDmZ+qyV5W1EgaUPo3Std5IC8UwaZIseMjPMrSPlIZFoh/2GjFEuFg4FHMs+gNmogUdOvW/e864=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRIlvc47; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRIlvc47"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-295291fdde4so2654735ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Nov 2025 14:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762122043; x=1762726843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyIK1ilUw35FUA5u8sORs0QLERPXEburx1e7TliwGA0=;
        b=XRIlvc47qQ7umPfWUO2c42T32g0sr94QhalBA7UUGlLP3KN9x1V+CpHybwuBBsiAxV
         33GCGeEV50MuhPnypIQ+q3znQ68EAYqt48F2xL2zjngOGceTs5pL9A65s8/d3ZQIfXhL
         wb7Uw2jbMQu45k5vNybiu5roqCPVz1Yl57emtXDRBLaPrUms1dPyRK7KjPPkoZQP0ZU9
         8NBBkQ1evIKdBK+EmxWuitfOswAb/HnuZoGEkNVsvksFLwebrdixX58ood9AKrQeecZD
         QXxEE6kUpWoowhSVH92DHDDY29Ub+SOCHalCTQNkCKHA/8ufy6rcY90xGLeftjo1pRz+
         q48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762122043; x=1762726843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyIK1ilUw35FUA5u8sORs0QLERPXEburx1e7TliwGA0=;
        b=JM85lTljHqdeW7RYrPo7CIkflZy4CGoFQSiUoDhQ2sT2WNbPbO0gPaSaNdqxl+w4ZX
         JDmzHji6YaHxa3I4h0QXbiGyuTjdrv/xP4Pq9WhyRr4eHP/t9DvTY3yUTN+wvewnYjNL
         E/frLgv7BNDhcEVWem43ubFy9FkUnuMQ7tuZX2BPAKzOXJw+gE3IM8lNvAVE0lQYEO0p
         rN9VwxjZWhWOxBHCI8cRDLvsyWCxdjpqq1leRyoRwxb9AGqektIvC7pk2nVcVmAYsLZc
         LQuvCp2COIIE6K4YYw0ITel3F8ukBuARja7CU/yJmJaRWKPRrTbbTtGEaMl75UYqiqeU
         shwg==
X-Forwarded-Encrypted: i=1; AJvYcCXmtn81INih0JY6JEemKlJnFuUoRgakd0noHDkW2ZWlHLi2ZSe3H7dJP7Q+GwghJfgC9ZArNwdxjyqE/RG/HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGO5vzBd5TT0yY8tz+EMPiDO8jz/Shgm4rM6PrfGPtjNC+IpDC
	HhdVGCPXpF//vPoaBT/oOUuJUSd5rByrwdrhK5W3Zi1mJw/gkrTPLXivLZJkie7nyo3hyuUVY0v
	hjHKLINBp84u7wqSBE+gGXnsW8lFCy1o=
X-Gm-Gg: ASbGncsJ+v9YOgy8XQLOi4xTPsOh9m5YNmpR6dZ4rKuxQpbUehvF1icnbAX2T1IcDgS
	eqS9n2wxXrZbQhs3t5S6VhmgJT/8O+caIekCNY3v94igV88iEzXBIo9S4LRBlMlmdhQUvSRSYgM
	1Ubv1/PEg9ntxI7EWUcvI2cxmcOaSYn5vObC7iOglK65yQF+TLA3AYlGQK8LIJSNAvhEQ3PZFQE
	SFXiUBombk/u5TyVq6nHavhoBdf3L6Q4EyDRoSob872P6I8WIsgmafuDeHLCEANULNASwdN57Uj
	TkaQjbnjJcISnkEz0eyrBbvb/rrb0fuT4cf3CUKIyI44qs+AT8y8Tphy/gYU4mkdJ+halGlfvL1
	r/uI=
X-Google-Smtp-Source: AGHT+IG0gQL4wpqk/N4eVevZ6EiRRAV29O6T0xOWLIHtqG3MysFxyrTz0rHu6gvrEfX+GEpHUZmKMf3I7Bn4K3wt4cg=
X-Received: by 2002:a17:903:2346:b0:295:586a:7644 with SMTP id
 d9443c01a7336-295586a77ecmr35979015ad.9.1762122042760; Sun, 02 Nov 2025
 14:20:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029073344.349341-1-ojeda@kernel.org>
In-Reply-To: <20251029073344.349341-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 2 Nov 2025 23:20:29 +0100
X-Gm-Features: AWmQ_bl3OkSjDsxEokBQbHWG2tBRxHmsdbaPCFuCFuWjjrdm7lQYLIM3Vzk9M-g
Message-ID: <CANiq72mKjZfR5jfzra-EEDx1BVJ23iwJgRHuFf+3wJh+iE=T1A@mail.gmail.com>
Subject: Re: [PATCH] rust: condvar: fix broken intra-doc link
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 8:34=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The future move of pin-init to `syn` uncovers the following broken
> intra-doc link:
>
>     error: unresolved link to `crate::pin_init`
>       --> rust/kernel/sync/condvar.rs:39:40
>        |
>     39 | /// instances is with the [`pin_init`](crate::pin_init!) and [`n=
ew_condvar`] macros.
>        |                                        ^^^^^^^^^^^^^^^^ no item =
named `pin_init` in module `kernel`
>        |
>        =3D note: `-D rustdoc::broken-intra-doc-links` implied by `-D warn=
ings`
>        =3D help: to override `-D warnings` add `#[allow(rustdoc::broken_i=
ntra_doc_links)]`
>
> Currently, when rendered, the link points to a literal `crate::pin_init!`
> URL.
>
> Thus fix it.
>
> Cc: stable@vger.kernel.org
> Fixes: 129e97be8e28 ("rust: pin-init: fix documentation links")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks!

Cheers,
Miguel
