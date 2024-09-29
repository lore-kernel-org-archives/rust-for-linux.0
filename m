Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92951E49F
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 04:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727584528; cv=none; b=OjONcyKUEUK9tJEDSbX1STr56H0FdDkHJf88mPg4Ipt6YfufoVheJIFbsFdSNJ6RNyGhg+jLi5MHHs045Z2sywn6CRxWchACKFrg0qRmqGsJ02q7u1e6Q2P5hdZdLvDW07PxXcdJ3fgBSG8z6o9bZL0Dxtb/4p5q4nOfX6wRGv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727584528; c=relaxed/simple;
	bh=iq8nYlJnTvsBXaVdMJD5ZEW9MPx3F7bxAs2/3KJBB/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIeN+87VaOUoI+RLho8JETLOc/Tc9u9xo3pz1A0jdCGfIpoUidNXs6TIEPZ9GGrlpKqqFPT0uBigesje5VjtOISGhWY3BVp/KS3nQ1+PY/i40DzYExgp5aHtt4BmNEuicTF5u9qCv6abLwMhNOIpx2IdAn2PzO8i5mj5KWVemY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=VI2NIJnM; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="VI2NIJnM"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6db20e22c85so29508967b3.0
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Sep 2024 21:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727584525; x=1728189325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iq8nYlJnTvsBXaVdMJD5ZEW9MPx3F7bxAs2/3KJBB/o=;
        b=VI2NIJnM6ZcaAnoh5hAEAIdS0eqB+9XJg9futIWBBWUTBI1aSjD+DIo3Boei9vGK1B
         lS98gm7Ni4+xFqIqzssnXZQHwllcyHjKH2FxkxmkA4xSy6LFz2a9YfXXXqhynL55fasZ
         kjz5yKqIt+t/S94AnhqFoMOilX9HXGrQShnAq2yvlcxFNr0h+d4hrCKUJGv25DxZBTEA
         WWqZSMIOGY06ibmzA4/HdWh/kwiKyTpNIyuh4hW7nEibDSwlwgsSMpGxtDwrsJjANRRq
         TtZXdFPydUocAr1KX6RlhUZTXAGAu1Dwx3gHiVmy3UB4xluyz1MEc2CChSfIZJDDyuH1
         vCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727584525; x=1728189325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iq8nYlJnTvsBXaVdMJD5ZEW9MPx3F7bxAs2/3KJBB/o=;
        b=mgmjpXt8/1bh8zmpat8lrXsp0i31MVrlAsOsRki9kyaG8SDp+4W7zo7WKlJs5xlDlj
         iT1t1GrFd9THBBOqabU+AO7h3VjU/nrYry0hzrKdpoKGIUORYo681pltpPO5BUQ3uhYL
         T1/MDUZgfr9s2+x1382yCNLt4We2KaKQBf3xc4xQvgeihJssykLrsxuv4WxceQo2ASoc
         jqyYp8VQBCD16crhyRukiouiiGlPhL+rvhVOoLOqNpbcFx7zRCDbhUo6CJbr/I1VwTUn
         Kxqw+/BJTY5yJcGk4wdlcXi80ApH2sEwfVv+MraAZiyPrBSlKWV3ZrhmE8bnjOM9HEA5
         i8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlez3RKKuaWnz2JHp3pCf/46BG5vw4V82p5WDFR/RDJ/Uj71NNZF0EsOGfDn4flFu79GZYp7fotLeg8oJfSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKD7ehFS0uBEdiyQT9SmW2nNWzpAwF4wpLSh4a4z+qr6yd/dJn
	EBZvLz0Bi6U0HGaczcirjcHiRV/9qIJik9F7Dj/VL89sDYxOmSKBlVZSRGJGvv2LSwRCpBk4arj
	NJtoXEH6gkyJ5V3JgZOhZOUtenPLOedaMtjMOYg==
X-Google-Smtp-Source: AGHT+IFTy978tTVEtvPzHwUu9f9ON7IF/qpS/26+6FLmZ3cp8HWcWTa+ibDUFZepM7iaF+ljOiiv7aClfsJOk7PuJM4=
X-Received: by 2002:a05:690c:4285:b0:6ac:ce34:9726 with SMTP id
 00721157ae682-6e247584d12mr50393967b3.18.1727584524823; Sat, 28 Sep 2024
 21:35:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-6-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-6-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 00:35:14 -0400
Message-ID: <CALNs47s9t=bFbcLOuwkMZ8XV1S_hF1igdfLKG4RLCwAsivG+ag@mail.gmail.com>
Subject: Re: [PATCH 05/19] rust: enable `clippy::unnecessary_safety_comment` lint
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> In Rust 1.67.0, Clippy added the `unnecessary_safety_comment` lint [1],
> which is the "inverse" of `undocumented_unsafe_blocks`: it finds places
> where safe code has a `// SAFETY` comment attached.
>
> The lint currently finds 3 places where we had such mistakes, thus it
> seems already quite useful.
>
> Thus clean those and enable it.
>
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#/unnecess=
ary_safety_comment [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
