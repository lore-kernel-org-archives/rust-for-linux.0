Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820ED3D1CC6
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508114; cv=pass; b=B3WsbeznNzWyff/w5Fv5Ug3qRTiToxaLIJjzQ4ME4zNSXGPWIMyrVtdMgvlG0y4re3m6N4F/oxnGg6g+fABA7GH996TXZzcx1oLunQ5JCjzg8JxQFeA+Nc7Mxk/tPURHDXYAJBT0LQxBLU2toDfeCJBEQ1ZnAWyFcjwuYkO9s40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508114; c=relaxed/simple;
	bh=JlzNS0esmZdzUsLyJazA2D92smlaeRYfegVIPLN8YKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VAN3R0VzNEJ2JqvUBkNj+RzMVpJb+4kszTfhjyGahqjwEGWTkRlzZIJA28KYhH7NK0I9MOC9v9uIY191lpnsphhxN1dkIcYaLtdKW2TdwJIq5nCPFicbeueXXpFv9y75DKWpn2FUK7Rl0S/ZdDZEH+BYYzFwRcv9htsURC6FBao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9hw6vnN; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9hw6vnN"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38115bbb83dso66847a91.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 03:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783508099; cv=none;
        d=google.com; s=arc-20260327;
        b=s3b75zoIWWvDtm7FnfvHHifyh2OJkhuZ6r513qig7i8Y4QXPYnNzQ8vsnt4iDc3Ik2
         9GBzgpgg39Jv8uJ6+MetrIhmwvAkzhjfYQVyw51e6LKz70wQMigXKtAC3GAXpX9lHvj6
         LzE2npkanILHwApEcTbPHmT7YJFi3VevyyEqYj0csUmxeUFufMESyvNhbEQYz50l8TCh
         4P5xqES3gilWOgKYgeiuvXINussuFivOuFpF3zplGcPg4+wBhbgVNH7LWlaxDDa/hB/T
         s0UYvhotNsGuB49XEIzT/aEGx63hKWesmzfDdDqvMattcqrnVar3cE71rPpzCtfNRcZJ
         re9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5XtzFmugVbIMu8031SSPHHiS7JIyWhVoU+hgD0OOMJM=;
        fh=wOQ0kr1QYWlvyCXCQfJbsEo8KDqq5hiABVipTvExIUU=;
        b=AUc3vuN0vJ6oHAzMjHZRL8LpwChmn5D9KMn9sYEbtdRv6WQCKwiXNg1d0cBzO607Px
         JSz9o3ZIcLiU6k5muU359Tm01uYpWsBbvHEcUl9kSdJymWZ59S+vcr94fYMaljjspVMw
         OGMz0ci8a1HlR1Q0OqGhwzcEwtUIuf0MtakAWOnO6T1PaojO8doVheCqrbZXxyKS4cKW
         TLKhYzCejXI1ikZDCtrSeyGgVgH4Xn1oWAo/WAyqyf7ozaE51WCGtCijV/b3gIyymiSw
         UORrRi6h/qmX0iEOcIvrVj2CXTJ1YBToe3oURQPOj17ZIGp3bE5Eno/IEnlO6IZS0nqr
         x6bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783508099; x=1784112899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5XtzFmugVbIMu8031SSPHHiS7JIyWhVoU+hgD0OOMJM=;
        b=Z9hw6vnN4JAyrRI7qRxm0o1bQz20jatxqcwzhDS4EC3yMuubtHs3AnzavSc/LaZDlD
         buqZf5KfOxvrR5/LmRZUF9qcCnrZh7byEpl62RwMcSHkU1Kt5ABU3grvdllHiphd89N/
         5dJ0FW5eAjYrL+AyQcwy+Ummsk6wtjooQs+M92KW7E4LaS1ZBQ+Ri7H9JeOpS0antlpw
         K8tZHJInO4vO5ZRyI5i+pgsNwP/saK/kvvvWNplYzJ6yMuVEyFTDlWyn1o0vjPshA9E3
         s0Vf1lEAZRGwMcIvuEZW7KHX1ttkZ8AP2FPb1SjBBOYZakGGzDUITbgRXx80LPe6bZYA
         exyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783508099; x=1784112899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XtzFmugVbIMu8031SSPHHiS7JIyWhVoU+hgD0OOMJM=;
        b=WjDTihFqwTEmZL6haecnZ02ZVh2QOLMz6Xv1fF7e63R6yMY+RKADe0KoBO2rImh9WI
         Xnru02GCUi1uGfA7y/XQ1bGAbECGyCXisqxrUn+IOyrSjh3kxLTUmNlJ4MTnyC0cjIjj
         zMO1g/sSnCOLlB2+gz9nGttCzplNqnQyPCN3IT8xRKwSUWwU1H0qS1ukPow3Gdx2I9uv
         1zY1DXLroCFJ2BK0f1LuXOx7Cownm6fW7y47NJLf+b3FaQydQ8dQsb75XbYj9j8zqDHy
         nQQ0HWrUGnj9tzIN2TGIwhgat+q4TimzczahDaeZu28soQGdrd67cAnwSb3QdlGlHEPv
         nTUw==
