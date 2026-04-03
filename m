Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C47221FD4
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210553; cv=pass; b=VMV5OFBlf18McM2Zkt1ZyughAVb0Mk3WEQH7aoxQNhgyGWK8e3++NO33ZyF7Wccrroxo4zLDbhzoUdb9gCrgL4v2XnLn1MfrunGDbwUf4U9dRDf7dAOATzcL2I67dXRlbigFXU3Zt8WZKoxmeeIiIACOJUiVXwraGQCwztXWIhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210553; c=relaxed/simple;
	bh=YFI9uqgjrm7Ser2aFrDWytEmaDz7CL7FW6pRqvVrkd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NH+G1nQfi78Mc4VqY/CbbUZjO1ozoPVPXduvtqtz02SnLyGJgVA2exGpb2qa8AWBsecaddXrfVR/p15MZliMyKZFYeu7rbE/Yfso9YB+vjjx6bIQdAeVb52jE9tZplCAwcfUpGZbd+Z5KZLzO0hp30OD64jAMCehxP1sohKZ2vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7bMKqLz; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7bMKqLz"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2cbc50e6a36so45055eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 03:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775210549; cv=none;
        d=google.com; s=arc-20240605;
        b=ZQpPwZyq8NTXq0Fs+NRzkY7yi3T/8L6YM8wFoBRgO8rhI29xmAndBO8j9YmMK/MRzG
         ie8eMI1/aVqUReFJ+cBmLFe5s8s0N/iDBS7eQFunGXNrB909QwMJbXzk2HTn8k6nzBan
         v6ebVU0jJOqrCfzE7rUiU7ysloCn2l9JeJPT1UJbYbSvO1O6WQSTobGmOz4U21lZA/sp
         u/HK877oylFoH2o9AE8wpaQaemzKZcfz+GuLsJc5cEbAqdRRXITSVuqavBntpGMQugIt
         ecIw/gdd3VSDvIi8Bq52fPQjPlr/FV10+HXV9RWwJ/Pl+HSAzrjvtIKhA8zpeJ+AYq+w
         knmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WhfBIoM0w925aG6rUlnptrbcWljBDHG/UCNbFnAd9Vs=;
        fh=yaZ1B9vaTO6tMGhppMuzXH0PSpMsMX52NpDTgQUv0jU=;
        b=KEl0bAdDdWDX9wZN/nYun7jIhR6CcC/NbohteDKApAI6fLLO/t6/RzfWdtdWnKu/hS
         mfoO6P67+QKqXu906WIiK5ON749yO9bKMiwrJESFaH6ufU7eOwW86JC+We3N08TAFYqo
         UzlCGQ0C0anRh7/gGo8ecNrghkzn9HyQ2n5f+S9tEXn74VKI4OgprCEqIk8w8fhcTLMk
         tGSOuE7fcOAKDN/CST1RKNZeh+QezXb0e+/B78LhUcwlZTWbxsZghFSb19yoprKIY67M
         b12KIafHOiXN/2Vvjux+G6J+SAZNhun/NtaNmgGaontCUZdpRs9Mw6NNjjM7bXADllRF
         gWKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775210549; x=1775815349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhfBIoM0w925aG6rUlnptrbcWljBDHG/UCNbFnAd9Vs=;
        b=a7bMKqLz78vgdY7xA3Eqpx+yy71tBb7DdaySg89whmxwXlZCpWvewGKDXzVZSB2QL3
         dnqZzdX7Zlw0BKRZ4V5uZBCcrc/PAxKwijnmWxx8VE0yN2LW/8fcVA9Rflo/kOHo35zW
         xLV95+m+S8c9yQJGUwJJu3jmbVguNZS3ZUr5f3q0E5cskKDgsWdCbE+tkF/wkNROHjVo
         8iiG6Cvrpvmwq8h5JpNeXGAaGASCjLJE9tV9Mbe2edn+gyBDlj2F4sR2Mr/LUVw4208i
         QkiOc2siKOnR5pWKNBXFW9tQ04zs8/WaYpNAFmwr18eR1bs0pmkTk6tsKMyTIshfpX67
         sZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210549; x=1775815349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WhfBIoM0w925aG6rUlnptrbcWljBDHG/UCNbFnAd9Vs=;
        b=nc3tYMzHdDREDZVPBpR3VV5FCCVZIYziiG7DkOnF8Jop0u+APZ7/GvPX6Vaom91TEU
         J++hQBf2tgnfsLPabHFrXaF62pzLwSaUZkMJiRZDTqCiYyJr1wdgsz2uMgVXM9OsA1a+
         fOb2T2wI1KvgqJ+6oOu2STKlY8w+d+Ncf1+PO0/qS5/FafhAxq6z9bt8e9QzppZ9hTe3
         5URFMYZetla0glUwGNxZ1Mrpj2l372J9qKw594SnTD5tKBM/Un8D4mTMNS6P2lStFY0u
         3pV6kDgs/n3CfBbEcLYG5uVrv9i3aB0A6ZcJqgbBJ3AmlMKFH7hQtMv4u/DbFK5e/I0A
         D9NA==
