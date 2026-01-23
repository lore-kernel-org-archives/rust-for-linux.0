Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9568734D90B
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161585; cv=pass; b=BDscAHSx3XjpTftQwmJdd/8mBQ/vKJMm9v/zzae3aAn3/U1d+fwW0gpoS8USgL/UATP8isjGyEh6Gt0amzbmNPdpi86j5u/M4fAWrb46/dh99/ciB3VLjnLubt5/LhOHx+4xN8LKihaBWYPJHRwcFlp69sVcFlOdeO8iQBISKXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161585; c=relaxed/simple;
	bh=SGU0lW3PpoR/lCJr9zaXHdWSyoNp9uzel31o3OqO2iA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enz5n4hwd2SVi9VBsGgxtdquc5zmW187S4d7sEraWJYJk4zjbth5HVJl4w5zK3/OSeNMIkrxUH0m4kcby69uCVd9Z8UTa9edEoLWrbKgZKXcrv6UsOcNvqj5GuIPh7VQLtox6U/PiLURcrhafUAQh+67stHIOK6J+KTq9RHb4GE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtCVATXs; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtCVATXs"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b1769fda0eso217550eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 01:46:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769161571; cv=none;
        d=google.com; s=arc-20240605;
        b=i5Z/89BNGQVx7URMjin8iEGtdduoMB4+auPJ+rLc3ArszmrFBYo7Ca+IzdiRXvFy/Q
         4w2S0SMJqAkydcDgKFLHE/DM2AaGaQob61AK1K2zVSnVtWqCUsAWAsyT+SNuI3hF9l9U
         6xyZG/8+NYYy3ZPItZa5lsodc4wIZuRtLmIAVHjJ5KCuPhsIZr3HOj0ts0wzu0F5W5YT
         e+aNBM8nCNlJ6e/xLiw2Ir22vHJAzht8pgpHIq18OXEBJQ/01P3IbK7c57SbJDoY+U0C
         F3vD2FgFKEATgzC6ypR0w8hVcSkapnSX/AYDDOyTdZE6po4mQ7XnmDvmLW3fPmFlHqos
         0gZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGU0lW3PpoR/lCJr9zaXHdWSyoNp9uzel31o3OqO2iA=;
        fh=blorPgLJi3U9Yn+uaBeXWnPgvPv6tOy4/qsHH0JOFfk=;
        b=iZUWLdmCbrn8aCwurAAK/GHo/59zskKQ2ZRAypYUuLB/uZ7Fm1DEU6Ishmnu+Sd3dX
         BbW9FjZpOr13yP2NEkbfbk5X3T97xlPvaT3k8c1IA+0t0uUegKmwA7Be6HF+bOruaI4B
         Xp4t0xEFTFVgg8V/Z+nh02nj4/j4MWAFS8llRkSz9FbRR3nO5zrZT+iXCUH3VVPz2Alr
         9A9CH3Cb/6XKzNfNHQaAD6ADG8xAkZhDII6FiCkUAiPK6g4/Ps7FWjeAJuw2XqbHajQl
         FKJDVY7El1N0shAU9oABH3b4USK+v3xfTLfS7kqRvy84sb0y4V5/Q26NsRjIq2Lu6uA/
         jSfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769161571; x=1769766371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGU0lW3PpoR/lCJr9zaXHdWSyoNp9uzel31o3OqO2iA=;
        b=DtCVATXsO5ail6ibN1GXlDcFwQfuG9+/dktdMsLHpjUT+9vptmUgwzEL6WCrK2Aba8
         Xz3mp6J1QJHVUVjaDYO5cVyZrS5Ofk4wSvCTgBGs15qBOy2RdfiN/MUtycE/WklikyYe
         DdaUU11Z9lHX4PeB36ANplJtPHWz3Ch8TwxxcyvKGmcFcPAMoiIqsRszMp39eVJg8BDA
         4zHvcUftcL/+cvckUpEBbaEnc9qhoF9B4nSom+mHUyqjQ2bBGEZHPsi8EgnmwcOtL3M4
         1UVz8NZcmt3CNexBCJdrJwIES4Zj9KlwHjA3Ce5fFcoWs7J/VrKzNCLvbUUCXsNfmOIu
         xRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161571; x=1769766371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGU0lW3PpoR/lCJr9zaXHdWSyoNp9uzel31o3OqO2iA=;
        b=gcaHT60QYTqyJvJJfFk0m6PdHD4wkNeiD7SQ3wIVFHXONMiF+23yce0e2W6+aMplVf
         y0JiIhTaEaV9xw8Ve8RpYUzaUqL7lrkeIi/gCS2nPvTPjLS15T3rXgwO0CZZYQJV8qZz
         ebP1WqwNBPfnvMcFzETD2c4j8KuFuTneZIAmr6l9ygScrnEhfBaIgZwk1sMJgNxY9TCG
         x9nttS4UK/VH13bikNGRVYBTV8+32/+qFm8AEVOx4SJtBRiCfSAiYX1GlOhI3O2HmSTV
         m6B/sDfGS4OkgBkOo/7Ag4ImkrGGsj9SyyVsLJG12p/tzbWg34MTvGPTbHeI4Hj4e91C
         GvjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDmYFrMcsuKmHiOfkcir9wXEvOHsXnL8zfH6LZTCAm9tne+1k0bYvOL8zHUsks7y7zKqCA/ayUbaehis2IpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy6uATVGEdxhG96ahGELuGvEWPFjLA8XCfrwWmovil+NoiG3qf
	BtK9QtJ+flhskg1VAmKknzASQ8t0VHDBhYH7DtcKT4OCoT7+3dWqlMKDCycktSpTy8dbVRxdgLS
	sQ34/DUpA7V1ZOdmGNIwV+2luik9SeMk=
