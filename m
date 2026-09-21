Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5B24A49B5
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Sep 2026 16:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006951; cv=pass; b=CzjdKNASfc+LY9DSHWSW6ErVeCqllGyHePy3hDa0bvLGrO5ysuXDdfolcmPkgaHaWCkzqu5mbEJjVkJgaYtI9p57jORe2VCN9pEZDZCICW056Ver0ypoH2LIkZCgrkKLVoqhNfPdREzRmkIBpUQo+mA3K7W2FTGK7eO3PAts98o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006951; c=relaxed/simple;
	bh=AIjc3MXIEI1WNzfDBHDw6Y+wt0nahAW6usfM1evUcdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r8jl+T38hfxPnQZTCJse5EP+VYtuvtOrYVimAxz3+teZluwYIJDDGCiNoG25mMnBUu+102jzrLxUyVNcidT01ZugTnbFJrt/JbfGpiLt3c6Mrcn+VBTHO1c5plpLcQ7woY8oWEloHPWOmrAP9ukUToPUR5kdASrkL/+8QZ3nFFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyZzq0iI; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyZzq0iI"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b79786cdafso468175e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Sep 2026 09:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790006947; cv=none;
        d=google.com; s=arc-20260327;
        b=QiaEzgmKE9TKjViv+M9vi18V8iT9jMTCQCkOkJ/9XchAycyKFtQ1vNSKQs+R2cw7T7
         BVR2K9YK74tMn2Ck91Mvn2/pjf9SHR1LqxGOilF4cJagcleGe6W2WDgzFaoT+a1ZJoUR
         Yl8uVl+Z0ppsu1o1ZutNVYKtHBRqqb/VhGD1otPT8BmuUjnIDza5oH34z/U6VHsKKrot
         AmXFwpo+j4Ykk/m9HlrE/ulU5L2mxZX1xXKM56/B1Yog/6griyz1E6PZZE4r24R+0Y95
         g43xjcRMeBLN5ZPD6vboGuV5SliBkrj+neLDDl7ikxyFXG+VHNh1RlePXRWEsAauyDwX
         jB+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AIjc3MXIEI1WNzfDBHDw6Y+wt0nahAW6usfM1evUcdQ=;
        fh=NTYe5UBaq57NVKkNuPIr497daW3GsQ6D4M6MhLdVB3M=;
        b=QHF1lZqsBrXd2lvfqHw/Iv17Fi0oj89/GXfDbPfNFNFGlS8oBtixcGCzIC3hxY0CDN
         1vvIbJ+OhIoSaS8ockLn4GtOxCgiM1KqNA6shsjnWWtMf5ClAd639BnGBife+TuU8+9G
         6j0hS2O9y+uocuGmXRJ6UnD7VJw1/PRqXrk7D/ETScFWc+8pU+w94OEVQO49RhSTAVwl
         LiYb9ELUerhkHBFCgy4/sS1ZNYoCTyfEjECl/kLigcVjW6GkH4FITiNjJxfkYASVuvGO
         1n7BVOpxFEPX1w09zIcvn01+hjoDNNKa4emZFow48NGeVA9RIwigZb31QiQRmK9mFwPS
         e6qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790006947; x=1790611747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AIjc3MXIEI1WNzfDBHDw6Y+wt0nahAW6usfM1evUcdQ=;
        b=HyZzq0iICYBObXLKZzkAbYdHutJgeMFWvA3srR1rgB9/G3D0DM4o72UNWCWsecRCUe
         +NL6bE5yfhrSDsN32oKwXFadspCpfpFLd1FVlcIvBLJ0Z7zpuKMJivUJvf7NL9x4W3aT
         n0SkrBqDJiMKlMJZ+9Vnx9t1OTZrqlzc6xcMW/Xupzv5oIDUAFLlltcbALfsGedOBKfi
         yx1qMu7wOJ7UgTqd4fu6TQxQ7AYVp7fK1aKSGdhsKFSWt7HGUX/4fU5HgWD0O0HZeGWR
         gO0jA3unzMgTiSzuVz/0MObUlTtmZ5KNhs5IHD6lr5HmeVx1e5ZkHgMBmKwANx4S8EXm
         2oLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006947; x=1790611747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIjc3MXIEI1WNzfDBHDw6Y+wt0nahAW6usfM1evUcdQ=;
        b=MIOdC3KbwNYiSBxlY0chfUPKY4/rvfSlRaQIFkdPDd/mg8LNatGinJK8iMJHNerydj
         cCXEMDLyiE5Ns4U9NzSQ1jzXvcP9yADfkKcQWL9q45dx2b6AWHXTOa1RepGWsG3txwwt
         U3yDxiUJe5M/7EIx1Uv/kLNRJH51zpq6hVLYtEO3U6g7Amv65bgBriVT8LKpaEH7W6fJ
         EDcKTruMY4XkbT1lTFQEAOLdSTgqg518Hi0vCe14CvAARpoV9Bo/53tjvh5IjO+wnyiB
         pI1/EmXaGlxxMU5ew5mYcnzCCFSy2N6SZddCbPLDreHM3sEWNNtFq2HnauYFp9o9g7/9
         kIaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtlqvokcDOulnnzuMpyAidZsAmsAW31pseOdhbspUQ/H03GCp005l6FwgZQVG3iIC+vVCPZE2vinKKFvcjTA==@vger.kernel.org
