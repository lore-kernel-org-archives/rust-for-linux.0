Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6CF394463
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621330; cv=pass; b=kZf0eSXB7P1D3XrYDS5OeDzwGFp/psxPqsPt1D9zh+s6GZFUCDbBn6AA7+bgQ6qhhAKBTVZz4zG3X9+Rhc6cNNO1uOmz81amQlaypjeVeKFBN6TajwZbDKqwa73jyEuc+HNeNSOMwxz29IXEMqLV/Aq6/pqZO880IEFYdG4wWKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621330; c=relaxed/simple;
	bh=KTDK3vOxt1fIVdHhRs3HNHtD5rFi66H7oz+TrzUybAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTMBgq/lScUklGL6ex3mpQL9Ptt33CGqBXDsLIp5RXILeu7dz1W/isVSIbREPzQbbyuJXSlf4savevzTOAdZ+6rXBYTujs7HmUz20VsxEJWq1kSfSUaH06EzDRsNjMChBFLi1OYaZ7h/3fm7VXvu6UAVRZscryK7xPf5Xwd8P70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ID41B3kO; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ID41B3kO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso18949075e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 07:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774621327; cv=none;
        d=google.com; s=arc-20240605;
        b=MEyCMvM+INJj3lRxuXldJE0SvU+hHpdrQ32NjzeGAMDKmNgTSPpfu4GXavOrG/E813
         Z71GKOegZcn6WJ3NjcvyXaAeTb6Me3v7CbScOhRJfkIa4zZu5m0YOrq64nkeDHooj59t
         VzNcwzSbeaRAscG3kmqbfJh+41jnLkz/Aw7EwhpLYa6tfmCBkT0XvuKKcSK8v5YMYsDr
         lW/DHeVm91Gyw1OSrG+qxodRiAkWgOzqqzkb22gog4oCVezw1SirDO2dtq11Et8Knr9f
         1IksaDA3LYiSQmzBkHKJk4ka3NA4GBW5UagoRlIzL0RK4zr9V+gXn9ECXiesULnnFIS4
         hCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ms382mXmeMfyEZXo+JDpLmvuZwZ5tlyqI074nqlFpZI=;
        fh=QnnAqTuexOIgmtxCCuQrqo7UEdFgid3sa5md6y5m4l8=;
        b=J0saqay75kYDpHr6vGkL/24r5xRQlFNmclxQHY2RhufYv6NnBogTydwU/gjaOFo9KZ
         VYakBFNW9PgiINtBUjwd6aA3qZsSqk6gl+pWb80LZq56EXyx2uwmBVXPa+w4zuXNV28f
         CutN1vZJubHkwpGtI0DyeS7YDZqvq1pTQQvHlMcZ5VIHyqt5r1QPcjnbbHwOjGMuMO3I
         Xb8mDXmS3bW+yn5vaO5iijnSgNvcrYAckYnyjl6kJ8861qXa/jqf38yF3th6M7Hab/LH
         zdjCfdxX45KjbX5gaUbyNrB5rebjjxVv0Q6ix5p0PEymzBB3vM4bPOoIc5ZqFI/UXzEX
         3Plg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774621327; x=1775226127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ms382mXmeMfyEZXo+JDpLmvuZwZ5tlyqI074nqlFpZI=;
        b=ID41B3kOeFeMQf6qz/FF7kGQvO9qo9l1SDlO2Hs/teWIpjaa68X4pXuzQaSFe80yGy
         dZ5ZXKzqbZyFKx/32kPuei4PrzJ/xUqRAKHlezgiEfbEhZV7sbljVBNYafTUJ6U/jD/C
         KeyZNqycrLT0xHJYsQx+XDNPW1mytftFmTasne8vb9pC2/9sKj6Hur52fAn0ugDbTIOP
         MPajGDu/f8j+9wKwCT29dVsD8t7akE56tdEIPRqcIQSzS3B0zlZElbb4BUyuNxKYDPAT
         En6wgibJHr8IL8+CBWpiEBgV1WcYYklfOliek5xF0Hd7PNSjAMwn2UVDVqXZqbJoX7NV
         jhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774621327; x=1775226127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ms382mXmeMfyEZXo+JDpLmvuZwZ5tlyqI074nqlFpZI=;
        b=OKcEND3HhUD7nU1PCAo6cIpuRNfVKCiFa9lPGzI6Bsa+l0jstf/3v0LM8q4F1ZbHcA
         ipBF/ljCar3rqisIIns/5JH9j5aVXEgS+We/1CUL8hLB5PVd/EMk0+IZ7tU1EgoqsWFj
         DLA0Uim9uq/pF5qoqhy/uFqrHFH0bUxrfVfWWZDpW66duYcuS93WOQfDSKyeMX+/mISu
         5LNjJWfLn/vaCcgLdTExTqLNlbHzoVhYqaDIgf7CnGo+LoacQv4ZMuGf0Ylklky8iXDU
         DvwamHMtQSbS4+McMWAuaXY3+9Gf+/1NMyDewB1hL2Hy4YM5hCOA83A9G8XV2um/RICs
         BZkw==
