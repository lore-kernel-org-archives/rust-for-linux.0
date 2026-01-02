Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E068FEEBB
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 18:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767379115; cv=none; b=dixN04qlbp5pC1za42b4SOmUtU68+3Z6esFEE5vJ/NXBMXEqjbF/FovGP1aX7S05a0qYtyzG0nLx98Ye8p8H4a4cNP51ZsC++exK+gcYoeeQPLZFLSJlFVW2OrdzlnimBSLTerj/5fpulgLKDaG5wbQ/RVTdBB60e/kMFJ6Lxo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767379115; c=relaxed/simple;
	bh=pUHLWvFkyZ/J1kSrSv+TIBOWe/9sBIuOXE4DWADC3sY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qH1PF3RFQ05mJEOdCV/6nRTs/JjI/BrzZbxxgeioEm4fMhiVpu+hJlenDIvgKoUIoLq/JVIXniPw1y7Di7GzyhQmf0I5j73BAXGOfbTSUsrPkEWutmWIqYglJSSO6Z5CS0fIodfIwsdJmXrwG12taUCKv3jrtyH/5GH+2aV8L/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJGxzqdP; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJGxzqdP"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37b495ce059so93510371fa.0
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 10:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767379112; x=1767983912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPH/BJwNH6Kjka+aAFpB6N63kdPW70knn43uWJtwB4Q=;
        b=FJGxzqdPtdJq0plmHgFo8NZCVFf5tQfv18IF9fJSq8SlALmh3n0y/XOrIRLLlOMDSR
         XeMWdWagumQWXCSyj3WCJsx+gJVyY5j4gdEqyPnadgRlUJuZbyK3g0qDtMsT6J7ZyLD1
         akiBg7aT2L4HzH1mAyI4pOVlXB27AGPEmTTpzPnERzR95ZsjEqjjXZGwxMaFj9HDqLIS
         Ya/0F4FJOLVstpi3BPIVlqNNa48R69jJAfY+F32Bg261sRm8pJuLwQe0fBDX25WAnANO
         XaiT3V64bFAYgM62SgUYqgeUItQgkDUY5L9Zlmlouve6C84/lokAQFFCXo+bsguACwHb
         KrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767379112; x=1767983912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPH/BJwNH6Kjka+aAFpB6N63kdPW70knn43uWJtwB4Q=;
        b=bZ/wBiLbktIWEJJ3KtxAKKGiO/WxxrhTWlX+Nnfq9oPTpPz3LQqQcmsSiOYX8NRxIm
         f8TOii1pFhkJhoL2OyhFGUzpTvRZ3NqnNWCLT/aVXwKxapjQHHdplk9TwcMoFtPBrIOC
         dlupEq+VkftJu3awabpX6QqzkU2gRWCFpIRxe27CLJSURngsUw6mvwTDyicX/S2KtgKQ
         wiHixvGgzbVKqThDAifXDlvr/sRN/nLyq2kO30/o1T+uJq8d4VNtMRn+qRjYZ0gjMZCU
         3sT96OnE21bRPuoW8N27p//Ys0acELGJaXtyX4zdib1JdKp+OCdLBusBELGEN+Bibd41
         DI1w==
X-Gm-Message-State: AOJu0Yz/Nijx0opHk0cExRndbpf42BeYDBmid9fKkOeOk3eeXX7hEDFu
	W6K1fFCy2KsBBg3fKzt+zXggRLYATce4oD25+9i+X9LAp0wpoU7MvuqKcjy1aOlOY5dGtZ0GYG0
	Jj8lIk6bXJDB9kPziAwBVmlm1kVSbR+4=
X-Gm-Gg: AY/fxX5c1uSJCP98OlDVB2IEE2vndG5s9O1tMu6hHoHuyuMdBJAVIX8/ChSPRv+dJic
	gBQOtIX4T9W6jPpxP6j7FpZKhbv7IodgBxqS1rfVFVlVBIwGm+1qfIik49nhO3xliwEs9H+JG09
	8X9wCSVUGYtKrA7cf6Exkl5VVkn2+02/VPlRmwXFmbnR7IQZ5h5LaUQ3+OwfLnJdL0N2c0z3oSY
	vDXr6WfvlSXKjvJ+mbepjqqcu4etudifv47ylpP5ZgtyVZNEdBxFwNEk6a+XuW+Sx+yv1G8yK+N
	beDAw0XddQbV7w8NiG55HhpQFIPRZKVGL4ouDApsg0WFXUj+xq/8eDJqQoALSaaO48wOeUa3tZ4
	kAhUaXb6p1wMRIzgdslntUYlvYkx9gz0AJ9lyS9oEGw==
X-Google-Smtp-Source: AGHT+IF1cfdYPjqLisMA/O6DKrPs84DgtJWgS9fM3mQ9SCVxtb/2e43pFKDTD8uMHkuRXCzl4ihna/wZEoX243/+vhc=
X-Received: by 2002:a2e:b88f:0:b0:37f:cd21:6acc with SMTP id
 38308e7fff4ca-381216059f6mr143206151fa.25.1767379111658; Fri, 02 Jan 2026
 10:38:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260102084821.1077864-1-dirk.behme@de.bosch.com>
In-Reply-To: <20260102084821.1077864-1-dirk.behme@de.bosch.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 2 Jan 2026 13:37:55 -0500
X-Gm-Features: AQt7F2qnhAEw8HFlhZR8nX5v32l3oca_CnPKIB6mmXSYrobEJ40QDtH2rV7lBSs
Message-ID: <CAJ-ks9=Q5iwH=f98HcEGfttfxFWogEx7qxJjjDoKb-pPO81zeg@mail.gmail.com>
Subject: Re: [PATCH] rust: fmt: Fix grammer in Adapter description
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, a.hindborg@kernel.org, aliceryhl@google.com, 
	dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 3:49=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
>
> Add a missing `and` in the description of the `Adapter`.
>
> Fixes: c5cf01ba8dfe ("rust: support formatting of foreign types")
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>  rust/kernel/fmt.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index 84d634201d90a..1e8725eb44ed7 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -6,7 +6,7 @@
>
>  pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
>
> -/// Internal adapter used to route allow implementations of formatting t=
raits for foreign types.
> +/// Internal adapter used to route and allow implementations of formatti=
ng traits for foreign types.
>  ///
>  /// It is inserted automatically by the [`fmt!`] macro and is not meant =
to be used directly.
>  ///
> --
> 2.48.0
>

Acked-by: Tamir Duberstein <tamird@gmail.com>
