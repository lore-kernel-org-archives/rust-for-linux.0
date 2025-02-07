Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493951A2381
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Feb 2025 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920907; cv=none; b=Sn8GoU/RZHkVjhmwMm+bBdEBZm4rjdhVpWIJ+pEaixN4zbddyFbYxyznAVe2So3EKZ9H97AycjHn8UD7GjG9EG1UjpVgE6Yi1PMZh4c/jVmEY4yabL2jnuoHD7uSqFxpooELbnIJuBvT37Kr3KXJGSIsHvvWlYUUer/357jdmQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920907; c=relaxed/simple;
	bh=WpzvF9szQZoGnzPsK8JGH5qUWtlXbF0BSAjLUqm0mEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hR9gqFc+c63KT2+G84j9yDcbmwsGIUtCRonXIhZi2mrLXWliLYF27r+e6MFBROsQt9RA/SOcT6j3ShiQzo/rGTdu16fv89hvwT56BG5itBI3P0svIBAJ4q+fdGJQr+TnNxSXD5wP0DTFBLDz6WZ6vJOxtNOR+S7UqkaGetFMZ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m/sGvnfM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m/sGvnfM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so18075945e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Feb 2025 01:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738920903; x=1739525703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2480EBnA/WUX+Abw4NwvBh7SdyU1bom5NZ1qUtPF8aE=;
        b=m/sGvnfMW24DT6nhxOhfOe1h1xQyRFlRZfe6ftk1GPuJN9Nt73iAsFSwlJcW6AUotf
         qXedEdlVtR+47n37WKPEU1ccA05rf6XDlw/p3QAOk0HnjSg4ybbpOboSVoRolmCud1tF
         2ZYOaDsxLo7T33yTWDCgWthrsZXPBgCazkQFyb/gJ8s1mq/e/RhHETveHjP7u16cDq5R
         0JgPVEJKwREsmjsDo1wnN3H0ohO+xLEdp7KzRpeOzojpMEqa1FfGZTxYcB0IlZ7Q2m8L
         1WaW5vPY3G6t5hqIKxzAOcB8VeZg2T7X2QH7ocvbnSM+KuYeRAs2K1Jf9mvK2VofAfZT
         toIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920903; x=1739525703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2480EBnA/WUX+Abw4NwvBh7SdyU1bom5NZ1qUtPF8aE=;
        b=XLIzR/dyzfoVreRfQ2q08VM06V6mbW7gHzVmdmwSUyMG3kn3AzhysDL4g1D+L+L2BT
         e9LPbgEHR7kNvibeZTwb0VwoZ3ajG6kmPBf7rVG5XN1GtZ1B1As/aVKst/UzQUFHCqPo
         JVu6VYsZKL2lDkI5wLQbAMjmppuGeTZCWdy0+OXAxw8ZCOE/RZWc7R+cDjSqW3DVRfbz
         xzlAjCCsS/m3vV8BhM2zQnaS0V6SevU+kY2fUgrNVhXDX3QR+OV3t0t3aI7+9l5Sh81A
         rFSPx69RMCUxeF91hz38K7uUEhBEFW3L504sTe4cxMdqbij+LX+23oPrydTg1ig9LWyd
         M9/g==
X-Forwarded-Encrypted: i=1; AJvYcCVmfZ5HY989dg2mOfkBKTPLYkHKc5mVq2wNGXeuRctIKiq8CLXUpjFGXiSOfnM8lVXpNYWxe47kI9XJn6zpvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrwefJnJ3GdH6FJC2sYwJbZDGtqvnU2UAKI8gXkSIviZ/+XAoT
	M53zvIU6PArnkE4es1X5xZqlsnIAroJeGRbcmcpnqEUcawoEpmxCmJHmjx8N9Y9SJ+2NYCz1qJJ
	Xgf+knWT7/44k7KAnj6Y0TxtLFiEtxe4Qkrkd
X-Gm-Gg: ASbGncsUSOFLFFn6nWJvF60ah3/lyGZvKuqHDS+3MBfCyxewfIhwK18IkIoVMTtSA36
	quZAMSGd5AuScTr5FjEsrjg9JIqajDwh8xpXPfx1Leqv+ZiKS7m/IFcI/snZqJkdwhSV4uVpcWO
	NBjdHA4uKY32cdzEZU9dVTXa4diyQ=
X-Google-Smtp-Source: AGHT+IGhUSNu9zvLoiFSofDY0OMxcNSFAl8TddmlA05himP+cOcm5XjI5yjsyVV0T3Kj//6iMl8vsfnlp3YycnJZYfQ=
X-Received: by 2002:a05:600c:1d96:b0:431:12a8:7f1a with SMTP id
 5b1f17b1804b1-43924991035mr24650525e9.16.1738920903421; Fri, 07 Feb 2025
 01:35:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206232022.599998-1-ojeda@kernel.org>
In-Reply-To: <20250206232022.599998-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 7 Feb 2025 10:34:51 +0100
X-Gm-Features: AWEUYZmEX6j_hGQINsn4AjZPTMCvx9Pp7UkxCKUDf-6T5E1oNpjkEWdcnoNHXT4
Message-ID: <CAH5fLgiJDrNPe4hT4HrpC+bcskWtBcZdcvAfdnqpY1eTHVWk0A@mail.gmail.com>
Subject: Re: [PATCH] rust: rbtree: fix overindented list item
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Yutaro Ohno <yutaro.ono.418@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 12:20=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.86.0 (to be released 2025-04-03), Clippy will have
> a new lint, `doc_overindented_list_items` [1], which catches cases of
> overindented list items.
>
> The lint has been added by Yutaro Ohno, based on feedback from the kernel
> [2] on a patch that fixed a similar case -- commit 0c5928deada1 ("rust:
> block: fix formatting in GenDisk doc").
>
> Clippy reports a single case in the kernel, apart from the one already
> fixed in the commit above:
>
>     error: doc list item overindented
>         --> rust/kernel/rbtree.rs:1152:5
>          |
>     1152 | ///     null, it is a pointer to the root of the [`RBTree`].
>          |     ^^^^ help: try using `  ` (2 spaces)
>          |
>          =3D help: for further information visit https://rust-lang.github=
.io/rust-clippy/master/index.html#doc_overindented_list_items
>          =3D note: `-D clippy::doc-overindented-list-items` implied by `-=
D warnings`
>          =3D help: to override `-D warnings` add `#[allow(clippy::doc_ove=
rindented_list_items)]`
>
> Thus clean it up.
>
> Cc: Yutaro Ohno <yutaro.ono.418@gmail.com>
> Cc: <stable@vger.kernel.org> # Needed in 6.12.y and 6.13.y only (Rust is =
pinned in older LTSs).
> Fixes: a335e9591404 ("rust: rbtree: add `RBTree::entry`")
> Link: https://github.com/rust-lang/rust-clippy/pull/13711 [1]
> Link: https://github.com/rust-lang/rust-clippy/issues/13601 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
