Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E08F308F3E
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 06:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737049; cv=pass; b=Lh5QZPiG2Vak/2lQj94kJxvIFQKAQ1qxvS3d2VO2ZSZsO9uDIAiwf0xYbV9HoY4vPzkTdAgDt/+r3LrKwtWuDcF2noTzMF8XI1ZQ7cQb1FAIug+1SZSTIharIPbjM+EWfNBRKePFGI3JvUu03SOtHhL+pm35x4cb6vbi9Fls6O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737049; c=relaxed/simple;
	bh=Vud7PaT1VUqc41R/KxUTZRAgv7I11MadSnh5c1uI3AY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFUz2aI1ZucV7W6xvQk5FRMAznqn+W5xj3I/nM/wjccuE+hjw8B5c8ZpNA/FkRODjEYAzJ8gPPJpaZo4jiG7IWvsLMf5hl3qTaTSA+o7jd2n0E0EOA5oJazzKAThQeObn8sleENXJKZic2jrFzlU1RjgbixcFpwRwknnAwdlr5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ryWcCX8e; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryWcCX8e"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc8311c6ddso1693225ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Aug 2026 23:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785737047; cv=none;
        d=google.com; s=arc-20260327;
        b=gFwxKA89UNsl3d5EzPZn23OFzzY0A0satWrgQQkrPDngnZKTFfttSH+P8n1/LBWvJV
         fWiTwaAbghxLmD02h8tSzlnECUe1RUG66J0A1FOoWxnkiQYd9GbpShloRW0vsxh/qFt9
         btaV7CvNbBHijhOAb67z2Uqxjiy+iGXbnkhkXXR+0o4SB4gbxI+OdzVM9V4HqmofK5n0
         KXNZu4NcjnGq8zb/PSiQM5n20GgVxxco+FdFm06YgX/f92AwZiZtfs1fQ5zKkLUbt2f7
         8kF2HT48RZy5L9rwMsUun5dJt9WbCCacR330t/gCueMss4tBXUtp0KZxZqeNkliJcnnn
         q0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=opkoRNulYp+bLHD2LANAtEBVTpeSMM/+YetLJXty+YI=;
        fh=0qTpKtXCzWsG2jcePrjNwSeBTPdWpcvZ/zyatVonF2c=;
        b=WDbfmiWBGLkKlS9DQtVv1TdIvmR89clR6C0+38Nmeo9mCEAeiESYdJv8OIem/fBRzS
         x7pnPAYwwe+bnHMBTKmZjGoYEpLEqynzw8fqllxQRH4uHVdG/PczfkmUsQQZYf+LDMxv
         I52MxLOeSWetnq4/o4HdExjaOJueJ5B73TUw5t0lEMI+Q/oLB8ylio42gt6P9+pAy/+M
         pq4E33GX9VUDpolhw/OkTR3IkRSDa+JtDTTZgJltklL/UWcM3tkjaZpEfD0nI2MINlqX
         C3yRRsl8uQYteB82966mXm8l6Bf3BWI5dNAUG1pye5EkasHXo3Bp48zPLfgbr3cvbKBu
         4sag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785737047; x=1786341847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=opkoRNulYp+bLHD2LANAtEBVTpeSMM/+YetLJXty+YI=;
        b=ryWcCX8etwfle55J6LMW3x5DLJ0bqNdZwfp2AyIjVPKTMKMv7010scEBBPZzGjh3rW
         bE+8dfeokNHoohaO0bC3o8NeNcLUhHtDb2QfYbsuGzneEEEhwd6Hiq6gnctBW0jycxOx
         +B75CU1sT49FA301mgEfnEdYEsFeNoEaS56hXxTvcJBxt3+7fVN1WY45eCVR2D3Vq0S5
         T+xwK/Qmk4duOcjgHeFxOlBUgVkaLcXn7jq/ko6oKVSZhicTJi3PompXXzpVhi33PWRH
         q7kKhffe+s8mQSEIFMHEUKiJ/GxHvhqZZ8TZTezLVKisfBnfPmYeAf0LkJN5p/JTzM1L
         vp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785737047; x=1786341847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opkoRNulYp+bLHD2LANAtEBVTpeSMM/+YetLJXty+YI=;
        b=CupqKuclahSz3mOg/dHyFaIkqPLnncrpsNMnukLAZjb8vMo6HuYT7RZNeE+KwIHbfm
         Ud6MED5gPjL6Fu+PS/URK9qCGHvzHVlKHLM8auEz1dguz3cPfdIZaeHZEo98iKfsbZgM
         H67D/FlQS7klmL1fDJ3GzA5lE/SHlZXicM6gjpJHFmGVZUW9BiOchxy4+QNRvyQpT3xt
         tZAB+SFrrGutCERauOd1viQOntuUep4INwqqnLol16DmmxmghifELn9vIJg3zd2wS4ge
         7j8o0ItRkZpCo85otT16gJoUTgTTgXOsg8Z19up4Du/3mwh1EpNZwlMndVs8f2D+hpFy
         Uz4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrV8OsJPsSzhlt8kHZfGS5gOFjytfOL2LkDXl9oe3QKMVYPqgEcKDv/jCH5ElfBe7v4U3YNDC+2j/zebqgf6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD+/ulb212KPeXHRmHMKfHQo7gzgyRB3p34V83pDTPYmYm3kRO
	6zUpsYUijeeFZAmmj0bkNvCAtHEchm7x0BjEENpN4Vm243Ld5M6OqEA8qceOfuKiM3j33vXRPQk
	2wo5kZcxJFLxu3TB6cBA16O5L9TTM3iE=
