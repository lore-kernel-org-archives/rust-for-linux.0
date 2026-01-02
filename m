Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5592DF3FD
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 13:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767359189; cv=none; b=LoOakOyJ6ByAQ8t6wbUOJ+c9/1XeIdPpR9JO6QHyJPCFQc9oZTUas8bBTFZgy6csuTdEEIoVes0iaAGUq5Z2HFLbdoYaDOpARo4uV51qgM1osNDffRqJ1Ergl5FQOWPl/C4Ju80gXoyUZUHQSdkfCmqRF5DW7wLu1QYKR4BustM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767359189; c=relaxed/simple;
	bh=0k2MJq6JUf98oB07t4UQd/VS3gwHDuuy+YhJCq+nxwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHtleSUQyvww+XS+0Lk7YgRP/cqOeHnP/Zsj2aJpWXldfGqT0ZEHjdEKxwlDNr/aSpOUFzn+oq82QVabGmcFHzIdgI+GeVWWb5ZzmUFs6yBlexQQWd+HEN+KsNUPuIFz7nPzDS9JZMhEDOsuNnLkWxkVZbNlqyPriGQTs28+E6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vg/jeAp8; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vg/jeAp8"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-65d1f0a9f54so1409408eaf.1
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 05:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767359184; x=1767963984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kz4Ewfo1/dp1l5eRr9+EYc+LKl4OaeN2WW1uXKrxl+E=;
        b=Vg/jeAp8YqwuOD9dCcMsBusp+J0SSnhzlSal0Jucs0B20Mm6+UE1F4tAvZuEwMqdII
         8vq1k5mM15VSuKbQ4siK4yD9AyKqcvKZajqLVavo75Zypyl6jWDf3cuagjesoDojDB0L
         ammgfZSbOUcZma83jt+1RB0JQlN3QzIHlMHGLOre7BemKAg3ssyD4mfNyaZQd5vP8pKx
         6DNVwH9hIbCoSYDVItnPNl76Q3rFBuDTonBWLjGi1IiN9/DwDbjSMNegh11oV4anY0lD
         piyvdhcTAMLjBWQshmv+ucGay13/JCPdLWrhbJp7TSEWC3XG8cF8HNS/EQezq6+kQLzb
         JoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767359184; x=1767963984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kz4Ewfo1/dp1l5eRr9+EYc+LKl4OaeN2WW1uXKrxl+E=;
        b=LBxUrOPN6yLFr1DIhii7NM+rlPOy2dbbPCZuN4i8ATiAxO2dHZgF39li91SmP2Y3g+
         +RgZTbnnkaASVcdRtpWcOzuyMTo2bLgGgaHYERyMmUsCtwuB6out5dEribvgmWPxP/Sz
         81h3bFnasfLNs5xYycLLsbQlGH+uYm0vt6pH9WaSyMhWX6tFmoB0v65xF0t6HkXTAB9E
         o4gs4jT9WrgEB2JOhv0+xL2fU5XiSHaEFnucf20UjqMIHNavswSx2hpOYGc7QqiS05Hf
         kk52Qgo5LHz4l+eTno9iUh07aqTofk00YCMyQmw1GH0J+9xLxQvApapxFHFuN3sHZNbq
         2akQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9AcvqvVQ8Qmx1lRAM7/vg2fJpFhl38e5bB+tKMBkmsvFcUkbR8YRoacy116fe0IKfF71FuPLHsOC7NFR1Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdswoLEZ66FK6wOuNLGdBkBGVyyfTimhBsfVQbUoeb363cR0Ho
	ZbrHX5crRLL/BPeHKw8f/H3fHoWbsyWHbgyo42Kfh9oYzXcw5OwkshiHklFQCBXy0MWXthKMwBN
	lX5h0ZWCFHzdOZlnVFyplSKmQg2L4e/L6KTKC
X-Gm-Gg: AY/fxX50cGF3elFq+s0A6u0pg+uv/n86J5NXUoafgbd/ev9MydArUz0XBZnThpi0kwD
	BB1aFYlKeq60IimKVynTi3GXOkNP2HWje/6Y40nUnG3JB45cQXL1NQTVvX+N0MneepDI1YewZHv
	G5KsEKBeoAP8h2Q2fHng0TWmyf9rYh1LADNH+bI/PpwHznW8ad8qlK8Pm26oNyRKwFl7xnmNhDr
	NGTt3R8lTwHGa8krrmtKFfuQcjGsFbL+fUh/1pAT8cVgQUqQsqZn2TQVaZcZ6DERrNBO2Y=