X-Forwarded-Encrypted: i=1; AJvYcCVSuno1U6UEXrl0hHsOfmn+VJT//8em7lOznDOAEsif4+JyokA+QJpYiCh9rf9s8RLOKSyGBb+4DLx9GRTY+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRP0Ra891x0MTc6fRQ6Nq/Fl/meuOffRz2x7T75XmUfvROA1Ye
	OzRnvaXSqDWhA7kvb+A7GHdDoit1SqJCAj9QUvnqZ6NhWzzO0DPeR+jfKXNE4qhtrmwZbW64zfl
	LyCYQ95ddYebb2Dfn77HIXBmbCRvBy/c=
X-Gm-Gg: AeBDietNIHc5bPmUBT0t2j6cY0DrXfe94pNSdo3DuWLy88mJfXF4K3ggWMz9BT6xJZV
	mhEweQjYgHjfTPtiu0WyhqpLOIUeJs4rVR7ivFed2c9PAIx53KbkDabehtO4g+EByvgbtkxWOFk
	PoqVckNw+atWBGLOPgJcgQLIAldCJ7+n76dcXDjtBORpGOoBN4GPWRNdVdfqnnUOTfVgtbakKJ9
	FhJ4xkJtiekooM85ykjObB7lEZ4f7i5z3gWSZVaoF/gkTZtJ+4I3rFLO1QcOuURXhiBXkoKZI0K
	pZgrVadHWRlWRChvjDMsUHVeaGhKSXjN1FrsziPV5O1Z00yNJ6Lwek+7fARoLSNv/jWHqQhq9zj
	e6tJmWEt1frvXOUVewViNGgo=
X-Received: by 2002:a05:7300:2315:b0:2c4:76a3:bdfc with SMTP id
 5a478bee46e88-2cbf6897126mr536257eec.0.1775210548516; Fri, 03 Apr 2026
 03:02:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326013902.588242-1-jhubbard@nvidia.com> <20260326013902.588242-17-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-17-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 12:02:15 +0200
X-Gm-Features: AQROBzB4WItLjwLo2Y4pWU8ugF4kWfsCcTT_2gtRaCm4U_QwmYlt2p8yz132CCA
Message-ID: <CANiq72n1ccTcApmzZp3M8U9jm5c+6Og1E-8atbX--OAULWHr7Q@mail.gmail.com>
Subject: Re: [PATCH v9 16/31] rust: ptr: add const_align_up()
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 2:39=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Add const_align_up() to kernel::ptr as the const-compatible equivalent
> of Alignable::align_up().
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Applied (just this one) to `rust-next` -- thanks everyone!

    [ Adjusted imports style. - Miguel ]

Cheers,
Miguel
