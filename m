Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4A547D951
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709575; cv=pass; b=isd3MjUA9Q+OqhKfCRgPKh5DRllogDXGIYJoBJiS1kne2uCfcJXCHdClGkQSaX9SGxELJ5SnAeJLibuap/7RwVCJSMDrbaxiqq745DgPQREzc+MZKWAJ70dWnE1wOtlonGG2GvXoDeDZgDTpRA4rkXRwPQkDJG4UOrNiMA3EE0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709575; c=relaxed/simple;
	bh=Jm6hSlkUp9+8ytkymNNVkAolB04FA2Ccq4+pdSay7kY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJK7X0WrYuhiI0nYOLJxnwucMw9qW+CMXnEyxXLr0gR7lqCk85FLhpT2inUXr51dr/05BFGR99PHsPzYno1pNA/GvCIvSt8NilUM2ULOOqQbaxXvxnL+BWQO9mgT6dG5OpvYu/LjlNPc2TdPh5G74OzPn7MSTi1p0oH8lnAixT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=BFOpV3yf; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="BFOpV3yf"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so2881360a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781709570; cv=none;
        d=google.com; s=arc-20240605;
        b=aXJu5zAI8vR28dO4Kz0oG56WrEgLXnveCaspz3NLiJDIQvJnum3jpF6OwU1gftt9fG
         SGZoVPeSdbZRo+j7MF4Piq969kQFmngaMe2lszCN+3K1ezpcqDvyRutdMWFzs/Y44bX+
         Ow7bFd3SyyTy0BvXUKAhrxD2iPcdb2yMAJ1ia/5V9OKNcHHmv/WCdCeriiL28RQu0/Qk
         cHe3H7seCJgsAWCjUgSm0WWD0aL70AtDBsDh8b02ucK+0HzmTV3R4Trc4bMRRcJVswrD
         3ctIoBDDrz+r7iA8cr1a43NN7xZd6k20tljjIF0JktKXLDhX7AkL4BpfdrsMfvEwO+HQ
         VuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jm6hSlkUp9+8ytkymNNVkAolB04FA2Ccq4+pdSay7kY=;
        fh=g7cpHqmMnaRHiPR4PAH4D/ZaGuZL/4Del+qksIDomJI=;
        b=k2xeZRlssLt7kmLv+O1jCgo77H0/e6pwWF314W/YzZ2e+sf/mlxX+FqrA6BBRQFnOk
         tfZtTMwpg50AqkKUV9JSrAu++C8hG3IUHEOcSBR6XKwURR4V8mbsSbXyAlVSi3VJsztq
         dJLMPlzoDKjQz6Wa8JSX17GNo/a/Pr8DOMo+xeTdojqhnOagoecO6yc6OU6s5hQXhHDq
         5GmWu9uUzQzfJqXrQh4hNvRRyNl3TblnA/9eBDXDgWzjtpJa9jUW9lMq0MDuPzl9RC3+
         LzYektUS2ECqC6/QjPKCL31TjLFSBzd8JzFlL4Tn3iA6i52PoKqCFR5HyXCEXrtl7eaC
         +3Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781709570; x=1782314370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jm6hSlkUp9+8ytkymNNVkAolB04FA2Ccq4+pdSay7kY=;
        b=BFOpV3yfn+qdzHxciCXyLgJW7631M8YcPccVK/2dZZQ4fM7jcN9yZsQzx5MgdHTNIn
         2zBvjJFfiHomG13S7KHH+hwkVdkdsc5u1GLOYoPYlVrwbUKZvAROHXv14rGNogHsTYW2
         7G29oWq5VY2gfZftkCT9/3q7/hys93qF+nN9MAdHuGmNJuc5C92yXYzNqp0T4cBFta2a
         HzjvHvWcFM0BIC1R3VAdvjlPEC/iBw3u9rddzjomo29I67RvNFivENKF2ZjMoolMpVDl
         oyjalxknsD9c5t6nlGyWEY38VoPvDLyntebFvqWyFKVC2gnpWvlrqVgMBgX08GtERVAP
         SQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781709570; x=1782314370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jm6hSlkUp9+8ytkymNNVkAolB04FA2Ccq4+pdSay7kY=;
        b=Wh8aHCylWCspXQHrfEGvQ6A7XQaO7XdqklwuRy6TUu2FCZSFnj1NaPJSxPzSpwqEae
         ItSkQ9b+VKFCmZPNwM8ceQx3X9UOL+fqhTlxFLZcqljHEdNt655OE6/uQLoGskbp06Q8
         +zQiudGrJ6woS0xnZToirgbhVhv3CEKqBExcB8BRlUzQTGKmy46hTdexHzxHYTX4EB7a
         6HYFv452qf3O5661tATPwHHHxQihUnTr6WQl7CXuItpwLq+GdyUr4y2wVyajNIrzp9H2
         gANLIwq905lb24H0b8yBCEG5XwaOf8JIeBm9gVNpl8ykfkjfp4FPQJOxUDZhpooyt6L4
         tOJg==
