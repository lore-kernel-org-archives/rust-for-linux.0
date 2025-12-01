Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD0F1F91F6
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 22:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764629447; cv=none; b=r3xVT9QSBKTY8Bj1HjvX2oVTmxEXU5nUPI5E3IsAX0bP7THRljc3DMZNFIEOQbfIwZGSCmnrXVYehJdahKa8xKu5J0KQ96YjxI/MHHAvSPmn964s7Aasbmn6s8AAmlfAmVNDN0lqlNq1cGvE1GSblK7CaC6BYZQ59gw2tStPhVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764629447; c=relaxed/simple;
	bh=o5MpGRWt1QbTCIx3psi0kP3FtONWDRDv/mGYqfAxpuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmRLN33pdiIjxJAL9Fv+MODHPHz7LIIXOSA8la4wAPfutn6SzRXxtgigkjcoG1IxikDfn3sERdMN46Meqq6JPJLaXpvbkVcaqOkeDPSuItOCKVwGrfL84k1n53CItpjlohm2X/pZOMyNQ6EkGCHIjlQChMxvSX8pSOf0odKBQ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiV4dQjg; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiV4dQjg"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297d6c0fe27so5310655ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 14:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764629445; x=1765234245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5MpGRWt1QbTCIx3psi0kP3FtONWDRDv/mGYqfAxpuE=;
        b=eiV4dQjg61/TnsGGhMlij00sMV3UNxn7wiKS+vrbJHMQ8yDaZE0CF9etjbdNv0Z2F/
         dwfecFBYINQXpp6KTEzLuti69SKwlLVyUddqEJlrrtKq3soS17V+adgfNjEsMTD7E7u9
         ns8YC/4mRKziT7PuyWTgjJkFPBV9PzedHZacIpRJPzz5Mc0qeqHFM78GZ0c3f3LFfbex
         nYnFnYb0FUyfmLwgIviXbZ8ukWHjQUKUCZAdXY2C8CY+DBZa3djCY6NR6XV+jAkQ1ICc
         4OjsHKn5+4pXcJ0dKmVi0thNzeojoIOlVaB1vwu24ImaaLv3YeSFiJRlmr4T4ISnILX4
         T5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764629445; x=1765234245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o5MpGRWt1QbTCIx3psi0kP3FtONWDRDv/mGYqfAxpuE=;
        b=ojrC5jiGKnVLe7QqSxi8C48WKOwn3yvEJ9/Zmgh0HPPyVA55hORZiQbPc69jxp6DgH
         xz0sFQRhiF2An36v70Fv1+zhMruv3BiJhaaovtfU9NboejMecj9LrbqBcDdQv0HDOlbI
         vF7v0WS4Y9AEfq7VpjLfmRG2dFZg3OlqMoeefYGWqDG+lPxjC8j9YmwdMYsdSpYmxkJK
         9UYxiCKL6hUkqHOFlWVthgPazXxnYzrHeihcjvqlSu1pM47QBU5Oe/WVeHDGxlpIfktc
         mMv09fw9irI7CSotLr92D6124HpbfkRE80gjYTe8LhiyL7I3QmTq1JavQqif28OeawhU
         CpCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxYC1iHaOZfbxMRxZAuaVmGVUl8EoS+nf45nOtiTWdc0cWnMKvxfHlST1Ed6K5UhQXK8vMVFhoKoi0WI4LxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGcaczEBLhJ/TZdKSk79Vjcm5tZJDMOnvFvwOWHZLB0PFAAWsD
	GzI9K3MxYo84GtDSRT3ZHb4Ovq9VvpB0wG6GwnRpQXaMPOK82nzQpfzEmB7xn4lrZO78AS6kitQ
	mDhX38lb+7Z0rTYLtgKuagYkHz0YMK1A=
X-Gm-Gg: ASbGncuRvLINy0tt3YW4dwYbGfe7yf0f8i+Qo9pN89biYEOd6q69dMPJeRWKj9fhW53
	PTT86QTTCKN7xO27BimjmUjTCjC6RN8cI1D5UriZhHD6rGY3XVbwE4k16a/SR5iFt4pqIzpsCOl
	r4XdH3sDODxZ/wzpD6DS1tU4nO7uE0Ff76vdc1QbErmtB6iceyZtE5fpOmiqo95PTZpuAbMf9gt
	OJgabIsQQrW3x4PPCnDvWkQGragzyQsOTzdeXn9xgo2EhMutcEEN0TNWyI5SfpYXV8kC+OD6F4N
	kF7EuVAqw907KGL+wYr1tVcisDkLoPdRUqEm7ngEzalHHSum/PDjzPDlz4IQlrRf9aWqPDJZGXK
	l+0hOzVfdoL4HEw==
X-Google-Smtp-Source: AGHT+IGHxGCGzFVwRUGMDnjtYFSdBL47/yuzjgLbitj4yeg6ia4ATcJFfArtvcqBElQcbvEvQwVhmeOGDZ21tUc8jmo=
X-Received: by 2002:a05:7300:e80a:b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2a718b198bemr25658546eec.0.1764629445406; Mon, 01 Dec 2025
 14:50:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com> <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
 <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
In-Reply-To: <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 23:50:33 +0100
X-Gm-Features: AWmQ_bn7_DfyaSJT0jy3fNrYUWknruqwwH7bRpIZRSHNxUbqTeaYfAUp-OMWGok
Message-ID: <CANiq72nhkOMGGb7evGn441J-8nX=jSWeDTASn0gj+TCa692B+A@mail.gmail.com>
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked lists
To: John Hubbard <jhubbard@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>, 
	Dave Airlie <airlied@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Lyude Paul <elle@weathered-steel.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 11:18=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> But for API developers, the problem with doctests is that no one has ever
> actually *run* the code. It's just a build test. And so critical bugs, su=
ch
> as the kernel crash/hang below, are missed.

No, it is not just a build test. Doctests are actually transformed
into KUnit tests automatically, and `assert!`s inside them actually
report back to KUnit too.

It was a major hack to implement, but I am proud of that one :)

That also allows us to build them with Clippy, to e.g. get the safety
comments right, which is something normal Rust doesn't support yet.

We are actually getting a feature from upstream Rust to support it all
in a stable and nice way!

Cheers,
Miguel
