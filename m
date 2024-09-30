Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB4E19994A
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 18:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727721942; cv=none; b=F8GJnFphqsVpm+jWI3++arQcyrFwxb2ysHjk3IXFrP5zKrSANaB0wErz2wgJ/+4J1tYRWKizG44bCSzor6/KnXGH+tP86ySkjFrVMQyVQ2vwMGjRwcvoHGEnb1IUAVN1BS9s5/+isXAn9mEiXKSULr+0dZx3o7037NMeGqE7HNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727721942; c=relaxed/simple;
	bh=8fsVViwz1Eq28nPRfLjqyeE9mXV7vGCubu6QTTrDqdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tlsjCqLEsrKuOwHyC5LMdwyBay2VmxKztT/Jy0AAxMA12ZcSO0YY/3bYEHr6ClxB5jaKYXGbky/mhJseEvbvPIFS19AKn5oIbcMDJOtaqtGd6zAbdRVwJ/VnDxtjeNcxMNCV9N1ig3RhmszTpGzQcKDb5qWHb6HyoZ5iaZeJCn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjN8+xQS; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjN8+xQS"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-718ebb01fd2so670831b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 11:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727721940; x=1728326740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmktIMftiOGH2oJjpzxG59Z8Pt7HbqS3oaz4FxfEfgU=;
        b=TjN8+xQSa0kr3gvKSHmGLabHlc/+jlKee1xH41dJK5caaVof1MTwH79KEjrTYRQiPU
         32ZI+kwboY2tU68a05728OZcXkpJTB7l0KOLZGM+7c0ys8DBLi2eK98WA+fs9I+DahoW
         TGgIExdBqbM+VCZS6E0z3kMvB9DTeRoM73oS/FkHdaxPg6cPgIdnhD5K8cEsHkC7G92D
         TJaUL0efZ4wIeyt3lv0Se+rhET9KJGak8yKoTmrDawPtHSnECuU3eEP294SuX42W73u0
         Csrb9R4JFuUOMBG6AvSmin1GYCujrHKl9nwbSCxMqQKhu5nbYjzu2MtiQBlWtD/CySg8
         SXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727721940; x=1728326740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmktIMftiOGH2oJjpzxG59Z8Pt7HbqS3oaz4FxfEfgU=;
        b=g9GckO4b/icE8i6Dp6IDLgWO90PNjhBbf83REtfhgqJKCZMCE+Gd3ndQtonT9ZLXxR
         EmEPo6XmZtmKIEEC52iTHmxd42ybRWc3kzoj1Bztn59xv8kMhCwEZKsYXGq/ipq1kvKr
         rCEhtOvoPyoSX4mOL300fXRsyYwRr1hI9ljOdJ+23eNHeGgFNf60ls2YcH1ZXsXOcaun
         /6QvCwymJW7Gg8zfZyqjj22g3XO9cXdkmh0wXzUgF/hZY9uwOpoEYOQ7tg0iRGR36fhz
         Gl3og9wdG91+hzlxP0kLG29vPZuqwXY+ecFULjtyChttda66fKYH89kMMZjIC338E5Kr
         IsQA==
X-Gm-Message-State: AOJu0YxSI59hoxfmkMW+eP/0iUGPFUJ3LgGVEZPGNe52dt2FCwbqafZk
	gUj1ctJtYis+MG+gra2OOduu6bucgYatsYTkS9X8uUKbQkkhD+ulMgZ3sCYTueRecpnCzoLq3DN
	6mED9zrI/9XVZIwYMe6k4SV0c8K8=
X-Google-Smtp-Source: AGHT+IGJjhKLU6bKAqPuNWNfqiSrUN1WVBdinfzEwJ3Mo+dYW/pkiHCyS5kN1PdBvB7dRtc1aDVaDRPeQWKYQNkGsKs=
X-Received: by 2002:a05:6a00:2392:b0:718:e49f:246e with SMTP id
 d2e1a72fcca58-71b260a8a3fmr8374217b3a.6.1727721940372; Mon, 30 Sep 2024
 11:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926050015.3216641-1-dirk.behme@de.bosch.com>
In-Reply-To: <20240926050015.3216641-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Sep 2024 20:45:26 +0200
Message-ID: <CANiq72=JSqQoF5qPUz+jA-PPvxDt2dvBUAV88i0wjrCZLYSDow@mail.gmail.com>
Subject: Re: [PATCH] rust: types: extend `Opaque` documentation
To: Dirk Behme <dirk.behme@de.bosch.com>, Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Nell Shamrell-Harrington <nells@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 7:00=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Update the `Opaque` documentation and add an example as proposed by
> Miguel Ojeda in [1]. The documentation update is mainly taken from
> Benno Lossin's description [2].

Co-developed-by for Benno maybe, in that case, if Benno wants it?

Some nits below.

> +/// It is used to wrap structs from the C side, like for example `Opaque=
<bindings::mutex>`.
> +/// It gets rid of all the usual assumptions that Rust has for a value:

Nit: we typically leave an extra newline before bullet lists.

> +/// * the value is allowed to be uninitialized (for example have invalid=
 bit patters: `3` for a `bool`)

Typo: patterns.

Nit: we also use periods at the end of sentences and start them capitalized=
.

> +/// * the value is allowed to be mutated, when a `&Opaque<T>` exists on =
the rust side

Nit: Rust.

> +/// * no uniqueness for mutable references: it is fine to have multiple =
&mut `Opaque<T>` point to the same value

This may be surprising without more context -- I asked Benno if
perhaps a note here (possibly as an implementation one, rather than
the visible docs) on how `PhantomPinned` influences this would help
(perhaps a link to the `UnsafePinned` RFC).

> +/// * the value is not allowed to be shared with other threads (ie it is=
 `!Sync`)

Nit: i.e.

> +/// This has to be used for all values that the C side has access to, be=
cause it can't be ensured
> +/// that the C side is adhering to the usual constraints that Rust needs=
.

Nit: newline here too, i.e. paragraphs need to be split.

> +/// #     #![allow(non_camel_case_types)]

Can this be `#` instead of `#!`? Also, please format examples the same
way as normal code if possible.

> +/// // `foo.val` is assumed to be be handled on the C side, so we use `O=
paque` to wrap it.

Double `be`. I think `checkpatch.pl` with the `codespell` feature can
catch this.

> +///         unsafe { (*ptr).val }

Examples should follow the usual guidelines, e.g. having `// SAFETY` commen=
ts.

Thanks!

Cheers,
Miguel
