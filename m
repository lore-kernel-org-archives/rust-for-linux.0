Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E727C1BBBFD
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549468; cv=none; b=KJryZ/CGF1G6YP+xku3DTsSD9UoBmi9JL2B5bcbzjYFcqMfJaMHt+Qj3LiCe+ioSkk/U0Jf6AB1SHA3o22OiYyKefA9f1rSXKb44UWuuMOehE74pgJsvQybD7ArU5l+s4sn8QnEfPh4LO0sZJMtDjxIJC64b5IV8FFzsS4iR9oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549468; c=relaxed/simple;
	bh=9FMviRvNNGrKMjQx5y7ab9W6PoN4yQqeRZ8Lp8AbVgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6jyu9AGQQmuVpluUNUHNxsXNmCCe+GREH/zR+TTb1BuQEsX7Fld2hIsW1mntWkDgGPypzIXIMI5VhoFirQ+l2q6t+gqBdnj9JnOYY4p96o4E1bmPCvTa8NfiEeFIgAoTiEZxGjuYAo/tdwfgibxhKtxdfkLI1kYqK9rAqZtLjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BFy0h6Dc; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BFy0h6Dc"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37cd8a5aac9so295589f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 01:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728549464; x=1729154264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FMviRvNNGrKMjQx5y7ab9W6PoN4yQqeRZ8Lp8AbVgg=;
        b=BFy0h6DcR8nSGgmSWEuxrXFyaIFynw2OIlr7YXHhNKX04RHGqMCrpMkwQk3pqp5ksK
         AIafqA6QVNpST635rGdf3vAE4w/1HunoTCkUrTjze+1zRGMFhs2+v5EkxjMCG3urpepM
         e8IH1mr111RmglDvvdqNqqU9YcZgjLJm/Oo3QqJzpZUl/UK4s6TShcORWIvikc8UMMxR
         7aIPL7tXyDrc80uJwXZcHzCxeuxRyZ0GswsbUi5SD3XYGukAO4LHEviB9z/ABPgD0xX5
         HpfM4c/sxyHPdCLRJ2IziRgjZlc87zOBe4tFstPU/S9+XYf6iw1Tjekwl+9NM6T+x3xT
         /I5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728549464; x=1729154264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FMviRvNNGrKMjQx5y7ab9W6PoN4yQqeRZ8Lp8AbVgg=;
        b=wvDoTgFViezB6kZ94R+VEr7/15WZq1U898panfwZbxpxhrA7fbLYmwXQ/rEm7LWewF
         41/BD0prGeVYjPAkFnLLXsB1eswAZsuVX5VTjRWg8yGG7+mknFgECZRjthnGSp3sJQRs
         QYHO8132ki1KpgDh9aOuk6ZDXeoygkt0sb1CPuij+qimc3N3KJ0df3adHtA3kbKRf7DS
         l5Mn9YUgL9g9bWp9JEFTfjlaFjxDpKhgQA30B6cZpO9UVywBvTJiW5lG6BMaGMepEAfy
         wJfXNIOGv8UsNGsJO3eMgalIsajm9HF7iw2orZtnKjwVMY+cylXtcRslzE1vW8ihiDNx
         Ca8w==
X-Gm-Message-State: AOJu0YyNIPSTTZaKyDVsZBSPKaSdHuURdM0EoqugnsSdDIO6YVlF2w1k
	vYmYhhqOTyIZWm6V9VH+6xuZ3uP83+v1+GspxzWs7ORsOLT/7Tr4n9hjTN0esK0NsMzG89MzsRk
	BjFO8lls6VE6+xW0jHInOm/vKFAd3t/y2DwYh
X-Google-Smtp-Source: AGHT+IHo7nvtYBfChOYg2s4EAqI+xEoiq97hn53e361dNMhfgEs18RdVrBlAKwV0JpOtmd2UT3msXVVB2YL5hQrF6o4=
X-Received: by 2002:a5d:5c85:0:b0:37d:4cf9:e085 with SMTP id
 ffacd0b85a97d-37d4cf9e0f8mr585415f8f.25.1728549464038; Thu, 10 Oct 2024
 01:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009162358.27735-1-tamird@gmail.com>
In-Reply-To: <20241009162358.27735-1-tamird@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Oct 2024 10:37:31 +0200
Message-ID: <CAH5fLgi=ZjXs6KyG5ovaSSkRHCOsVb+3TFCnDvghYjE6w6uBfg@mail.gmail.com>
Subject: Re: [PATCH] rust: improve grammar in commentary
To: Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 6:24=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Commit e26fa546042a ("rust: kbuild: auto generate helper exports")
> added an errant "the" where one was not needed; remove it.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
