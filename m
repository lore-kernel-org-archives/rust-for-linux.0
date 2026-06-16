Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099932FF17A
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 13:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616884; cv=pass; b=ZFOX+sODpqxlu6dyvGZ6CeWsZ4uO6JeBGUzqqLsWgCoZiY+86llWBvNCXr/mmHuAj0zSulu/XGdzzFMkNjCwEsk/Z9SHJCygVBS2DnSjSmG9H/Cl9sM/O/GxqgMupEo/bMGC/irqLFHIbxPyIiDMFOmsafRI16N/pIi+H8NvggY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616884; c=relaxed/simple;
	bh=QBqTU1PGfLqhSQsy+36DeZjxgRuZWwJQkLxSXeGDv+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijzYrdcuX97sDFMGvCdTOZCMXTpvDEardi3QhKyx4p5+L8osniqeP9y7EWnCmm2vdDAAvidQCsXtcCM2N8ClsgydJqzY+o5o3pw/rpI2jqW9zCgrZxzKtuYpyytzDahEo0N1pYC39uHTwv7xpG8I5ukChp+JEc5VTrS1KHHNZYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYOnCVaD; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYOnCVaD"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-306f1213aadso407275eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 06:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781616882; cv=none;
        d=google.com; s=arc-20240605;
        b=csvOscbwrz3pUUUbO4Q5CXFG2Qxh9TUcxpnwE++85KUIuQnbEaJN1TI/KfGNg8vD/9
         /o+h4ZFKIBM4NVaWZt48PBNo6sJGY/eogaWqTfsUcJTRV5cIKLVXBfpwBo/EKuyiuo71
         l/AKGDbicRGp/bNmbFubQ8A4xcu98vW2qOtLqqtVkAWKawtAekXaTDzzNClNa80oi6t1
         OINIAlsAAOUiU+q9c76TW7WWh9YH4GqSmqiKx2ZoBcyP4PUh5qX8iF7tGOy2xSlKWAi6
         n5ghQyUmlniehGTU83EtRN2k+UPLpU+KX3GgwzAoGSgRcgJlpMvU9OY/OtaeRkycmlSR
         Nrfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QBqTU1PGfLqhSQsy+36DeZjxgRuZWwJQkLxSXeGDv+k=;
        fh=mGSvdiA+fYtYW4EJ0MjTRX++auFQ484LY/GZgAYN6LQ=;
        b=e3RtFgkfdsSFmvAk+A+tRj4APIMRHxRE/L9meaHSZUiR4x6F1fH7gBnvzlVe2ePb5i
         Nvk0/j5yeIEFcCi6jyYpQ2OsXcPhCkCkWf9jF9z6qlF0uvTYrQNbayPZGdXFNChzoD8s
         0f5/6SUE6XjQeLqWNmxzcYMx6PNCupOia7RMJ6mgZGrVgeDT/YJrwjtleOwLquxQL8T/
         H0GYpJawyTfqISTwIBc+3l/RPFsRD+SlacxG06pv8YDTZKEJyvgE3rmnpdu3N28Opkwg
         n6Pf534yREX5k4KG6mHSy5hPEjdkkxdOFZaNCPD9y9/bBVf0/7fD/J2H4YzIYo/ltRUD
         +Xww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781616882; x=1782221682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBqTU1PGfLqhSQsy+36DeZjxgRuZWwJQkLxSXeGDv+k=;
        b=RYOnCVaDnYljJeTgv2qNuQDAOvvDo1eSRyvrsKoxu9nuZHDWtPGRuhSq6fx1lXvjDO
         sOlmD3eUWNNu9kCUXYQiROIBLY1ePKB1c8t60P7j6sS7c6oCAG/UT1RvUaW+9mC90lwc
         0ujFv+QNEHNxlcgyHkUAx4cdGk/Qmhv3bxJKWsVcqdzh5xNtllwzXMRiJLEqgWvoF1M0
         C2vmuwbzZ/ySbspvPfMf1OXiAqDC2mGyYNcM3hNzE1C+qct1smKpKHbwVrQBFqRp9h3d
         2MnPPTxb8tmKuiy38bgg4FA65HVt3nMEf0g6wMZvfnsR9xhEJQvTp78oAuhGuI7vWH+V
         tzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781616882; x=1782221682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBqTU1PGfLqhSQsy+36DeZjxgRuZWwJQkLxSXeGDv+k=;
        b=SEuuw72XN+0mCJbXckc+rCN7Nxy7kX3W6Rua0kIuW4eFYXBeWZqXHDSMZvNtlWG8oF
         qniQAfnaPYPj+DTX1HgZoQTGnd42tBxyO6zS71ciPXOWHrs7FZFReQVSNrIw0/eWK9cS
         xnzOeSpXZrTrC9Cy1+hR+yvRhPlJkwZFsr6VJxpvYeGBHecrENsaF9Z856oaLf58O+dR
         vTudx71MuWz6ZemP1np4K3qYPKGCUDs5hY/GToKuUTkq/lRsnsX/XvzU1VzqADVK+LiL
         XaRlbCBFP0eP4hkth7E3zpUB6dPiRNXoBapEqxzJW1FQ4hCGyDf9iaPkPqBuOU1yRhja
         vxLw==
