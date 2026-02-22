Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC98B67A
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Feb 2026 19:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771787337; cv=pass; b=owWm1iMbxr471TNtzutzd+hIfO75FXoETayRFktz0o7vuvJnKC08L5ljMxo8q6GtklORGjYIX3w1Xxu1vPjG52pgHCKUqfnkiLlPAST8+DiU7fdn44YVSn+6twKqSz0stasnEl2QkdabqrJXEya1/NSodTlpi+kS6JfD4EEjAtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771787337; c=relaxed/simple;
	bh=kl0zg2k1iWJd8IrCu/1XUcKBfdFRiyTicKU6LPJTRW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzDLnyKMlqP/cb3kaLyXOkSD3bahbE73EKngknbNnjMM/lgP5vxdejKCSc2m7DVJpiFrVNq2JMop2nInmgDPnivKpoYRYpn9M70zIml3eF4pKdduhRrVvR8B6piEbRC1pdsorXBzedRSHrcOrXE0ESumi/f+2p8ohckEpGJ53IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9LS8FLP; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9LS8FLP"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12714f01940so208515c88.0
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Feb 2026 11:08:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771787335; cv=none;
        d=google.com; s=arc-20240605;
        b=Epks0Y5+gaTymp+Qraj9pBsCla87Tr8UkvBPYx5aqrz0Ub1nDZFXC5sMkjCmmAiAdp
         4crVfb9hvdsj1mqm1zyjIXnM2mWMCt+EjUWvDsIDE1gpBZ2x3a+G9qFZqkPq51bgkmlV
         Fc/4/Oznm2yOZylueweKpWweTrV5mNmwelH6xJgscXKC14+GCCwQ3Wq/aRfwZ98tjNcv
         LQGuYfw988oEn+DeIABRv8S74+caZn7p23PE0W1E04WF9gcoFEVk0qSaNwBg9vu284IR
         B5KTqEg3YQWrqT6GRZP9TKXaOJOKIcN8h/IP7mjvEbrorjbZKvqeFRkOq+vNsBL5Pm3g
         KGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kl0zg2k1iWJd8IrCu/1XUcKBfdFRiyTicKU6LPJTRW8=;
        fh=DuK8PwBCoKJ+SS8qrpy74sp8Px99ekGOVAAev5/1O/A=;
        b=dJ8/PIHjfhI0hWHD4YdfSG4DKlya7Zq/N/vQ5Pyg7O8oAgSaqKsLLVF+rpxtT7RmSX
         0s/Sfc6tPNPa4sa4RWAz/3zWs853yPwlPz12sYjK06IrRLOfitE8YYmjA+Iz9QywqV1w
         I2qy4nyWfoM91bowX3QC8rIqyjaBAHmY/CppxgdK7r5kUf3z1HJ6uy7tN65euQFVzJmA
         8Jjq9Yk9YlZWhfERN7gTgNK+cQdO2Xl5iH7fYzxcXIrScCv6Ee3f2XCJqwoKDyPXMwOJ
         OV4yuxuEVqjpXQXb0MWVSPirqYFRWoFg/tV3B9clIfU0jZVm68ixNAwiPEEpag1OQkCE
         Ybrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771787335; x=1772392135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kl0zg2k1iWJd8IrCu/1XUcKBfdFRiyTicKU6LPJTRW8=;
        b=R9LS8FLPP7++dKkEMCQfGDYl1yKfWGCCpL+YZs7pkybUbrs4+bmiKyUAfwPAFNLXWI
         IudPHUNCOG1Um/FuWDrPEOXEVll3nPCBjwDqhhk8palNjFH8MmCh7aNaP24U4xP6jecR
         SVGFCNk/X3tX7FD+cEvalWVdxxCFUxRM+RPmo8scAqv4ONVmYlylN+zTABKPsFUoC/9X
         TGDphKCxyRZYAC6w1UXzBv2S3LLWW2xBz6Cdi7tMP5HoOxd7gb22Pc4mPM4y6FAJ3lks
         xPVF6oCDyiJgljvhtVYiIRqEeLxEKN4a20QtUr6NLAsmZa0Ea7fqGnAKoQWnd6pdiZuq
         FAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771787335; x=1772392135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kl0zg2k1iWJd8IrCu/1XUcKBfdFRiyTicKU6LPJTRW8=;
        b=xN3y/9X+76X7i7Qbsc/ZLogAN7nSefUrpSjaVsRJskjM7nigDd6AZEEHnuhob8v+sG
         6qHxMO9BSKrthOSZKA/D64Q8lpzM7bopgLULHfS4cxowpynqCFEjm0KIPNNZdfIMnB0R
         qtRe6pBSb9m1OC4hGnqGUtNfXPA2HQHztNjZM9K2j8X2Q/pdh/v0JfECvJ7Sp+5mgH+9
         FyOs0IxwLksCb3tRVssq12pIMdTAGWIyDVeXYkiwHX2DiBaLSXnx25T1oX2D6+RqOY4U
         tK3l/kwXOJQmQmAL3LNiQI4SXTQjDBACLQ59Wh4iTt4kdIXZvQ3/DUB6CZkiMXI45ZH8
         nxnw==
