Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793963064;
	b=GtuudNhNvegcmeUpspz7u6nteW++eFwg/x+Jnht/MQzwWO9rAMjan/2SFNVfyd6WhHlF
	 Zqdvje1ZJLjrNUO4qP/+Nh4yzzpC0dmZw4E4x+OMiT21PPfCCviVgOxqMN+eiFs8Wkp7a
	 9fUyZN7yHyDcMveZOwOdgCrwrlpdz/ckC8sqnk8WQZQDGzdBMvKHyZGi8TQNj0d1Os53b
	 x6o+3udfpiRAgpbOBUlL3krHOXr61VL72zNA61wSLEUbWayRntjkZvI0hP5rXXtQOfV75
	 nN54kt7OD99A/xMzHThkbBL53MoZNz6tY/yPWg96X7b36eeOHIMNSzokLvbvK0A7ojg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xX6kbsH2ACpFzEA8FaBzvuQCY5451nglFyNk9c6crjY=;
	b=KXZg4SqbP/CG8j4tMgTFTFhJUw4zXMW8Ld7GaZI+VHlHrKamWb67GcW82OGitZtvSHwz
	 lVI/35N6vbpgd5CP4J4yZFTKW31y6fetCJtuQkfCWTXY0+Jb0UD8vKKNOp6Ll89Uxn7wL
	 R7F0YBm6OAFIhLnDJkhAKIUXvDIyhA1BcJYnkwEadNwByj55gsd+dk/BC1SSYh6jx1cy+
	 ZX95EopI+l5uBkSlMyqkePx1N3711tjvkpDNu79OKyj4/SoqieC1re0019CykA30wK/vR
	 U9cwqpNDd66KgZgKI6hSEmDqHDxqDDjW3r29CPEQZlIgbixC7ISehzwTHiRXrfIF9ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXX978+8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2602E606A32C
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 11:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2602E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXX978+8
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36dc20d6de3so81320eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 03:04:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793963063; cv=none;
        d=google.com; s=arc-20260327;
        b=VKkamnhJGCybvWo1eaHvC7l95CIxzKh/ig8cjW93dHg1zfBj/yLLsfbGDNe9aCK5FT
         wr11JDhVl+pTrPyiNTsnmwpKekXSvknq/5hdyKjcQfWPbhAOUz5PihVp0JHz7pYw7aaq
         sx4bs8jcB0Vi2LIrHWzzPkBSFlmvRb7e1FwkTdAJhd1L/MV6OIvzmOW0k2naSQfJLx5m
         V6BFrxYf8cdkD4IIEEMYhZd6/qb+I5jm8G99QEn1k0NLelm77Rt5hmwuKRNgiyfh2+bg
         xKUxG0MiY+Av+a+VbukKtc3wiI0qUVWKzW9vA1qVIa+ItoU0Em/kOUVVE74Jr/8LqlS5
         s+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xX6kbsH2ACpFzEA8FaBzvuQCY5451nglFyNk9c6crjY=;
        fh=CAypNipfhYuH5gzNoo3sszBL70piIJRir2nxQO60Wa8=;
        b=ops3w2LfV5w3F9CwNH67GAdFnVTE6qaQBLi7C3VXjgQ8Aa6CfIk/N++GFDlfZl5YOO
         +8/UgCEk+VRjDcOy1nn2jjCJ3QMglyP1JdZskwpz57PjmVc0GP5bn/uitP+s7hFDwhrl
         Wgj8gYrvEuK4jdwr/E1Ag2lR+UTeZZAnf3CkwEm96WhWUi9EJNhsb92q91b8VfCBGAru
         DasA7sIh/qYahPiUh5fOZCQpCbJniZoVQ+5H7w4vrhDX6/1CVkS1f9vZQtnotUgdvU65
         CFCuV/UvbZx9BoOGQ/OgxSnhRiPfsWRW2/QgV/RDQyMmAoPFwUx39DUUq0I0pHpqICPv
         w6fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793963063; x=1794567863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xX6kbsH2ACpFzEA8FaBzvuQCY5451nglFyNk9c6crjY=;
        b=jXX978+8EoBAMGAwT1dGsoJc/TpeWkrvRfDiemGcXY438LSbQ1w0STurN0gDfgi1Wa
         kPEfJg5bDfLiCK8aGgbQsZIDMIwuqsy+H9zxgLT5Do4RAG9ZUMYhfDbTBlzd7AOnAWjf
         3SIMNBpbDRb6RFIcwXGtzDpXcsZLr+L0xJ2HbkEk6JF1qjsCCsMHodj9nHPes49sigtG
         D19BJAZi2WvcPAtgm978S60X1qFtpM6vBd58r/t0jCcTt+aEPQZf6O5OpGvwWv4I1eyD
         mRdYCsSnbe0MCXdC4xPYNOwo62sG/DUO7FJo4ar3lwlZeLI6gPN0w03IA9XLfxGG2eYZ
         ppzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963063; x=1794567863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xX6kbsH2ACpFzEA8FaBzvuQCY5451nglFyNk9c6crjY=;
        b=Wo1ehxS7u1yOptBSuPyQq8KEABBoND+J2SXLkX7MVzeIDtE4nE7Q0RcBFsMEsGX3xK
         yLjmXUJpO7ZK+chgXIjslGxORL+OykLGHPaGFl+l5nSfMwnPnSmoTHlbOwfFVTCcZTAr
         7htr3xVBfRG7NiBxRy+OagQ91H17VQM7pVWgVUItgVykXAF2Gm32lEcU4Fe/hl5EWU9m
         /aqhmm2W7XHGzUI5FzpCdffwWWU2pRtEImlSMzieKesYLlPM0HM2pI5AZ8Tg/Z/2s43F
         7JPG4VSKlsdZ+WDCNcvI+wZt9zUXJq1lR3QKnDhr8WBL16aPxJFI2tSBh1RDZvhgns4e
         hcLQ==
