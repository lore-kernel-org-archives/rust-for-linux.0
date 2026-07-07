Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6104227BB9
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418707; cv=pass; b=svlpxMYSEboZ7q9y0ocfsoLmc7YFOfc5CYK/ClCGBDsWRaFU9lZrZlbGdpXNcyGUcn63BbhAbUzuzDpFgixry4tyAhy+sLzzoyVz3KMcU8CmhyPLLrsTrEbSxh0HLGvOi5mDGQlkEZHOlDvDiZN5YG7aQhjKf6ubTOOGyLv9rlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418707; c=relaxed/simple;
	bh=80xHlt69QXf5Eik8Ims27JGY04/uUKaZkrHHNCMdYdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GUll1iU/iUcazcS4qbuYTIbD20sLxXSLxho8Qg9r6YCFbuRmTyF1Orp1yVPckVScSw38d2mO2i+aESy8VmQps4aB5Wy6bHF2YLDXTsQ0RcIU3qFDRjb/De56aiKnnkuK65t5Bq08ie+qC7oLpbxhAOpVu3+4scNGwSpmDS+P6Ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajJWw9Rg; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajJWw9Rg"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso194350a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 03:05:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783418706; cv=none;
        d=google.com; s=arc-20260327;
        b=VOLgz4X0ZBD/hxn+lRk5X4Jy9IUt+09yujhxtZxSWlpp0FKo43yxgnT7909l/LjVca
         Zki1HyznAX94vNet1oY+yy4i5lutshYYHXaENbJOKKdixjacuFdXo0pNUTbbbWzO6FSo
         vHxkXCzSYvrBrZOFF+51mikEIqhs19Ev+hgqf1KSmu/MPyuWHazXdDIbCKldR1ZV5T80
         vcMaEqLrgOiW1qT+yo2OmzLv/efQM89znl2A/qQxhyt907GunvYKGaDYxjabBz+W+mu/
         rckOFO1Ul9xva0PKUVHyznEyK1eAIhiOa+oDfGblUy0jf+VvI9hlvX8Fy0dte+npLam5
         0JGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/gdw7Yl97QcVZXZSB8KAzQbsvFn+eeRwH4j/MMj3UQE=;
        fh=UV2etCPLxtOF9QHcE4LIc2w9JfuTtRoGEMxLby8NMWg=;
        b=XiKqYLeU0pfubFLbaME4zhypTiQ6DvfB/qCuRYfEvyQsxrhkiGnw6p9E74F6FsxIwW
         fXNP93lEOANTEiahnxzpdGdcBd+4d1UXNlaNq5nGHDdNTD/fVS0NM9fFJ3tHsgT71Qmi
         kkfttKarZBVVJNjyF0lodSLVmu4bK/vTGTGlCENVhekR/ptBCSadlFzl5ASoLQBdJDfg
         0jDwOPIVqQxL0KH66iDgz7LSY9HeK9QeeFr5QeSHpljxEM80YWrWntNBNt7usOw6adbX
         zp5HNOHE9UxfNw+OGglsCiXfihwq4lbJqW2qO64zaKuJpDDZ874D9Ns4Ju31xgHHFgUA
         LvnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783418706; x=1784023506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gdw7Yl97QcVZXZSB8KAzQbsvFn+eeRwH4j/MMj3UQE=;
        b=ajJWw9Rgjv2/pjezIquqT/KrnO/hZ8kgReC3eRASvi7us6KIZMI/7tj/2OQuSp3sPw
         HSLzgw9UsX7Okh5NvEjiP6wNv7OMfpDWBBgDF2DnTlmu7X2UhlGhkMaBmwBN8uhI1a8M
         +Z/IF48qWgx7SJRtuY7gsQA+u3PqA2nON2LBOGEzDAmW0WqjT2wbsaaxsIVt6AssTULQ
         Zs3vrbGi4qXxbrjA5v7R99cBQkJMxjOJ5o5VYX3HQhPR6X0h91lUoEYQYRspGwg9EImq
         9EXNwB+rHcb4yE3VU5h9pWdxwT1wvmV+kX9lgoIkCm7fFugSSRUUqQdRDqGK0ox2SufJ
         xdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783418706; x=1784023506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gdw7Yl97QcVZXZSB8KAzQbsvFn+eeRwH4j/MMj3UQE=;
        b=bRuXdeMnGDeNj6v5rN6ORcyhyvrPdjqUVRnaiHp2LH6QpDoZUkim0ctXj+9xDmfVxC
         6Zkbp5dm39XBlc8p7jbzYU0aCOSL3riBtffit0YavLEgjpPbZpTUPDogaQHCzrmaHWQV
         ws7CW7wRTM3wviyQHYnhzeBRreL5DT8obnwrcwf2IPKSY3ZTJkvNfXr8wnTk41B+Uo2Q
         ASn3azwOGAOktTMvCN6HNdSx+pUvArvy1lxOR0G7OJmNAsJp82ocwaOYG5qhMh8qfplW
         +HXaYltI+7AmqlkPjWMittHFMFAtMAb1uRog9nRVKD1RDPqNtaOH0GUwLJaEVjz1tzlw
         yHSQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjoRd1GNj4U2IZIbM4njDAplhh3XyahIyvI955rI/S+AH39v0C7FyriEDeSByVjoehTOVt14s7I+X811FwAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ0+kNlY1cD9kRSV/eDxbOJUE3PNKvtQcAbMaToCROIRaFKh8n
	l1iVu3LL8UsW0JvVUcJSyKfFqhKyaMHirFIiOIlgzWkCZrms5U8sczyPuJlgKVdS5tR0P5N0qXz
	mYzmcLye6SeR0L2Qm7iY/eLdj3odYZok=