X-Google-Smtp-Source: AGHT+IGzNpB7ap5NAFoDVSZMKhcGDL7xhNxSerusPXTZ4NdYmONV7/0H7KrwrvOJ1mW6784dQ/Ow5yBR9AaZ4PT3TQk=
X-Received: by 2002:a05:6820:162a:b0:659:9a49:8e0d with SMTP id
 006d021491bc7-65d0ec0cb4fmr19529800eaf.79.1767359184373; Fri, 02 Jan 2026
 05:06:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101-rust-project-reduce-size-v1-1-4cd66e9e02d9@gmail.com>
 <20260101220903.0c099099.gary@garyguo.net> <CA+tqQ4JF_ZO63U4GiSb6+Ym=m=81kN81xr8Q2q3qypYfYQinxw@mail.gmail.com>
 <20260102103643.352fd5c7.gary@garyguo.net>
In-Reply-To: <20260102103643.352fd5c7.gary@garyguo.net>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Fri, 2 Jan 2026 22:06:13 +0900
X-Gm-Features: AQt7F2pHhJAkd4obmcppL7rgmZ0myfTutIY4lqiyGRzM-5kWqWfZl0ZLKOCMnXk
Message-ID: <CA+tqQ4+rG9XdT1s7X0YjEKdS+-S8p2yFpt2EokQz5fqg=5=2xg@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: reduce the output file size
To: Gary Guo <gary@garyguo.net>
Cc: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 7:36=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Fri, 2 Jan 2026 10:04:08 +0900
> Jesung Yang <y.j3ms.n@gmail.com> wrote:
>
> > On Fri, Jan 2, 2026 at 7:09=E2=80=AFAM Gary Guo <gary@garyguo.net> wrot=
e:
> > >
> > > On Thu, 01 Jan 2026 08:21:24 +0000
> > > Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org> wrot=
e:
> > >
> > > > From: Jesung Yang <y.j3ms.n@gmail.com>
> > > >
> > > > Use the `cfg_groups` field to aggregate common configurations into =
a
> > > > single project-level definition. This avoids repeating identical `c=
fg`s
> > > > across crates.
> > > >
> > > > As a result, the size of the generated `rust-project.json` is reduc=
ed
> > > > from 11MiB to 406KiB (about 96% reduction).
> > >
> > > This feature is not available with Rust Analyzer 1.78.
> >
> > I suspect you are referring to the rust-analyzer component shipped via
> > rustup when the 1.78 toolchain is active.
> >
> > Do we apply our MSRV policy to rust-analyzer as well? The latest
> > rust-analyzer release supports older Rust versions, including 1.78.
>
> This statement is not generally true. Rust analyzer needs the ability to
> talk directly with proc macro dylibs and AFAIK it only retains limited
> backward compatibility with old rustc versions.
>
> https://rust-analyzer.github.io/book/installation.html also mentions that
> the only officially supported version is the latest stable and users are
> recommended to use older Rust analyzer versions with older compilers.

You're right, I missed that point.

> > practice, I believe many people who rely on a language server use the
> > version provided by their editor extension or IDE, which is usually the
> > most recent release. AFAIK, it is actually more difficult to use an old
> > release of rust-analyzer, as it often requires extra setup to manually
> > downgrade or pin the version.
>
> Many editors just use rust analyzer binaries in the PATH, which can quite
> often be the one provided by rustup. I guess the "IDE" you're talking
> about here is VSCode, and I just configure it to use the one in path too,
> instead of the binary shipped with the extension.
>
> This the Rust analyzer version string of the one that I am using:
>
>         rust-analyzer 1.78.0 (9b00956 2024-04-29)
>
> So I'd say while your change is desired, we need to wait until we bump
> MSRV to a high enough version as I suspect there're a lot more developers
> that use Rust analyzer in the same way I do.

Overall, I think I overlooked the diversity of local setups; I was
indeed focused on the VSCode extension's default behavior.

Thanks!

Best regards,
Jesung