X-Forwarded-Encrypted: i=1; AJvYcCWb5i8QIJ3n0wUcSDYpvvEoNmSn06Qkh1S1ewUqYREnLIrPSy4JWKynoOxaWFl2QagOATQsQBM9bqpZ2B0glw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlx9Fu+xzbvHODpB3LU1NCT/BkYmZfyLo3cQ7K3acIs6YeWznz
	Us10M6cok4gHTudXgFnj3OmdzNThENchelLqACa9J1vKxdWer7loM8KR1BKTTFSKDpsbby4w1VZ
	Y3YEiTNJWBK3Qh5/3SNQrN5TnlGq7oio=
X-Gm-Gg: AZuq6aLewJ/jYF5OMt0JuEVzAaBODsjr98nQL37Iu76mdMIettD5LKv6L8JeN66euLB
	A8cf1voco1aipe/DPWtspA4M7AlWlvf5JWuam6ALL6n2WIhq0lFuWl6V5LJNinX6ZpiPpM9MET2
	hxNnPdckRvw0I6qQzzrZ9ergdaJbxKboUvg51B3IDHYU5TFLSBhG4Ku7O9CILEc2A3GyDV3EjHq
	AeDNh8ni09vtirB7+1T7yuqOjuiBd3e+kthLNj771sKe7nqsmifeOFBkWMfCmV+sJDe6UyusNDR
	qUscEwvL9qTLz7TGruSSd4PuCXXttB5z32RMOaL4iYcpLs/4OIl2rblyBYNLAwahH3quby6oLjU
	icNEd7gKc5AYgDXYcz1oOpwfH
X-Received: by 2002:a05:7300:f108:b0:2ba:6978:2b0 with SMTP id
 5a478bee46e88-2bd7bd5a67fmr1315684eec.4.1771787335408; Sun, 22 Feb 2026
 11:08:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260221020952.412352-1-jhubbard@nvidia.com> <20260221020952.412352-22-jhubbard@nvidia.com>
 <CANiq72n46KhQv453+9nMWxaXqo77PT20Ya6iw=fiR+oyrPDquQ@mail.gmail.com> <86600a42-9eef-4c2c-84c7-112f5b9b2509@nvidia.com>
In-Reply-To: <86600a42-9eef-4c2c-84c7-112f5b9b2509@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Feb 2026 20:08:43 +0100
X-Gm-Features: AaiRm50A_nGtqy_lbkhZtu_nezZAudv0DOJyllseHvbfunV8fSHzfBOG7cfXEzY
Message-ID: <CANiq72nW3MDdBDbQyPfbc2t=5sLEhc6ThpJ-PApcUgpS3S+ViQ@mail.gmail.com>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 22, 2026 at 8:03=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Works for me. I was anticipating that people wanted it in rust/ but
> I'm perfectly happy to keep it local to nova-core.

Sorry, I didn't mean you necessarily need to move it -- I only meant
to point out that if you do, then you don't need the other changes.

Cheers,
Miguel
