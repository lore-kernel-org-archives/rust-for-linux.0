Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6FA550DB3
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878948; cv=pass; b=tBgyU/qCxx8/+4qZMOkQjggvZgurxebBV04ftuWfcGQCOrJceGVFZpl6An5IEBdUdjD0AcM37BC7MMbS6sfDuy+yaVDu14PbVSBPcjBTtxZxhoaZIRnRKS7/ZnNasNNLXFMUuSX91rOG78K0ZSWK5fo6Q6PGQc7iWzeOpqBTXvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878948; c=relaxed/simple;
	bh=vBTnbXlbtE0JtfGMQ2MHvqNX3t4tOrq8IAFxQ0wndOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TJMTWawLeEUtkwRIydOd4/nm+Sq2+wzJctAiZ0xSkVKq6fCX+PudWK+tspKziuzCktl0leBID1+t9MyAFHKH+Yub0CF7+KLXNN+JQVyvMkvo1TmLzBgrQa7dwDVQu/UV+8/f10vccuQlzYDtZcTg0AFltRurl6tNiL/mQv2cjAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com; spf=none smtp.mailfrom=darkrefraction.com; dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b=usKQCZYU; arc=pass smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b="usKQCZYU"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c7d65c83feso4429243e0c.1
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 07:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788878939; cv=none;
        d=google.com; s=arc-20260327;
        b=QAF0FAW/qs/Me8iyT7M4OAiEUaG14UdRFjvOjgA/ywuhxiOMVVqy/ystT8NdhxVTeC
         hOIP93B0Zjbq2L/p1JCRU3wknQOu2axodnzAR/ZrDsRHbttRlKhtYPczX0w0EgV4ZbvW
         SHjdn12WOPPOkLjZ8m6IsaEH0dhP/vmJNtiVqYdd00lOPRDgFjHzMePYdgWHVWcyKhZx
         0Lxz9GNpxqT3f7QaAGM12ATBn0GfATTOEwbqLb0Wt+75h8LGH/JXqqXeAmBVmMCkS8ns
         qPK/0Kje/fXFTQ7Xg2JU8glkB1mP30akkJH5hzOr18lBpyQNrFnoZssV3+eNmDXN9mIP
         iY1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mn26V6U9AHVIB3sm1/v6lJDDiA+oJxKcvjPFvuodVsA=;
        fh=AAM8ADa2+KGS/C6gvPtYh8BZsczP1aAIwTsoRRI9Rdc=;
        b=TJl9N4XYlxamDZgvA0A9TGK4isTs5ygujZjk7LbvaE4gloMSgTurVY5a9c/KVsvQ1Q
         oXLtcLyDt2ObzHISg97CaDqUZzyFIx5ToN3DJq6GY1Y1Lo1B16RLv3WM6LdY0NHxeceH
         hglywI833wP0z3gWj2gWRz9bJu8ld4v7OfsT2SoSIPvN/gmTUOpU3bu2l+H/lqIpdPMo
         kJPK/gneS5RtNqcIiExAi0+iXc9KRdw52L8xtVp0FBR6KqucxenmT9G6R0q3kZaKgCax
         VoIK4oBBIrLzJhr9v0PxncnpaxSeQ4F2aprhTfTnuzErpy1BOQtZ1zveMGsphjjlBNrz
         x9Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20251104.gappssmtp.com; s=20251104; t=1788878939; x=1789483739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mn26V6U9AHVIB3sm1/v6lJDDiA+oJxKcvjPFvuodVsA=;
        b=usKQCZYUaNB14qGxSim51us7Ji6k6mUaZBzormMQZ7Azv8A3XC9AJxcY3dcC6Afwoa
         4DmCFfRXeEoZv6EBxbHh+ZbGjuMJdEWQSYqyxLyuwi4VudJjmZ88xHpVqiQBnUQ4ON1e
         kUGmNK1cfYoKXe3lg6Tau6ZQo0+6PeaNejGOMErA38ARqfQuIVe6Zd6PgZYJgN9xShu/
         tG2gJmnhxwIUhHu/wOcScCL6AxzFGVn2/1uo3vOMbx+tXkIqDDQo3n5tWdsD3FMzYcx2
         DOVpypblWFxdvfm5ZI7qFbspcEABb6OG6UBhJ0mg5G+JWy8A9eDz8bShDh5r0du+SpD0
         yD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878939; x=1789483739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mn26V6U9AHVIB3sm1/v6lJDDiA+oJxKcvjPFvuodVsA=;
        b=HMXGx0zBmX/KSMph/UxaJPVOEXhvcbGS5OakgF6WICXORdObFibVTk4w/gLsNexNep
         kpbs96f3RjFpvSgENWGaqm/B8nFRCj1rQfdKeGyU8ALkQB8UyHRQ5IB+JT1HV2f39pso
         1/xa6Md4mxKzanLIi6iGqNrVVVhCc+ApL68NPCeYIMLbPUu/VuHvUcHsONOjcWdzIg41
         tFscyQQ9BP4+Np28WwNC7pvgTvcXe2dKNSYndTBtcpLzQ+2aDCC5RT5E21feR/zm3sGy
         ZYUYTZrOW/SKS/vsFmlH3tP8bitbumGjxl2tvbJl6YKOhl06jBEwHHC1S/n2SoE3W1X1
         qaYw==
