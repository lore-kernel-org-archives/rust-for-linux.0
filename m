Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E745F2E764C
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769170102; cv=pass; b=HV7WVzdoqRE6Cl2uld6U0/wIS5/TXa5iaeHjrjoxpZLe2NvEH2DWrG0oGDqbbgx0k3aZMoynZXutAxAKrkNq30tPEdKctEsbuE2DynFKXxO7qowfXzEUwAPs//wkyzW/0UviraCuaOfyINmsKHl9erjiGHHnk2IMhtIZEQHa8bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769170102; c=relaxed/simple;
	bh=+XU7oFAuGDdowYm7s/ifBZpXLE7zt5MY1/p3INyojKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5oSw7hIMTg74SdN+SLb+UxI8OF1ggdflB8lLrkfxntXKrh2adDXo/SOOY7c8pJ9tTiW1CU3BWx2qbDhsk90uy3f76604XBOizfb+PQunmE6RIL4Fk2HVL1+EFqoEE+TQ5AxJEgX4FJWIbG4Hf5Ycd7hpsW0qE4ZZSUCx3oIq9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKz9BiOt; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKz9BiOt"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b6a868ad45so247459eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 04:08:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769170100; cv=none;
        d=google.com; s=arc-20240605;
        b=X0POXqdktVX87GNeM8R8/nZTLvx88H1TZklJcGXr8wyoQDsSE58srTsXqHfybWNLqg
         AyfMk1V9RN1okpxGiGwN09duQDnoc0augSm//bqaeuUvRQbneJRWir67XhogeEcuaF8H
         v+lW3jkIhg/iyDptgrMwwToPPK7hm2fcrobXeWFpwakGCeTFy/ZEJufOfbrtrOROSOhL
         wu676GwCg0vJdH0E99KigMIGW6p5kCWH2nuKQu8GO1c5q/IAoSdqZRUCNZfv6TWmi925
         GbmPIS8DN6gGJ5Pcbo3RSVNrLMy6K2g1w1tdzROYUd4iY5Dcu9mKcbW6KGNSjcwT6IXE
         sGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+XU7oFAuGDdowYm7s/ifBZpXLE7zt5MY1/p3INyojKA=;
        fh=uTl7kiYdfKnEnCxUJ4dgSe1t8vZ0RfyryzWKDE4ipmA=;
        b=F0mhaWf18CB0gOCyzGOfALqK8eOOwTnvzmNk4UkEAitCMDTYle347egxIXlZR0O+AE
         ZVTKueA1uesz9+vfb5oi291resJBdFvOzun4to4pjZ86Nlbjzsv9AO4D6120lkNqnFkM
         8SLcjqBNT5Z0J/aVlAGs8I20O36gZdQzdmHODXXLwjHpI81hO4zJeAGX/MLisjIjGCJi
         SWs3rtgXja++Pxh74eXABHr1GBiYLGNqAkSSzgRxGivj7iSRBQ0Cp3rB68xpxVbIFxwn
         nH6qECJYK7/m6iASg4xp9a+2GLqtTfAdsZpHfehdD1WzmlhO3zC5HMSp6588pQrZGnxE
         dbmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769170100; x=1769774900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XU7oFAuGDdowYm7s/ifBZpXLE7zt5MY1/p3INyojKA=;
        b=iKz9BiOt+n9qag2KWI9Tqulu/knbb88BaNCSrs6KcWvNXjRpAxGxT6P+FRdlzviu0t
         wiNvbOg087fSFiyeHMI1FQLs+Vd4Z6lyVZ62hzAWep/LfANz2T6R+At17FhLXM0z+A6C
         fSFotmVMOVNywJ9rE0PGN+0LcW6Z8RMPKe7wdc2HTz0y/2ZK+INUHz3mEFzK+AANesCp
         kFbs5wP3Ngs9YqHusNoOWTR02wkns04HcAgrG0khLVByqN8IpHTGkRDh0439Y6v5uUI2
         cJ9jAMThNC1Ae+VEZKlOZD9qkmF4NEfSeFEwSb0G9k/aJVY6BprAiLpQToYlVsoOYUcc
         /1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769170100; x=1769774900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+XU7oFAuGDdowYm7s/ifBZpXLE7zt5MY1/p3INyojKA=;
        b=MQcRGMd3yFL3F6oq8LfalG+ABAKrwK+0FwBanjIDoIrDG894W3Zpax+SMOrq7d2FoY
         nxo1QIN5mIP4mSHYvh7Alvrr6M8JHBZkHiIs1P26LHPwJIwpXKGmWc5QXy75yR7QQW//
         7pomAOe+uegqRXOgYgi3vC5CX749Ulu2xYsrHiTPm+/PESGPx9sb1iucbqsPyK5dW6FW
         iHepSdtJUf4mmYaVDGkzChTY2A21gWdzBO+F/hC3q2Eh7tJdIlEfK6uitvmfOmldox7Y
         jHinWP140lM9Oh/L21TDsazkmIb3CrU+MCjHQhu8vZ2ZjVhDQ4LxSCGdWATMh7xxPA/7
         E3Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWPjNX64oko2nPvlUs9dmxmhoAOObrLUG6dNM2mbF3e59wdU2bd2xtksjXS1/HpQj0hQudTuTzuetYNrcpZZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgz4lL1TGxgWjJSKljvJrlzRjyDA38ufbcojtLEJFVTIJhU0Tc
	R435qV/oNF22GzgJvYhH7I9wm1z5mTfjl4n0E5mgM9wevhBysgkNLoakjbP4M7OTGOyJFzmX9bk
	3eud9vdyVO1ljZb4nI4dYttJhFvUDzw4=