X-Gm-Gg: AfdE7cnPxSobsjrA8yVoQo7GkNYGDyWqxajNtSTsr+fAG79auHJmCWNowaZ/mnozPPm
	j6RfHIB+BVOxSDwbwul66SijUnvUCBd1PJwSTtvXYrtLcA0yWZrN5XACiT0le+iNnfkVqk4jdbv
	RwLKppnaXm6c8k2ry/L5bzfKcpARFoQvo1IL4X5YAzRI8Xhg4bDZiC+Odxb2uvofPJrO1ZhutFj
	yNvJE6mG/3CXdVq7evem9ktgJodrG7mynEzYJfztxVLNcbkivoG2Fg+AlCgVp/cIPb6eB+P6768
	D9nzCJQLUhRRnnzU9fylMBml7iNfII6j0cz2SvrOE39GTe/vZszkrlzzMct2rBFx/fYZWnZhHw1
	GDq/aoc8h52QY
X-Received: by 2002:a17:90b:5390:b0:381:6cf0:d5f5 with SMTP id
 98e67ed59e1d1-3829ee06b9amr8687758a91.5.1783418706018; Tue, 07 Jul 2026
 03:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707073639.33133-1-melihemik@noirlang.tr>
In-Reply-To: <20260707073639.33133-1-melihemik@noirlang.tr>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Jul 2026 12:04:51 +0200
X-Gm-Features: AVVi8CctQpUeM_GEWae1KPBwr3TGLS8AlPLYDDxSEQbFveFCm5Mn5TWu1XIludU
Message-ID: <CANiq72mzXZgEFsdXSQ2i=61v1WhukGeYuBZr0Efrd-+YL=HwzA@mail.gmail.com>
Subject: Re: [PATCH 1/1] rust: prelude: improve generated docs for `build_assert`
To: melihemik <melihemik@noirlang.tr>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 9:36=E2=80=AFAM melihemik <melihemik@noirlang.tr> wr=
ote:
>
> Signed-off-by: melihemik <melihemik@noirlang.tr>

Is that name a "known identity"? The kernel does not accept anonymous
contributions:

  https://docs.kernel.org/process/submitting-patches.html#sign-your-work-th=
e-developer-s-certificate-of-origin

Thanks for the patch!

Cheers,
Miguel
