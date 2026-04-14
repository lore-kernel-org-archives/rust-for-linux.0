Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BC83B8BA5
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161028; cv=pass; b=ICA9dBsjvQtWNt8YoRWLpSDGiKgz3zhvBymhDQoJIByz1hY1TP0XD8sC6bnnqUB8ITdqMCsfk1BPneciGV8+DciBORpFe2KPiwcYZq/DQSnPMChWg4MLoVstgvctUuREbwqA+GOrOSnkhfLw20N8rQ9avONE6Y2/o8SD8g6+mA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161028; c=relaxed/simple;
	bh=NGw3vq0gGYgbZs3WougDNYv0+luak2LML/PW+q8OygE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVl1xcGRgvm0l921NrC8PzqYP0HSCTMTPy68lfCVfZOHOp7kqDe8/ZSyEbxkqbpzc6IrRn2NI6CVr9+c0lWxnbUFAPUtl3x8EHsNGsLjXnOxjKhiDXhEOYTNMaCCZw4hbxtCwtv1B+lqwevAalforJgLEeqpXBOEz1x/1eqZFc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQI/D51c; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQI/D51c"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-127337e3870so826724c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 03:03:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776161025; cv=none;
        d=google.com; s=arc-20240605;
        b=OBegkyNP3vU+TunjyYNGFSvNfentyguYTXTN+WtU8/13Mk9pSPkwBskqlil8w0PxXR
         i/cPWdbzNqq3xZBtDbASVweQxdCIDknZKJ3EKq2qN3GZyLhTz1gYYrpA1OgPgpkLL+ZS
         KOos8s+PXQNHq33KgE8SuSpRIkTttM9STjNCmtytbK3QmvK+I6K8E7HUaS3rvDKwGJU0
         NgfA4zgd4Qy48VxwMSXw1RJXykrL0evlu2KtmSzXGk8EaMxfeFLXSRt5OIRPI9+tq6pM
         P4VYorj7rVCg9y0A+l7F3ttUMcG8VHdd0lIRWFHz6J7qbke6TMaX1b+Jgc3r7O2OXvQt
         r42w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NGw3vq0gGYgbZs3WougDNYv0+luak2LML/PW+q8OygE=;
        fh=WAtTLJ0StRr8Fexlh8AKr2e/oRyoEMtOSYpo1mmqWrw=;
        b=ToixnSuBCYdSSySyCrTgJtaeGdAW0MXcx7sgJepsqCMzMnPqLgCEjaXKwbqVoycheg
         Jpu/ukQsF4sqSOvB2nuYED9ClMKqE9d3haoGjKndz0bhqzgCQ0qyHXXwyuWmm30sR7Qp
         gh3hdXKyfXT6NmF7FDvT8NHxzFlHukj5PKuu1eBcYGHir2Db9w505yWJaaXlDItnQgYe
         5/sLBe+AiiwG00wHHhUY72xMmxoCSrKUUGpa1MgcgmsQ2GHqIxVEhda91oJmgrOCiq9j
         b4cAH9RyBoatUdgf191iL0HQ2T/fJIm1HBgef4CQgMWFt9yF7ywhTdrhswWrlGC47NAN
         aY/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776161025; x=1776765825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGw3vq0gGYgbZs3WougDNYv0+luak2LML/PW+q8OygE=;
        b=bQI/D51c4K+l4NywAhMHn/wITsRY3N2eBGXJ7D/EXUlNovyKkLwxY6DPb9vmPK8mvj
         zK2mMztTYbJD1j4J6R9Bd6ZcudHSuegN1qoPDJjI0epH7Kn+W8O/1WFqzMIOAOIt7dLU
         E63X186qMidr+i8ys3Dcxd+1s7PJ0hvivDOlYdOdgbs4bu8jzHRK9T4lfBtKMfHrsEbR
         YbKYJX6G2w2rTy5Mqt38a2D9KhrjuThxrexQkeg9U6YpbCr1LIF3U+2byv9KOFw1uDEV
         BmA9ouHNU6TTlHKnVBlwq+faFjvNfkY62/rXq3XJK75+JT4l6aOz5/n/YLMCZbDzdHB3
         Dumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161025; x=1776765825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NGw3vq0gGYgbZs3WougDNYv0+luak2LML/PW+q8OygE=;
        b=LIzdWZEhJ1u/Tc1tAz85w479VzPpQxnVhPdFvlAvWsUIAM4yI1J06AM7xpeFGBz4Gd
         40TL1fHV1p6/tp0+updN41L18IsIdo8mTOoprySGcD+wDV5RKyPOJzjxbV2/DStixjBM
         4OOZ0kxwaRXstJBfdgvhm52sYCyl0LdTXVkmk6c2iI9LmpRCF/cjqL3fA7CgoLQHXmQa
         2f9kqSfUwqLQKVj/YSw+XuMNoPpSUEKrAtgaoSgFK7qCy+4bHB3SaBNSf+hK7Sm7O2pH
         Lj60psoq3t6x7prHp5HDihBBiQLk+qOrmByEXxubD1tV6ZIPqQjIsTmiCmmbcGZNwmha
         T+/g==
