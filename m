Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EBD3FB3B
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Aug 2024 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722847454; cv=none; b=bk6si1B4eFQEeFDQvmxUxgAvXDyYt/cMD5y17iy5M1OSjeY4LnXm1QmG90JfECaHUiUJfO5Kcs/hkALMexKeku2wkdOP4X415dDJARlPaDKCNm7JXjZ8tpn7ecHWvdjiS2wx+rmUiL2yTnFcTWyfSpcSJpOWb+aDP3v6hrsnym8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722847454; c=relaxed/simple;
	bh=fm6iDdrrchB9TLaDEjrQrAmycPo24uRg4U4FYXtFY70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pg5VjGaxEHt7URrNomzrJ9QJL9LcKFdBvfZCgM+pJAW+XfJ4x2xk2+2/x8PEt/AJxczBQp3cYT3/txS8HtQ2Izia6eURqFxI0BQHJ7ALrOY4h4tnzXS0dMIYAdpiDo+1UARb973ar6MFaRPqIBCkgQPZkuPwmr4zsVvDpDF4a9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x3D8tgBF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x3D8tgBF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428101fa30aso69623075e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Aug 2024 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722847451; x=1723452251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fm6iDdrrchB9TLaDEjrQrAmycPo24uRg4U4FYXtFY70=;
        b=x3D8tgBFQgUHyC3dJJfgzgsk+HEf9os+Dr4zhjZQeDbLQAmhyWveiQGLOUhKJKjLSE
         Yvhw0xxovCwCHOzMm3BfOtmcoCdH5BsYdrAleezGdvNRFDZSrq+NfLyyq8+CYgzbwwxp
         8TNLbh/bXoiKr9p5bHjQyTLj/ZAlaimLtGYI6lgeUN42TvWbI4dFGFjWGxt6SqWQlyKK
         ElL8hrsk9nN0Dpgobkm9Pz0Eu7FgJbJuVLnvYHRfY9I56X8+h4z5Gy0JihLebRTO91w5
         SWZFLJQz7dXsBuqE2uBDqMP9QoGiSgPFIWBJIxBzMqoJAVxsP57xOkW8okdhAJ/Pqik4
         knHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722847451; x=1723452251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fm6iDdrrchB9TLaDEjrQrAmycPo24uRg4U4FYXtFY70=;
        b=A+xk6zprRDW9qcecqi+5HPp/uELCmEYGZxa10vA46RsF+CECe+8WYKj9zO9v5N0DM0
         LpcB3opSuh4DKRsV/3Ls1UaIj8T834lb1Z5mk20NYJyrIJKRgMuptxnunfkinr5MgL/c
         KTuS4a+x9akEUCz1acWZ2FtmI1VC/gSf29qLzCLVtR61xXASd6TRJES9WiCi3i0GwFnU
         NONrkdVdZm/GknZm1XnLJzkapm5/R0udpN1mv21l2Qi+1QiTXrRVyobljo2hEi6BMPCh
         dpLtjV4CvXHJya9JnWs+0TU0QkMV1k4loPCt/nSLTG+pkqI66/hB/HiOeyMrQMUeXfW3
         t04g==
X-Forwarded-Encrypted: i=1; AJvYcCVpeXbHcxzAUWO50n0vS4jUZfru+DJV7sB5Wg74QTXeoLkiMFA/wNqdA4tC6QBF/AhEXDXKZljk4PAoZvvEJT3sxrcRsiWF4OyydTDziZw=
X-Gm-Message-State: AOJu0Yz/CcfbInLuDZe8qOnqGrruznD5SiFdPxJyeLgoOVPnYk+2nrKL
	dbHEa73OT4MFlnnYNgcbpGZmABOAOFsxhrjuyJ+NUtk5akfKigKBnqOCT/MYcB0hHFFM4LCB07Z
	NwBXxQeCVDVbAvtU+DZ8kLXdtLARZtYsLXXJO
X-Google-Smtp-Source: AGHT+IFQNNlLaN3e/vSKEN8qAWnUmVt+qaGbQE+xaDCrBD7/2Fspb+GbLuhT6mV28u0V7jNeDv4p8cFoq4FWkdW6LSE=
X-Received: by 2002:a05:600c:3b0d:b0:428:387:79ac with SMTP id
 5b1f17b1804b1-428e6aea8femr77816135e9.6.1722847450485; Mon, 05 Aug 2024
 01:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240803141639.3237686-1-benno.lossin@proton.me> <2ddc08c1-ac38-4cc6-a102-2ad336d6b617@kernel.org>
In-Reply-To: <2ddc08c1-ac38-4cc6-a102-2ad336d6b617@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 5 Aug 2024 10:43:57 +0200
Message-ID: <CAH5fLgj2urZ6OD2ki6E=6EuPqW3Z8BGg8jd6Bgo4OOrNiptnDw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: kernel: add `drop_contents` to `BoxExt`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 4, 2024 at 1:22=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On 8/3/24 4:16 PM, Benno Lossin wrote:
> > Sometimes (see [1]) it is necessary to drop the value inside of a
> > `Box<T>`, but retain the allocation. For example to reuse the allocatio=
n
> > in the future.
> > Introduce a new function `drop_contents` that turns a `Box<T>` into
> > `Box<MaybeUninit<T>>` by dropping the value.
>
> Is this (and the stuff in patch 2) used somewhere? Otherwise, I think it
> would probably make sense to base this work on top of my allocator work.

Yes, please see the red/black tree.
https://lore.kernel.org/rust-for-linux/20240727-b4-rbtree-v8-0-951600ada434=
@google.com/

Alice
