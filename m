Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0DC175D50
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 09:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732093393; cv=none; b=orY8zlCiHt16oeu+SzPw5RbEdJ7/ZHl6O1MrVpL4CD1SVxwmRMjaP0bsWYV60O2ejhtL2IOrD0WbuLwzOLkFelimXmpfDM3MVoXW/V4kEqqLID9SiBgkEYG2rb7ZsmSHUYUsc9ecmFGxHbM1e4WyV+S0MoVVLNbC1OzXdxFMg3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732093393; c=relaxed/simple;
	bh=LF2Yw+qgLiPQx+Dzoq2k5DqLTgvQYbX6B29yUUAxumo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZEz3PwxNXBdu0f9C+WIp+HPCsikjA3KqK1CzXfwZETan87AfOqXYrQguH9HKKyx4GOhs1db6DIncfhm+lq1asz1Dn8Vki06R0pcRBZ6bXkPaaLQTcra3bApu6DIRHB5tRj0ndBIl4RilLeL2GBnKV0FnqUP3Yb3YuA1DemsuL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fvcpO/+E; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fvcpO/+E"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43158625112so38409175e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 01:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732093390; x=1732698190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LF2Yw+qgLiPQx+Dzoq2k5DqLTgvQYbX6B29yUUAxumo=;
        b=fvcpO/+E81EIL7QVeeQGdEhNbadM75vOXHh22sQjCBqasIp4dhnaQIvO9Su0+FNULQ
         0lD7mrOQIwzMcX5OOs6XZBX97COZJVcSFt3HG5Pg6MI4m85zcLpoJZ6SLutAiSHh6WkG
         MXZ5OGqCKWJ8mcZNmKzlcfnaI5SRDbGLIk4q7JiiV1JmOiGOvGtGULgm0QjfcjP5u7FD
         tulUUj2tJ14XlZCUsI3PqpkpVUlHm9ZqXRR2EyXlx4y6yCeeDwrNCTuolUzVZTCnZzhk
         zFr9+q0ZkVwUcqtAbbi6WJPNMb/id+wQjB1pvDRguB8R/nNqM9Eu7nTZfvbzA1Asvo1E
         wcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732093390; x=1732698190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LF2Yw+qgLiPQx+Dzoq2k5DqLTgvQYbX6B29yUUAxumo=;
        b=K1vXlGdbHw3Mzs1DGPQU8CWEcfSgisuFohPDbibfIIoZi0rrwa1vkRAV+zy8oBHOta
         2rL0tYWqLfSkO6knd+D9l/Eo5IFvZmkT2R3gVC3RlNWvMkZnWstnLsQjgnZR4HXjrpeY
         k0rQrH3/cjDTcxItqxuSRvUrHOy6ozWIbBi6+GuphbKxElF2qbmC9gw6xu6lmvav+e8/
         ZV8E8vD//y35CEwP4cEtjxDERg10Lo3jTA7yq9POUA1iIJ2t+BSIlvcvK1qiVzUbHyS4
         Ge/Krt/99ZZpYZn249zGsCd7cF2SKTcSjXYUYOGEJg2JQcPjOLQUhxN4RVc67pEVPabn
         lhUw==
X-Forwarded-Encrypted: i=1; AJvYcCU3jpvPaRAxft96264eC+9C9Ew0gjGp/AMQ8u3BavrLcDZHydR5ifZxDLtzfdT2LxRStYsdc0gXdl/DXH5m0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpS/4Clqv5AckzR3jATY+MPlmw+4n6haw7tjsqvMPK56paEbyc
	3ICluV7JlT4xkSZ0Bsx0N+iTHbugfO3Ny1JYIWvlWW7A4xZN6iDxLJ+FRuey43RIBglZFUv+46Z
	rafBonFde3o/0QKDdUjH4oyFXKMhTIArx5d5T
X-Google-Smtp-Source: AGHT+IEakA0rhDR08VT2hzJm/iJJ+AnHGCptMMP5jBu7+/57uyd+4iEVRJjaFwQChqnGRXIeBWF7wXo8Kp0MIarEagQ=
X-Received: by 2002:a05:600c:4e16:b0:431:57e5:b251 with SMTP id
 5b1f17b1804b1-4334f02a9femr13544135e9.28.1732093389022; Wed, 20 Nov 2024
 01:03:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119192715.38282-1-daniel@sedlak.dev> <20241119192715.38282-3-daniel@sedlak.dev>
In-Reply-To: <20241119192715.38282-3-daniel@sedlak.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 20 Nov 2024 10:02:57 +0100
Message-ID: <CAH5fLgjpS+a24HKYvfA3cEtBAB=D3vF+yuMK07UJVaki9E78ng@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rust: kernel: rbtree: remove unwrap in asserts
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 8:36=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> w=
rote:
>
> Remove `uwnrap` in asserts and replace it with `Option::Some`

typo: unwrap

> matching. By doing it this way, the examples is more

typo: is -> are

> -/// use kernel::{alloc::flags, rbtree::RBTree};
> +/// use kernel::{alloc::flags, rbtree::{RBTree, RBTreeNode}};

What's up with this change? Is the example broken?

Alice
