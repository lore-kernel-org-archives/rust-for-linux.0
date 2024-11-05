Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628FA163
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Nov 2024 09:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730800177; cv=none; b=rStCjPKrFBaL640IwS6ZsbXJrfj8K8hHseGNCVvCnMweR4ZqbzFI1FmbLpU+EuIyHqeCojcQAp63NGTOcR3rTGIUsRNVCfbWk0U/y9AgYDAi8Oln9cXT2ZmQrPtlKLKXrYQqzA4rjOArl7ieC7cvTWC3QZ6MpH2D2MV6YWc4Z8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730800177; c=relaxed/simple;
	bh=WSxyeRDT7brI8fXCDr6Wzow6scSsG+0rHCTG58ApGHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D7SEakq9x1n8Uir+cq1nqWNEVJW8qqkrMMP5IV+7K3x272Z9R7CJlgljkA6cwmhcAXpRPrVVF4xIDXmyrewU1jFoYxTUDRfWFGYVe5/RzX/nW82iwBP6a7K04Qb+jtV4oiRrALjPXquo6e6XYqYs9rLQX02Uhzim3werDOlxV58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LDcZjBR6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LDcZjBR6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4314f38d274so62171295e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Nov 2024 01:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730800174; x=1731404974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSxyeRDT7brI8fXCDr6Wzow6scSsG+0rHCTG58ApGHQ=;
        b=LDcZjBR6VmgCozCiZMpRH7qD0X5L2An+8Q3xm7kJ2v5NJ6zROe1prNrxHkmlHDtY5U
         jdJX7ei9n69FexRyxTVI8/9+LRf3nONmpdo2S1wIWI9yRZMuAWLcJMXNGr19lYFJXCtz
         mxE3hyvuw6jb2lAVc94OsHdL7W8ObUqniFiNiXqVCEPCt4KUl0DlLTyL234xC2qqxWMh
         lHETignOfSg167gpMX97+zrukpoTDsyU2revpiUO8WxCX8K0FPJe+s9GDUJVqj1uUWy8
         eZBkCM1G5Z2nFTJzlfSVhFNkCkF8+6Yjq4o5kP1N9POtEFRjMMSs70R1r53PZriYhi6r
         yI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730800174; x=1731404974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSxyeRDT7brI8fXCDr6Wzow6scSsG+0rHCTG58ApGHQ=;
        b=YcgRttRm5467yI2YwLBM+mjMk60f5AX2uhkdxATCoQTv5hnc/lHrF75fU7N00ykvGF
         fAniOvZrBpWVb5wUXex1CBqIIrmi9iPxyAd7f+Wp5jqAzBVkZXwNkK7ASQi3GqwhuSdf
         WaLOXzC0ShbqA781oyHLFFkxJNB3qWty/kvogXHh+nfdqCd+Zg2QEQVfK4J2Zs4aG6ik
         TgOSAkD68KQ2Chi2/R2g33HcQt/H505aN+4N8f0kSaGgHK2lunQoEHj8C7TCwm8lLGz9
         TeQRiVkOY3P0lPYuQRS2jkznUYL5Z1ZTVF2PGNMKdeRkv9tH35XzijAGgFL8AXZIAH4z
         ujbA==
X-Forwarded-Encrypted: i=1; AJvYcCXmqQQQ2Y6b00azkJs+iYiEJqDoN9BiSq8ROV1Yainl4msKMpBCOXlEbltdWEhe3+fQw2Xs5dD+geo5ZGl1Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsCUuGEAlEeqbh0zVzUzdAhgiHuJpEtdnrxTDjg51wE9GuvKOQ
	USmxED0mCa0tEQp7saKPYwqgErlVmpvYKdcMchZGtvk2uehkNomMW0aQypxQJUPhvFwGL/gqHF3
	hvH3rulk/tBgov5gVq8CYuRAvRObIRidt0I8C
X-Google-Smtp-Source: AGHT+IG9Pq7AVQnpHVvnLmiGGQW/TqFYN2hCr50GvIm4X4t39SM5Knc3eWwgQpiIH/K4NKNGRT7MK+vktj4d86uT4Xs=
X-Received: by 2002:a05:6000:1f8c:b0:37d:2de3:bf8a with SMTP id
 ffacd0b85a97d-381c7a6bcb4mr16091403f8f.26.1730800173559; Tue, 05 Nov 2024
 01:49:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104140514.877185-1-2407018371@qq.com> <tencent_78A46797341AFC745CE618E9EAEDA2D62708@qq.com>
In-Reply-To: <tencent_78A46797341AFC745CE618E9EAEDA2D62708@qq.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 5 Nov 2024 10:49:19 +0100
Message-ID: <CAH5fLgh1xrWnHpUdbHrnLZoGTsj16uCGAKoYPQcM7q51HwRDOw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: Implement Display for Box
To: Guangbo Cui <2407018371@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 3:06=E2=80=AFPM Guangbo Cui <2407018371@qq.com> wrot=
e:
>
> Currently `impl Display` is missing for `Box<T, A>`, as a result,
> things like using `Box<..>` directly as an operand in `pr_info!()`
> are impossible, which is less ergonomic compared to `Box` in Rust
> std.
>
> Therefore add `impl Display` for `Box`.
>
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1126
> Signed-off-by: Guangbo Cui <2407018371@qq.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
