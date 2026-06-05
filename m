Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171D930D409
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662768; cv=none; b=t5d24bCLAkz141+uuG+Ua37TN9kKO/bkR012nF0dNBMNNfkBCs+Iwpkqp4a1tvIyk2/ch56HIx6P1QxT+Z03nMUTVgrtD4Q0EZHBNwIH2YaMcCfFUXCCiIDHsTq87RY93tiVoumM8Sko7Mnf3kXjq5mG88uqNBm0upg33dbalw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662768; c=relaxed/simple;
	bh=D1oLHAua4jUTmU5gp6WlzH8JfS2s3/uXtpY80bD92r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rW6wLdB0DHn6VrHU6HETgqPL5ZlHp/V0eIiKoH04q7QNzjMdw/uctAvB1u3tXN1bFJ7Xm6gd4bKygJF48JoMUzjwCBnN5miQ7AJJhpTaAk6NSUXdYuShmdF2AWeIYvvRObaCOrWehBRaUz518uU1oeT1owfquSWI4y5nVzkgtpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXm+5Yty; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXm+5Yty"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A061F008A0
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 12:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780662768;
	bh=D1oLHAua4jUTmU5gp6WlzH8JfS2s3/uXtpY80bD92r8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SXm+5YtyQFklf+zSamfp65tiQAGsEPBS3vr45Or/3jRioWWTB+PV1nsHlzIl4wgDt
	 VIlalCkydzLw849D3+Q4KTD07aFF89E5CQr4pWX2x3CevJRUIaLHz2zD1nz9Ybe1xQ
	 fJPznToagvASn3pZ6dy1QZg4+1OULnC/lVcTMMeuibgs518SFC5NVDqX3FivX9CkI/
	 +hGLg9YWwWubcWnYKOy2rs32mIm9sW+Tdvp+ThfrMC624LtMS3R3/K03V5MYb1eDtS
	 WqjGpxjSrPLPbsO7nIPg2h7kgfaVvfk+EkJOW/HVqeiqmM9IVWNEm+l2Ve7Q8YI0oF
	 1KsQwOCURoUkQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa6cdebc33so1760042e87.2
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 05:32:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8NNKP8rcDcYukqiLdsnyU3LwSjwZmwAYurs5pqW3A6PKN7QaUEYZ+GAzDxeg1F6Ka+YwHtPhjpADW0qzobXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPvaCy3zWRcwNCHgj9V8JFjLBVoc8YLe/sqqn0+EwEzfJDCUA7
	rw6mawpe0+3V3BgX+8RvypGVMBwp2rHno9/FhYN687NvWKqwxx7bdO4Rp0+ijrlXJt+Ux/b345l
	OwA9ZmKeXLm54QcQPtMi30sWAbgd2Nho=
X-Received: by 2002:a05:6512:800b:10b0:5aa:6a5c:be3c with SMTP id
 2adb3069b0e04-5aa87bb96a3mr786459e87.14.1780662766576; Fri, 05 Jun 2026
 05:32:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-xarray-lockdep-fix-v2-1-25a5509abee3@kernel.org> <178066138611.3594.6559938011018564470.b4-review@b4>
In-Reply-To: <178066138611.3594.6559938011018564470.b4-review@b4>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 5 Jun 2026 08:32:10 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9nTHUwO9CZBqzP5aRxMRapOwXQ69LX2-9L2w8VdQDMwgg@mail.gmail.com>
X-Gm-Features: AVVi8CcX64NRog_7wMR1bB7W-QcNLkxJ-oG2VZohCw6zgIy-1GUDnpTN2mxAOAg
Message-ID: <CAJ-ks9nTHUwO9CZBqzP5aRxMRapOwXQ69LX2-9L2w8VdQDMwgg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: xarray: fix false positive lockdep warnings
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 8:09=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> On Fri, 05 Jun 2026 11:14:29 +0200, Andreas Hindborg <a.hindborg@kernel.o=
rg> wrote:
> > rust: xarray: fix false positive lockdep warnings
>
> Reviewed-by: Tamir Duberstein <tamird@kernel.org>
>
> --
> Tamir Duberstein <tamird@kernel.org>

Apologies for the duplicate emails, it looks like a bug in b4[0].

Link: https://lore.kernel.org/all/20260605-review-double-review-email-v1-1-=
d52c2ca14024@kernel.org/
[0]