X-Forwarded-Encrypted: i=1; AL+hErHrfssPcWri5M1LP9ewyqfzbexUi947p0wUEI0qWE+beea/uQ1uMipGHMJseWOYLsaEVbDRMis59KeKGSCfSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8W6+9KUr/946EvLW03UWBBeroywFVjNspqXMU5vXUj6G0a9Wmx
	GQSFKumhYaGT2US6IHmrQwiJcJ1un3Ce4zWgkO8HiEztAZUD0y9WKZe9PAN6XwLv3aMps9Cywsa
	6ePvFXKYC+FctGHTekWKWXCB9EnOlfws=
X-Gm-Gg: AYBFou0sUMU/f09oTZiDBuTE/PoCGoiIxEQKGw+IkgkxFcIdGQbCpNqKduNzRpwJr3M
	QUnwE0oMpWyQjKLyRxbbyeJkU5TzKnerGZAxPqeL7XS2dI5PBIt5SbV6hxf7pmmWcGj4JYefLk2
	sY3Yytd03SZGLTkvZ0/Dwh7A+khUt1GJBOFgpxppWvkptfJhz9KT7R0lAaCIoSoNupd9q9mGcXe
	LY8lbudMEwfKAjbGb3pOu2KIfoEy9r3jbl74nrjjIHkUPa2hKrHUf/OV4ztb1ShC8+naGs/AQXf
	DW5BFzlgLYOcmMTsAFo+NAcHz1WfFvJAOm0EMw8/ucNAy7h3fRCV9jjjQIdzPTkf0P9Xuf8aH9O
	X9LOqd6elK/tLtSSmz8p3i1kVc1ViskCbj9Nv5AXAfxDJLUXLyZGwq6fCTw9y8mZbl37qygmuoH
	Y8H/7gwcKQq8+fJ3HwaUi2dlJCMla6wOZF6w3eNAI4xxhoI50r0bBKm+OI/sOyQDI4LLKWH+JqW
	NC3JF8xvr35udWYZJFAee5VFTUmY0/o0AboiA==
X-Received: by 2002:a05:7301:da07:b0:36d:cd5d:d809 with SMTP id
 5a478bee46e88-36f75831c52mr3957219eec.1.1793963062999; Fri, 06 Nov 2026
 03:04:22 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106073528.93371-1-ojeda@kernel.org> <20261106104546.2297584-1-aliceryhl@google.com>
In-Reply-To: <20261106104546.2297584-1-aliceryhl@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Nov 2026 12:04:08 +0100
X-Gm-Features: AclHuK8jyqAZ1F8XeuMU6UiUwoMLOdeHY_OERfr8_KSaOVX2nI10vYWcW6OLODI
Message-ID: <CANiq72kSG61mTC3_0pPokoLbbE87oFrKHcNUZhxhbxpg24USYw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: support stabilized flag `-Cprofile-sample-use`
 for Rust >= 1.100
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:45=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Could we check for `-Cprofile-sample-use` directly using `rustc-option`
> instead of checking the rustc version (e.g. testing
> `-Cprofile-sample-use=3D/dev/null` or using `$(call rustc-option,...)`)?
> That way toolchains that cherry-pick the stabilization (or older 1.100
> nightlies from before the flag was stabilized) are also handled
> properly.

It is definitely an option, as usual, but this file uses the version
elsewhere, and we have preferred so far the version one where
possible, because it is way simpler and spawns fewer processes
(especially so in newer Make), which Kbuild has usually appreciated.

Regarding old nightlies, those are not supported by upstream nor by
us, and we intentionally never attempted to make flags work for
particular binaries out there. I think the fact that we support even
nightlies from Rust is already quite a success :)

Same for custom `rustc` forks, if you mean "cherry-picking the
stabilization". We can't really test those, and if someone really
needs that properly working and can make a case, then we would need to
take a look at all the version tests we do (and not just for Rust).
Perhaps some folks only customize 1 or 2 flags and thus only care
about those working, but we wouldn't know which ones.

Thanks for the review!

Cheers,
Miguel
