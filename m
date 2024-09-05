Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3A0194A73
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Sep 2024 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523040; cv=none; b=lRdnleCVPlLUhzbgu4BjJBc+hMxaDR96tlwSr/P7PUNaEjgYBP6EpyjVq/QAaX6yyTnX0pBSIUrVkg5r28UAbaXmyamssDGqRCbQl7DVMEqeqN8oBJC6ER2SbUPk1QE/N6ulTCOIRcMu8WZZOmNiNT3D2bsM4b0o5m0uPGmVo70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523040; c=relaxed/simple;
	bh=/15VqRopHjfs3Vag1wk1OqFB52SnvYMNDXanIJRXvYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlHf9XvzrPl+vzWlxl098vrklXrLtuoyRoLSQtB4RVDl+BW8KZL+Fh+9v2REYlESLvdPdd7tcqphWR662jA+AtZ+7Z24OX4o2HMDDPNHxdtzCRIsLW3B3VVemJgq3BucEUEsmVXAcRdZ0OY0LsNMO3d0onj5vOEE1bb7s0vprao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=05Z4+D+o; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="05Z4+D+o"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42bbc70caa4so3213935e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Sep 2024 00:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725523037; x=1726127837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7YrEnRdBza8n37TnMfyYmOU2+akv+XRSo40dZskXfA=;
        b=05Z4+D+o1hte8gG8ebxJ9uhLz2VkZYWO2y21Q+7/LEK8Q1bo+ICRp52NgAhPn/YIpQ
         9gmUkMUxnn6eLFsddi7LjQvJxMQAObqxDf2+cGI7vtxvXqoXBTFweDjLyx4xZZ7XXrNK
         TSu18Sd6CmsOfF3A7Z3MuiSUjmWNZsurpm0uWNY5WkcurJXJOzSCP6jVxL+O/mew1aK9
         sD7EKuGMOipnlcSS3prj0/6EiOn2G2PL69U2R9bybK/MC8l8ioYV0nvWH7d6AQnpPW3D
         HA+b8NuTILCJ0zNySkDs1XqbegyfYH43WuoqFI35U1XPZVPZDDaGLH5hMIzsC/MgOu1t
         dCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725523037; x=1726127837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7YrEnRdBza8n37TnMfyYmOU2+akv+XRSo40dZskXfA=;
        b=Qws8DPGVQyWqAXM0iQMkd6OON+bZLio8/Vez2/GevVk7H1ztFCwtkSb8sagAq3LJAj
         GWpfjD9HDC+xyeUVT0weyXBG0TIJLkldSXI1m3HNwoSTPQ07EzGBuZT80Nb/XgQeIvzQ
         a/wkLjVDxMaWW4H+O327PHg4Cjbt7gysRs4cHfoohVyVz9w6NZjIYY73nz06T56WB9QS
         bcWAWgLPz6ViOE7Z6jUcSnT/Lu1+IhhEz3JRYdW6hOYPu1BuW0IwLvt9RDJoob8mUF1m
         lG4aJsY8cEMfozVY03oE8UuDTD70Lblj3L/wbM+lrWwXrkDyYBlKurB6jCh6hus6lpl7
         Nraw==
X-Forwarded-Encrypted: i=1; AJvYcCWOxOHTbOGzfAWrD87kdCCdSlIPQS1D+o0N3d8yzuU0K0utckLvJhC5+zOdBKU9LYpruPxYJEene25JWhuLow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs1T4aoTFo0gmQz9Efp34Wf9YqiGnGdYkV5oX7NbBtfB/sfwK/
	jO0sntH4jhSke8PF4wUv6fNpnSBQp+fdWYC4X1eT/ubiRMZbXzympYnhgK0nEYHBc8o2ozDg2V6
	6ktWuvmeYR8hldIqZeC2JTzP9rciY531YEbE6
X-Google-Smtp-Source: AGHT+IFGxSk5gvaezHEawui3mVYKQEAynuLTKFXTokKk6E856Tt9Cj3ku4PsaYI/2eDBJp3YhF0CWjK1PgsgItKLriw=
X-Received: by 2002:a05:600c:1551:b0:428:ea8e:b48a with SMTP id
 5b1f17b1804b1-42c8de5f5c3mr45944275e9.8.1725523036325; Thu, 05 Sep 2024
 00:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-2-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-2-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 5 Sep 2024 09:57:02 +0200
Message-ID: <CAH5fLghM7mLjaivcErwwMGREvdJJMosHDLdCn-RUbdqJQo-DwQ@mail.gmail.com>
Subject: Re: [PATCH 01/19] rust: workqueue: remove unneeded ``#[allow(clippy::new_ret_no_self)]`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 10:44=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Perform the same clean commit b2516f7af9d2 ("rust: kernel: remove
> `#[allow(clippy::new_ret_no_self)]`") did for a case that appeared in
> workqueue in parallel in commit 7324b88975c5 ("rust: workqueue: add
> helper for defining work_struct fields"):
>
>     Clippy triggered a false positive on its `new_ret_no_self` lint
>     when using the `pin_init!` macro. Since Rust 1.67.0, that does
>     not happen anymore, since Clippy learnt to not warn about
>     `-> impl Trait<Self>` [1][2].
>
>     The kernel nowadays uses Rust 1.72.1, thus remove the `#[allow]`.
>
>     Link: https://github.com/rust-lang/rust-clippy/issues/7344 [1]
>     Link: https://github.com/rust-lang/rust-clippy/pull/9733 [2]
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
