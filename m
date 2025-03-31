Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876291FC3
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Mar 2025 00:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743379654; cv=none; b=PIrpKGdk9fJG9aGJrB85Kt+3UgvM014c2nzzuQwzRCq3MzQoxwbWNe4hChtbsBr5Tvyufyr5/QLNeyTiZqzjEKJV8zN/fT8ZNQoMwagjPPtMu9V8fm3QrL4N48Jp0ULU/oacFJgYZ71MnLtDJ3XEQvWGmRND8c1geFxSWhOB9h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743379654; c=relaxed/simple;
	bh=QeWzRvs4mUn70gMMNCejW9cBbyYLrlw+6qM4ca4Tdjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aI7MRvl7yewOGlENjavQYWiX1bP/wl1Uzm7ihw+08V7l6SMq2sxeSuDkC914HjmgDNHFWhdsvhOlfikZ+tVHdDCxjp/feqljmn0chVAnpsuU4VmCpCTY2r4TqOECpjMiCXoN6KLzpH38NAt2pDrV7lDXqk4N9yvup78UYyT6xyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GJYW47SO; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GJYW47SO"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso6126706a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 30 Mar 2025 17:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743379650; x=1743984450; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5WwU3ZZjvC3SjVsCAB3jUkV4LMy/pxS3elhdnZLt7Oc=;
        b=GJYW47SOg9J/ImY7LjFssS1Y1030tmPDi/56epJjpdyAtQUWWpWI30YWTf16l4+e05
         f8xt9+77cSFCw4huqh2BDQB33mWvRQGkl2gofv+LPR13SgZX61WlES1MoOgkUfHXZYH5
         QhYHxiY1udgAf7kR+hKOQc3WPce6J1uYaLvJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743379650; x=1743984450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WwU3ZZjvC3SjVsCAB3jUkV4LMy/pxS3elhdnZLt7Oc=;
        b=uPddSyENcZMH7JvfSazlePemuCOuGGyH6NIeLnHd0a3XEb/xR0TcJc0p9wvxw66o1A
         76FzkXxzpwDO2f2+HHffwP0ony+oratHFZj2VvAwRpo70bPrygceRYdtr69+aurxIkX5
         3edrjS0/4RTsvQM04PBLHVVfKywK98X+968LcQzHxH/RQQtrT9aXikJXehxeVcXnqobQ
         HVmeyEG9jqMkhnIQeBHnvkrJ0L39gH1oLMPtY5Dacu5Ooct1xQJ1+P7eHur/zCt4p8Y+
         YuktHlFKtfSLOoOpfSFXobQrDcl5gKh5Z52mj1Q8WeJvmqQBWu2n7LCLuIxn2IMbse8o
         Aumg==
X-Forwarded-Encrypted: i=1; AJvYcCW+CK0K3MpPoXMVqB1dxb4OpNieuQcY+J0AdrggbIGPDICLwusZxwE2zhIqIjbxi2HW+HkNeVJdPwenaQUAoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye9pQBrp6fA80UQpIiwtdecfPrLn4mnJ+yRKE7Mz/TSlnanFSg
	dGruc8lKxzaM60WRUoIgrIvjJVF0ZGiKYANez7dWzuEHXJe5E+uSKfRdi9CiO7XXxFoRjYd8pPK
	M3No=
X-Gm-Gg: ASbGncuVVZqrnXwdwzZRQJaS8DFkX/FOGbpDa0ULOKhN2C6VkzaLyg2dZLoQXpkYK5e
	b0iRcCv86zWYFVm1kx+ccV6XWUeblUWmb2VuaUavyvb036rYO36gavrqmf+4L26KX9KVfibQPs9
	XCz0+ipie6OlWsopY1OVfqoEkIJGqNXMpjsLcHWq0zc9YmHqfGJ3qWKZ2sGmz7v1y637f6XUxR+
	JT7QQUYF2+CaZ6xaOTQPFl4JWqqCr32CUaJBes1qze6wC2bEJxq0r9ox2GX9K4uc3XPcaEeumUT
	Z4vPdb1nqEQCwbw/Rn56ZmYUcrpAJ+r9y7RHcnSK3IKOqNrlqNOqOIfL7Yw3x7xp6PJht2dpu5C
	rafWMR6RgQKYCfPW7zz0=
X-Google-Smtp-Source: AGHT+IEd0R7krq3Qg2Iu6eShZIX7CIBK3Q7ILP/S/lZyT85nvUPLyGfsxonkk0UQ9xxwI4nKTazeSQ==
X-Received: by 2002:a17:907:7f0d:b0:ac7:150b:57b2 with SMTP id a640c23a62f3a-ac738b61acfmr571060366b.41.1743379650470;
        Sun, 30 Mar 2025 17:07:30 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71922c0c5sm539855466b.9.2025.03.30.17.07.29
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 17:07:29 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso6126675a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 30 Mar 2025 17:07:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzmj89CRkwA8XKJjIoJLThLKqevIsophYkb8mLliFSxNQ/iyodX6ollEmJ0HcEZOTwt19cSx9149f8MENJCA==@vger.kernel.org
X-Received: by 2002:a17:907:6092:b0:ac3:c7c6:3c97 with SMTP id
 a640c23a62f3a-ac7385ec8dcmr643913266b.0.1743379649049; Sun, 30 Mar 2025
 17:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330170535.546869-1-ojeda@kernel.org>
In-Reply-To: <20250330170535.546869-1-ojeda@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 30 Mar 2025 17:07:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjpDpK0cd=tBk2t005nrddL0hXRQ+h+iZPHfVsi6qQY+w@mail.gmail.com>
X-Gm-Features: AQ5f1Jr4MnCw1Ik4xYg0StGcIJ_tUfwA7pQAW0iRnq6hvBG4t9EoTLGk-5o8sIQ
Message-ID: <CAHk-=wjpDpK0cd=tBk2t005nrddL0hXRQ+h+iZPHfVsi6qQY+w@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for 6.15
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 30 Mar 2025 at 10:07, Miguel Ojeda <ojeda@kernel.org> wrote:
>
> The second is that there are non-trivial conflicts, in particular a
> semantic conflict.

Thanks. I decided to try to do the merge on my own, but failed. I came
close, but it was good to have your example merge to see what I got
wrong.

The pin_init becoming a crate of its own, but 'pin::Pin' being in the
core crate ended up messing with my "monkey see, monkey do" approach
to Rust merges.

I'll learn eventually, in the meantime please do continue to give me
example merges and I'll use them as training wheels.

               Linus
