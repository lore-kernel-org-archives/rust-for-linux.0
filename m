Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304443F99E9
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 23:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780700513; cv=pass; b=jvGljLkPfzO/vw5/f3D/B3A0GjrsgFTgL2sosVFUFHxeNvJO21Ybhf42G0XVUcR2cf2QRWK9vYpcOOwE02okeVp74RFn4LTCVm7+D3EjdBJWnzxywIhqA7oDZ3ZVsZRQbF8T4GPs1+0pxSIU3eyIG9ZKaWw1kGrP+eGI/6Ok7LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780700513; c=relaxed/simple;
	bh=AwBNFZ0WM6pZL6Pp8Z58p7Hs/2OjvSciA0fgEF9nm8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLb+E8fkC5Zpi4OH3V8IZ9YHFEu1yyud8YUL6ljfhV4zpQW7i9a/xAvwYPpA+eCsJIK+tbBHKljLqoqqPAZD4U05zHcZL72EM8Ie/zTpYvg5VSedO7AsGflsNQTvHsfCfVVmkdIWZOCMdWVl1PCA0v3XL0IHmXHzHQ2NgeW9zfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hM7mGRAB; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hM7mGRAB"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137c0db2638so212056c88.2
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 16:01:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780700511; cv=none;
        d=google.com; s=arc-20240605;
        b=bF2/7/We5jtE+ihl914lF++Z81Vkq0VKw3IGC8++TjKV6xX1pJaaEM6s80DflerFXX
         taizg07D/VmmM91q8V136XZYmfoemKxHctH/lRGXusYtNl2N/kVbZHvzy4jTXuioLoIf
         WXF4ZjAIk+YUS3ieMkuLkI0sRoIclBIKfXi6QhSh2MHPX9I6hjw710/oiP1ZbZWKj3zk
         hsezJPmRWDfDtNIeFb8pj4Aaut42MPqw/W/H/lqklz6xautVGwUAImslqGIVcuOodcTq
         +ZYC46iAPEsi9xL187bbrF+/AIj+8ujGnfds81RuD3MnbToQjXRiJMzal5eibdRAJnKe
         eWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KWVvYfzd9SEj7xbCIZAqz8o71OURYC2fCOQSSuZXyoA=;
        fh=u7Y5jfLt+xh9tlhN4IpRlRDGCZCV+aSBbzs1JCAW/FM=;
        b=JrE+ZcvDNPUcugiJ5m2QMRy4PKcxlfGc2uuXi8tNYh3srMSxCvORT32IaZcgY9Z4aM
         JSztiiezeUL5gG0L5ul6E+Y+zv7TRez7b326lB++Y6IsDTR68mjjFkzLHrBGQ3Q1Li5y
         5up2/aak//or480PVQduymF8Cx2BokIUbaCAaAN6Sc0+x5a8BlT/niRuxasYMIVLftqi
         tgvkXC7KwMVlzDgFvjfOuLqd4fviLyq0snEMUhiw/mCn/8KnggZNXODwI4rLVG1YxBqD
         PH7ljVVHOcfTjX/1eP0r7vYZkrIvZJAUTmTwWidjD9p9+UvEri+khiXumqLTqxZ0H+Dx
         vFNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780700511; x=1781305311; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWVvYfzd9SEj7xbCIZAqz8o71OURYC2fCOQSSuZXyoA=;
        b=hM7mGRABVwP5naTeaSRBIq4pYj4Z1oRqgNd4QEn+z0tgc+QgM+FAnbEfJge7ZS5yZW
         BTx9JC6MAkF1oS/IRr9ghPc9GGdEvrjoPDPQ1aKw3qXEhklHCVbPrF4y8NSIIJakQbU6
         mDd0jH932BsK+BRk64YTpus7a4NEfxmlsIS4qC/iiYr3J0rpV5KmrjAH0X/SgRuS+Mf9
         06+wr/MOmdB844Rhf4dk8MMUDeWJUSCMUKIxEknwxnV4vR6nGoq9ImkQwWChUjGWA5Os
         L+vbxkFBzunAIvoeDpXXIFDNCtAQMmOedNJ76cVnz3jwHcpOZ8KfEhZiHnYChpU3lTdo
         8KYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780700511; x=1781305311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KWVvYfzd9SEj7xbCIZAqz8o71OURYC2fCOQSSuZXyoA=;
        b=PKC0kkvzXZoUYhkz4HXWUqO9nTJ6o5CehGemfClzv2uibBfJpvyvj/VzffAOB7fJEa
         dCjBmaHpZtPmqK2mpDXB7QN6C3w4xjlLnr2oKiBgSRnjFCt1cqhM2KE+htLreCG/8vcg
         JqiEsfneSU3XkPTzrb7rAwdiZexFjZiIWiU0WL4E1i1Q9Q9QpT1ZKcrgdPmT9dSsPCtp
         BsgCdQ9SNeZrQ/YwdTuMhPQpDznJeSEU1VAatRGOhSFa87MPZfhtO3kdQpyq5WcJTC9c
         9iiopzSIhbe2jKY2Iq+8Cn1kd2XD9lmhwpcMmPCp9DadGIRRyok3IlwuypEqOSltQOl5
         1nUw==
