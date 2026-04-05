Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942022D97A6
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Apr 2026 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417496; cv=pass; b=JcvZjJW06+lz2ZARIFPnJ1ALUR5e1k5xra5x+u3UctCwx01jTK4ML1u8fcZLzWeolGCf4km7gPeTXiyNlT4YqiYuSdKLhDwLDJt6c6L00qui1At4XgUyggi5AvIL/ima3FA97grSJaZunaYqmT8Vcy7cpem/Z8QGUpVXd/KMxF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417496; c=relaxed/simple;
	bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHa1jc3KXbXCVu5JIKhbKvDuo2/luW33/j8SQSDeG4+ZLetJBJWM3V1gcvp3ZBmwgNvsC+qlLWBaKKtiacRv6IAyiTCY/jSVDND0BvWVUBRhiDiHkABlba0UGpaz600JyjIOdvcZ1gCnI+qQavNp1g55KtiL5+QuUQKZ/1N2RWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVCEwxRe; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVCEwxRe"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c6f5574d07so156303eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Apr 2026 12:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417495; cv=none;
        d=google.com; s=arc-20240605;
        b=FgMeJ3hmcbgcwHInNdiFu11VieAf8MbV4c3zMVRJa87V032JnLFb2EaDboMAGpymF0
         LJLEU5NQUVuY7FO/DKB6RqskLVexazp75+2wPjb0DzGRIoOgwiowSkT/1s8sb/Klarlb
         KzkijjJ05LTcFrpphvhLOnTbeXNeSnkGzzDtZnS3E0E2WRIQxwKWIGSTSBE3+AMrsLZm
         8qp5KzFdJRNqhynBx7CXk7vH9If72X8EKdZsyOLw42qNhyBDAguYl9sYlAQzTv3nNAxH
         LoWoC0ri+jgUpLB0VwHAc3xGPJWgRKr4bYnjvN0slzIaFRnWcSMQPhavrEkz4oLJkz9n
         kCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        fh=kfcYIkmc6ot5r1ajqoYMbkqUHatnGw3kuoYrZ+ZGQPE=;
        b=gNlYOBJjsXVUEOUTBW2sy/qp1VmqDoUU/kOHCLp6n0qdaf/OXO4R9orbrcEk9Qtg0L
         Xgq+1sdW6KkgMyRJxRgNbOiHQ2GX3c+RztCsOp1eaaBOTJ4IB67xJo9Ljj2UL4q2yngd
         yzH4aAiQom/Roi05IICDISYT0vusQI4noKJT3T2SVk/k5ewvtIy6YAsBEzJul0D8uH8D
         rMWhvvCJkGXQKKC2AA6DvO8wFDnl1VWmpLvoX9AYSLSh5CqMWGr7O2RYmIhjOszxarTv
         FMFYiqS2CGICbUiqOldjVrCWra+KbpTlKrn+d1JdEiwmwuRwMEtZ0svTTfvajAhCv0wB
         Naqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417495; x=1776022295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        b=lVCEwxReXi9mN7cmASayUr5PgOSdAvJhNeYBKcnYoLBzpIgT0TuwJ/Jk3k0JnGksn9
         LPLA3K3hqKAwZ1+Gu0W8fbUQE7/Wf/eIofzPngWRiYCxfRQ15HFeQRREpXcs19Fk93cS
         AtImrKZrFpPYme34oYo9XVkw75r/UkbvOYlYg1wBNtM3FO5qvq/+NCimsomC8oVNMQhG
         HJ4hnag0EWFRXm2UKFVOIWvh0vo0JDsJ36HGzINS6PP6/p0hnFvfoxrEyp/yKoUdQ2S1
         2aCnEvsZed/qapAswjf3R0CCMMgGqiQy+yh4skj1F+RIiBGvxzcCT1hKH5CAfAiCX/cX
         XvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417495; x=1776022295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        b=rSew34Z58OSilJ75coue5pBl3S/Eiw5aKnDC8g/BWVSZzM6VzEMyN5s0LuqIs31A1h
         Ntcv0suHoxOJrCZIdu1Jer/MkSnGhaksZjYYkvR2syW9kadqFy8I8UGsQKbZF60yi34F
         ax4GRozFJwVFiLzBltCHulLx/1M7yqLgPj+mI2t1Qd4c4h8I74qRFzRc6Yb2vdrXdKHk
         FZzOrxRrezDha82uU8rjrUNeeS+wGrOaEisFJoa7gODzvgh9SswdBbPxdv2cW7LMF48L
         NurR0IiwcwDwmazNi4z/ysr/bUV9e/KL8btYRSecyULKn3P+4wYyhANm9Rgy0cBaGjXj
         92Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUUpyTOdoknyrojUhg2DZrOHtJYo4wmlaLGDcGKX7HS2GLk0beLD2jZKGGBcyfieh/UHnh7hdzw4lKSMadZ1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc7Sjp4Fj/jRn29QiT+lncrp21SM0L45VaaBP6Y1+Huk21286A
	kcU6dH+fJ3jcNHUn2DvMGb+5j8tryCt20fSTgIxX7CDTVozg6lJ7Gq8fpIE4d7rJ175CjCwV3E1
	0Xr6Lcc8no0ZoZUI04mOzLWM0cuYD3Ok=
X-Gm-Gg: AeBDietwS5xeouRSg1KJAVlRMQJf3NjTkY2q1BRhMqNRUQ5LE+Up6sndNqm8lLx++/O
	8BO+nF+7icJHjjIjQeyJEqSM8gilQvzPE5DYjbBkI0XXKuxR6QnKlRbUGTyYoBCCtXh/jjcHFN5
	WYOR5GBBS/0+Vu6qyISIcAZD+1JAF8//9b7ua3OXNxBJqtmWkjo2HsaPVNLcaCd3NMrblb6S40J
	YN3X5jRDMrBSOhnOd8iXeaWMmZG0aXQICLAmtCM5VFUkFRvk5rd1VZTl9dYl3JX3+GpI+NYmgMV
	cyHeTn6bkhV6eqy9sPY104I9ZyzGhHvsy0K6E931LBK3Q9Bdgpkg/+dtDNGjCptrwE0JqSJE83t
	j66YMrijH3zvTZXHA7IPV1JQ=
X-Received: by 2002:a05:7300:aa8d:b0:2cb:cc20:1771 with SMTP id
 5a478bee46e88-2cbfdb8142amr2476120eec.7.1775417494698; Sun, 05 Apr 2026
 12:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-12-ojeda@kernel.org>
 <177508434445.73816.7873322235592463050.b4-review@b4>
In-Reply-To: <177508434445.73816.7873322235592463050.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:22 +0200
X-Gm-Features: AQROBzAFcfOg6EKctMXZNeC0mwP27xs6Xk4PYTGLQOlXdHdfwi1d9GtE-fAbfxA
Message-ID: <CANiq72k1U0JacHf9rEVhOMmeZ4szCPBhbfLxC1K_0a0cQPw6HA@mail.gmail.com>
Subject: Re: [PATCH 11/33] rust: alloc: simplify with `NonNull::add()` now
 that it is stable
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:00=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> This description is inconsistent with the previous one which had
> citations for both the feature (function in this case) and the feature
> in which it became stable (available in this case). I don't prefer
> either style in particular, just that things are consistent.

Sure, I added a couple references. I think it is good to be consistent
(well, at least within a patch series, but I wouldn't say no to more
information even if it is inconsistent sometimes, especially across
different patch series, since everyone writes messages a bit
differently...).

Cheers,
Miguel
