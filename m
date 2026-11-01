Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793547279;
	b=0CBrBugKsvq2DRpajqRUYo6xq7HpSYJoNaub6okctXpY93NJHJGTddJR8VGb7wNmYGLG
	 0qnm0WE4RU8SFANEH+PcAhKfU+IuPf/z+ootw1ogq5RofgxMXJQeaPpKgtAIMjKRvp6my
	 2tviNnOiKM1s9WG9bWvmMnFhhlAuHGLz2tpxkw8Rrh9ufDu82l7zK0Oj3y0JkTdhAzF/c
	 +K8U4VP06fie/ZbJA/e0+8SHnF8bKYJxNqL1NNtDRpBoNX9F+aJh1B8/kPcmf0XHN/uDT
	 MjEOMtC/rre1yrRT0PRLcpoSk1qOcBUSvWBAYg+H8yg/zO3JQWjNtKLBu7sMdi+1czg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=psGHhOsIoIp6B+XTiXsNSE0GhyZPqC7AReMe33kXerM=;
	b=IKkT5fq0DG49tgdtrmIvF5lLUWBwmilqe6ecwQedoSQUApCfUhp44xWndYYr/5js0M+6
	 D2ylZXfRRsNxUzICCd9s512wzPof+qUvV0TqjyVr8II5HaFqgUwA+Mbk0UAk+8GhnQATt
	 ZxpNQAxw1tgdrR77X/NJ//4D+a5mVwuPnGv1Ec7jZ/6iw5M0gvbzKD/Sq2+Bx02SYhfCm
	 qB4vzIYXJA9aWRrVf4RYNmyeDdpsyVQM54x9IuJYjpWVKuXvsF4StY1jxJsPdmsPd0jap
	 43SnrgToW1j5g9UCGB0W8Cyt/eINCZe7QIOTyML5wPVUsjzY6Di47ks/b5s9ibFPg4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eYprsY36;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1FB606A324
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Nov 2026 15:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B1FB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eYprsY36
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35159e0092aso242078eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Nov 2026 07:34:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793547279; cv=none;
        d=google.com; s=arc-20260327;
        b=sEZ3B4rUl8BPLO7s3oKdiH5jJLEDrXiLi9deuhCEODJ/jtEdK+5Gb5w4DwcScX1z65
         OBFGZJGkB27JPg6FPZrtbkdioJesy81i2n2NpkUPQTYKKyM10v9HwXCCkEpbaw+n7uV9
         3PsVaPSZxfntCzV8ALBtYQEveC7yDU84ZVJHdcTGnEnmt12pvQy+2PVBgXP90NW1h3K+
         w6ccDpE0zyvF1qG/4Ci3ZCrM2zPKil0AvzOzhpWiHtR2a9hPdUuIcUoEVtG6cPD9Ixrk
         sMYjvWM9h2SkfsgSZ400v+QuWNuT+5EHlNwH+f9WGU3qsPoGJhHDgHvHtalHjnppEDPZ
         2Eag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=psGHhOsIoIp6B+XTiXsNSE0GhyZPqC7AReMe33kXerM=;
        fh=VdxPkElNSG2eqC0jBeE3jCf1zS1iIHtWhG7zcl/kHto=;
        b=sxha7or5hg95HaZsLnJAfbsSQb+AFu3FFXlql0vFGmTkZ7EubFdTZWHT3on9QETvey
         2DCn2AxeOkJaDaf0QWxXowbkcxhxpsyw4Hnzjdi52XxmlbnjOaauub6RV5DyGYiJnV7s
         q32n7JVniMu5+eQN+q9RV+Iep71jy+/nYeMxU8dnLZtrvKbKYSVcNOIjmHWb0ceEzZbx
         boiSW7OW3UDtTj37npvrJ1nwe3iDXJlb2F1CJ1Kic68yswFNd0YZhJ65Z7DmpGdrP3DI
         reBY3R1Cdiu0AsfFD1A+H2yfPuA6D/991OM3y6Cn8zJtZOe+4C7f2nGbtXxOO0l/bISW
         5ZwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547279; x=1794152079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=psGHhOsIoIp6B+XTiXsNSE0GhyZPqC7AReMe33kXerM=;
        b=eYprsY36nXzookYULLHmEke8H5GI5P3RmtqXHxJ1MQ1DResE4YG+f97CLR94tUL66h
         AS7XKPPrNS4wmAtiXLg2oRuR1zRuz3w4vCmGa538IkalFwBWlxeh0y0ie8btlDREU4qp
         N2G4QWT/XGiVxK6bXGk9UJdEt49SaZ35Ael3n5eBzasN/u3WfF44pv8IN8iFIHgC8u8H
         ko+ZjD/B/9wLJnd9F0NjfUm72KWWANIO1r8yMaDMTeWHjA8lALh10/UocLtMR/r4c2f2
         ZLCRPbVaLwo2KBblST2c97RQqYh8L/GYy3q29EOYvLaLhwdwEXF8KlINH0nmtEprlkqD
         uU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547279; x=1794152079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psGHhOsIoIp6B+XTiXsNSE0GhyZPqC7AReMe33kXerM=;
        b=ADN3KvzG7fjHm5pZOV+ajnqk1U66qTtQ6KXC5clua27JpTQP7Zu5LkH2f95xePplTq
         3j37XH2t8Oe/CKqdKrGQigsh1gK3z1+YgNcCJdICZG5hMVP1yxudyrQkhTmzU3RbvyMO
         4A0iT/MxDOVUqKmhEzGU/NKqtahXxQfP0KPt9ogPrEg/qfjT/45HCpqhk+oYXrz30o4F
         zAG2IIgAZ73e9UJR2L3xQp0/me1A7frQV6XiqjwIhkE/k3UHPklS2+SGHN5uPSNEeDf8
         kqZhaDOoQE3b4iZi3ncZD4FT4z5Rvk96MKjYe76r/I7OvJBPZI+fbzgyfgoZBTbCRKfR
         +cQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwG1LVWhoU4jA6uWUxOJSvV1L62hRl3d+G7pu7ZvD1HcLeDS5DiwM3PQUWqb641Qu/A2PXz/RS+aDdw+Vi6LA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJMAlbaM2D5yK6HyQn9GQ5ueOjuYNd8iQJ4k3FVMhM81D9DM9HS
	1mEcd7ttYbUzvfpIhcd363LhnMHKQKqJzcGs5/i8JNwT4u0h3rTIB6lJuANumPuzhQmXkM3KldO
	pz6zRj0OvkWEAMKq/V64PI0oIp+TPTpw=
