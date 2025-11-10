Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06413315D51
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 16:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762793345; cv=none; b=NkpnODnrj2020MRwVDOkuc9ClsQbDpcz8f5iV9EMxpjvsIMFLm3ZkhpT/S7gpjLCQn1Hh/qW+XUfkIN4AMLL6XGbG8V3/TPjGaOUkBqKyZG+qn3wyT6JIs4AqWCa1dbUcHfqBXlqn7MSwt2wJ6VMAsqd6tZ/m6qL20GTTWlKBu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762793345; c=relaxed/simple;
	bh=WCn2M9Pn98zQCwXGhIe94Mp208rWyyDEa7Ij/HDRHtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4iGN9zjyaOwshXniDCm4B7BZTLoRCxRm/QBd/27doV6OZjsFaBgIV8bnXkKCBPcBPJmobOp8nAWidmbO0rnG2mRpIgNPeKQ+BrLLkRe1XOVsZLBpsnITtMMDpAFlCUL6fcr6ml0/ncYvYFZ0tartZb3ZNFzuQSfGzM9TZJ/cgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXCIop9C; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXCIop9C"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b178a4f974so261170b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 08:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762793343; x=1763398143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCn2M9Pn98zQCwXGhIe94Mp208rWyyDEa7Ij/HDRHtE=;
        b=LXCIop9C9154lwZg3Trtm3kb7fxgwtRrx/MWfU21BhkvGi1QP8dHv3OAgCWJtm01hK
         sQzeTMCj9AAr+qxes3HBTPDDwt+FhNNRhgoZPAoUJF/KDNwqjy9azSHvI5ez49Oi5W/Q
         cRe9LcY2DZJfksaFhejhBVfAJNu57XIA8qFIn7VzWA3LWJ3Ett3CijAsRTTpzEgEMi50
         X7Ccwwxua/Wefi5U9121aYnrM9GinZ2kc4vZF6bOmH0rFAae6lb/iLvfK8iqdpkNIyYo
         NBF/v2yqn7x6o2qKP0RxJ82yYoFHS3LM1V6sEPbNEzM4Gcdw8a/BO9otQvGHsEEtTdb/
         svHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762793343; x=1763398143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCn2M9Pn98zQCwXGhIe94Mp208rWyyDEa7Ij/HDRHtE=;
        b=XjFc7VBpHLHnia3pDFB/PM3RJ36oIPkf4sFKHF9C8iIAKARs7NYxEZ8316dBhi4e45
         d6yQ6gRzKsadpcBsHP7EORm0UBQKMXKwrH+f2yJMI5FQ2CzV2U72OZE1F564dyVxSlKB
         0W/2mNo6vHfqp8/LmMYeDytbiLK9h8EoVVciWr2tupalx6c9TGZLx+C+woxkbo+9RKIE
         cWQVigLxSIQuj+DxmkOo7FhR01b0d7EvfFd/nkeqyyY4SqUzpzlNj0ccH1mII3y4XtKB
         JZt7TS2u9YG6p9Vozocn2JG0raF3ymg0ij5Aj4xwzFgWZI0TedTKZ3WklTywEvd7q9EL
         +9Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWfVdDSEO8Vma8T79IlDrDXFiJiAxQ+J4EvtjeC5uN4KxGwah4HUY0jS+LZrabVUVrWG1rP1jp3b/qai5ZntA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq59VNfogPxkdvof7fJg1+0bxKnTJfyruyGqgyx/foJVjo8wnL
	RWe4oKsLhcnE8ShzLpeIFajzq5xS2o0LP1XXneIxgrgfjzC2ktxh0d+secLry9qBguuf937WhQQ
	/6qbWz2IY3ZjPXa6WAjir8zV3xSnHfOE=
X-Gm-Gg: ASbGncuvpXsLlEg4TWJ7mXMiSkJee8QzI7Kdo2ITJiXwa4XCjBYZdrZYLvt1zm7JvF4
	ru5BON96Qhm6FcJrJeueuHcIEB9hMD82k0Hi93kwwfVV93QK3CzNiBWqUkiP+NCWEWSXbiqW/KC
	6lyXmxD/ZoZvv3FYqDnfvwNYkm8jQ5upAKHTkJzdBLDb2nAellyZ4F913/SCuCsua7OTZZpCUQP
	XpZGIP6VjjP55mF8+Ao39uyuVtUswHrQwcqwhvE2dwyThfAn0hjzHvocUlrCX8FSrmu04J71gy8
	eiZ6cgT62gty/Z3Kt6niPskI7ftMh3nopasT8E5rz3H5Vzy7MqgaswOfSFcj1c3YBhDQwIU7r9y
	RknBmroPSxiQcXg==
X-Google-Smtp-Source: AGHT+IH5I1+eyd6kWRNYzgBd7iVcE03A1u5jBf0zW8VtsXhcRPQLzp8sRacyFb9Hd3dmI6N+ld/TjvRphEHH4nekiBM=
X-Received: by 2002:a17:902:d506:b0:290:ad79:c617 with SMTP id
 d9443c01a7336-297e5611fd3mr70148695ad.1.1762793343249; Mon, 10 Nov 2025
 08:49:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110131913.1789896-1-ojeda@kernel.org> <aRH9Tjf0tszyQhKX@google.com>
In-Reply-To: <aRH9Tjf0tszyQhKX@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 17:48:51 +0100
X-Gm-Features: AWmQ_bnW52r8h-0gmyLN7ivgaSD0gXN5MS8PTRXx5xySmJt3bBV43-xYwc4HHKc
Message-ID: <CANiq72m4K+UZxodnKqdx3cowbYB+Mj_Z0gB63j=3jE+E-x+3UA@mail.gmail.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 3:57=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Is gendwarfksyms actually present in 6.12 upstream? I know we have it in
> Android's 6.12 branch, but I thought we backported for Android only.

No, you are right, this is just me being overeager. It should be:

Cc: stable@vger.kernel.org # Needed in 6.17.y.

It would only be needed in 6.12.y if someone actually backports the
feature (which does rarely happen, so I guess someone could have found
it useful since there is no Fixes tag, but hopefully people would grep
the log in that case...).

Thanks!

Cheers,
Miguel
