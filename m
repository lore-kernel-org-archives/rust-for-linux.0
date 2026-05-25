Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4803D30C147
	for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 18:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779732153; cv=pass; b=jDleC/Dv4u1FD0vUg0qoX5uHkfEaVmCQ3U3b4OoKwlfnTTJUAoSEW3mbr0QlVx5172jb47R3ize9RLLMq/6xMgXPVdNvJ3DKb6lw2rF2o/dYbbPAk09eQae4iIcopvymhNVuQirJwRwUm3x0vC1cENRBkR20Wrml5yb24qy3B9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779732153; c=relaxed/simple;
	bh=8ZSUnXluYLVn4jYwuGuuAoUqSSDCn0ar/92Y3HH//e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNxttBL/nFwlctHnMoFXVcf9gu1KJ60rgi92AOxjSJ+S8h23wcRmgHki9ch22HamPbDs3Dz96vwvTp9516Li2fr3xAYw0MVRriBQs6BMVkwNU31dew0yb3zY2kkVeK1DdNQ5TpoPVi3Vj97oG/Gv/kdLjdzDu3FU70Zx87qw5mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ny44HMfg; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ny44HMfg"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30436e8f582so454403eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 11:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779732151; cv=none;
        d=google.com; s=arc-20240605;
        b=XGd0hzWIbRHVt5uykDINgnrwpRAsONvj/6o47q/Lg9GD7MGk1JRSCF2YRfSdQW+Paf
         vRWsQxoOzIDzdmg/8BMWmKdmYQKXtK+mEnEDppfWUhwld6Ex5OTu6cSJ1qlkH/vFC8A8
         Ccjof8KDZKZ1Kl3j9FxKw8sJF4YhGtshQAGYLjeiVz2KdRawliYRqc/bmmyPFeoTo0gR
         GrXzosE2cw1XjL9xHB7TSlOBl3Tav76N9IFmKfUakUrcoNoFMcB/DECI2V/5EBpxlqFX
         mYpI/WKE7JDdsiqd4mgjy3aEBjPus8ZHwYQOcWuyCA5z29BqztGa0IhPwb5HRAs1LE4p
         5ODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ZSUnXluYLVn4jYwuGuuAoUqSSDCn0ar/92Y3HH//e0=;
        fh=qmnh3DIjc4mQTYc/ohUrTczMHuJ4bsoBgcB5HT5cZ64=;
        b=CDUFDwyipZ7KGLvTuZLDzh2rq7cTilTIg5o7EOUgbVIA6+5zSPlU2Z9kUpio4Xq2N1
         F2ATv293PmI/245EJYkQm1lhjHf0eUq9+VV6DT3zHN5lk3/YUNZ9HVKOwDPtwD0pTqi5
         v0kHwgNFeGbK0/t1CvUopZ4HVj4BFsX26pBvesijXuzBRmBZI0C94sMmhnmH8KBJlgoM
         QWEZwaEWzYFF9VrVK9Hm/0CAZnNyMaaGIvRMn8KCVa9jAeSkrs79GoKI4vnJSc1zj5Cw
         +5b6cLFrdccteeHLuR381+6sAzf7BYqxyjED4rFfEThiPQp+XxA2SUcisZ7TmFIj1iMJ
         E57g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779732151; x=1780336951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZSUnXluYLVn4jYwuGuuAoUqSSDCn0ar/92Y3HH//e0=;
        b=Ny44HMfgXU866IO2JoH5XDjGtJTxbWyjs+rG4xleRfMATvHg2PmhpNeJQvPX7ukjPk
         7j20KtsGnYAg50kyXFIxiq9CRdu9xrxE4DzSRksVh7zh9vIj1Q+y2SaXjvO8WhwohK6x
         T+UHQCGd/91O7bANgZoYpasyobec6fn3Tfk73TDJpiFjBh17iLHIg6693B5f9SU437z6
         VJtjVKZqKKDEcSj8gUYPv7JMq9HPs+lxjhJ7zBfqGGH74KTITB1SI4qRUhQ+EWkb6+ME
         n1SQhcAwSzbfKkhi7QOT5v0wdayx7DSl4/zhwtDGuV87OJSpb2h87kDx9OmOQDVMklom
         pjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779732151; x=1780336951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ZSUnXluYLVn4jYwuGuuAoUqSSDCn0ar/92Y3HH//e0=;
        b=j9pPyssbBy85sHyWDFiRelVl5h7Q07U7LdEkKbMmUc/g8Sk70LU6HlIJEnTN5hbj5Z
         kgikrwtS35uATYlF75YoOrVD4NDkZzxUxfDw9QV6rG4dPE+5tKqC+x2zExhclluCBXaR
         tspPpRZBUwZ5yJc+VrcRq9JKNAxnxK4JZpruLFiSdnhMRKVFfl7ccbQvYJbaNZibZcmM
         MhdS+0iqpV9UwFNYm5TP+oodnN/iRwGmcw8zGxBaRdH8w+QJNVebfsSZCDWJmUCQLFX9
         tpJGo6lFgTb1xNFxB0Yb9KjMMnRBfMYi09eNuTfDxQTSiarmeWJ2718fJwFb0Ujmo8nf
         ngzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oOYYHVDTFsTqJWaVH/B/ElPWHpgbxHflCpbOPemcFHdH4igfoTOzsknPr4jYgIZ8laN3rjt05e33tV4H+Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwAFiE0iEbSNJi16abb5Qc1N4VMv/pxrNTQ/iwneF39nTwuL1s
	NXg4EGr6KDCEXW3rZK3qmg+0d5w+wDVhNNLDYl1uiSIRcae+7mFnCEHSIlkXFKjC0gdgncFrKEr
	h8FtGUx7WsFPA+u7rIQfjvYwpNtit6K4=
