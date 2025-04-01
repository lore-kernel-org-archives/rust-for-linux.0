Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D591F236E
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Apr 2025 11:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506778; cv=none; b=dgwNBXOWG8dYXLhAetvaAL8Qsbf6KHGhtbdMyZTQHL7d5BqygHdtM2vYFZJTh0XHOLt+udKOB2XPRpD5JRzx+XHmBmc2AIXiYcC22IEE6DLh+6yiBXrwPYeLfP0oTQzE3lVQjt6vtkBUpcoYBsCe0A1LYfbF4/A/oEokooOc18w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506778; c=relaxed/simple;
	bh=4q00NjhK+XTzB+lx/jR6zs3IV0wtbJFoamhSIKUeR5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIt0GumYcRFS7ctPS/79V17gPMYCmXrR2H8Gjpfr9ggJvf246eQrJgYkEKfnx6DBmE40xM9gYgx5koQgeLUYAX1LP/kjEyTMq2MpmNQSLgMFJOilD/WBKjVs5/jwr5pcLotENVd+ltDPysN79OEprsjqbgxYaokb0pcEmIQgklo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFHqa6c7; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFHqa6c7"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224172f32b3so11509085ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Apr 2025 04:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743506775; x=1744111575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNQtxr93zTxu/gSfXTlwOuMLWRgHJFdjc65dqLVMyNg=;
        b=CFHqa6c76VmoRsZ4y32JoiTyxqIq4VTp26aEPsQCN0+NIC8mJ9iZSisl4J35wILX98
         ejeXoIZYde1K0UqZhoNfGGIy+ynrbr9Xo7hpH73e+CjcQb11MDFeXJD69TcDg/ke98Yd
         LrVGCKYEdV/erJC6EHdU2C0L8rTsPFqvLta8eDT+mz/J8R2sf0o48J+nHkjPuAQO4lJU
         h7i97WjDDHHuDJ67Evr1/CHCQe3G7GQgFnzBlAf2gMXo83cQu9UgJ+y2hFGAogqqhiOv
         mf0t9qoSBEJR9g4Jo0w73SLb4tHlTq9UxqLZGVLpIigbrvc3eZvmbUXFePKgIQr8RGd9
         1bpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743506775; x=1744111575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNQtxr93zTxu/gSfXTlwOuMLWRgHJFdjc65dqLVMyNg=;
        b=KbvvJXAY0ZhH3tlLQFwjGQj6rArcXPHFhgX71KO/S+kDHuqzeEogZ10d24xOb8Vfab
         STu5s5LUr8mHsRq/0X+Gx/quC0wLu9LXPMQD46CaNjDCVDLwLy/0RGB/O8uBEWvt/csF
         7Po6Q50C0Kyq1ogOnJhfAdwCZTlvT89w5jBWbLm9nCJIJZ4QYeac5zT2TStpZma10fUg
         3ek3vzAav5ns3MLfDwyq9u0C+GSwNrhAWQkW4G+bbd8glwGtUCOrZQYRZqMCr4LdvYcS
         MnjIv97gSW4/XLTlRvgxUhk1+38OvYHYEXJ1eG9Faog+JPux8DOp0+xS6+ZJ+sclQAuk
         SkUA==
X-Forwarded-Encrypted: i=1; AJvYcCWiAI6gWSNthNhjOywRhAc00Or2pnT7cdHYO0gLOgRHHFPFlr7xqJVSaDWnPCsq/okyBBOyeknSnyUzvAyr2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbCViv5U8ThX44+IxheQ48gW600gyInG0xzPA+0sXe1CMCTBPX
	FAdAerlW7SsDebUm4qnQTSBSos0ALkr52JV7SZ5TGiZO3s74wgqT3VK1IzjyisZBQuxQmxF49iQ
	pjt3gjrTSm/DjWoyJ2zfqD227odc=
X-Gm-Gg: ASbGncuVZRf7pMJ7FF9zAPh+JdJVHa2Ck5TVY5fEgGJLIDR9ZGLYEOiMnrvjT24vc2h
	cOHzHE4shOiTwpGVzDvzvUgfSG3Bgg10OQRo5vAASHAGmVBHEZFTisqO3cP3+yIZwPNQWoZ8ELg
	AkXJNe+5TtfZe/F7Yz0xT7WZ+QHg==
X-Google-Smtp-Source: AGHT+IGS2h6crh5EexWRIwYyfwLo/Ky3x6D27XfHqMeU9uBJjtuUgFyAXfo5oP6j5WoocStiQF8JEIAjpEOIvknbygs=
X-Received: by 2002:a17:902:fc47:b0:215:8d29:af0b with SMTP id
 d9443c01a7336-2295ef12acamr12139995ad.14.1743506775447; Tue, 01 Apr 2025
 04:26:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D8S8C5W0FCVD.1LH1E86H6PXZD@proton.me> <20250331170118.1376899-1-igor.korotin@yahoo.com>
 <CANiq72ngOZs8idtvxP05k1TK8kcM+Yd7ztSuq1PaAoHHBEQBhQ@mail.gmail.com> <44928637.255825.1743501279791@mail.yahoo.com>
In-Reply-To: <44928637.255825.1743501279791@mail.yahoo.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Apr 2025 13:26:03 +0200
X-Gm-Features: AQ5f1Jo6jIK8006O9s4S6ZEZF4QO3Witf4F7AVFzF0W5qdQWIdBAJ8_h7yq9GJ4
Message-ID: <CANiq72nZsGcDCdE6ddxLg0daLnfuyKWkXzkb+j1PGL0kun+zgg@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: quick-start: update Ubuntu instructions
To: Igor Korotin <igor.korotin@yahoo.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 11:54=E2=80=AFAM Igor Korotin <igor.korotin@yahoo.co=
m> wrote:
>
> One of the issues is that bindgen-0.65, by default, uses Ubuntu=E2=80=99s=
 Rust compiler (version 1.75), which is not
> compatible with the latest kernel sources.

Hmm... I am not sure what you mean, but `bindgen` does not use the
Rust compiler. Of course, both are used by the kernel build, but they
are independent.

> Do the environment variables RUSTC=3Drustc-1.80 and BINDGEN=3Dbindgen-0.6=
5 ensure that the correct
> versions of rustdoc, rust-clang, rust-lld, and rust-llvm-dwp are used? If=
 not, perhaps those should
> be explicitly set as well.

To customize the binaries, you want `RUSTC` and `BINDGEN`, and you may
additionally need `RUSTDOC`, `RUSTFMT` and `CLIPPY_DRIVER` depending
on what you build, but the rest you mention are not used by the kernel
build.

They cannot be passed as environment variables, though -- one needs to
pass them as arguments to `make`. Which is definitely painful to do
manually for normal development.

> I'll try to come with some different format of this configuration mention=
ing the command:
>     "make LLVM=3D1 RUSTC=3Drustc-1.80 BINDGEN=3Dbindgen-0.65"

Perhaps mention the full one, if we are going to do it anyway.

By the way, please do not use HTML -- your emails will be dropped by
lists automatically if you do so.

Thanks!

Cheers,
Miguel