X-Gm-Gg: AZuq6aK7jhav8oFzk8uLBEPdMMdNqrIuJ2Xf/uWV69ibs+rUScPWmdkeVkTErFlAurO
	gjPdFmKo6z6zSRe2Vx2XQdVfCzDYa4lMkLzJ4fDIp/U6JzcGAiURsGFTk68IfRCkZqnyQtE/bt0
	Fg8/mHr13T2d5saNCgRx8+pVYS4mgJczw3emXcEluJbnz5ArFTYCtAbkFY70EWExxAliwRufcyW
	sY9IfseyKFZE3QPKKZKaPPzguVfnllFXXqEgyUBo4pFkif/bA/TUYNOz+NqTg23tMREG456tFRj
	6mm2Q4EoJS56606X/Akpq1aBIltPVzanna9spgVzMrKCAEbqrf1PX2ircyfim7Qdwuf/GfMlLVr
	RLBHCA6fEIItY6nrQsANRHXk=
X-Received: by 2002:a05:7300:a507:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2b739bf315fmr648075eec.6.1769161570560; Fri, 23 Jan 2026
 01:46:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122054135.138445-1-ojeda@kernel.org> <DFV3AZV2J4YJ.3CQRIB59QRYBM@garyguo.net>
In-Reply-To: <DFV3AZV2J4YJ.3CQRIB59QRYBM@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 10:45:57 +0100
X-Gm-Features: AZwV_QhHw90EZaZIJJKDv9gslrN-7AVg8Fw18aflMn16Hilz5QP_uwlImwMcIjY
Message-ID: <CANiq72kvNbaufe_V8pwomSa9ZqhuR9XgzAtiuT84HRxcDkDD5g@mail.gmail.com>
Subject: Re: [PATCH] rust: proc-macro2: rebuild if the version text changes
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 12:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> We use the same trick for multiple crates now. Is this something that can=
 done
> in Makefile or it has to be in the source?

Good question: it can (we do it for `core`), but Kbuild preferred we
avoid it since it is considered an implementation detail, so I only
use that way for `core.o` since we cannot apply it in that case since
we don't control the sources.

Having said that, for the new build system, I would prefer to ideally
generate this automatically (and then it shouldn't be a problem to
depend on that since it would be a "single" place to update it).

Cheers,
Miguel