X-Forwarded-Encrypted: i=1; AFNElJ+SliB5FoX4DDdV0f5z478EoAwnUu5hXLdmrX0IPvp7Wk6iL3qc4ek/RW6q6SuWOdyWQEqyfGW4zUbxAYwrZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7zJ1HsfG+uXOH8dLlR+qmvsgNvsoTguDbDVz+vUDXYcsG4EyJ
	bEe6pqT0ncvj6dHtimNUDELh6QVAS74s+10bIwnDRN5TITa6BLjZtEIpLTvSJHCR2p36CCykUQh
	yGHFlDSxsrbL6IHCBLoEUYAdpXsxaFvc=
X-Gm-Gg: Acq92OFine2OMZ/uDtdCEf7iJdpCDy5bxPo2ZsEOwbs3lMqCJVerXHgObE9QirouaNw
	SGL71yZF72GsGkgwQkvu0EpOZO/jjQXE753xvMwWTc4Pfhj4jyt1E+TCTAu5ToTyo8knS4Kd0E1
	FmxjCuZKNg0oJKocNKUtsteJ1W/7B6YD+91X99IOmZhcN43fEdpHrAhBM8I/ecPV/X4N605PvhG
	zoMh1gR2/KiHdFV5iB3rmnpiMtz6ZvzNcIMNa2DoDqSUAeR4p7MId8Uloa7ALlTUYuAAaR2U4V1
	21ErQCK+M3bndCQ2FxicfF3QVwV3E2TX4w/tRSGoH7bU3pRryzdg7CglumhHO0h9m4qVEI8jUu1
	jMfapXw4CyaWZK79JY++he1c=
X-Received: by 2002:a05:7300:4306:b0:304:3c33:7afd with SMTP id
 5a478bee46e88-3081ff5d099mr5382252eec.1.1781616882115; Tue, 16 Jun 2026
 06:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com>
In-Reply-To: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Jun 2026 15:34:29 +0200
X-Gm-Features: AVVi8CdWOkZz4CAAFIgrXWReHUHZXx2ovGTrzpr4YooCnTaJIfPp_aHfeTivWuk
Message-ID: <CANiq72kek9NoFe2PCFnND1p6BRbuzgv6kT2o5jw09sWg+wau_Q@mail.gmail.com>
Subject: Re: [PATCH] rust: Kbuild: set frame-pointer llvm module flag for CONFIG_FRAME_POINTER
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Douglas Su <d0u9.su@outlook.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Fiona Behrens <me@kloenk.dev>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 2:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Cc: stable@kernel.org
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")

For 6.1.y, we use Rust 1.62.0, so we don't have `-Zllvm_module_flag`,
so we cannot go that far back. I guess we will need to accept the
issue there.

For 6.6.y, we use Rust 1.73.0, so we don't have it either.

For 6.12.y onward, we support Rust 1.78.0, so it is fine --
`-Zllvm_module_flag` got added in Rust 1.76.0.

In both 6.1.y and 6.6.y, we also don't have `rustc-min-version`,
because the version is pinned there. That part happens to work,
though, just due to how lax Make is... However, if the flag had been
available, then we should probably still do it cleanly with a custom
patch to avoid confusion.

So I will instead do:

Cc: stable@vger.kernel.org # 6.12.y and later (flag not available in
pinned Rust in older LTSs).

Cheers,
Miguel
