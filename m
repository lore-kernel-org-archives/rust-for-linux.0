Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFE83DDDA0
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Sep 2026 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508445; cv=pass; b=BVD8RmLu/s+OebRgd5HWTqp0EJoW0b5JOvWWIL8tr5VarI5m0M7nwceXGX/LaEbVu9VKn0Fh8azdemupEJw9hByiPY4W1Gs98UynuTzRaOtix8EkdZhaHf+cjkN+P6w/hnNi7YhTOyHvyza/jIxnzw8c4/uuWYo1q6Tcu1skEJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508445; c=relaxed/simple;
	bh=wcvjg+AYhNTqXh7GWpJ5CTmwV5GIrw6stmgUibgREwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRQsTEfYjcRQvuJI4unoiZhp2UemdQ90vXEfPa5R7JB4NfdsCwYacjskPQzr4qqPMNHw9ZsEj8UNCJgGNloCvOThsf6+qyl2S8NQnkfZnpCudHf1gBQmhvxdsf8dUU/QepqmftsS78yyhTW+loaIcNjKGg2WnZ7BpBhxAXKCk8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5Ha0LCa; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5Ha0LCa"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0d31034so69940e87.2
        for <rust-for-linux@vger.kernel.org>; Fri, 04 Sep 2026 00:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788508440; cv=none;
        d=google.com; s=arc-20260327;
        b=Nx0mtLosxpWEr58fMI3XiaAa3QOtDOsXY3uD28e5BJKSLSIG6GSktNcIr/G/rlNH4a
         Ip2FghHHv7QcqpcaXaofOtAMTuDRp/dSD9aXCJf9F/99yzo2hQINrLYBO7gtORiOfbn4
         C5Gqr9vScr2JmyEyYx38neDQIr1s9k29aVOggNGMRcfw989zvjH4Tglqq33JeqQmBjxD
         nRHMz2ydWbmtviOCh7PCqGLSZNu3Rj53Io+YNsL6ZOhJN8T7b5MedQB1V5u0HW5HJXg7
         yEoCa4tKOE2MafrSwNckNFzsQFowtlYwJ7Gx2lq2JeWkNQplXZQbHC+kj6O0EN5Mrtx9
         vfgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=owvm6o4N7RgrNbsjjtTXPv1xxL39SmJXwndV799foiA=;
        fh=ibPnQPnZQzMi/Ta8Zptj9Fgx/ZIKqxccS7WI2UITheI=;
        b=RdQeNQBJiOmb8SG5tirMGq/KYDdUwlw2/32KZcV8MSxjtYm6aB2TtSTI44/gP+8Wks
         +OGPbqyMkh9c4Dv6yjh8tD9Z8f/hpNkFSTmqahzEh6sRvQ45sPj5IQF+b4ImCzCiyWNA
         G6+LhZJfUy+ZZFm3AdabuMkCS1bNmJs1yu4B3Tfxc4quZmKUnCjH9cmZkiU3lDMXXKDR
         VcVjVwjxqD2Yq0FIqz/PR+0cxqCkzoA9UVw3ygGcwnGFRfbMecQhFcyTlxZ/s67oxnlj
         Wssvy48xwMXz39eXwjGjWKf+0c/r53dFaeouDHMSVcFHDKc0HPypn3W5ilDCF3UmclhW
         6+JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788508440; x=1789113240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=owvm6o4N7RgrNbsjjtTXPv1xxL39SmJXwndV799foiA=;
        b=O5Ha0LCaibk7BsN2nnHRyBzDMoqbeVXj5KTG3iJa5bLBX1zaE7CCw+7tqynZbCad1C
         zKk0wGe2lGm9v7jlCPvKyWM7DIbuJ1lWAfC07Q73g05JniSSHS2XEqh3addsSD/ILEK4
         e0LNEJ0jiwUU8cOl64RzGGsQni7ST0veQEpKsSbA70F+vL7l2CckfG2epzWIcVATwYjx
         8/EFEfd+k0fEhbeiqJJ/QsnK15T78IuYMNTypbfI36ymH+jULsqyiBHiDHX6qNKrHoPC
         jwc+xryBwpXHFzhXMtKiBbqmvcDQQTMvlQPnL9vTOOvVYdVZa/KILsRPvvQnAnNp/tqF
         I60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508440; x=1789113240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owvm6o4N7RgrNbsjjtTXPv1xxL39SmJXwndV799foiA=;
        b=YalTv8hm2s1F8NGsNgBG5jLgRwc9iqe8tKnXww2ufiRIQIrftgrRcfimVp4Ip5lJVJ
         qE5R5F6B//w0xi3O4tVYllPZLsf9GqjvZDEb+/aXwa7pgoChAXNqsOaXn6oHoNsC2sNi
         X1nkUICTK8Hanmow1ZpTCyMfKdKN5H0X7FtsaSrS3wpjxMrW9u3ui7R7dtYAPK/cIS0o
         YHRbAcYV8jY50+y9xDffgfko6iJDhsBOjTLUQ9/pdiD/Od36D0ZOSmAC/ysy3fyoWWoK
         d0qxsLZZOKXR9G2IbFkGfFiSRFtJa/afXyV5QAbrDDtgKx7G+G+vCBysKj0GFGCUHJMC
         9iGg==