X-Gm-Gg: AYBFou0VnmJ1+CIk3QOxpm/qg1NoVQCifKqIKIlHKDThOnsPANrKWrsglqMuAGQK4cf
	ppbia4iZJp9AP73SD3yyWob5fhvsCH/BNei2yJUZDuF7RAH2NuN7nfoKtuOAVvro8yVP4C0KmhL
	YRrexTzHztMNU9HWl4IPBANJXOOPwzcr+/uc/1O3NSuErvwTZtRM1wEst0CEOm8cguIRkPytVsb
	6Pw2s/gYozoZBKroeBX7k6yUUk+JtVeQy6ROQ9BlfLq50ZWCnOcjNSXXKSgcR+eJQZKpu2qAK10
	d33xr1YOhHiy0llAVyqDgsOhRx5TvelFWwHCyNkNnMW/AXezQbbWGucH82dKQrdyo91KyQk8dtw
	Mas90j3UF4bSGOeS513p/+CuaGHmnL9T1RXb5X5absPkps2bcinoljnsPn0lwXUvN+yZeSXs+Dn
	7XxXiL28ixLk5ouUvD4+MLk1GNXYylrmln6M7oWl15g5RdW796m8ZMR+uc9BIrXfT2a/nMf0feF
	vTn5G3lrmrD5Qa9towFR2Xw5MYyD534XL/b8lcMfHsQxtxWi2NplUas9g==
X-Received: by 2002:a05:7300:e9d7:10b0:36a:1452:8da9 with SMTP id
 5a478bee46e88-36a4231f759mr20462458eec.1.1793547278227; Sun, 01 Nov 2026
 07:34:38 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <27b58e47-723b-4d67-a1f0-ccb8b0ae66a9@kernel.dk> <20261031152846.746656-1-sashal@kernel.org>
In-Reply-To: <20261031152846.746656-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Nov 2026 16:34:25 +0100
X-Gm-Features: AclHuK9CG-B0tjlQR-Ajve19cMS08Wyi0a0Q-isF9a0uhX3oTI1dOa50vKFtVEI
Message-ID: <CANiq72kK9p_eUwa9BY1pYoidRqsORXhd-YDu3SVpnAmrMQm5gw@mail.gmail.com>
Subject: Re: [PATCH] rust: bindings: derive Zeroable for bindgen's opaque
 array wrappers
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Josef Bacik <josef@toxicpanda.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 4:28=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
>   error[E0277]: the trait bound `bindings::__BindgenOpaqueArray8<[u8; 72]=
>: pin_init::Zeroable` is not satisfied
>     --> rust/kernel/block/mq/tag_set.rs:41:49

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/rust-for-linux/20261030223702.GA1673281@ax1=
62/

Cheers,
Miguel