X-Gm-Message-State: AFuF++m/yT9yPRxO7wNUIANz13DFgb7HOeAIoBkeMblN395dCOjOD9p5
	hWZWtMEsJwn20irY3O7VAoanx9OQgsoUg4norjSylXi8XqtFN9GWX7bbb1P5Z7fmitts0YYDRvE
	gJaxEL9QG435lD99wPxllRCi2vdj4Mng=
X-Gm-Gg: AYBFou3daKb09NGVC6dfh+DhK2VanPH0cJOM541iqi2k1fHTQHuPMWf6zwOGGjsF1Ua
	vVXuMQ2bp42e1hK4kwuuCkEftE1vRNH1g3JID4adFzj4sz4+TChAklF2OD3N+a/F0WAk/a78nGb
	0SlmnYdm4lKZ3PR3ah8lPN2OmAHh+c2/rPnHa4AOJaqGxQfn5LZIH/bkKIOvCJ5QlW5aAASS8N3
	u5N+T/is87g02SKs+sOn3wHsqzgyD7q5SOIebQxFotckQrkPQg65a63+LBvpPYlJM7buaQJFQta
	3hGQFMDZFWD8dlreczqRtVt4yDsVAE8qAxrIuWSU99Q7+0R+7kh8+CrBRDgWUQQWCcvnGfsPR56
	3KvzR0X3YHurLpQY25z+KHt7ODCiLuidNJ3KnQGNnJMBnsP2uBH15AeDVwg84aNa0JWZMxSxNgg
	wPOzw/1S7sYj0yUdqTwNY0WlFjpd8oE9giEWDKeSfzwejQEiVl+A==
X-Received: by 2002:a05:6512:65d3:20b0:5b8:c6de:48f9 with SMTP id
 2adb3069b0e04-5b8c6de4cc7mr1586547e87.4.1790006946532; Mon, 21 Sep 2026
 09:09:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908225615.1732105-1-georgeandrout13@gmail.com>
 <DLHSL43HJVOM.2LMYD808W8FPN@nvidia.com> <arFPKcA1RCecTfMD@redhat.com> <CAH5fLggOMBVi3DjQSmLtstnntgJQzDsQjEt15nRkiNi7EuLB8w@mail.gmail.com>
In-Reply-To: <CAH5fLggOMBVi3DjQSmLtstnntgJQzDsQjEt15nRkiNi7EuLB8w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Sep 2026 18:08:46 +0200
X-Gm-Features: AcwNN1XQ73lDz4xpLQP5yNOyxGkJdAQw7Y0pwDB52hNn7bLVuCDQdmrVcz_Iz7g
Message-ID: <CANiq72koa5rBohoBg4zaawBUPuhBatGouBzqTWi8djxMaaLacQ@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: document overflow panics in `Hertz` constructors
To: Alice Ryhl <aliceryhl@google.com>
Cc: Brian Masney <bmasney@redhat.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Georgios Androutsopoulos <georgeandrout13@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 5:51=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> My understanding is that the "default" way patches land is that the
> subsystem also takes Rust patches related to the subsystem, and that
> the rust tree is a fallback tree.

Indeed, the idea on how we suggest setting up the `MAINTAINERS`
entries is that, by default, maintainers keep control of both sides
(they are the experts, after all) and that, hopefully, they get more
involved on the Rust side etc.

It makes sense for reworking the subsystem, too, since it may happen
that a rework on the C side may need adjustments on the Rust side etc.

The file is already under "COMMON CLK FRAMEWORK", so in this instance
it seems fine.

Brian: in case you want it (but it wouldn't be needed!):

Acked-by: Miguel Ojeda <ojeda@kernel.org>

As Alexandre said, we may want to rework how these work (instead of
panicking), but documenting helps for now (and whether this counts as
a Fix or not is, I guess, up to what you usually do in your
subsystem).

I hope that helps!

Cheers,
Miguel
