Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C2F26A1B9
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 21:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771017205; cv=pass; b=LQaaW4wko3nJI3yiOtZTXlArr0v0p2X4n1xIz+EQmqfhCj8E31eB7ouTm8eniugB1sO/NnataFrEODvJxywGgALr9B9u0FsTWdcCjtfPZwlS+0Kc/+wl6I8RWGaQL5dW6R3t/ViSAUVwSIqUQDLQI8uTaRxHFPKrF5EsvWIivrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771017205; c=relaxed/simple;
	bh=hyD+1LRB6yy7pOWx0UFjAn0a+WYqqKiiAK6segs7eFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qoxdv5NbtHgpEfYEPXjrA8/rdpaUzk2lFn05y9kOw7Sak9jPWddSTx7H9OMe9tSwf7VWfIqdv0TgGy2sJ6QD7+3x/RXBgAddARNqPvrySirxdPrrDmsNX1GB0zxA7Ff+TyDNjDPczSE+9UtlcRSkcTc/RCEAwox8zTx1gHqe9VI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qa6bKQcG; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qa6bKQcG"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65a3a1740e7so375a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 13:13:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771017203; cv=none;
        d=google.com; s=arc-20240605;
        b=XVfnan17eFxVqbjLnfpyL/OoUqSiTYqJ6kR/J5fGcNMg3OSHkOY25vD5UdDl+TxZuS
         xVoSj5YdFbgjM15BM8CO9bc31kYyaX00BznUfwFLgaUAq4NiZRw5fxe7GKrXbjS39QYw
         1bH+EDEDpCT6hXIqlnaqDnsBZTSCM5iL6w9rznlOR7NVyM44Ut+uy6S2KPwtyiO9c9Hi
         lJbigr+aQ5yVXFLdzlLRcMpasZ7RKKRlT9wjcopSPPgItzmqxl9S3NStW+xEKUBzfRtK
         kCAs3TIzVRf2/5dmxOU1kiYEPxLDBysxmFso7pj0T39Ub6qxoNTq7sgaHht/Rj4/XrLT
         N3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hyD+1LRB6yy7pOWx0UFjAn0a+WYqqKiiAK6segs7eFk=;
        fh=LvMxHjvxHWCY37Wvv5rZXsoKbQIiS0ixLlY3/NqocSc=;
        b=b7X29Zf7jcIPsowDSNUaE1/+7NsPtXxVyk5a/Zc8CV+ej0bovC1a4tKHu/AtH28Q/a
         rTv5sbaGvQ9v5JYUyv+RCxL0OzY4QhYfC78sQlWSVf9ARD0lCcjW36vnvzolIUQcRC61
         erAmIKO/89I+9fULd66wT3qDT6CmlG6KpzHSSTvyxlhWhTo6CVOA6gFwIx5t0fYFErmv
         R01oHRhg0AiWwwPbqc1s+jugu/X5scSLEzVsxqI9eoYLQtU7EJELJyM4h41P19rZ7z60
         IVpal5vdNO3N9rprHIEI/GXcf2HBmen8rG1Wetc3KKJ5QXTtoMHWOTulLgbbebOiIt+h
         SmQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771017203; x=1771622003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyD+1LRB6yy7pOWx0UFjAn0a+WYqqKiiAK6segs7eFk=;
        b=qa6bKQcGURD3sOVui3m7e+deDruBEdJQDn4yFQLYZHEyQ4InW1tbzhKuQlieHPOVb4
         W0ipiB3dG+ZMfb+xhZf0SpBznYhbTSMrUPsfxV4KYdetEFwNZ+0upCcaz0nGwf+xS+Op
         KkTNln8MQ7kmbxCy9K5xVx/HXmCMexwlUQVB16GC5JKAsT90J7YSdsXw9/6BfRyg59VT
         pDFOGVpuKuC0AaxbSDyCNmFhKtErWadm8i2zjDgbn9zzlk2QEmkvhPhoV9ksXyEZkfvH
         hzyLtfzxZnHQKdHDtLMx/Ga2k0qWB0fUKhox8M2po9M7E5OcEBZ2V9ZluOobDO77hrtU
         LjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771017203; x=1771622003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hyD+1LRB6yy7pOWx0UFjAn0a+WYqqKiiAK6segs7eFk=;
        b=USePFz53luU5dkLZsap4alh2Ehf9jVcZuh/gSqXhjWDTUX+JmVzMNZWzvEBCidZTs4
         2rbb5kaFTeFNm7ZVGe3xgvyzCHtMnIlGTp96nHnDl/L9Rl9uJzfF50jqIfIa7m6N4SkS
         SHoAkvT+CEXlPDW4NpQXYPGLWHvMdfJM5yovbOZ7nzWmwtM8gLMs01dBVkKFf3U6Zpe3
         +5pEM15RruJqMtE0ylpNsz3nlVaFAxu16brA9VIw/lLRYAQR462yGDQ9eiyqK/tHxB5s
         cuyCPwk+74JrqCdKI9WxpsQ9xAhw1kJh2GwzJ+cmiHU3fWye650qeqbkGROSgMy6ysba
         Qbjg==
