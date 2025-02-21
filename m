Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CABE20E326
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 12:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740139546; cv=none; b=XOewByfxZTkYM4y+pNnJ5knspIEXm+X0VA4H5MHPNmaGIzV07bTO9A3GU2tVebKloIpjk8x8+YRLY2WQtZcGhO72TsQxc2oVU4WURDTiRx79SRBPknN/J8sm3obRLMFT1tiXqB/eAphW9eJYXmBLZpwVxTzlEHiUrcapQnhrGgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740139546; c=relaxed/simple;
	bh=BQstsiPQ8cT1WzjLJVwY7xRdnhbI7ttgU9Qm/4wMFTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTntMEbij1C19waUHkyKGzCra/BOtHrfZk6875GzNUjz407FFYhCdf/D19NUSVDXaaqds5RE2yrG5WYonEpnAdXCMPjCsiuExsM3S0PA5TrZo+6m1dpne6DXarOWTEEl5XXTE6FS8DSFD3/08RRdBJ2tCnJngnF0DgE0X5bnhWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1paXrxSH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1paXrxSH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso19990545e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 04:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740139542; x=1740744342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ehjj0CJUAO6DDOfCpZiQMMSQ39JXaHMG2u6ksCe/iG8=;
        b=1paXrxSHsWBYYNlDgE6IXrnA+K1FLhErkROnj2jPfkxEoaXNwBrD+SkbqY5+AYrsP7
         o98SbkY6YVxj8acfo4xk7vh0ygGzRs/T7NNjik+GzoII+dodp4UkC9jnBGD+MvRPb1Cg
         V28hPS4uGCX/XF15fKV87/w66zaUsTc/sXgUZ0A94KAeyN68tJ0dDzBkrEyt9vnG2LAE
         57r58DSTOFs0BbgN7lUO6YLGl0AP7EyHDGELLHBVG81CrTBERTL0kmly4s0wtYxaZyN4
         o4hEvwnCVuG3cWnoj7lQTcnPwxHgWTYyZajorOgjWPLWyw0eqtfCDkpjoR3RNTsH7J0P
         oNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740139542; x=1740744342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ehjj0CJUAO6DDOfCpZiQMMSQ39JXaHMG2u6ksCe/iG8=;
        b=E83/VHDjsrgabqpD33LYtcBy765nhVXS+d9FF9Wz84XM16VmaYQDCMKpxC3azxZKaH
         bhQKmFtutQGl9281uMN867eoAX5eOMiKO4xaMEN222zeo8TzTjg34tj3PdsJ0CGTn2nh
         BzP6/cjpIXsuYL2ID/rb6nClCvmHTzVYuvt78MvghCZnlckCOeaUyl4MFo4sr+uRsHwp
         FHpsmsX9vxExzqT8udIAHq1KzM0+qBXsfQZ/Nw48OCwxAb0Yta+sXp9qYGq5z+wud4Dt
         6YM7SK1ey9VKsF3CpbrV2LmEQqUqRnAqYjzy5vLBEiTqK7m2I/5G9PR5lcqJfWxbgOSX
         UGeg==
X-Forwarded-Encrypted: i=1; AJvYcCW2VjE1YB5PEaCAMCFDpFQYGqEnTOces/Sqgv/wHnW8/W1YCuc3OkukA//nQcZCYJ6zJLHRAa++61oeyf7yFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2H4RO9ZfZLU0RCJ4WQV/lFO6DNNpkg4YZqR1koxguFVEKQiIK
	0EkuzAeIjX/HmUTfQKizkBryyIqxRH8BGWSX30UAJpCrvD3CYx0vC7fccoYke/rBhWuZ+sXeESq
	xoPFivDUujb2aLKbu8rc9whgQ2CWSEL10R1wN
X-Gm-Gg: ASbGncve8TfDGif8wS6ZjCQNc94mca9zw8u/C9IUYRlTnMoTYrRo3Df2FGl3n249RP7
	TNI15MohGW3E9XNEWW031LpV2n9c30PeNeLs2afnEztL2xWmjdIL2H5087FktiNUWkSsnHVw6D6
	IsxlEKbRxSApA0t7bxC8GbZjdcp5u1tmqmOO8=
X-Google-Smtp-Source: AGHT+IFUVqGJpEfAn3seSUzRTwg2k1L+NzWo5q83w6Bc89WWGUBJughjK3PTWCt5aJQbVcCE48SJfo3U/1oy8D2Zi4w=
X-Received: by 2002:a05:6000:1447:b0:38f:2f0e:9813 with SMTP id
 ffacd0b85a97d-38f6e4c074bmr2748320f8f.0.1740139541509; Fri, 21 Feb 2025
 04:05:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219201602.1898383-1-gary@garyguo.net> <20250219201602.1898383-3-gary@garyguo.net>
In-Reply-To: <20250219201602.1898383-3-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 21 Feb 2025 12:05:27 +0000
X-Gm-Features: AWEUYZlMILyXoM87TavacNdZrv7qxkgn9wtRgwQznZAn-Ot0POHswTlmHPK0Q8M
Message-ID: <CAH5fLghKXePs1bJA1pHtnofKRmbwEt_PjdB380-zjQZ4PSxzgA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] rust: convert `Arc` to use `Refcount`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Wedson Almeida Filho <walmeida@microsoft.com>, Alex Mantel <alexmantel93@mailbox.org>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 8:17=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> With `Refcount` type created, `Arc` can use `Refcount` instead of
> calling into FFI directly.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Overall LGTM. Other than Tamir's questions, I have one:

> +        if refcount.dec_and_test() {
> +            refcount.set(1);
>
> -            // INVARIANT: We own the only refcount to this arc, so we ma=
y create a `UniqueArc`. We
> -            // must pin the `UniqueArc` because the values was previousl=
y in an `Arc`, and they pin
> -            // their values.
> +            // INVARIANT: If the refcount failed to decrement because it=
 is 1, then we have the
> +            // exclusive ownership, so we may create a `UniqueArc`. We m=
ust pin the `UniqueArc`
> +            // because the values was previously in an `Arc`, and they p=
in their values.

"If the refcount failed to decrement" seems to be leftover from a
previous version. This should say "If the refcount was decremented to
zero" or similar.

Alice
