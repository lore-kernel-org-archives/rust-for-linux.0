Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8E9CA6F
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 22:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714517131; cv=none; b=m2We/NJAlfe7P1EBYXVdmWkB/2ReO52sQn7m3rh2s8SZZgs2sOt5sglcbHFCG9f9UEPQa4FYUlhzavJYdnCEnJhA/mLJzGLg6OsKchNQzTBrr+PXiuzizk2VPXXto9DdtyhHdcjV72GwhQ/cMTgl3RGI4iSjDMGTegx9fKor7MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714517131; c=relaxed/simple;
	bh=Sx1LEOH01WDB1hxGvY8P/QeYlY8LZ0Ey2pZr8NOxWq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4jUwIQV0k+H7sT7BSPqC1Td3BkyFeSB4D6E+Q1tS6zVtnn5MXFKf/i51ogoUNM92z9c9Hz005vpb8Zi+JP4oWghHqWG4H2qOJdwZmosFEG5sxxmSTerc9thh5FQAxwFJDqio62pUC4B8tA5rXqpV6XwUWbJyKX8A+XAiYKZTbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/YNIoX0; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/YNIoX0"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2b2b02d4148so845009a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 15:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714517129; x=1715121929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sx1LEOH01WDB1hxGvY8P/QeYlY8LZ0Ey2pZr8NOxWq4=;
        b=Y/YNIoX0dGm+p0FwkgA2tmpiPw/eosWxLoUp+sLWHl7E1hPtzOmKaHzpjDIJSVctoH
         y2MLP3XuT4dUhXfKJ/6wqvCcQWrTgZWCa8nBgmfj2TegYRtOj0O38dewDM2Bvdhk309h
         EQ54rmw06X1NNaQttCaCrnGdH1LuCyijwMrRU6fb+q1DG9iQFX5V5GKGMUcb/e/X5X9x
         Fzo4FdXGkKNIXCpaIu4RkFpxBmlrbiSTzs6tieJSU9tXTEJuGRmlu9xxtYnNkvaivJyG
         1L0XYx4sKedOR8T3tP8Ym6qdCqgN/uztg57EXpmo+ewX/8ZTtpMHq5zdT5GfD756szvM
         pV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714517129; x=1715121929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sx1LEOH01WDB1hxGvY8P/QeYlY8LZ0Ey2pZr8NOxWq4=;
        b=n5EAmjtaBmsUx+AexzsL+FxXNNH3qFpvhuqg21HhNtPZGV1uwFv9v9uXTszC7Rsebm
         O5H37fnLkrNFlbCq4uXT5TxGJMwVue+CC1prTN3wXH022umhHtOJw5rDNvwTnM+IMKtc
         vMj+U7m8d+XYh8ZesEaMPhkovLSIbjofdky4dwLXfPQgHfl+jDJ66rumxKHhnS0epVSZ
         TNrFB61if5uy+T/dGvYpCJD/rxLNG66BRC+s83mdNUPsEhRSA8lwxzqJiEbDR++aZeLm
         Dzy5KBPvYvCgJx/yW2U2NJqXnQ3JquD9nz7wu8WN+gOcu1iS+yycpDXzVp+VFpdnDJiL
         QL7w==
X-Forwarded-Encrypted: i=1; AJvYcCWXqtW7aoAScveUilzIN3mGo3KReCtZh45Gz4HrpEdBFCzUP7a3PrXHkKIg0EAR+m+eNrTF+sVmeVKDjRVnU6cZbRTeO8p7n5Ex2sCfXoE=
X-Gm-Message-State: AOJu0YxGAMcpaMPjWoFMSdrnivOvgbX51DS3s9PCzvg/d2+gSqSlFBKD
	NgBDYzf9I+ywPrB4+Houdxv81qpb5GZhHXnDNOoKMW6zrTLEaP3Xv46eBcZZNu5ofdldlQR5uYw
	GLEkvpOvvM/iTc6iHhnW61S70S3k=
X-Google-Smtp-Source: AGHT+IEN+dRtufUYFh7iVysX5uCVqcMJQp3EC85SEUJfib0TgD2KnAHR2xwfBP0I25h4lQJ5ym7+sgltDfymynMC9qQ=
X-Received: by 2002:a17:90a:15d0:b0:2b1:faae:36ce with SMTP id
 w16-20020a17090a15d000b002b1faae36cemr885296pjd.14.1714517129206; Tue, 30 Apr
 2024 15:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429192435.2235-1-dakr@redhat.com> <Zi_6aDHO4B_iY9zF@boqun-archlinux>
 <8b68878e-2ddd-4f31-9f82-4abe638bf148@redhat.com>
In-Reply-To: <8b68878e-2ddd-4f31-9f82-4abe638bf148@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 May 2024 00:44:12 +0200
Message-ID: <CANiq72k_eciLRuJ=nyoeP2gHBvcgr2s9aftPrFHiavPTrgDaHw@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
To: Danilo Krummrich <dakr@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 11:01=E2=80=AFPM Danilo Krummrich <dakr@redhat.com>=
 wrote:
>
> I'd be surprised if rust-next wouldn't be fast-forward only, is it? If

Like most branches, it is generally not rebased, but it can be if
there is a good reason for it, i.e. there is no hard guarantee, and
rebases indeed happen sometimes, and they are allowed for branches in
linux-next (again, when deemed necessary).

> As for squashing fixes into existing commits, this is something I would g=
enerally
> not recommend doing. This would be a non-fast-forward operation and hence=
 break
> potential references to other commits in general (not only "Fixes" tags).=
 Plus,

It is a judgment call. It depends on how serious the mistake is and
how costly rebasing is, which in turn depends on the branch in
question, its state, its expected users, the testing time one would
lose, etc.

In this case, to be practical: does anybody think that the risk of
getting bisected here and hitting the issue (especially with the code
we have so far in-tree, i.e. the `T`s that would apply here) is high?

> it's usually not providing a great motivation for potential contributors.

Credit can (and should) still be given even in that case.

But, yes, for e.g. a new contributor to the kernel looking for their
first actual commit, it could be a big deal.

Cheers,
Miguel
