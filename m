Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A7C1DDA14
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 14:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753022108; cv=none; b=Yt6DcCRs9DBPC46BUIzie/2qcUPRBL5GC0MhSJDThAYRYX3Iw0vD7uF3gmv8vSGu9c7zIFWXZPpQba0k92l65Pnuirn9oxgJCLYIMQGoLxuYc+gghuw0ikRgPFORj08EyO9fLtboXi3rbuMd4mvBKD+wkva0taAfsEdYksHmZTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753022108; c=relaxed/simple;
	bh=i7uMsRBqhsMVaG0q/nXtIZ/VY9xnXiALLPkqUK+tmtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ru5IJOO8DFChfwTvG6NaU5rezuhM+QJqaVNTiQxO/rawE7djwUkTVlT3DamB+r0NPqGE0brkUwCmK+/ca5wPYQZEHdF7OYsjVawbpnzHEvhmBlAecBU/zQSMgqMyYDb1IwUX8qXMwlIXX910UM2Qf3EEdCGaAo3gEVZnpLGV0nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEp9PZQS; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEp9PZQS"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31305ee3281so720652a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 07:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753022106; x=1753626906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbnsmPRScbuSty0LjL8ebd2bjiRM9gUyFm1TjaLhXnY=;
        b=lEp9PZQS5CFSEKtbGqZ0wGyBC67Zxjd2GHrq1ltxh44ohoDMZ+D23rBqvb6wijesqD
         oLFp5KQk4ynbmefaduBll9krbrtuE91oA/XVVyJ3b9RQTrgsmm1NDpM0aadHCGUtZ4+f
         5IDTXjZrwRPqCXKy5Qriodfi0CM7rC7/dijpmSX2/dqwP64F+aymzg4Im/AlTfOGq+t7
         hKrqi+O/j2m/xxvR9iIbNXqMEjyJd/le5fcwZlltKhGiN4SpD72cGDSaMgOquAoxO2hX
         Tj8uuLgWR5oVX1vGf56VrldknkQWngWH8OBwnitWhAzQsfr4xu0nyznVjHT1u9CWanMa
         LQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753022106; x=1753626906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbnsmPRScbuSty0LjL8ebd2bjiRM9gUyFm1TjaLhXnY=;
        b=l3bMZbWulYs5raSWTqRXTV0bKvP58ENv+ODNigcFWVovlKERPO7r6QUFmtunQ6VLND
         kEJC/czdOyp+Esuw9oU0IlgPicoV8wPZhpJO2/QSUS/ROgK137SPHuIVCF5wgPS+MHTI
         UwyxHIS4gnt8HQXK/FmNpPKYGkAH+UV/tiv0PWoTrYvgxQ1PD8aEKZ+UeKXZ0gtt+y76
         54uDUH05Yt9K/OMGNjfRfV097EjBOd4EE+UJ+uHqppSHiy0wfyKRehuXGU6l2sk+CtJJ
         /RHBuYa//gMEtXRxqfl8C+SMfaZ0Jp8r/YSO6vkHJS+GmIpb82IRPq7HyHn/a4NEoCLf
         BwTg==
X-Gm-Message-State: AOJu0YwUauSFMMEdGLe8i/cvHT7KQhgF4zBXFRRciQHt3ibAK675OJ7e
	K3id+9LaoMA8bM8CfjdFCPSC20Ptc9Gw48ZPTvF8RV8h/QAaTriVnJ2Xz/8T0bnKyqfRZ+xA1xE
	NZyjy/GSYlRSWmvMeaUFH1boOcKxYZKs=
X-Gm-Gg: ASbGnct6u+XfqZNc2ztWiUiVkIuN9zrZA+u2EsOP8OGnLZ2nD7XooagCNisarCVWYJA
	4CiyhLPoEZ/O9KfVXCLH9ACVj00C+dryVNRIEsQCRXsVPrbT7E/XCbAxM2PwJOHCvMnj9sI8AQB
	QGSvWsFV93q59S1Rqb/k4susVmupi3GDfAmXVIDN1Q/AHjQXb+647iNlUs7QrnhuvZK6UbiHUnN
	shpsZQU8oDvWOGdfT8=
