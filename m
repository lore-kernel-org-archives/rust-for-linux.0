Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA6121350
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716198082; cv=none; b=jmSvb7df4R1v8ZThvPLTkWHGf9B/ipBX2fi+qbtFrMkHuGnhA7m9Rp8PtEhGtDZ9oJv9feALasl0g8XvipiEmi5i/27klNKAFqBYWJJxlybICG9+nKPRPeg64FhpiVS13k4aEPnZQKAhQPaihXslIMzJXs9Ec8aEc8Vj91G+EVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716198082; c=relaxed/simple;
	bh=7uuugY85m3skoiVn07kJvXcB4zJBbm3CV5cNkHDjjBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+mb3DZ+t26UMfB0eJ/ckh38jwnoZB4FmrBvdgo1wvu8jmi42KE+aCI3M3zW5E/CGKn+gQqPZkZEv6r7YirwjyMYAcJDW6tjhIS6uDS1W72zTlyshOTqJ2ejzw3UwTcYM2QcbCdwybxFzfyJj6AcrX1RM9X93ItEFhsxRrshDC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aZ9xzG0X; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aZ9xzG0X"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7fe97255d23so1268569241.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 02:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716198080; x=1716802880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uuugY85m3skoiVn07kJvXcB4zJBbm3CV5cNkHDjjBE=;
        b=aZ9xzG0XRwlnWv4nP42FIH+tiSnaFlqpvRqqYwx3DSorkig6BcVA3qFnSFrId0ELK7
         Gv/o1Mx2ihBDvkhu/Scg1hZnT+f9612AJM1FqubzNMNcoxI2JbLK4/aMnWHw6mIEBoJN
         aY7/rm09UQsRSwh412d1d0Kl9fxuczUH7JyAuedJRdMlBbPtnX6YJ48P4C/WCvd4o2BW
         MH2piopsMHJxymHNPRZ5Sv/EPB/kGQxN7YpQCQxg6+V554VEoigCledMjif+zlYwNW9W
         I7cLu3O0hQIFlTS5Uqx/0PQ9bUF394LAMiaLAT4hPkyw3A/eOmtPjUJ8v4sxaTHvfw6c
         veDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716198080; x=1716802880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uuugY85m3skoiVn07kJvXcB4zJBbm3CV5cNkHDjjBE=;
        b=Ui8IPlP06Hfs8Oe8Y1u/UuB43nzOnWJBA+Ae/5D0J/fYej/HLvFHq3al4N01jtL+rS
         YLJrFS4WkCie41Z12JngH5BymLb5acEjqY1sNGpZTNkVC1lhT7Wqxwz3iZrH7y0/IPsH
         FjscKth6jFEz9wCAOQg4A779p3sHdkYLz5JTkphH5wnSmdCTks91x+FPGjhSWVpNCnIi
         slIE1MFwvx5aQnHPxerR0CSXd38lXCmz95YdgFXAM1K+TzobQ57Zs2QwY/VqsoO/oMX7
         1zVGxFkkBuUBa0Bo0O25bIevPm31CQyCSMGLMIs9V3JqumhpgDLgXYJIr9sV82lwLTwV
         KZ4A==
X-Forwarded-Encrypted: i=1; AJvYcCU3U/kDc59Eu0CGJZb9/NXPlaoZsItAIyPjTj76tdtAIaVlJV3BHRWx9Kk4BcAp6pUCeZ1Q0A10uMC4nelNpcU5jXgXE3/9Q9SEnYnBH8o=
X-Gm-Message-State: AOJu0YzOyUwAQUp9h2wdmjzESGbWJlQfBVe62NlsAn9AONXApj66czHv
	h40coJOfhRqQ0jhUOLBe6rATDz6DdRmZNV9/41JDnOuWBEP2G+lgRizHkJ9wg4lUC8VurKKZuFX
	uZg5ge7YDE14m+43F0T4ARX7bN3lzR97svb/u
X-Google-Smtp-Source: AGHT+IHIRXk83gqTUdQImOJqZPIX0uv6AUm05mTPSzxJ+VjagPZfmFf9nOGa5CXpYjIsVt4/l7jOnVOm53CKwZsfOTU=
X-Received: by 2002:a05:6122:200d:b0:4d4:e92:1a71 with SMTP id
 71dfb90a1353d-4df8835c8d1mr26014914e0c.11.1716198079941; Mon, 20 May 2024
 02:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519211235.589325-1-ojeda@kernel.org>
In-Reply-To: <20240519211235.589325-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 20 May 2024 11:41:07 +0200
Message-ID: <CAH5fLgjiKzmmwTrfiAx05tzFYVHDQUsiFmroMcWd3t=P+f6spQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: rust: move `-Dwarnings` handling to `Makefile.extrawarn`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2024 at 11:12=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Following commit e88ca24319e4 ("kbuild: consolidate warning flags
> in scripts/Makefile.extrawarn"), move `-Dwarnings` handling into
> `Makefile.extrawarn` like C's `-Werror`.
>
> No functional change intended.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