X-Forwarded-Encrypted: i=1; AFNElJ/2KLyiUWkRvezCCIV6SPqVmFodYozCZGTGZBvWeif3v2i2YwaONsG8DbOG/vsQVWyyaj3PXlPvcV+6gxz+FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLanp8QvxjdENeuU5zyzUWBNZ7ldx55jjfFZuN+saREg0PJ1mc
	n3NtMHoJ52jg+fF2vC6lOEhXaBGrFd0G9DkEHdPbwfXMlLiH3PkhOnfd0ePBlXj/MLX4lPvwj8C
	wtGyjC4Tygp/UNEjopwa4hWIfGbDJ7YM=
X-Gm-Gg: AeBDietzEzQ94OFXkkJX4WCE/4Yg6kIHTX4+0yBVKcS6WJBvRNkFjKqYJlwblccNmra
	QXIYG0Ynw2Alh4/7pdXt01z59hGd8jpfJlzxdHmnICwXVZs6WOwaukKLmd0KGuoMK3PupYwihnX
	kn1EWipz39A2evuCV3boU89TOrU5bHVf/MZ+EI5LDtSXRx/t5TCM2PNvnCSO+Dx3yIvf+g/M35O
	XOHbDjK0mVeMhFDrOoruVstZgusfF8AYM5SI9Bgi3pTY71QMjbsWfNh6NAKBlG7hB7jE0Y9+DEC
	Lm8IZhzouvILGX2tLMTuiSOVnj0OKaalziyjGvMOtm6x9IUxrhJO31hCED5+aBuhfy6kvMVCg4P
	3If1CemKb30HCI53JV7L/IbI=
X-Received: by 2002:a05:7300:6da6:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2d58966b77cmr4005329eec.3.1776161024897; Tue, 14 Apr 2026
 03:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414080500.320095-1-r@hev.cc>
In-Reply-To: <20260414080500.320095-1-r@hev.cc>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Apr 2026 12:03:31 +0200
X-Gm-Features: AQROBzC466LTvnRS_A9FBMV0x9gLQuJNVW1COdEXUuheC7eprPjxu95Elog66iQ
Message-ID: <CANiq72=c2wniA2piByZNUVzSUA2YPhRPKBq7e_bBP-69Lo+wCw@mail.gmail.com>
Subject: Re: [PATCH] perf build: Add clang and rust target flags for loongarch
To: WANG Rui <r@hev.cc>, Dmitrii Dolgov <9erthalion6@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	loongarch@lists.linux.dev, Haiyong Sun <sunhaiyong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 10:05=E2=80=AFAM WANG Rui <r@hev.cc> wrote:
>
> From: Haiyong Sun <sunhaiyong@loongson.cn>
>
> Add missing CLANG_TARGET_FLAGS_loongarch and RUST_TARGET_FLAGS_loongarch
> so that perf can be built with clang and enable rust cross compilation.
>
> Signed-off-by: Haiyong Sun <sunhaiyong@loongson.cn>
> Signed-off-by: WANG Rui <r@hev.cc>

FWIW, sounds good. I guess the commit that added the list should have
had it to begin with? Cc Dmitrii.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
