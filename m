Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61B11A83FB
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 08:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740559174; cv=none; b=b8wyO8Araf9vzpSPA5FORshZOglHzCD8qDJyVQopZwi7HymG5G3jNyko7ZePuu+j0C/d3Y0GXOWMwzPAzHTqzJeZ+5gPoJeR7wOD87Sf1DDjOxuMFbl3mgv+aGilO5GIkZHf2kRq7la9J8zVUGD5dn5PG5zcssHR0Q77R0jP9xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740559174; c=relaxed/simple;
	bh=GVyDNaY6+fqwoUtVjnyv7MlKCJ8j/D26acuBjiblkCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INvh7YNsKUxax2qQBcwsv+fqVM3DeXAh+73+3rZeXLRtFvCKjMFbBlVvPKr2LOyR7vQrhPYBLBZJCYKhBvtBL5dcwVI0AjOzhtfgME4BhUeA/7m24efOrknV9SUBpDD012YllsQWDTQqLTGuj1dHFz7mRK05f8hYRs1fx29XP4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h9ARkDjK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h9ARkDjK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-439a331d981so56646055e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 00:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740559171; x=1741163971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht6WBt02v8B/a/5DouNJugdEx2I1Lc+d52dgpIP/wWg=;
        b=h9ARkDjK+8lNdaB+64Ti9VVge93ZmoYboLHO9ojKR/UcjjfVX3cUpBhJmp5tTMyp0q
         EAQ2vHleC1HO9+YtESmbtF2+lW2UY7NaBVfZpklPf2KY4jpScR7RyxEIAt+9bFHiutiF
         cZffuhPCN7G+d3wsvy9ZOpQlHpLE5WjH5Ge4xj0C4cE92N4WvUF7kL7agZuMV3XGS1xj
         GFNg+cZEYr/Mzr8CEME4L3zTr377B4U/Bg29JLlnYMwTgr5TRHQdVu/PsskGSeXjzhag
         sErk8hO3eEmRLdkYjrt/fOwdEG7PcsQwu9aMXKW4KX3r/4dd60ZoYZV/fusRMM9ReRCy
         BaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740559171; x=1741163971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ht6WBt02v8B/a/5DouNJugdEx2I1Lc+d52dgpIP/wWg=;
        b=gms32Hi5Z7c6KC69Q0Ud0jyrXaaBgzwon/XwcffhsvxYgcuxF6BcSCFElWqHKj3xLH
         lfa+E7Tp1DS46c5368qLA7SBcQ38myRh3brYHVf79olyQSUvNVjj9bTMBnY2wLKpsm4P
         U/43e/icbVQR2jo+QcLCb88s+Iv+ewtjlrRa8zcaEQU28vrq7hy3BffOjqO7v8+N2jx8
         zJrxoQC2kfTdDNM/0692nsv4F/ILcKaCRmnopGRU0PQw30595xlpi2OAyMqgNg7eGDgM
         J6GaTA/uieqNYPfZAjdwWKHIFBG/wSw0dzqBcZlqwP326jWOqkp7cvp6HPIpzFzEy6ET
         mT8w==
X-Gm-Message-State: AOJu0YzB9rH9XIykXnWyuqluXSh4Sh5D1JTIAlhu66IzgFTjjvzFAaHT
	+7gAQcJda9jXqXtcfAuf1/j8i7PypPe4sOISONOTnXA18enYPEA6WrWFxsL3va1QCgsCxIF7hhn
	v3XkH74w0x0bA/z9V6CIM8EU7XM1caLHnuOEeIQZgCW2GPMrWNA==
X-Gm-Gg: ASbGncsQhgQFiOTtSdWLsjcpBezmOPtOd29nh8eXLdw6OQoR7P8YYUJdcN2VadSqcex
	71EvNx+j4oQXN8KzHgCrEgqkRShwFjRNDsYN9jpF0MhWF3r3Ije2bR61hrpCTskizQadnYTisEI
	fLSXx02sJAeQ12r05ap7NKVOr94vzbh8KjFr8Xtw==
X-Google-Smtp-Source: AGHT+IH2YOOgmJJq+20JpUJLcvE32um5OoF4ycWk2WoATazzM1UFIN5ekMfTI/oKjYXPlbOk/26tK0r1Bs7Vnk2SXZY=
X-Received: by 2002:a05:600c:3548:b0:439:8a44:1e68 with SMTP id
 5b1f17b1804b1-43ab9046de3mr18395905e9.28.1740559170862; Wed, 26 Feb 2025
 00:39:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225213112.872264-1-lyude@redhat.com> <20250225213112.872264-2-lyude@redhat.com>
In-Reply-To: <20250225213112.872264-2-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 26 Feb 2025 09:39:17 +0100
X-Gm-Features: AQ5f1JoEeKqGvLEXW3mM8ELPq3wAVUCLl4md3n10GKFy1pzYMyRYWo_o7jMGa-E
Message-ID: <CAH5fLgiku4K9n4p4WaFJWD_GgaOjHND+UW2Bnf3FL8A6M76DFw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust/faux: Drop #[repr(transparent)] from faux::Registration
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 10:31=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> I think this change got missed during review, we don't need
>  #[repr(transparent)] since Registration just holds a single NonNull. Thi=
s
> attribute had originally been added by me when I was still figuring out h=
ow
> the bindings should look like but got committed by mistake. So, just drop
> it.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