X-Gm-Gg: AR+sD13Fpkcm8Ix1SpDNuB+2VY9dqG6nNoo/aRhLfTIWbNDerjQbI8rKeJuTW5RRCQd
	7Er2NCc5hqa/6wvMRVlTtQqQcZU3R/km4hiisXGfbr7lr9ZoDmvgCf4Tc998qAIPPBj/wp+UqAe
	6QlUp01T212Nt3vhXaURskVlQKC6T7P+qtfwpm8HnI8tVTIMyuhxbPlxwQxhvyq/hvlMotgHExI
	EmFKRmkNkIS7pVhN3zxRtpe7wipMxwx6QUaHMByOJ7A/SXb3NvGuMLB54pAmHuCexPG05RQ9gS/
	xhCpR2uCNn1JGGsYjQvE4PtM8ul4tUKDcxnieA3ftapmrl3siWxlrT8M2bRIJznicaFPt+jZXyz
	mG/RsnCp8iWQebk4IBSKE2uPNQvkoihDfgnwowtYqHgcu0Flk0a6T2V2Kz2Kh
X-Received: by 2002:a17:903:2f8d:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d052064a84mr115238245ad.0.1785737047606; Sun, 02 Aug 2026
 23:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728191448.349241-1-ojeda@kernel.org>
In-Reply-To: <20260728191448.349241-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 08:03:54 +0200
X-Gm-Features: AUfX_mxqcdfWM3aLdK2D68JD6cYnTf-Oa20VFAYdnXMbU0EIgzsttXPt-hp0GA0
Message-ID: <CANiq72mLq4B530DKYf=tnb4zvaKQx_zVWRBY2+ARDwxMn64iNQ@mail.gmail.com>
Subject: Re: [PATCH] objtool/rust: add one more `noreturn` Rust function for
 Rust 1.99.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 9:15=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.99.0 (expected 2026-10-01), `objtool` may report:
>
>     rust/kernel.o: warning: objtool: _R..._6kernel3str9parse_intaNtNtB2_7=
private12FromStrRadix14from_str_radix()
>     falls through to next function _R..._6kernel3str9parse_intaNtNtB2_7pr=
ivate12FromStrRadix16from_u64_negated()
>
> due to calls to the `noreturn` symbol:
>
>     core::num::from_ascii_bytes_radix_panic
>
> The function was renamed from `from_ascii_radix_panic` [1], which is
> already in the list.
>
> Thus add the new one to the list so that `objtool` knows it is actually
> `noreturn`.
>
> See commit 56d680dd23c3 ("objtool/rust: list `noreturn` Rust functions")
> for more details.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Link: https://github.com/rust-lang/rust/pull/159554 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
