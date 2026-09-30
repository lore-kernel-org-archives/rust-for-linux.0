Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839D2318146
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768168; cv=pass; b=XWPYyKwsJvWo+5z87C9fz3VNHXfKadDm/91CEPgG+qnTYpIULQKBiSHioWu70XLRRcmxr8r6fv3VEmGFqL/CyzwDEgMTk2QTr4WR9yzX02NLKWrbIW2AsgSQibI5gC+2uv2i7PzX3q/aeOJ45w9s5Y4EWaAY4l9rxyFsTlfXuVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768168; c=relaxed/simple;
	bh=zF1aZ67Ju5HSyYBd6lp0FvqcV3RgRMD7QVkQns1YJp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXFjd8BAqWADhNhjf5oZAjhvg6SsNwhsb7iNzi2bZnApDFHUUS0QYwwSDJLI72aK3p+eUAu+85Az4OOtpVidGEb0JU4FLz7sNUuD/aPbLws+Sb9FU6rRyupDmBLxjuclTrCecc1vbWBOy5ZLaOiLZ9R+gwya+1ifqdfZ/Rpmdt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+xk2BSC; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+xk2BSC"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e79c06622so561946eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 04:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790768167; cv=none;
        d=google.com; s=arc-20260327;
        b=HbINCnLtj13MI2v0H/IjGWJxrkC6strI+vB4aE3R++ZaLgENG/h6acG4waWfe5vuum
         gR/lcXch76SPQyT/HRIHsHb1qr/8aE+/jbEg0TS4X+GYO/SpvIcxQ8tpWPUWCAXkeprF
         uVA5MCQ4phS+fWIdb1Pn5Fcy23Y85/X4L7C4nt9Bqjv/4+1mwxEsR9uh0QhsI5jn+IFf
         qC/ParRhf7A5wyrXmMXA1xDy2pKhHisK3fJK7dT0cOfKROg9nfTNCEoOHM00NxLYWjs8
         3S/dyrT/GQHzU1KLfh8cNdyLG/4MAGbNK6WnhCKZJ1FPhPqIEX59vI9xq7vnyXOM+dn4
         xPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eoFXCdD1SByAP8/MurFAuievxJCdo/nKRYK4zXMXLi0=;
        fh=xeE4Qk6hS6cJELtO2Vc9rpZaUlnM3CWdDny3A1ggR/4=;
        b=TbG3SwGYWwK4MJWEqv2KHYyxYXG3pdlzkwisWvjwA+tBtl6ezEnvhfFcpldT3oM9FN
         ldOZTeHiN359KrB0xDrbLfzpCN5WBroggZrwW1JBE8ugwsArkiW3HYMCeFJoBIu/nmBV
         GZQpEZ1MV2pxFsq4xYjiHnP8Kzs6uFwgz+AU72+8vqlUbcFHn7Q+V9k4RwdzNoFw6oLT
         xfuhQQDNWNOErzQIwi+9BoDvm0oBhsqWznegAuXOfQum3sa57OVUxRw+96kZ1lAEzLzY
         +HCdP44v7LmmQhYgbDVjjEheLHHlyZ1F8WpYmlky0AHzXGBCal5J+exxk1SLWUDKhZn9
         2+SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768167; x=1791372967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eoFXCdD1SByAP8/MurFAuievxJCdo/nKRYK4zXMXLi0=;
        b=M+xk2BSCTP/CYuGTKUtIj5g6qS1PBAcEDpuQObcHU/pEFazJjA9GiV7cIq5lEssUgu
         0hQBxtL6WUoBqfm3cPm7RqoAeXuqVch1uSBvQij3ChtcNSOKb8zOnoMQPDZG4HdK0Ma/
         TV7zuRx9t7GQQaMZeqjGLGXhmryA3/KzvXwAwSc8kdELLoJ9U4k7cDzuRa5Fl4JFDYB2
         nHf/57mato+23LJZZns/xdi4FfARz8MQDTbiZMMXiH6n2OhePBjBzY1whbeA1YvluNZp
         UMrp9hYERc+dPtpWQRMB/dOKWIJlJI4Y6bFen6cgnq0g2+JkPus8ypBZDqM4tszqQm+i
         daeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768167; x=1791372967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eoFXCdD1SByAP8/MurFAuievxJCdo/nKRYK4zXMXLi0=;
        b=24HdQUdp67KWd/hXOnmKgyJ3ZyIz2pu+Sxx9GgyfXMj34UWtKMCyLEyVPCE96vceSj
         3jQDMH7BNbFcdTj8FqaTnzAzV2uakdsDwTyTGJnDTUa/gYtoY8eQQohw3D3xuwDttgpO
         IYANK0wSeSyztnfq0OXahl1xgRlK061gFS/sWz4Yw/BPmHGQm/4BKD5UBInNABqTi1ev
         zwpZYhoMfxLGphZojPZ6itJ6FtZ5au+RlnUdDoztAWx9jcWJ6lk2szCUdr2ftqi7ow8x
         S36pcP5xm7kiQq5L+0knhW3PREUW19B5IyOrDm82zeifuUMo0itzdGkwBa6J0PLPxujY
         EKhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxepZqG9dnOy4ngdACAMnmiKW3yAoQNY0l+jbdIPd1jn+jTSMj9mwmFBIb0Uxq09JrmRsVw0cGdW5d7nWK8Pg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJZEFKhgeVcIBQYtKdHcgWRe3tQLu/fMGZEto8uRXh5Bv2lNPfs
	HfEvvtn28Fp8+yKh5UCaf+YEsaPJCRkGo7nvxVJRM7b+I/pkpkG9Wp7TY9crlHUC2z29dC5ahRK
	pUlslmfMjSJnn0sFR12Gbot7hPyBK548=
