Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A480111CA9
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Oct 2025 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915437; cv=none; b=YyeIh8JYPE8UA18VQ5dT32Z40yPQ8CeHVDfhuX3I3hfeqo2eOZrbsN8/Tu439LTij/NQJ8GACT8VY5aWYZ3wZqCrsz/phavIpC0CC8YZ82DkXwZYAWPbZq0Cxt0eB+qkwIMF2j8wMySdxx2mmLNZwORu3E5NduquDtIQIF7sK9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915437; c=relaxed/simple;
	bh=57XM95AelX9DUBLfU9THwVSSutS8OZT8Oj+HWgG7Ons=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pc88OJsTQBouKWAiiWQmEYVkwpXbJCuCaKmc111VSsbcegDu9YqNvN8P5fr8N/9Z9UWiSwdPTjCCrR0yOiIaeGX0CSosG2t/S9pn7ESbW9wbZk3VQA41a0XklN2oI4VChkvIbzvI2ZCOfkD5PY4XEvXVuaHCeyvbCoTT0bulYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fx9INj2v; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fx9INj2v"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3409c8626easo59884a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Oct 2025 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761915434; x=1762520234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57XM95AelX9DUBLfU9THwVSSutS8OZT8Oj+HWgG7Ons=;
        b=Fx9INj2v/zscGtylqr7LuT9oOrhVNAaptHEDLaTEIhjIXv+edlW88reBW9iWrRsvrl
         el1j+Vtv8ANRYj7wUuqVGwf8LaMzKdY5ESO2mYiYa8UE9J/dBekJ1yvfdWou4FdYmu6m
         F8T6+NZQY7atZn6LZ09MoFWF+E9O6XTsOArTbOlnBv23KAKKFpVWxiWcVsbBp7pp+27/
         y3kMy6BgMLtP4VndSGTeVz/P+R9V7vOuTCUIp4nk7ApM69jJn6VgqY3iEXJ52XCvhaTd
         iyPyFdWpDSx68PN1J0ucNN75jES6QvH8Skeo9nufrZ2SCsEqScR4gOoRHfzmitSkoqhF
         H21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915434; x=1762520234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57XM95AelX9DUBLfU9THwVSSutS8OZT8Oj+HWgG7Ons=;
        b=epgQkjz6cdem/M99ohdp1gSbklqWXJDlZmtlpD4DgOT1o1bx9E4evf0xXca/S1Zv+r
         anit4XPD7AXb4pdo/ZQ3EXUg2e0tgXKd1D7m056nHKMbr4O8wPOEGSw5rmwv1puh+mWR
         +6o+IkBw4IT/ELr21jt95uhbwLxNJfabKI6X1yxF9CuAQRT82fNnJmGeNp8lOe2rF54Z
         NeRWdDd2LV/EAs9dYfS3BkRO6YtIW71JcKALc25ypyUtDlU+xBTKzmPAaPO7j+LgufmR
         keYJYy+iJGPJ5XZ3BcG/qw1EqOEQwqAfvKR59VSl0Tq9f2YzcnSqF3zem3R1nJvBOsCE
         5cxA==
X-Forwarded-Encrypted: i=1; AJvYcCWduYelb8u3TkBHnj++O8jtnCu7i6VgXCpPr+26/XtxdQs4OQhUqGyz8nNPd9dKnBwIyc0wI4fy9jeTvYXPTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCihWWVlSLeCCSaF0Vi+JEDyJlAmd8qs35iRyNWt6QktZoEI0t
	m63C2M4lUlnAUxj6/9OS/q88w/MvZmaQ4zDl53avi4gjozDPRTmhelCBCIpvV2po7npmRjIHmWn
	1+ro6iuAmUZMlHA3puJnHmNxlkU3wu+Y=
X-Gm-Gg: ASbGncsNyL/zWBmrpTCf+MgWIFs+/NGmo1t5v1dUg7ucAIzJc54gB/RlvJ+ekwzw/QE
	KvdesIXJogW8NWfPIHrAczF70tXJ4iadaSfG0JkQs3mm61xXDezg2FLldMlQwTg4wzMnxSnjKn6
	PYNIcEaw6jH2dbMzTABL5iE0mT5hdAUR1oi/xPonKcwOmZDq7mKJeW4SvhxD2S7ZJrM7B+YWRnC
	9Ri3BPHmfkCfHG6EkLCScZPCm3+EPkH011LbUV7uiKowq8VW6jxyedcZKlIhz12PnB7bI81406C
	t1t48P89CzDTUxEbro9K5UDlW70dZy0PX8R/0GHCiHnaWToukEFGUvLk2SjUExSamytTKJGNFi6
	PaDwUgNKb6lq1BQ==
X-Google-Smtp-Source: AGHT+IFJM+PQMbTXmTGodnAosPHILr2GU6NSMb59LbmXplfAnvliIPhU9LCa4gpUD72tPa8WjMFa+1grBXZZatyQfa0=
X-Received: by 2002:a17:902:e887:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-2951a3d2847mr26244955ad.4.1761915433746; Fri, 31 Oct 2025
 05:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
 <CGME20251028122316eucas1p2733987cd4c1eb8f83d6572d542e76d2a@eucas1p2.samsung.com>
 <20251028-pwm_fixes-v1-1-25a532d31998@samsung.com> <h3sivr3uuzr5oodqe326svchbw3rzo4f4nw4chpeee2jwzjq3j@bdtecauehkn4>
In-Reply-To: <h3sivr3uuzr5oodqe326svchbw3rzo4f4nw4chpeee2jwzjq3j@bdtecauehkn4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Oct 2025 13:57:00 +0100
X-Gm-Features: AWmQ_blGoLkmXXueKnCk5kJ5O9pXLS5GlmxYneYVuP4K75NG97cEfvhzpNZh5XM
Message-ID: <CANiq72nNxVJeMZdESrrB+LGmdRK+M5AGZbUw-x2aE-Qa-=HtJQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] rust: macros: Add support for 'imports_ns' to module!
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 8:47=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> I already asked this in reply to the cover letter, but the question was
> lost on the way (no offense!), so I'm asking again. As it only really
> affects this patch, I'm doing that here:
>
> Can I have some blessing to take this patch via my pwm tree? Would you
> prefer a tag to also merge it into your tree? Then I would apply it on
> top of 6.18-rc1 and provide a tag for you to merge.

Sounds fine to me, but I am Cc'ing the modules maintainers since they
were not, just in case:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I think we don't need the tag/merge, unless someone else is looking to
use this (is there such a user? I may have missed it).

Thanks!

Cheers,
Miguel
