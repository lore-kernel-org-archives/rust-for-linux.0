Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0FE45003
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525308; cv=none; b=iqQuDAml21OCpGItaJp/cVplQogVHPnBLisx5J97eWGP1Nhy8UKbjL3oebsU6GGYb/jqOwzMpOzXLC70N+VRzUQajs7Dx8ZUDqpmfA/9bWm55vbGS+mviBIUdLcvhuRXZhIleYYQ6wXOErN8nJV02IV/GfP2PsM6fwbf+XaA5NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525308; c=relaxed/simple;
	bh=vGa2e+sOxR1kjjbqNBL8dGzoNyZCoVnqDAz+1z/eXvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QQotoJKBDd7f41gcwS56Fw3FD2NI9ZYKLZGFhtxNlTVVhdvVzpC5ptHBQz9DQbS2NvFQl1aPu3LvA4qqTdxfT78teQ1uJi5J/doXbKURz9tQa2A4CmnruUEwLFT1oITRZYdN/fjPu5R6ladeqTXXMbypP2cfcuD8kuxv7Ndvu+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FWW9HO/B; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FWW9HO/B"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3823cf963f1so2597095f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 01:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732525305; x=1733130105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGyB7+c80UUye82s82YdKy2wH1HIilO106QQXKDFNMo=;
        b=FWW9HO/BX9JAndhmvG9xiBFJtGBfLmPRbNtIcK8O1M59bnTa6U+dXbPCTUY3eT8VOo
         86BJj0gwoak7AZvV2jYpmXmwV5nICEbltRzz+dIQnWb5jukUovkif3D3MLzQzlDI9vnn
         5KGh8t97k+xTPZrmMHWxU/kzFKYS9KlVuY14Vnv6oeumxF09srw5Cvl0oV6uBb42KaJz
         DqOAaMZg7RWlS7Zs78PaCLZULRIBCkiuPdJAIaN9cOTWsN+Iavyx0QgDBwLIQGAEV3bs
         Vyv0zrtleqd6QDbVDGQsCp9Uxxy3hP5fTNvTWleIERoXi4b6uVn8aoekmQAhFHSwFQEe
         JDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732525305; x=1733130105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGyB7+c80UUye82s82YdKy2wH1HIilO106QQXKDFNMo=;
        b=cTyRRaeZhOCR0C2kqq/CZaHHD4I1O/is2Gm0KkPJE9DY1/e7sxvUe+8MXSzcasG27T
         2S0fshxgPpgn86bxiqmzc2XWcZY5/ctQmEZSUZQP4YJ1HlDu4EbAgQhngwkxyqMCedCk
         Cx5cyisF9ImadYQSOEFjmzj6aSEHPjnvEH1WXW9BEaOFlG9Wv4NBlzE9NTi2SR92rzDc
         JeMItH0kSqe1bAASJH8c+G69+Z3erWl3ohlo04A0EOSQLi0odTQ97nYQV8U1OfDhLsqK
         GPlaf+u2x9sB7CdpkDxt+3uP405dTucQSMxb5sP5IehIIhZwn9ZBnS/WyqIzxnRnDNnR
         b2lA==
X-Forwarded-Encrypted: i=1; AJvYcCVcjHG8U3Vcyqql1la7R5rKh6vLoOi6XqNbRGoQ7qIimJzu2Wa74Rt6kGg1spg07ZNwoBPRQusXyy3B6voeCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSyxWih0kfYMCwhmsl0aWCpPDPvmm8LorSJpibWfUfhjOdZWGZ
	7JtukRevojZ6FfrhIDac8xS5E2aT4OEvrrmPW5AZ7gVxZYfQakn3xZKtDtrFF8yrsKKK3P17U9R
	WYgDIaTdwlMS4QhmmkN4qIjsUPYh/4UnR698H
X-Gm-Gg: ASbGncvnsq9eoxbrGCSzGz3+FDyGXf4oAH69v6EcGn4OXS4cdEL/7aEpVDLMeEj+xol
	Rght+0PQiO5LmOS1GLscBB3RO7EDwUcqb4mM6uljnRE+n58gC2TxqxuacJhag7Q==
X-Google-Smtp-Source: AGHT+IF2PkbRFpcrfZyNOP88wZ0sxdWAIzvjJc5q3Y9pYFwn+cnOqJriyqf4ho7bV+ji8P+STy3iqOXpd3OuhmwQpps=
X-Received: by 2002:a5d:5f86:0:b0:381:f5c2:df24 with SMTP id
 ffacd0b85a97d-38260bf39a6mr8590568f8f.57.1732525305258; Mon, 25 Nov 2024
 01:01:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123104857.49385-1-daniel@sedlak.dev> <20241123104857.49385-2-daniel@sedlak.dev>
In-Reply-To: <20241123104857.49385-2-daniel@sedlak.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Nov 2024 10:01:32 +0100
Message-ID: <CAH5fLgjEnugoWErZn2ssE-x0eQW+SyuNFsL=_AwKtV0oQS0ewQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: error: modify `from_errno` to use `try_from_errno`
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 11:49=E2=80=AFAM Daniel Sedlak <daniel@sedlak.dev> =
wrote:
>
> Modify the from_errno function to use try_from_errno to
> reduce code duplication while still maintaining all existing
> behavior and error handling and also reduces unsafe code.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1125
> Suggested-by:  Miguel Ojeda <ojeda@kernel.org>
> Co-developed-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gm=
ail.com>
> Signed-off-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmai=
l.com>
> Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
> ---
> -    pub fn from_errno(errno: crate::ffi::c_int) -> Error {
> +    pub fn from_errno(errno: core::ffi::c_int) -> Error {

This changes crate::ffi to core::ffi, but the correct thing is to use
crate::ffi.

Alice