X-Google-Smtp-Source: AGHT+IHVOkvVXlTTluNyAFD+r7TDaM1ZZfl/7XuE2uePlWYejqGzVDUBp9fSmF6B+aAKjXRzj3OsdIWhcc5T4QILChc=
X-Received: by 2002:a17:90b:3f8d:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-31c9e7a4012mr10347634a91.7.1753022106111; Sun, 20 Jul 2025
 07:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c187d747-4a47-4c9c-a057-8e8394f3134f@gmail.com>
In-Reply-To: <c187d747-4a47-4c9c-a057-8e8394f3134f@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 20 Jul 2025 16:34:54 +0200
X-Gm-Features: Ac12FXwV88bfToQjfJYH-VybNFxzoHWx2b0iVc-r4UvEJrUcq6EbCK1Kc54Hf3E
Message-ID: <CANiq72krjY4ieQE0UW8q4kPSegorc3qwKaw-0BZh_0dTeG=rWw@mail.gmail.com>
Subject: Re: How can I get involved?
To: Nikita Krasnov <nikita.nikita.krasnov@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2025 at 2:42=E2=80=AFPM Nikita Krasnov
<nikita.nikita.krasnov@gmail.com> wrote:
>
> I'm new here, but would really like to get into the R4L and contributing =
to the
> kernel. Here are some of the questions I have so far:

Great, welcome!

> 1. What is the main fork for this project? Is it [ojeda/linux.git]? Does =
it mean
>    that all R4L patches first get merged there and then go into the
>    [torvalds/linux.git]? I assume [next/linux-next.git] is not something =
I need
>    to worry for now?

For this, please see:

    https://rust-for-linux.com/branches
    https://rust-for-linux.com/contributing#the-kernel-development-process

That and the links in those should give you a feeling of how
development usually works. Please feel free to ask for details/help in
e.g. Zulip.

> 2. What is the current status of R4L? I see that the project is marked as
>    experimental and there are no in-tree drivers or modules yet. I've als=
o seen

We have in-tree drivers and modules. Please see the left bar at the
website ("Users =E2=80=94 in mainline"):

    https://rust-for-linux.com

>    a [template] for creating an out-of-tree module. Does that mean that i=
t is
>    already possible to create some sort of driver/module in Rust?

It has been possible for years :) Essentially, since the project was starte=
d.

Of course, there are a lot of missing abstractions, so writing a
driver typically requires developing and upstreaming the needed
dependencies, interacting with the existing maintainers for that area,
etc., which can easily be the biggest part of the work (depending on
the case). For that, please see:

    https://rust-for-linux.com/contributing#the-rust-subsystem

> 3. How can I get involved (besides reviewing patches; I am already subscr=
ibed to
>    this list and reading some of them, but I don't feel confident enough =
yet to
>    comment)? I am fairly confident in my Rust skills, but have little to =
no
>    practical experience doing anything in the kernel (except maybe config=
uring
>    and compiling it a few times).

I typically recommend reviewing/testing, because that gets you exposed
to different code, APIs, subsystems, the people behind them, etc., and
more eyes looking at things are always good to have. So please feel
free to comment and give tags (like "Reviewed-by" and so on). You can
see what the tags mean at e.g.

    https://docs.kernel.org/process/submitting-patches.html#reviewer-s-stat=
ement-of-oversight

There are some other ideas on how to contribute at:

    https://rust-for-linux.com/contributing

> There is [this] thread I've created about (supposedly) missing driver for=
 my
> Xiaomi RedmiBook Pro 16 laptop. Do you think it would be feasible to impl=
ement
> it in Rust? Though, I assume it wouldn't be possible to mainline it since=
 R4L is
> still experimental, right?

It is definitely possible to mainline new hardware support -- in fact,
that is the easiest case to justify.

I hope that helps and, again, welcome!

By the way, for general questions etc., we recommend our Zulip -- the
mailing list is mainly used for development/patches:

    https://rust-for-linux.com/contact

Cheers,
Miguel
