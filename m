Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B169E244667
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Jun 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782641818; cv=pass; b=hAMss6/HEqvT04kNPeKgWQ4FptCngumPYpnfeY8U9bEMrddVmny6myr8h+xYKXPyryj1pAr6XjiR44dD6DhUWk4lWf3wGpq8Vtj9BFzp7L35WQASFsjfVoQRL9ZDyhAM7Qp4J7hKhqOZSsC23sqFyb3xRGg3gtTxHivJfbSgDgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782641818; c=relaxed/simple;
	bh=8tMNKb/8lxbTk7uHXMMWA43U7ZV+7otKMLFxtDUVTSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OET7N0ytE4c4BZiB1jyiXpviDzjHPBUt0TGiBFArzLJr/Vi2HAoHzn2C7DTR1uH8WP26UxQcfolfRAINUyK8JC4xKAmCz72pQBtrKYkFLl26eBXdkK9OYfJ0AsFUA29GdYJnt9kG1hSvJz8h3mTetM4aSeX0LPpP7lQX1tIcbPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJ27Hbao; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJ27Hbao"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-137eb8e3491so168379c88.3
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Jun 2026 03:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782641817; cv=none;
        d=google.com; s=arc-20260327;
        b=OxVlZYvSdAFgOpX9I14qLnjWeqSkLo0jRO7acfp7y2dNKzkf6zF90hgU92uVUetO3l
         qdl70CTsbUU1HZvMCGAvHnRZA4DhjrLCxRXoNepq8AJJt7Yfhwa0dPDHsOZjQeaOy7H3
         9UMsKNQFK5UUPn8ZXRZEcI4WPhgQu4y3cuVugxvp7kIxDtuP5s1pnhK9qcEr+qgXEKr9
         4VLgk6ken4EnKlQUcBV3/rIT57A/VkDL1H/mO4Ek4ySFzUL+7sAJhNTJAEaYzWio5Tv2
         Y0p0or7r4MzgGV8vPnYljV9D3y//gAB0oVxXFc9bgFo6OuQIQUQFMFdmZQ0iC0GXoK5z
         PYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YXAst7xrYRCj66Cp/0A9vR2Egoo+fSdu0Iiejp3JKeE=;
        fh=+KBjiX84YW8WekC7XtBjEq2W1adDRkbFsxC/Enbg+Iw=;
        b=cCKW7+wtH07bz1yf5ufpkT4bvYbn8QUA9qckB81ZJwgyxwd7eGUj8ekgV56gUwdu2b
         CqoXz4zXw1FTc1ChSy5mvYaDFUTManGPqGtLyvHTxhwRR9SJWhhHmWzD7L7skduSWFLw
         etTZcPB98amKRQ4Zf46RbLo/rW/by4q0dfd1z2xM9iDRv2vo7r3O7tBOVv0r0WZs5DpM
         o+6/ewOJF1P0T6QOcyuufDOH3lP0caRGR7dmz6+I/05cdvG/UKHO87LsW3cD+MWxFdb/
         mcfRpB0aVM6gp30Olqp2wh80SnhCGnoHMZTxI+K8qiz+WhbzYqB1nqywhW4KP85Mc2uk
         BvGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782641817; x=1783246617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YXAst7xrYRCj66Cp/0A9vR2Egoo+fSdu0Iiejp3JKeE=;
        b=LJ27HbaoP/G4n15XcIWJg3qKL83RKr12JuD8y927QzMjn25ETcwUCiFiMrZX1+CU1u
         ZGXehZUlk2C7lz9+gpXG3j8xPekzFStnhXv/xnwwNDplCgg/Ev6cSdUK7UEDncBPuv1E
         OkeiExIWUZVrPfAdyNcZeRJCPsEO5jhqMhAIubchrbQv1Juf3QhSjAFzpkqQ/Alm3eXr
         1VN122K6HjcGb5qOerfc6eJhuC8e0YjNwu+z2doUO21sHFux9w2elZBKInjDF6T8xZJJ
         MXJKd2C8apoIGid/LtpiaMCO/p8GV+r7jNU9lBQOrKgq7JrjnAh7uth2ngXjYEvMeUpD
         GIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782641817; x=1783246617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXAst7xrYRCj66Cp/0A9vR2Egoo+fSdu0Iiejp3JKeE=;
        b=aJWEjSdeBovkKbuJdmCSc3Nbc+qd2dgRjbKjIgypBWrOeUMEaJeHY3RSHXfbVy2Yxn
         RqYv/92CCj4h+owLGRUl6nNyo3ScDfFJKSW+qN0H+7z+VkTG+Zq6XwkF2+KrUZousycg
         UILW6IUZ9EgKp8zRv0ynzuCpywdAegbGUHoNaR8zIjAoCO8FamouU1DYn3/oMXf4+mQP
         Pa2R5/YLOgfHBcmiPBQ7Hfi5ZN2fkGhVMIger3wIXHWEMqkAF77MqariZYg7FXDdEbvR
         gfe+pG9ADA8y5prxGSe0D6O2Jmq2FSjqPbJkMAmEX8KR9px0dxw4wHlGW2F5xNIn74Nw
         9FXA==