X-Gm-Message-State: AOJu0YxZBz5i+eid4cAlw4YflfpiMMqaH7N4FqSRbitkePM1cn3tgtEF
	klrAjRP3/sjVAsbTQWPR3aSOhaHTWs14yF52KhWwHjFp7aIouQkurCX8G//7e23OBTmlXX0nUny
	N1bUnviekU3z1jJFwkQIed3O6JHZOxr/MD7p/eh09
X-Gm-Gg: AfdE7clGMVvy4jI9iFmzRdk1lbuIyobRaPLmZaPfRegVhXnB8MV5SzJSRhDwPKcgZ0M
	QulHLX9f7FlYOL9h2K7sSp/pqbmLWWrwbAZpNARxHS5P/KIl955De3NsEF8aUFvQxyiJaXHA+/O
	NsYTsHS7mxqhLncy6DxgmsOuMHk5ByIAgimhaHvQm9+Upc5xJ0qTEBhfW2rSqwTnCjinV+uJQNB
	m3kwRceeGvhDU4Mh0Ypod5ludUvr3GCaFGF/d5FCQir7iAcsMI5Mmapv1JtCGEgbCQcpmlaUjir
	wCyqf3M7l6bcGHySybIl9QlkjhUPaQ==
X-Received: by 2002:a17:90b:518c:b0:379:1f28:cdc2 with SMTP id
 98e67ed59e1d1-37c9366af27mr4205011a91.13.1781709570282; Wed, 17 Jun 2026
 08:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617150143.2152-1-mike@fireburn.co.uk> <CANiq72=me+GZCOW1H5FtfE-b1OY5FXN0yT2S3661vP+S0EDVwQ@mail.gmail.com>
In-Reply-To: <CANiq72=me+GZCOW1H5FtfE-b1OY5FXN0yT2S3661vP+S0EDVwQ@mail.gmail.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 17 Jun 2026 16:19:18 +0100
X-Gm-Features: AVVi8CeWuOWKGlZUM8EgPahDPvGN1Vm2nujo09E_7z5rX15dPJ93XA0Nva-RtKI
Message-ID: <CAHbf0-H=bvw77=4ob+AnMFJewYacjxy+v1ZSY0QqDbY-4_D6kA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] rust: crypto: library AES-128 / SHA-256 / HMAC + RSA
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Jun 2026 at 16:13, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Jun 17, 2026 at 5:01=E2=80=AFPM Mike Lothian <mike@fireburn.co.uk=
> wrote:
> >
> > Both were factored out of an out-of-tree in-kernel Rust DisplayLink DL3
> > dock driver (which needs SHA/HMAC/AES for HDCP 2.2 and RSA for the AKE)=
,
> > but the module is generic. Compile-tested in-tree against drm-next.
>
> Same question as in the other patch series you just sent: is this only
> expected for an out-of-tree driver? Maintainers generally cannot take
> dead code, unless there is a good justification behind it -- is the
> driver expected to land upstream? Do you have a link to the code?
>
> Thanks!
>
> Cheers,
> Miguel

Hi

I've just posted it
https://lore.kernel.org/r/20260617151249.2937-1-mike@fireburn.co.uk

I'd like it upstream if I get it working

Chers

Mike
