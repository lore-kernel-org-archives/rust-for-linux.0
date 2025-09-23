Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB92F30BF4E
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 21:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662989; cv=none; b=bJihpPKjpuQkq+ai1q71rGO6sI/bYp/Z/cq4y8RribUrzRFSMVDw+EiCLqRrSs7FW3QWBuq6/vJxVx26n1uK629nL7cJ808/XBX6MjfaeN35435QcRksutLbkE3R/Oq1i+SSQh3SNiiuu7qtLfyL8eaXTbqV50Q3WxaHYfaOPmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662989; c=relaxed/simple;
	bh=klwPCi4puQ0zuDEZyWWCXYcdBGsO/A0fjywC3l40eYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQGk7q2j6BQEAJPRmn0Z/3Lo21v99IRdH7CP6B38P+hQiNaTKwU/32gy5ZaQkge6uH24xhrtYxODeK3aiGvTQAFGWrOfecVcanHfe3Lx2EfAqjnLJCQOpRQYHaouuu1I6ItIx9lgxwGPA7S0nKBDNldpk1H/z8p2Gj3ZXiuZ9CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHGwRrl+; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHGwRrl+"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-32ebcef552eso1070812a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 14:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758662987; x=1759267787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klwPCi4puQ0zuDEZyWWCXYcdBGsO/A0fjywC3l40eYA=;
        b=hHGwRrl+vRBIDsXW8Yw2H3AsVLKcoHwqEz3rusLUH847L0K/xR6LURZHK7LCyAWcKy
         4/Ex0JtciQx4FgwTlh52fghHp03M4ZEPJeeExyuFRKOY3UF66a3fS9b/SYIfLlEbEhKu
         SnfwYZO7KfVQ/uNvGv+Lis7zUA2/LgZprAg16U8FF4YgcPYiCghtF+uZFr+dEbosuIZ8
         sMUyc+SKv9/ks/XndtdMfQbrPccQoZHgZB2knAcJa4wJgFwttAoJEJUh/S9UFy2WsWM3
         L858KQYn3PDzteG83ra2UBUMq+6MkdmxT6H56N+EAZWU32N+a3YQ3WJ3qKgexG7+hEcz
         DqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758662987; x=1759267787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klwPCi4puQ0zuDEZyWWCXYcdBGsO/A0fjywC3l40eYA=;
        b=eYhLHEp5QFfQ2kX4skUxRs7Bm4jBx68BphntyK6AQ/Bd/pyqweBfB+EySKMw3hdedB
         NqpfHS8WXxzJnMEbDraEiEk0DfgHDvdj4fSkFL/nrOhA4uFqf6mJX1GYUxAkF9ye3QjG
         vpGSgxRLktNk+5BqUUNhQ0pVK4wExN+YUygCORkUmhO3cqjBPbKKCa5ec099RKBhlB4K
         ApWcSkd0AcoQzvAEFgEGA6sX0HVgZK90BMQYXz8dIJvncp4YOjCYRqr4cukNZ0eqaLf0
         owQiFUyaAaWxio+QGSu9cCUo6e8J74HGyPdbeShZpBOf3akAg2FxXZf3DIOt4Iqw173u
         MgjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/o3/glcRhlnpPG8mld/phRmfUcR42unF/h78FmQc3Ov4nR6akrtkBALrIpws8/AHTzxRj0hQmtwtxfx9T1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YygRaH0aSDAcyDAq0ikoFLLhVQfW+py1JexancdG4ODRtie+R+6
	UscoAbIOCoH1crearBdHFMcDaddm/x39PDzeRbdbNLrf+houq626pxq8JGvEvyQgYcYkSkh5Hmq
	fBdQr7UEzYk3TH0Hzu07snGrZK5W2pss=
X-Gm-Gg: ASbGncu0KIMZNIAElJvKX8Ca/eYneQHrXXp7m5MKYHlsTnsNDCHZkzL3VOwPV7Bx0ts
	wWBM3LCNP/PVv0rUIac4e6QE0vv9eiCJjNTzIuQeGFCy4ljEPvQsqMgruxNc7w4DA6FDba1QZyy
	NS/8Mfnw39DaIhPjjZ8NZE9v+FovqKFTC7btz5aIYhvlm/vtxj+xwdO0oukpokcBhs32O6UU9D4
	+vZ6koudGTp4PXr78X8wnxl6MZd1T8YFX7GUYI3Cg+C4EBz1x4ymQDrGLEXCAShw3sAE4JnG1Rs
	pZL8Ao4/LSyc4e1PExRC9MGAuw==
X-Google-Smtp-Source: AGHT+IHm3C1GpBA3VBrZexjxAHTLcQA1zEDuqcUGIlepgOANCbpnx97SeKPhu08lBO/7UGD9tgSCkuBSZ0I0ZfqhRPU=
X-Received: by 2002:a17:902:fd4b:b0:267:bd8d:1b6 with SMTP id
 d9443c01a7336-27cc5de0da0mr19480475ad.6.1758662987013; Tue, 23 Sep 2025
 14:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825-b4-usb-v1-0-7aa024de7ae8@collabora.com>
 <2025092338-elbow-dash-373d@gregkh> <CANiq72k4VG4UMDJUUfD=LNM+tJmvceNDxG=A-+6GDjLzCVXurw@mail.gmail.com>
 <F14B2B5C-C361-4670-88C0-61A1EC97E630@collabora.com>
In-Reply-To: <F14B2B5C-C361-4670-88C0-61A1EC97E630@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Sep 2025 23:29:33 +0200
X-Gm-Features: AS18NWDubd8RGsH6mIJhWBKGluo4Gi2SmLUql2vcus2XnvSic-9i6pFMqT971zY
Message-ID: <CANiq72noNB9ctcj51sJ=vvw6PfocgWRAD7sxBJHAfbNt9ZcVaQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: usb: add initial USB abstractions
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 3:25=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Yeah, I did not add that on purpose. What=E2=80=99s the preferred approac=
h here? I
> wonder if we can add the Rust files to the USB SUBSYSTEM entry? I can mai=
ntain
> the sample driver under a separate entry, for example.
>
> I=E2=80=99m open to any other arrangements.

Up to the subsystem maintainers, so Greg in this case I assume.

In general, maintainers may want to maintain it themselves (thus
adding the files is fine as you say); otherwise, they may prefer to
have you as co-maintainer, or perhaps a new sub-entry with you as
maintainer for the Rust part, etc.

Thanks!

Cheers,
Miguel