X-Gm-Gg: AZuq6aJl4agPBmYRAC2qiu5xZjxO3PKCOS4TU7h6gvUCFXLSnOFViFLI+M+l7F5sBMT
	C6lL1CyHdq1EKV/85RKd24GxrF3qMTdQ4euJsCc6UUcnLY43Fg6uUEy8/wd5Py8BdpK8ssox1Lu
	TI/CTkaZho1cJejidt8yHusilLcN7E/hyjvv2kR10X9naIPvDWEbMfm8NP6zaHgcRKt0m21A/qZ
	pXXJF/DILHNudri+ci9niQp9t1/8KvN6umPsLePpbuZ244lEASS4fZj+ftqSrUJqeuTdurGLxyb
	xhRrpbTvuOpf6HATM9V2wZYd0jRUaCB+/G49Hl7oWpe3a6AZBHCA0fqihe449049kGzLhQcqtkP
	Pi+MQRyDoj2pj
X-Received: by 2002:a05:7301:fa86:b0:2b6:f2d5:2923 with SMTP id
 5a478bee46e88-2b739bef2b5mr562027eec.7.1769170100095; Fri, 23 Jan 2026
 04:08:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com> <20260120-ra-fix-v1-6-829e4e92818c@nvidia.com>
 <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>
 <DFTTQTYK1KNF.2N1PS08QIAID2@gmail.com> <DFV0C3T2RXW8.1F3G0Q7R999TC@nvidia.com>
 <DFV2IL7N8X9O.2DLY12HALP8AA@gmail.com> <DFVQBFD54CJO.2D3VQ091URH2B@nvidia.com>
In-Reply-To: <DFVQBFD54CJO.2D3VQ091URH2B@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 13:08:06 +0100
X-Gm-Features: AZwV_QhYanZzgfGpIlWH7Zb5rMAiUbD-RC3hkYbiM1qSQ9I72dmpwMUx_J4SgiA
Message-ID: <CANiq72n65eLUmWShvpVBzkbCork_85A8nMZPKdf+rpw-nJ6j_Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] scripts: generate_rust_analyzer: move sysroot crates
 to sysroot_project
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Tamir Duberstein <tamird@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 6:45=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> I think it's possible to get it to work (at least better - not sure if
> it fully fixes all issues) in RA 1.78.0 without specifying sysroot_src
> if we add include_dirs to allow the relative #[path] references to be
> resolved.

Generally speaking, if a version of rust-analyzer is complex to
support , then it may be best to consider avoid supporting it.

It is an optional development tool and many/most use the latest
version and/or the distro-provided one. Plus we will be moving to the
new minimum soon, and so far we didn't support multi-version for the
tool anyway.

So, in general, if it is something trivial to support, then why not.
Otherwise, I would recommend focusing the support on Rust 1.85 and
later (especially the latest plus versions in popular distributions).

And if a good test can be done in CI for the new multi-version support
etc., then it may make sense to test nightly and things like that too,
and even ask upstream if they would like to add the test in their CI,
like we do for the compiler and bindgen.

Thanks!

Cheers,
Miguel