X-Gm-Message-State: AOJu0YylbcCJ3f4e2nlIYO3NAv2zX49Syd9ilxOFVYwQkPJqh4znXU1U
	SAvUKdf/thVyrnRs1hXcdsf7ZvNnnBbVzotw+1emC0RV/+1byQ3Boaxqkxz43q6rZMF7z6eMkyu
	S3BuQKGKYjXVZ0F6IdVEuq2gmzcQiMKA=
X-Gm-Gg: AfdE7cmG7WXGoDuCuDojoYrFSIDtI3E+aO+kFmjlnuBAy5Xn2YjtfrlQf/s6HLclouS
	c+LPoKb0WkOBeUaPFX9lIcegw27uey8dErUTvUlIvTm/G1WQhtKkL3uixvG1CF9hab3xIsNp7nX
	BFiCId68XUYSTlWViiItO1oRzz6u5a3mpFlqjU+Q1uSW/cwg7rHMaZLrRbfgjZuNStdhtUGBMkO
	X73PaHe8B+cwHzM428r7FR+wy2DdWUnNeR5fNPruoIR9YC4FNe2guduxNa8/ByEuTIUNZiq2NJQ
	aXiOdQjDHB4UpNUv9qKpnyo2tk5ZSeLGqvtgPftCifRqjiLQhwC9LmgOBvVBd6iFNlMuN5wndm+
	TQHs+2leL/DEM
X-Received: by 2002:a17:90b:35c4:b0:381:6cf0:d5f5 with SMTP id
 98e67ed59e1d1-3894279612dmr1551180a91.5.1783508098666; Wed, 08 Jul 2026
 03:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-soc_unwrap_or-v2-1-007ed724cc7b@nvidia.com>
In-Reply-To: <20260708-soc_unwrap_or-v2-1-007ed724cc7b@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 12:54:45 +0200
X-Gm-Features: AVVi8CcYNzK72rgFcf_MGGOIljD7cV0DNEd6uNO1X5Foym-jQMge4LaBJm9o7ws
Message-ID: <CANiq72mn+8zqQguApz4FEqvu5mGSrt231BKOwKf9oHVx-xZ+Bw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: allow `clippy::unwrap_or_default` globally
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 12:49=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +# `-Aclippy::unwrap_or_default`: the lint is buggy [1] and ignores our
> +# MSRV. It can trigger depending on the optimization level.
> +# [1] https://github.com/rust-lang/rust-clippy/issues/17379
>  rust_common_flags_per_version :=3D \
> -    $(if $(call rustc-min-version,108600),,-Aclippy::precedence)
> +    $(if $(call rustc-min-version,108600),,-Aclippy::precedence) \
> +    -Aclippy::unwrap_or_default

I guess it may be per-version later on (i.e. when they fix it), but
for now, it can go into the main list above -- I can move it when I
apply it.

Thanks for the patch!

Cheers,
Miguel