X-Forwarded-Encrypted: i=1; AHgh+Rqv54dlO+ZWfeHiz06GEuJg1q5y3mHFDuYxPm2Yr6Wfl7YOSUylod3EvizPxZ5+/OT3Lgi4CRrI+hfHaEQP+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZjeZtfT+DmgxKu7WMN3kB+0nmIoV3CMjvUL4qgMDUd+8kPuWG
	Z77k2GX5Mtrk1PANLS1Il/WHBr8R+09UEriscTcoP4ALWfcIYonBvt9annm4kQwrJMeI2yOcNh4
	jfWxueiZnI3JfKzPZ5n5hI55zHW2AaOE=
X-Gm-Gg: AfdE7ck6M9XvUBr8gCth54CRfQaUCgf1Nk4J5o8OvIjdr2N45u1Bf7CQHCT4cg1ArVL
	RJrYewAN38xu+KvNVlGYBSa0GoFpWR1Yux6Vy9edBxhGIoAv1CFcBbyRH6KSylgMrdasye6S2FG
	D0PdrYIhb03TbwAP4IC/OGcbNB05mVpsA3pgD9KAQn1ovwP9+BAwo7REPg+rNTWCf+eE5ey1Zzc
	25nwS5KnSnerZDBRWoDoWJKOo510glgf0+Rl0uc7enCSj2WUB+1+spCH36zWfjoEkbtU4tE10Yk
	vvkejf+UOls7SSYhNVcInmW846NGgEbtDda//5ekWjY69UlpWiTbhM4XLPYddHEK9XKOQy7RxI1
	h75nrW6liXcXu
X-Received: by 2002:a05:7300:8284:b0:30c:b42d:47cc with SMTP id
 5a478bee46e88-30cb42d4a26mr1645870eec.3.1782641816783; Sun, 28 Jun 2026
 03:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626214404.852685-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260626214404.852685-1-nico.antinori.7@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 28 Jun 2026 12:16:44 +0200
X-Gm-Features: AVVi8CdV3GkBNIFxfkC3ESboweEmXbUNW5qahhjyWV5NNAdXS9aAO_6owtx-IS0
Message-ID: <CANiq72k8KOmVLrHGOa9SidU=vYqGUqi5dmyW9J1auVMnqaQAeg@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: use pin_init::zeroed for file_operations initialization
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 11:44=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> -    // SAFETY: All zeroes is safe for the `file_operations` type.
> -    let zeroed_ops =3D unsafe { core::mem::MaybeUninit::zeroed().assume_=
init() };
> +    let zeroed_ops =3D pin_init::zeroed();

I would just remove the variable and put `zeroed()` directly in the
fops initializer like we do in other cases, but it is fine of course.

I guess it will go through Binder, but if `rust-next` is preferred,
please let me know.

Thanks!

Cheers,
Miguel
