Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C8C43687
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Feb 2024 16:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708101825; cv=none; b=sMe0RU3cZCwf7C4lIYMjBz5H2xNaUUt4uetRN9HIf4Vbk8ZBfomiSVf3hKPKlvDJVVM3CEARJz/qCOtc4wVyNgsCsTCnWpgUBX7Q7uINSzyCJn1uE5xiYpLvvqTG6X1nAku0/OtF8iyuGcDoYPzx8UzSP858APo1Bet8wPHTymg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708101825; c=relaxed/simple;
	bh=KTrwh8Rjypze4XrAz5GzpqtMQB5UT715a9wiNdq6DwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V6AQcgRy0KZ8dtwyYl7jzS3LilUoButKoqX7Gtm2CF0Sxfy8K+GGg/KfpsWREZkQnwh500DbztvswVbDu7uMOtb0f//XeEYOrRkahGg4xaBMVctL2kXkcvroHDGUf0RskNLU1O43YuOAsGWWoHoTgC9cWp+G2otJJz1ZBH7+YKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DCxjOk2P; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DCxjOk2P"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-467e4a04086so170742137.3
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Feb 2024 08:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708101822; x=1708706622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTrwh8Rjypze4XrAz5GzpqtMQB5UT715a9wiNdq6DwQ=;
        b=DCxjOk2PXcZ6yVCzLTszT7ET8aBVYMAd1vAfqNWyDR7/jRk5L+famI5I6qo0+0dNcD
         OjeqcRcz1Rhcg6L31vrJYKK5WommzTxzXCV8Afn6miz/zxtDtHweWpoCmpEZH4Bm1GUH
         opu5xpDkfsGIWDiLN1oagXgeUjHbXjpeADMGQl36VXk2c8Mybh4Bu+yTTsz2eUA68o95
         ZcDQj4JWUg3q77EIC9kNuyTP75QuPsQRNyCpAexVCEbsCcZPn4+UsCPJNuXN6QxbPq5e
         ugeP566+Xev+2JrUgtBIOY0DD4+f6Gy2RWQgFdP4JGHtHqwc6ApKNTTUbhGTmyG5KPY0
         7kQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708101822; x=1708706622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTrwh8Rjypze4XrAz5GzpqtMQB5UT715a9wiNdq6DwQ=;
        b=Wafb5RqDtKy5ZQfMH2Yo10wBGhZ81inP5ByKV8V679NM4Js8WcyRVWCt+LpYsknqVd
         KJeJL1FFpwHuFWBe1h7BPmFBCIbJpixo6RDYUSu/limVeRMcypqwyoCcI86PSw1/YW92
         7+hVWKGXiAVIMFP+JhvEbgdekYMZxPFBY6HLit1Qn3/EsD2xe82Sn/qFhz0KMMyvTdzS
         RCMfSm59ur9SMm8xyQetuO7BbGGCXwaBQJfR354V2lBoIkZE7vDy8S6Z0gLVNhd49rtn
         ZjVPK79j/FaZy5EaBSOdOaZ3DLkeY/+CL8uBnBte80pnSwAkvQgfdRO2oSTteanhOBH/
         W/FQ==
X-Gm-Message-State: AOJu0YwfXG5uzVTWygj56qOViipOzUHOikVSlIUmRy1BOkKfoVvFoTwU
	yqz2uu6rQh8ejrMyVb1EWvKQ/suA1E614PVIBJPJqXi27cUZiTmBu+b4vDaF/J8cYNB+a9a3R/q
	mQFev72osQWjAaZAAF3w4trjIh8FSJjJ4Fd3/
X-Google-Smtp-Source: AGHT+IEXwKSOr6kzJvlf8bY4T0WPzQZawUfd487rew3KKDgstDGtcWkztKtKcllQBjSvKypA357C0uq0a789+KiMLyI=
X-Received: by 2002:a05:6102:1488:b0:46e:ccf3:28a0 with SMTP id
 d8-20020a056102148800b0046eccf328a0mr5268613vsv.20.1708101822170; Fri, 16 Feb
 2024 08:43:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216152723.993445-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20240216152723.993445-1-mika.westerberg@linux.intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 16 Feb 2024 17:43:31 +0100
Message-ID: <CAH5fLgidiAJYTuONztfkgJvK4HVg4=JGVXD6nkK7eSCPRS-arg@mail.gmail.com>
Subject: Re: [PATCH] rust: bindings: Order headers alphabetically
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 4:27=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> As the comment on top of the file suggests, sort the headers
> alphabetically.
>
> No functional changes.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
