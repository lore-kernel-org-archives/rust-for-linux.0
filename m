Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0D930BF67
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 11:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969242; cv=pass; b=YDZToCKZUBheX6u+BeYRvxK0l1btFKTIdM+y/sA3/AZm/EVDBicGmUw5iM9mh4IFtZWGWyghq5ZebQKQ2u3NWqTIUAA9tsMdZZlvrTmBLNOqHPI7RirVHYAiqH76qJKgNKHixoXZ/P1AYbfwpElKUa4eR5Yf4A5L4aekLzxpy6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969242; c=relaxed/simple;
	bh=+i+7WT6hQq2y9ySvwKVLfO/vDchNz67s/vijWeP69DM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKKBnFVE1zk0Hj5B5riGEfkLhmg9HP5Ilb4+tV8xJ46fDEwqszkWMpJ82D6aYcQ2Kq28PawEHskmXpX0vdDs95uLyWNeezT3/SCEN/QYV1B6zFCe2SjgQ1aeRiiOLj/2zIpGZg1ULf8kIbxUaa6LN3/awoFlJFVuyx3Ai/Qp3vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+Sdiz2N; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+Sdiz2N"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so40643eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 04:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779969240; cv=none;
        d=google.com; s=arc-20240605;
        b=DfvETBckoMWWTC1koYHkWiFbY2MGAVCGa9t7ltGCvuvIykZZ1nhM8tEmDcAjBJX2+i
         vIjFby78th9McVJvxHleJKc0iOTrHKpB932/rnY8mm29mL1EWh121msvBkhxrs4TC6ja
         xoEDByNw8Jn8qcFV0i62U3Wvnzd++bVtyU7XeyHcHDFQeKlpSQ6LOL08q3m/DE+N99Xo
         Q05Gom+l29WasAC034++phUOMEsgYI//P4WmQo6gp0+D1mz+/OM/rEVg5oQwcsvxCPuY
         6CesOA4/Oob49tuHFvWevt/d/FC/MmFpf/b/S8IhYAI551u1HLxGp4ylJXXklTIupc3H
         Av3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9YWbdpeB3kBUHbSUawXWFsvVyi180Z90CSLxa8M6it8=;
        fh=3X5d6vPPmGR97WjFr5DQn9xTQrgSDoISxPj3H9e/UM8=;
        b=EyEC8Uls4Fn2KUwv/su0fRNqO9AQhzrUYCMAPnnbCWPIHE1CO+/EZZdxP5LX5BwS68
         CzZVy0w3SLigMNuDePEhyI+ovVsSU6I6Pb4xw9fQL7T+Cq4h/kwRUXGMnjpR7uAlAXH/
         VeEtOAXnn07ZvsgApcTayM7J7aI+cNVrfQDv/X6vN9jwCk6V7uBibjrKNL9e/EsizNZr
         AYUYgBfFHnX2CBKEZgeua1XuBEPjYYI6aoHxPIVVgSyoJmZk3F5NvH6pjVTT/OdwhLDP
         L0N/+0d1YbTiksJ0UKkWrUGracXqqiDq8CC2Wg0m5+ZYYlkrGFgSrV8sJC/cmlfpHERg
         7Q3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779969240; x=1780574040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YWbdpeB3kBUHbSUawXWFsvVyi180Z90CSLxa8M6it8=;
        b=U+Sdiz2NUoVAJzUntwkPEpwHIIgHYD+YgYQh5DCl8MP7oYZpyEPx3mnujvEurJvX4o
         yW59WOTWKLMwz+zLAKSrAR2CU4fuADaSh/dB6nHrxLWaDJrjY5kYz96W20PKGnKynMPp
         VVnmLk7gYScBH4kgumbFqzjVHhn6Sy/anmUfQDNxB1+49niRFXUOlojGL5/XbNP2BBii
         UbPd2yFZfZOrqZ/lVZPTHyzfqV1aC4MPINp/MD2A6nRo5+SAE0zRIsW89oyG00sE1Vjc
         fROVa28zUcgRXHPY0UR0waObqsOSLHAPvYabAxmo7buyK8HlFr0tiaVcHRYw6wWHxyJc
         Vf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779969240; x=1780574040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9YWbdpeB3kBUHbSUawXWFsvVyi180Z90CSLxa8M6it8=;
        b=YCP6F60zBbRYY4cjda2o6HV9yFoCc985JSng6MmG8e9KmLmj1kSlCU9xYUlU1t+iJM
         mjs0D87Dn7djakY+HXihVianY2JrMc9ctqXng0G/GaXkRdDSlekAMQGE0p+XILQC/Z9f
         1EFrlCSojIIVC8KkuHLmV4hMUQ5Zk8K9JtFD8Yzp77tCEOiTKH3kbumLPudfy7j1g2Zj
         UJJ2FgcXJZj4ydJbjdP3m/TvUYHdYrnLgJAuU3P3E3Vyr6IOVE3as0PO7esbzAav7l22
         358BwkoY/jtMXf8wqtY/Lv9YHQF1xK5JBx3Rv6efUd+WPgxF6TlxuhefEjthwou8rk5v
         8Yow==