X-Forwarded-Encrypted: i=1; AFNElJ+se9sVvr1NrBVWb9D9mDOt24XI5xjy22gykup0CRzMJrokp0vRvTF6tvnd7Qf3CXLSn85vsfLte8w2VgFRIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZgXQzfNH758YkYeLFjpeQ+XKVLkfkjk9+uKDTTjNKdzMsScoM
	JoFW9aE+6nRYtsFwhtHXqFWuIab0A7DtBIVqlpX7d1NslMO32N83Uqvtqumq5lhfubwSuCAX4YK
	aV5cMTurNP5CFJL+h4Fn0+vvZUTKAxEw=
X-Gm-Gg: Acq92OHISEVmYOiWajhprac9sX+yJ1bsHQd2sTTbFV1oZqBvy7Iu/TML7/aWFG8eHq2
	0sp5xoY/F96cfHLQ1fxgKH1372DN/IltC8/DkNcoTzZh/Fl/ZxWBj2jykgnplWI9otcJeBs7YnJ
	7Alz2EOt0anTkfj3dkwfYZ9E3NxGBlfn48jfXQ7ISH3KzXtdC4SfKAEzgNjLfQq5pUZFjs80cL+
	Unc3qN20lg8rz8zVjgMyNu78LzwD/abwcPI9tGpVstxALGYWlZK7R95OPQOfdx+yxV0a8ZTJQcz
	zszFWE9QYOiCLaI/PJ3cmPV6KKRX0dsKOthHs/HRP7J4d0/6b80vCMwjm2Czyu7ekzb7/lALdmQ
	CTXX4iaShSbf4kciSusrgxLLySlsGzGhIgQ==
X-Received: by 2002:a05:7300:230b:b0:304:1d92:42ab with SMTP id
 5a478bee46e88-3077b258b31mr1194818eec.2.1780700510955; Fri, 05 Jun 2026
 16:01:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-impl-flags-inner-v2-1-ad1ff3f7ad2b@kernel.org>
In-Reply-To: <20260605-impl-flags-inner-v2-1-ad1ff3f7ad2b@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 6 Jun 2026 01:01:38 +0200
X-Gm-Features: AVVi8CeEJqP7HtJHzLS36phCRcYTulGmVZMPyo10TSsecK6R9NYbsBYmNLzfIZA
Message-ID: <CANiq72nKtrhU0ccpS9h+s+Li6eQtQWD-Npd72zih54e6+aepDw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: impl_flags: add method to return underlying integer
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 12:55=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> +/// An optional visibility specifier in the inner-field position of the
> +/// bitmask struct controls the visibility of the generated `bits`
> +/// accessor. Declare it `pub` (e.g., `pub struct Permissions(pub u32)`)
> +/// to expose the raw integer outside the defining module =E2=80=94 usef=
ul when
> +/// passing the value to C APIs. Omit it to keep `bits` private.

Hmm... It is clever, but it can be quite confusing. Could we use some
other way of "tagging" it?

I would also put `()` in `bits`, and make it a intra-doc links, to
make it extra clear it is the method we are talking about here.

And why do we call this "private", given the `From` as Sashiko points out?

i.e. your example works if you do (without the patch):

    /// let raw: u32 =3D read_only.into();
    /// assert_eq!(raw, Permission::Read as u32);

>  ///     /// Represents multiple permissions.
>  ///     #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
> -///     pub struct Permissions(u32);
> +///     pub struct Permissions(pub u32);

I would prefer if we had separate examples for "optional features"
like this; otherwise, people may think this is the "common" way of
doing it -- and I assume in cases like this we want users to avoid
exposing if not needed, no?

> +            /// The visibility of this method is controlled by the optio=
nal
> +            /// visibility specifier in the inner-field position of the
> +            /// bitmask struct declaration.

I would make this paragraph a comment as Sashiko points out.

Cheers,
Miguel