X-Forwarded-Encrypted: i=1; AKwUvBwfxU9lKwj9QUeEZtml8xk5I0VKpWfVzokA1/sCXQ/ilyihBaI6yN7Gguc1MsB8MhOzYhd0lyDAyFK1c54QPA==@vger.kernel.org
X-Gm-Message-State: AFuF++mVfQ0CE4X1UhuZJiRtIhIpup3/VVKjSE+NHVzM2QuwXoKrQcar
	9BdlFJAo+GbE+8lDSrsFWvAQdAh0S4J7KHfYuMYAK6J9uKhNxbx0UTtZdeT4fQvDvuOTL2M6jCQ
	qkhhP3+Q1OAjHc3TL5qtTggf1Qui1QLidv/5f3p/6KUZIMDVvsq1LHFB7ew==
X-Gm-Gg: AYBFou2zgFAM9raneZ5qi/Kkofb93dbPfJ+X2gkV5njTc6LGFYiHmG6YcX8MlV5pSS+
	eA250xwvml0Gd652p2X8EVg98pouJP0A7G7u4mW0flsvjyGM69XFrm4+isBCVEaEWkxM7g4uCG7
	vd5/nnVZYseXxfsQIuz26lhMXpglL00HDIRFCK+jnQxZK5yyIard3Je5zVQJ6KQfsFDeOSt6U1m
	DySJhlqmgqFoiqdPYf0qGZIOjIQ3YGrDGy9qZ2VKwawcJwK0tMzlATezA7s0/BKkk5rT5YIgOqh
	TyAC52yEnJKx7Emh5emkxHvLMLZG7G1JGETyg+wJEuBL
X-Received: by 2002:ac5:ce1c:0:b0:5c7:ed31:3c11 with SMTP id
 71dfb90a1353d-5c7ed796b9amr13188562e0c.3.1788878939466; Tue, 08 Sep 2026
 07:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
 <DL3WXUPD5JKE.2GZ1CNJH539ID@kernel.org> <DL453EFS03T6.2VGI5TJEQ52QO@kernel.org>
 <apdvTgAp5eGezO5t@nvdebian.thelocal> <DL4QCAZXM8EU.2K8MLAM00VNTX@kernel.org>
 <apioGUDamrCur_oR@nvdebian.thelocal> <DL5MA26KZEF9.3KHKQXZ4JD2G6@kernel.org>
In-Reply-To: <DL5MA26KZEF9.3KHKQXZ4JD2G6@kernel.org>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 8 Sep 2026 10:48:33 -0400
X-Gm-Features: AcwNN1VMoN6xdNn8eWXN2SwQNMCIT94e5yatQIWCSWj7WmgOlqVF8kOh6QLwKIs
Message-ID: <CAAgWFh2iPJzQ5PJfFpPBTdgZ=GFjy7Eoz5C0e1WwFMuOuyJSTQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, nova-gpu <nova-gpu@lists.linux.dev>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 6:42=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
> Because userspace otherwise has to figure out the architecture itself bas=
ed on
> the chipid, while the kernel already did derive this information.
>
> There's many ways userspace could do this, and I don't want to incentivis=
e any
> of them.
>
> For instance, you previously showed how userspace derives the SM value fr=
om the
> chipid with sm_for_chipset() in mesa with its own lookup table.
>
> Then in NAK (src/nouveau/compiler/nak/ir.rs), there's this code.
>
>         fn is_turing(&self) -> bool {
>             self.sm() >=3D 73 && self.sm() < 80
>         }
>
>         fn is_ampere(&self) -> bool {
>             self.sm() >=3D 80 && self.sm() < 89
>         }
>
>         fn is_ada(&self) -> bool {
>             self.sm() =3D=3D 89
>         }
>
>         #[allow(dead_code)]
>         fn is_hopper(&self) -> bool {
>             self.sm() >=3D 90 && self.sm() < 100
>         }
>
>         fn is_blackwell_a(&self) -> bool {
>             self.sm() >=3D 100 && self.sm() < 110
>         }
>
>         fn is_blackwell_b(&self) -> bool {
>             self.sm() >=3D 120 && self.sm() < 130
>         }
>
>         fn is_blackwell(&self) -> bool {
>             self.is_blackwell_a() || self.is_blackwell_b()
>         }
>
> That's two unnecessary indirections for something the kernel already has
> available.

Userspace mostly uses sm id and engine id for feature checks, and I'd
like to keep it that way. They correspond to either the shader isa or
which class methods are available, which are what it relevant for the
related code. Most of the checks don't look like those functions
you've pasted above. Most checks look something like `self.sm.sm() >=3D
86` or `info->cls_eng3d < MAXWELL_B`, which is to say that a
completely opaque enum isn't practical for our purposes. We typically
need to check if we're before or after the point where a specific
feature was added or removed.

> Yeah, although if SM is correctly reported by the GSP, I'd rather have it
> exported in an info structure than have userspace create its own lookup t=
able.

As others have stated, the sm ids reported by firmware don't always
match the sm ids documented in cuda-related materials. and nvk follows
the cuda conventions here.
