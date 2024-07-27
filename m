Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82644C9B
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Jul 2024 08:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722070726; cv=none; b=nDjTxhTy82YBkKFdIpuqDD2IskntyVErIfs8E6j/8GmXmuLTffZinF4FmCV+1WHZL/5P00rnzAsu4XBwc1Mp1hFmnomg0uKUX6znHuq3gZFLZco45zM8/9joFTRKeK/+cuEZ+XJfi9Y0w56bSA0Eg/ZOc2cLFPtbogDG0/vXUu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722070726; c=relaxed/simple;
	bh=LcgEyp/IYnAKXO+Dvl3srBVV/CmiqeEknQN8bVUv+ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddPZ/Z5xvIzdAP3bpyBNm2cy/XBk/YMGmWqQeCmrmjXbKAIsvz43tyEd9i3+sN68KJgmKk/4gPHPqvyL2YpwEAKU+URAw4XMtyj/W8EktgGQH+E8CWRdtbVbTG/jqZyA5gI/z46KMWyfETO2qmspL8TjRGdK1B2IJjQv8IJg5VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LAAsN5yQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LAAsN5yQ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-367940c57ddso276420f8f.3
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Jul 2024 01:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722070722; x=1722675522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcgEyp/IYnAKXO+Dvl3srBVV/CmiqeEknQN8bVUv+ic=;
        b=LAAsN5yQTlzWr95OtMG1eMfPHzmWkEbelCrLL6jbhKlcKz6cpujgl7sgV1O89Zzypx
         uWR6olz69hbcy9wLLl3Nf1AU8jnZTz69f7OGdw9jC6IyUXXzQSOyUSoxgK+5hDsvYlRF
         NWbyJ3GxbmqAnaYK/q9lFqdk4OZQMIvgK56QVyYBF0Abpsfyn2AqrQNmTQzv5aRhFYkd
         r59pHohX2x3k0Gt3TiEtSFjQHIqWnoLZQSZBn8epOdvUVjSt8YwV3pdoje8XJVui4+UM
         W0qAoNpKR51RW7EH2TmUS+OTMFGioFIdSwJ9W+yKTfdJt9tkCg6cdf4iEhbYxerDjBtE
         T5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722070722; x=1722675522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcgEyp/IYnAKXO+Dvl3srBVV/CmiqeEknQN8bVUv+ic=;
        b=MG+BJqErAPfOqMAto4ePIRvXmhqBDIis3bZWDfZY5Bt8p4LOCTkY/2cfvEKXJ9qOcH
         uliDjMIrexUEE/BiihzZQF/XpHLMsboG4rV0oxHduj8UQoZZZhTvDVSS1hQfvaLYXX4s
         4e8BpTLXOKU42OnzzMgwOJ6WYTkRc5sQfDBUynzVR/yowjoxROEyF7JYC8f5htLNhhON
         CfY/bJAdRu9o5oSRRlV+JanvzhLSpHTGSzPEg8d75puONkE0e73hxke8w02R7qhaDcpa
         VwO6g4EhqpkKnOPPMyyoxfhHhza48801MYDlh+60rb+6pHJJTd96LwXOgKrNiYwgMzzq
         KGlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWleZlLUMI4s53CHz516V93509zQ1KYLQ4NoI2h49lryqPwDme4P7RKEN6wzkBDdFAl0pDBmcK/CDYm+Avfm/LEKl/SYxQJXuGX7f5LDjc=
X-Gm-Message-State: AOJu0YyNnlyRvTlDMx7iSTfK/L6QQKRlgsFnukR5SXScaBqZUpe2gqzN
	OoGn5ye9xQdj26vQe+ByU0Az6Ao5EXEZGD7oJrkfMSGEq/uqhIUoCALZv+TkxhBntb4poVmodBc
	A2KAyQqWuXSOnVYN3uZGJZCzJ4HyPQU0KScrM
X-Google-Smtp-Source: AGHT+IEJd0KUJd2pb3W32mJA6m/WBUd7vT8mCwjrAMv1qZd21H89mER5g+dz6DHruOk/X+WXnO7cGJ/ZJv5eKP8dpJw=
X-Received: by 2002:a5d:6288:0:b0:368:7f8c:1b38 with SMTP id
 ffacd0b85a97d-36b5cf23f54mr1123461f8f.30.1722070721690; Sat, 27 Jul 2024
 01:58:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240727042442.682109-1-alexmantel93@mailbox.org>
In-Reply-To: <20240727042442.682109-1-alexmantel93@mailbox.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 27 Jul 2024 10:58:29 +0200
Message-ID: <CAH5fLght8TRtSi0g1Tm8RjJVH9otOsTG+_4hzU5ZNrfBuwfFOQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Implement the smart pointer `InPlaceInit` for `Arc`
To: Alex Mantel <alexmantel93@mailbox.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 27, 2024 at 6:25=E2=80=AFAM Alex Mantel <alexmantel93@mailbox.o=
rg> wrote:
>
> For pinned and unpinned initialization of structs, a trait named
> `InPlaceInit` exists for uniform access. `Arc` did not implement
> `InPlaceInit` yet, although the functions already existed. The main
> reason for that, was that the trait itself returned a `Pin<Self>`. The
> `Arc` implementation of the kernel is already implicitly pinned.
>
> To enable `Arc` to implement `InPlaceInit` and to have uniform access,
> for in-place and pinned in-place initialization, an associated type is
> introduced for `InPlaceInit`. The new implementation of `InPlaceInit`
> for `Arc` sets `Arc` as the associated type. Older implementations use
> an explicit `Pin<T>` as the associated type. The implemented methods for
> `Arc` are mostly moved from a direct implementation on `Arc`. There
> should be no user impact. The implementation for `ListArc` is omitted,
> because it is not merged yet.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1079
> Signed-off-by: Alex Mantel <alexmantel93@mailbox.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