X-Forwarded-Encrypted: i=1; AJvYcCWaoN41IklD1++6XSeRo/JCWIpaOjmjECPnVHxmffoHDQjfWhSwTKkc5WCw5ohvPA05nsYZlPXOXa3t5Jv08A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQTwhIco/gsTN4oML6zRb8d/QSvDiDeb+aTdvUO0Y3z35Vd5nv
	8dodNybxldSLE138JuMpkUxKD4Ubct/b141BSaEkR4yqkICL15YMCuQCFLFByLZPCKm+fi+zCAC
	IVgznd34mmHTKOpbthNljOy9dVR07GlSzGKWnYreB
X-Gm-Gg: AZuq6aLJQcQy5sOQWaghIffq0/2V60UNeJblbdBvEhvAKQr668e3Q1cA+dJ5B4pf+MD
	NBlRYfPGwhde4t0K+7Whni6BIaArex1AWJ8AztA3KJ2lrcRPZW3NiGhUMqBUMciLgpNxNyCPla1
	Um/ljJmjACarVQ5EDKmzvYWdH4Wv3BbVkPeDM3JVKFJJm3QIDow5oY/YxlOdWvIzEIIpIDmVafy
	wh+d28NoTJnsBSXNL+UonWOMkgSFNBr0p/Vi2pHVyfpYZ204ytnipTSc7vsdQfrecA6Usp5RXby
	cgxO630DD9h7Q0/8UlBmffixhgueSkfIIZ6bGA==
X-Received: by 2002:a05:6402:380a:b0:65a:1818:3668 with SMTP id
 4fb4d7f45d1cf-65bc7baa98bmr9456a12.10.1771017202476; Fri, 13 Feb 2026
 13:13:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-rust-uid-v1-1-deff4214c766@google.com>
 <DGDPG8TL1IGS.3OVN0KU25D9YA@garyguo.net> <CAG48ez0=4Tw-FKF5VF+MZNj4sCqi3CTnbB5PHqvC4mo=3s3Rvg@mail.gmail.com>
In-Reply-To: <CAG48ez0=4Tw-FKF5VF+MZNj4sCqi3CTnbB5PHqvC4mo=3s3Rvg@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 13 Feb 2026 22:12:46 +0100
X-Gm-Features: AZwV_QhkEYJYzfgcMfa6hzLsa9hsvcdsiYioLhSs3pe2peHvJFddRTdU-9ini9g
Message-ID: <CAG48ez3xGnFSCZdoZiLoOqjTujqYg-9jBN+DzWMmdTyg_RgjJg@mail.gmail.com>
Subject: Re: [PATCH] rust: task: clarify comments on task UID accessors
To: Gary Guo <gary@garyguo.net>, Todd Kjos <tkjos@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 3:43=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> I agree with that; I don't know what that failing test was. (Todd
> would probably know.) My understanding is:
>
> In the current version, the ->sender_euid reported to a transaction's
> recipient is the EUID of the sending process *at the time the
> transaction is received by the recipient*. (This is wrong if the
> sending process changed credentials after sending the transaction, and
> especially dangerous if the sending process went through a setuid
> execution in the meantime.)

Sorry, looks like I didn't read carefully enough when I was writing my
last mail, and I forgot the details since I last really looked at
this...
What I wrote above is wrong.

In current binder (both C and Rust versions), the ->sender_euid
reported to the recipient is the current EUID of the main thread of
the process that opened /dev/binder, recorded at the time the
transaction is sent.

In C binder, I believe there is no check that the thread actually
making the transaction is part of the process that opened /dev/binder;
Rust binder checks for this in get_current_thread().
