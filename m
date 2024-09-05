Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3301197A83
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Sep 2024 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523974; cv=none; b=uAL1rS5saMYIaPGxWFo5UWOQg+Bhkh4gaMBeztuAlpjt20fgZICUxo2qeynaJuxHPfju+iOBcgqu+P2gDCciZ7gOD8oY14lg8iTbplxBuyO+dw+ZzeRkqCzCwiVdMfC24aChDZ3fAAVfTctaWqfurBFgpEzXmOs43+DW6YBRSyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523974; c=relaxed/simple;
	bh=EM5AYZn3xHS8ysks1h1PoSTJYxA67HpzaIoeDZpkynY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HmJgXeffUl7IeAStXLFQBqoMzaH1531VNsWZy+zKb+yxGNweiWzGyiJOd0t1eYY5gvX/25nMKakW3cbsw+eZpic+eJc5UAlCuzF90KO4XFWwInFEK+1PddAyCxjjHN1vhCGMciZUWp07cwomomqqDDCdk6bXd93loooyJKAhOmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GBRL2SM2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GBRL2SM2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42c94eb9822so3241755e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Sep 2024 01:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725523971; x=1726128771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EM5AYZn3xHS8ysks1h1PoSTJYxA67HpzaIoeDZpkynY=;
        b=GBRL2SM2EYk71aKwtf6mB6CKHr4cPxdSG8P2e3LOxq1vusXb8bwvRmRIf3jdnjI2EP
         dKeTRspJKKG6Zre+TtaIUQTCaTHThRfo3aOGn08wQD3KkQx3qmh0u5odGxJPfUUoC2FD
         irKW22zAZqeManyCTOUpoH4N3Q7mOwxBeQun9t/6X9xdvxpXlVihCJKc+x8r8OrUyqcZ
         lTYkDPeGYkUuzpB0kd0Afnnk1hWWPR/8HkQwHOj5jV8EYJnrCF50ojC+KnNTSsk5IZHL
         E5ikoN8TYaM0XYjW3ks3BTxVwM1hQ35705x+YuIJtJzJOKLTCCaeCX+w4l350WpjOuwO
         3GFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725523971; x=1726128771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EM5AYZn3xHS8ysks1h1PoSTJYxA67HpzaIoeDZpkynY=;
        b=RCid+bmzrd7KxbqtscMDMCjgwv1c6RfT5sk7exx2OYzPXNgt3U9dsrak8dySXChlbw
         sf93PgTgRi8JHx5GffCnqZcx4ORX7FfWd1yvfwr02TcXl2FI6/HSjc56Chdj8mfgyEKe
         iW7A3uhgQDqk5jNKZvaYnwVDbHn/OLnlsaWZeR1zYDeh7wYS6Iy0RjwvKORv+TdxI4ok
         eUfug3SkJuBrcpNVoLVqXspsqmj6hYUirPzW33A9O0C35Y6aANYowEuF7RKsrxYdmuoY
         a9kcDbs7mH2WUi82ZUz0JlqgCUjjkbx/ia0sNwJHpnG7Sr+fMxI/Xl1pf8FcjEPdC5zv
         bLEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcR4jNfngczMfWyBrootTKmXtdKqqRbaqsy4fI1GZZfX85QLhFp/ETdkxtfQD3XfwkYkaR+bkRWfdYpiw2Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ajGt2Ue2KIqAZ2X4QOVS1lCBowGsVN/QcdSv4TPi7OdBGpDZ
	uAbaNtn1SyINs5CLcAVoqAECkNNj9cZfiNIXdsQkHLDTRHkkhc/DuKZ1ZI2t4F2t6MThpYFaoY2
	mOd5ubtmPcWgsA8XSH3I3i0jLPwNeiYaiWbJ8ION95E/0kOzflWEwAmE=
X-Google-Smtp-Source: AGHT+IHUJq5GDiaW5WkXtiY5x7TbnuRpJfJj9Rrctnr2ggXgTY3BHdUazeZIh/t5+B4zy9gdHlKeAYqs8BTvqcnvl7w=
X-Received: by 2002:a5d:4706:0:b0:371:8e8b:902c with SMTP id
 ffacd0b85a97d-374bf1c954fmr9377269f8f.38.1725523970885; Thu, 05 Sep 2024
 01:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-14-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-14-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 5 Sep 2024 10:12:38 +0200
Message-ID: <CAH5fLghf+JUHJpPzL7yTXGxtRA0LK5xreXwzsSVfxCiT-mo20w@mail.gmail.com>
Subject: Re: [PATCH 13/19] rust: rbtree: fix `SAFETY` comments that should be
 `# Safety` sections
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 10:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The tag `SAFETY` is used for safety comments, i.e. `// SAFETY`, while a
> `Safety` section is used for safety preconditions in code documentation,
> i.e. `/// # Safety`.
>
> Fix the three instances recently added in `rbtree` that Clippy would
> have normally caught in a public item, so that we can enable checking
> of private items in the next commit.
>
> Fixes: 98c14e40e07a ("rust: rbtree: add cursor")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