X-Forwarded-Encrypted: i=1; AKwUvBwQtAe/XK9XpWenAquWDPotN3sFj5BQrKNUqyT5b50J3lBfONY/TP8lqwcms6Y2UpgNgVuvFdwLKd3BeXuhSg==@vger.kernel.org
X-Gm-Message-State: AFuF++kzysb9e1yb9L2CnSKuVHsP8sY2wMqJn2y2KFyX4e+ozUlzrnue
	R2xYSBBwcDedLiWC/Qs3gETJrZ6Dl5pLbC2HMB/Jf8jSnS1YBz2Bj4K3tPgTzbxPBqOc80zfKbe
	Ze/+tDxC20LLFcFhOdJOvXVgh61TIIcs=
X-Gm-Gg: AYBFou0wxb5yXKf8O/c7GBg6iy4y1Q8gr4zvsN2CbRD7rXaZPhK+H4PeK5ejqaHMPfm
	z7/naVwiGXnH5utxUa+kTC2AZHV/xK7e6TXGvIYDi7wXsLOBv/dd2ru8pysOo1rno6Hj1pUI0AU
	+Xvd1BF/03F1o215EFQ59rrpTNP2wAWe8lyovBR2IcgfOd9r7T9m0hHNacNQ8BmoQcc1olPjpVn
	cyyyfoamJsRclMV1sLmEAKC/g/uq5cutFQmRO3Rh2mzRxgN2usbdXH3sT7zMU6vFWaaNoQsP1Lu
	YDxf11KGfXffkhBc0WY1noUAGTTK2kA/EczRiHAjDW1MDnz62AM5Zd8uFBYaTTGNAamDz6BjRLu
	yeqrz9AEu3gpGq6PommYGD3iZcz6+l7Jl3vQZDrB8kbDgn3Sk2K4NTx2YPMHiL176KYwvYsU=
X-Received: by 2002:a05:6512:4027:b0:5b6:4b2:c408 with SMTP id
 2adb3069b0e04-5b61707fca1mr702903e87.6.1788508439773; Fri, 04 Sep 2026
 00:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902150353.23666-1-ojeda@kernel.org>
In-Reply-To: <20260902150353.23666-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 09:53:39 +0200
X-Gm-Features: AcwNN1VBz_mYbTOURWZnSU-eJEinL5edJeBG0q2HqJ5Fc-4KupKLS4ugizaXgSI
Message-ID: <CANiq72knf0aMUjLzmDFf96RV5yE9PjQSgVQgeUX1LQ8SsU5_Dw@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: add intrinsics to fix Rust 1.100.0 builds
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 5:04=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> I sent a PR to upstream Rust to make the methods simply `#[inline]`
> instead, and it seems like it will be merged, so we can most likely
> skip this workaround:
>
>   https://github.com/rust-lang/rust/pull/162191

The PR has been merged for Rust 1.100.0, so no patch needed.

Cheers,
Miguel