X-Gm-Gg: AYBFou24Ksvyt0Fqr2mFvYsfeZLIF4jn8SsCD8IPZDlIZqT/sLc9dxMr9KDnmFMK3Be
	oSH7E7W7NRcM4pDv/Ck8MTDJ3FLbaSHWK0CM7srV4PCRE+hMN1jCMS3kQssDVPnTa56PAX97v/k
	VYrrSIdGzKML0QTH4BxxxFz/UcvSukNdQF1oFY3BhzalOq7x1PEOihlEtnjHPEkdYSua5OSFvVJ
	DAhGorARAlYpFp9zpTBevWxk+/Jrdi1k+YxulbUi/n3asl4a7z5g+U7GnNmjsUKpSVk5YGAcM3l
	h0bU0M+2c7shdtL7Ed7kuUdHbvzrd689PQmM5s+1XiHEiyQvnO17d1nW+cH9uINwt/aLPMASCtM
	ZVzyvRpvHBTJiGGr3gcDzy94Jq/79dzwaTekOhhSSmmY/YxbvkJiZZLU0Esa0323C4Bumk4a3ET
	/D69FIc5pjpbGc1/woSzDWB6NWoQdtZfSw/mSOLgQA2HEA0G7WyrM=
X-Received: by 2002:a05:7300:4fa9:b0:33e:8552:6e06 with SMTP id
 5a478bee46e88-34cd6003e42mr2202125eec.0.1790768166558; Wed, 30 Sep 2026
 04:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924005052.2805129-1-gary@kernel.org>
In-Reply-To: <20260924005052.2805129-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 13:35:52 +0200
X-Gm-Features: AclHuK_yuuwCg9JinboBNZ8Dm3VmJy-wdX3R3QxVkeuHJ_HWhUIjFv8RJNFLV1g
Message-ID: <CANiq72kpkVJbi8ud=G-HjMmTBv0o-uUuk+qa3LTVjKgKevL7bg@mail.gmail.com>
Subject: Re: [PATCH RESEND] rust: doctest: trim function name for reproducbility
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 2:51=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
>
> Currently rustdoc will generate function names like

Just to clarify, this happens only for Rust < 1.95 since we use
`--remap` which already  it in newer versions -- I will add a note to
the comment, since we can remove this on the next version bump.

But please shout if I am missing something.

Cheers,
Miguel