X-Gm-Gg: Acq92OFIN3HlgmeuQlCehu1nmkllFb0MNMcJEFxREbe/aEz09y1Va5yj4rZOVsytPnp
	o5a5ONkzuIaDlT3dC/BYQM3ACkl+62k1DQva+EH4x4WHiCG4ss7otQJLtLf81zLDrOSYBMVD1h9
	l97LMPbhLx7PEU7SrT6tmb77MKvHag2dnt8Wnj+zorVG8hO2vEX1O5FOBHKoGdXSpAa2Q9Spu5A
	tMEP/r6mTLmANGQJrG5BfhH8vvXdJaFBPS0+oMvF6sPTGnAevhIfeZWrAbymsQZGhbMVxaggWam
	y61l7ngd3fJAPRtTk3eb5vbP6mfsJj0LzsZgiH4vo3Ml/BYWI+5qKF5qi5mvG+LxFtK6JJCbMfP
	M36CDAReByzqK+x23Qy1PLvc=
X-Received: by 2002:a05:7300:fd10:b0:304:1fb6:8903 with SMTP id
 5a478bee46e88-3044911cc33mr3366059eec.7.1779732151161; Mon, 25 May 2026
 11:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525-fix-vbios-v5-0-e5e455251537@nvidia.com>
 <20260525-fix-vbios-v5-15-e5e455251537@nvidia.com> <DIRU7Z3NH9J2.2HT7Z93HFCFW0@kernel.org>
In-Reply-To: <DIRU7Z3NH9J2.2HT7Z93HFCFW0@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 May 2026 20:02:18 +0200
X-Gm-Features: AVHnY4KrDhM9kXsLM911_pGuZ_nGXHEjBgcjbdN5ENiTRugzSuQvUMPiVBLF30A
Message-ID: <CANiq72kR0raSG33DgSxMuc-2uMa626dT=-5=ko_HBgmeOrCFZA@mail.gmail.com>
Subject: Re: [PATCH v5 15/22] gpu: nova-core: vbios: use the first PCI-AT image
To: Danilo Krummrich <dakr@kernel.org>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 4:46=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> However, I'm not exactly sure it really is an improvement in terms of
> readability and whether this is a prime example for this lint.

The lint is globally allowed since v7.1-rc3, commit 838d852da850
("rust: allow `clippy::collapsible_match` globally"), so please feel
free to ignore it.

(Same for `clippy::collapsible_if`.)

Cheers,
Miguel