X-Forwarded-Encrypted: i=1; AFNElJ9dMttZ0c7aBrtCQMp9Gj120+IDGfEHoFHETVosWu3dqEyc1dRlCqQxV7Fz0hEcjOg9jqia/dq9zVDj+ubHKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRk3SULCCQwdwC/6pHEH88SVKBrept3l6Kue5ZUj8faOb6CFoy
	GhonQhAfhFcqR35qsGQd6/y2MrGhRL+ViU9RRXcPPuydN6hyDlBqNNBAf3nTyNkCH0NG6F22hRQ
	mgI6ThawYRJEu1vG3B58CE9Qj0mBZ8oc=
X-Gm-Gg: Acq92OHHXU7P8rd45Kw01kWm3P1iu4vkVWh3KoVarFs2yYSbNPryXXfvfRnqxVOjqnU
	o3JzLAam9q/ywQKN3rlq2wvoE2Uxi/vFQey7ntpWnMyDRnjDkADN4CsX3/36AAZIMLaoJsSOeB8
	VuvcxWl31tmAlPkiM0MFIGuarneze+KgX/iIXEt0DIgtq0EbwaVWZu+6hl9enyu2xQn7DGUH8Go
	GlgoUGcHtG/6vBA5wpKV/lm5h6vjEKfwKYd+u2TC/dsgqE8VNGMmLlf4f8t+PcqBf31I7lP6ibS
	fsdO+ljZaT4os/LtJDtuJSrvAfbKhh/52qoSiT4vIuje8AXmFhtHSVRNBek/nh83ZiL9j4mpcM7
	vPAKCHgwznJ4Gu61rDSJ8+kNOISvoQ6VkKg==
X-Received: by 2002:a05:7301:6793:b0:304:1d92:42ab with SMTP id
 5a478bee46e88-304d2ab127dmr475529eec.2.1779969240385; Thu, 28 May 2026
 04:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-rust-gitignore-long-types-txt-v1-1-5be5e6fa427c@pitsidianak.is>
In-Reply-To: <20260521-rust-gitignore-long-types-txt-v1-1-5be5e6fa427c@pitsidianak.is>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 13:53:46 +0200
X-Gm-Features: AVHnY4IpyYWsCqgASiWCHSdBWaUHYsVId58mzWvg96RYZDoZpq6E4eRyhNYy59w
Message-ID: <CANiq72=cKXdmxEacuGET8fuz_v5eFGB50vnOnKZZJd6iEeAAFA@mail.gmail.com>
Subject: Re: [PATCH] .gitignore: ignore rustc long type txt files
To: Manos Pitsidianakis <manos@pitsidianak.is>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 12:29=E2=80=AFPM Manos Pitsidianakis
<manos@pitsidianak.is> wrote:
>
> When rustc prints an error containing a long type that doesn't fit in a
> line, it will write the whole thing in a .txt file and print messages
> like:
>
>   note: the full type name has been written to
>   'path/to/subsystem/module_name.long-type-11621316855315349594.txt
>
> Long types like core::result::Result<core::pin::Pin<Box<_, Kmalloc,
> kernel::error::Error>: pin_init::PinInit<Box<_, Kmalloc>, _> are common
> during development, so add a gitignore entry.
>
> Signed-off-by: Manos Pitsidianakis <manos@pitsidianak.is>

Cc'ing Nathan, Nicolas and Kbuild -- I considered whether deleting
these in e.g. `distclean`. They are only error artifacts, i.e. the
build system doesn't create these intentionally -- they come from the
Rust compiler in a minority of error cases (where type names are
long).

So end users shouldn't see them anyway, so I am not sure what the policy is=
.

In any case, putting these in `.gitignore` shouldn't hurt, and they
are definitely not intended to be committed, so it makes sense
regardless of the cleaning. Thus I will commit it with these notes
unless someone shouts:

    [ Depending on the compiler version and the kind of error, there are
      two possible spellings -- copying them here for reference:

          =3D note: the full name for the type has been written to
'...long-type-...txt'
          =3D note: the full type name has been written to '...long-type-..=
.txt'

        - Miguel ]

    [ Moved the lines closer to the existing rust-analyzer one. - Miguel ]

I also wondered about `--verbose` (which probably we don't want to
enable unconditionally) and `-Zwrite-long-types-to-disk=3Dno` (which
could be possible as a nice middle ground if kernel developers prefer
to avoid the files unconditionally -- I asked upstream out of
curiosity if that or something similar is intended to be stable at
some point).

Thanks!

Cheers,
Miguel
