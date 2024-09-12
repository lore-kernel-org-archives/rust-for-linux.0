Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9265B1BB691
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Sep 2024 20:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726174747; cv=none; b=t6GhTgn7F5x6+5dGl//4QJtUiizT3I0tJchCWum0vjm0phtesx1Tl2r8G8k9+OEDGV90UEYd9ufEedGbkfUnz/e/89CwIT5eUWCU5TOlZMbvqydsLhh7H/X4vvQ4zHINozBAaFCFPNUN8Jr/jg/TdyCsR0CFIs4NX7aR860pXcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726174747; c=relaxed/simple;
	bh=BGo4YnBtJLBzALgGPXw2885jarBIn/OgobqfXJlzQZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZL7qGjyAY06EOVWi4gewHWTJdbfeFAe/KJo0xHGDLbaUP5jaZoZ/z4b+tEFtl6guswQfd0meB3LZj75wSjJ9FrNWE5EC3PVkfZeFo1icEgba6O8ghiz9+fSTUQo28uXJUQhUhM631j39oRtgig9VcQLKMX8UZVaXVO1tgYEXGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=12qgrbfr; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="12qgrbfr"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4582a5b495cso22761cf.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Sep 2024 13:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726174744; x=1726779544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsCx7PNwUKDs1VgbiUw0bQvBD47bWmKcNmPPKYW0TEU=;
        b=12qgrbfrttf0OYZuqi6cXwLR8/+GLqh4g74C50/WZTePue6idYRzsnbJ4EaZCz62uy
         Y06BE0k6sGucB9kX3nU/EfeMYuJfzGxPzb9OITmkPOhcmKWBTbMmzRTIkrupDbFIdebd
         NKUnrt5HdCAJNLzh7rnPcxCz2ZpzOcaAtqn3QKxrXKHxOHl1A2DSCatlhzgw5qB0Iqtb
         vEBYyW4+gjmFBO+fvoHAH18UazZMgDMxQ6KMp+jkxz8Gt93Ic1J8+0F3Qfe13F7eZ7g2
         ca9dARo2gPcfmm7gnQJf+KhQiHYHrQIKFNsIu+MK25nM+/3UjH2/Ize02UhRlE9eWXeC
         zFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726174744; x=1726779544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsCx7PNwUKDs1VgbiUw0bQvBD47bWmKcNmPPKYW0TEU=;
        b=iHxf5OU/OwnQ2FH6pxK9KPyxjy8xoMyGD1BJzINbkZZRuUsdc6SyLc2dYNProV1nVS
         HG8IXut60kLQxgPgLmWvfE//F3B7yBjp6Ov9jWgJhgngT86synGZBBCDwjkyckeD0aXb
         2m498LYxYq8s1Mrk0QX80xVC40cJkm3Jyp8IdxmLHvkGsgGLIskRA1SEkCvAzpl/Bf8/
         CQy3SOQ8iqqCOimdGHPSPJjayT+qDmFqvUNWOtnvVA+oVi1e40PIjW5APuIzaWKPfT54
         aMFI/DVVTFu2zOKo/AiHk2f3a4Tv6WXGkyuO4RaWECk0sn+CgonLy85my3GzkMmthA+k
         J9+w==
X-Forwarded-Encrypted: i=1; AJvYcCVHLGfhVF8QTAnBhHvUNvsv/lmpZA3HF0vVaCKNxLTXaKYPQPdXXd42ZkyvH6HBooSVtRoI1aFykXUR+AJNWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyl3h8QhCq8O06csg999RkPGyPvwFhM9x9SrEJMm9kzIot5EJB
	YDiQrjZ8/AR/BhXEGYky9Uh4kuhaYl5BfKN4ifB/H2N9pw5cYZynN66iwaZfQJ0m9VnyZrEYbjB
	Sj5FKVkrLhUKCIPSPEpXxSNElEilctJZGuYBK
X-Google-Smtp-Source: AGHT+IGJ2peUmYzPvc/ly/d/Ex14Yi8y3LliEmED5bKrPQbZs3ROv8z0RY2viWsWeA+pvalyZNjXSH9Ak/Cat2QudqE=
X-Received: by 2002:ac8:57d0:0:b0:447:eaaa:c852 with SMTP id
 d75a77b69052e-45864547dedmr4206811cf.23.1726174744257; Thu, 12 Sep 2024
 13:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com> <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz>
 <CABCJKucCWfeC0yL6Q2ZcBfef0tMd9L_gmHRJt-cUYkg_4PDtnA@mail.gmail.com>
 <599892ec-3cf5-4349-984b-7c94f2ba5687@suse.com> <CABCJKuer=O3FnLJNGMg2+-HxFJFUrccTuuHt5OiMpRsAJBvBsg@mail.gmail.com>
 <2b2d4953-d2a3-4ea2-98a4-078901cfbda3@proton.me>
In-Reply-To: <2b2d4953-d2a3-4ea2-98a4-078901cfbda3@proton.me>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 12 Sep 2024 13:58:25 -0700
Message-ID: <CABCJKue-YtCQWinad2GW7uJuVN-ZSUmRYttK_PUurJOR51Urgg@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
To: Benno Lossin <benno.lossin@proton.me>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Miroslav Benes <mbenes@suse.cz>, 
	Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benno,

On Thu, Sep 12, 2024 at 11:08=E2=80=AFAM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> On 12.09.24 18:06, Sami Tolvanen wrote:
> >
> > I thought about this a bit and I wonder if we need a separate
> > mechanism for that, or is it sufficient to just #define any additional
> > hidden values you want to add instead of including them in the enum?
> >
> >   enum e {
> >       A,
> >       B,
> >   #define C (B + 1)
> >   #define D (C + 1)
> >   };
> >
> >
> > Do you see any issues with this approach? I think Clang would complain
> > about this with -Wassign-enum, but I'm not sure if we even enable that
> > in the kernel, and as long as you don't overflow the underlying type,
> > which is a requirement for not breaking the ABI anyway, it should be
> > fine.
>
> Rust has problems with `#define`-style enums, because bindgen (the tool
> that generates definitions for Rust to be able to call C code) isn't
> able to convert them to Rust enums.
>
> So if you can come up with an approach that allows you to continue to
> use C enums instead of `#define`, we would appreciate that, since it
> would make our lives a lot easier.

That's an interesting point. Is the problem that you cannot assign
arbitrary values to the Rust enum that bindgen generates, or is using
a #define the problem? We could probably just make the hidden enum
values visible to bindgen only if needed.

Sami