X-Forwarded-Encrypted: i=1; AJvYcCXNdNLa+jKfdG5XnSJkJVTc4TH0oIQBIhTr5cfekcsUzy0VZ0BeTQGc+uIHqHyHzMnk+giPPCDdO6qX8KbIlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ZFZxRugewiNcZzUreQfmAEaZMZUoIxehTn0t3qk5PD8M85tw
	27veJgoJJUZ7fvvjqXuLOsTeXpp3FlXmd2Q4eQOfouXWOvPOuNgwJbN6DNqMLWbkl+URW7VIU2i
	jdxGks44DCJmIEqtU6PuyzaqZ8FO36ls=
X-Gm-Gg: ATEYQzzIz5rknynWH8HKY9IRjFGjDXjLx1KabGbUIe49QiGXnDuwjPrFmcaVP1vCBaf
	3dSf4OvslBTDaYhUCRRxbJ7kUIEmtbn+cM73HUZwntdfqiCyGqnbEJ7PxZDWhdcZav0L2E/3orm
	Qj1LdvmGLOGuywxECu+BfpRkmCQeHDTMUgXH3O6SKaEVuS84QXOZlmX1/sCRrQnuKXa8rjpJl6l
	V/8p+bufpaxMq4BAkojXMAPGt7mQgGH3ejwL6rr0eYMQpv7ySfMGguJh/jOVXNNgxzoizyc2ubV
	IECxY+E2wnZTFUk9WxyrSvgPOUyHozd5hnS104tHbFmQdxHGwDfxqnILj2o3ERdLDETUj6ODse5
	961mrJSe/81RFSm/Zr7Aczcm8dg==
X-Received: by 2002:a05:600c:4f91:b0:486:f634:ef1 with SMTP id
 5b1f17b1804b1-48727eda549mr46648885e9.17.1774621327165; Fri, 27 Mar 2026
 07:22:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327114741.91500-1-pilgrimtao@gmail.com> <20260327114741.91500-2-pilgrimtao@gmail.com>
In-Reply-To: <20260327114741.91500-2-pilgrimtao@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 27 Mar 2026 07:21:56 -0700
X-Gm-Features: AQROBzBIPfZAUsMrDB7LBzUtbbmaH79IMxVvd9bzKdqKC91ZGulsOHpJpWVa3Bc
Message-ID: <CAADnVQJizm+Y8_AE0rjJnBCrvNc+ThiWdbc-ZuUZqYTLtf=MOA@mail.gmail.com>
Subject: Re: [RFC 1/2] block: Introduce the UFQ I/O scheduler
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, pjw@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alex Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	tmgross@umich.edu, Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-block@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 4:49=E2=80=AFAM Chengkaitao <pilgrimtao@gmail.com> =
wrote:
>
> +
> +__bpf_kfunc bool bpf_request_put(struct request *rq)
> +{
> +       if (req_ref_put_and_test(rq))
> +               return false;
> +
> +       return true;
> +}

...

> +BTF_ID_FLAGS(func, bpf_request_put)

I bet you knew this is not safe and despite that you still
decided to hack it this way.
This corner cutting is a red flag for this patchset and
your link list patches.
Since you got caught doing this you need to prove much harder
that you know what you're doing and there are no other safety issues.
