Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303D22BFC73
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769511338; cv=pass; b=SADlXm9Q2kM6Bx97b+RLyl4yCh44NYcf9JwfE59ukD6Wqju4Zbzn393sI/othlmZYdp9+D/GJNTIyunKp4IdGFaON4gzZykEXJ7iwPsRIx+tcbF0hk9X/o23GBbUJWaYCH/0Aedr2r3LzFITXNbW1z1aA7K5gfs2pUN3MEpF7ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769511338; c=relaxed/simple;
	bh=ht2vJCW5mPP4KuRLCiR+riK0eHYZtN+oD0KxaAV3Hys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJrgdSDuAdQ0q8Ge20wVkMfZf/X0EEXcyNXTBfFxRFo8Fy7Q0vJDkGbx5Uu2Jqw5NulFItsUz+o/LX5rtsV7HnJ06kAAc5Zr6W+cxFSI/00gOj4b2ROj0FXNTVm3Nss1X+qFw0LXv1hlMnsHYU4AD7dvZvmDjdWWH99QTR4pgGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AebxmAC5; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AebxmAC5"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b701d29ddcso242687eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 02:55:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769511336; cv=none;
        d=google.com; s=arc-20240605;
        b=IWx8/5OCNEkc0LqKVekQlNk79jUEuI75EEi95z2N7RFhQ+l674h3MOIzlGugy+Df4J
         j28e/IS+HHQ9g6ZMycIiuMw8B3fAielynHqxT8+v+LowMjRVCS0ZHK/d9fza7EAGoTex
         P2PIO/nkNZi70BuQ8pNxk5WI4CkEMoimcHftlIn9K+82A2MRs/TeYRV0jhaJO9OB3Ed4
         KPP0O6Vk1XwyBqGAQaMLt4XT/J5/wKBGz0GFQPEzu33KviFwEKxp6TD8CBenrgP8FMlS
         EvqxyMzZ2FdNeQCHMDDk21pQrIQsDcfM6WJ4cffgzvud4EhKqG2iMmwuiu8TnsRtx6Uu
         voGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yQXNgI6/TD8hNUiBh2advBtgjUuQ6yQvYnE2eGiW2Ds=;
        fh=RlD/poW55nJ2Xmdv0L8xp/HgMblkbUewMSK6jxTzx0Y=;
        b=IzptmUUTc6EavbhnBEer28GYsBFr1WFaCoIxtzOzxtjN0dZvc9tOat0d7IoBeIDRgu
         /PExq8BXXWAOLZX2TJO/8tzuvt2hlSDjtM+fNg2azq59zngoBa67HHngi5eRrEiknvXn
         WBQTuQ889da6tBAVAiiiE4cg9A/Kfl0SCDbwJ0Z182pZJHe07vOYSSOcHtxe8yJiiXRD
         +1YHJXfaI74DUTx8psDZq9vMUnQKOE8n8cUSEHxrP3CZQ7dVw+tcyArbs+RE2sm+bpi3
         CRcJJ9k79ntIkkIaCFUGn0khTfmCPX08QOoqF7tkZPLHxbe8h5XOv78GZzBq9IgdpTrU
         iD3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769511336; x=1770116136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQXNgI6/TD8hNUiBh2advBtgjUuQ6yQvYnE2eGiW2Ds=;
        b=AebxmAC5nK5K5B3NlOu7PPRUD99Qqb/UigpPU/P26zggu+BsABKGOI07OkliP76CWO
         lpujbG32Fq+gcil1NXMKRmy/W8qqqxdLLyS06clKRku06dPUr51UojAWM/gxSijkQc7T
         E7o2zH5OLwiAtychUHyXbo5eXLsy6/xbTwqYyxnyEddxfJO+FXibZrENtDyuI30IX7Ox
         Dappy4DRR1aNPSE+T5k7e0fPo/nhMwfOzdxYpA5Js5GIr8+vO7assxiA8Qf5XiFoLmST
         tBZl19Ldemeqd1clQO/XaH8S26m84Y0p2wQaRG/vy9UNcYs2SytlBKQYmATfa/1Ijy5U
         G1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769511336; x=1770116136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yQXNgI6/TD8hNUiBh2advBtgjUuQ6yQvYnE2eGiW2Ds=;
        b=s4b4nOnX7TpPrym0f0NrP81h9XCjeBR8mcymk/r/cRyV4hH/RHsbm0fT1SMggVG/Ee
         eeU3aHUdTI3fNChls5us4bwDVJJIKXklzIgAnqhlZReytypmQBBDnAj3c2YeXD3eoBEh
         AtSrrDys/4WEVCzDUdOYPx4RVZUJtQFt56ODJts5iph1AY6rD96q5kzUCBO1eQrjeMuP
         2o6xIIBThA8fbbzU1vNbSrr8InWAJS8oYxKWkiQKmgGFYi1rd5bxT/4Mu7ynQpY9b2BG
         HqK8t4HXqeqz7QJQRm1EdYw+9l4YQ5pcFNZ1zUfU53a9Gqcy6GEQqGLRohEBqEg3+kyc
         T1VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUue328jbEhizujy7Sl3XRqcX0uXY+qIGpO4tbFzBFKCL0/Z1nN+gYy6bikxjziTUyyQMFlmhqo+qOFvn4Dmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTHRXFF7P9gzwEgSWtgT291628pCy/tPgWylD/RTlUf6ooPbR+
	P6uwEREB3cayaGHlv3bnh+V9TTzBQRDCCofHE5HXT0f2RdTzZrTmmlHiGkYQZNWQaLXKphJ2vM0
	LvdOWXMriOXqMN250T8CUwpCqFpnVfLmAHg==
X-Gm-Gg: AZuq6aIszLpKKoWZQdAUUXij1dqcQCRPa5pOl04UNQMsnBKBjRb2VsXCI7KS/fc2neN
	yVQNAzvEHIjKMeJpYVOOFw+Ij5/cZ1N1vEJmLIlN5r0B483kuIBHCFXE5HPt1UZoJGK1W+X1Naf
	2CyBUwXM4f6rxUryosuOTLE+kFXc7dzCORT/8qc0w8/+tJCR37uQ6n3Nv/FofAay0/PS6f9v6G5
	Y4YxM9FbAelbQUFf6XmwZTkvpLfngFM44W66Gcje5Iv/Bhn9PbchilBd4r2VS3YmMuhpC4XpIPY
	h9pMpTRIbrRJi8Qw5SOStixWDEAI04A+EQL7K/2WU4Q8lkRxD1X5ob5syVlZBdY5YRO8hUulpx4
	dYQORLatVdXBhFG5EnNqBSXI=
X-Received: by 2002:a05:7301:1287:b0:2ae:5549:2c86 with SMTP id
 5a478bee46e88-2b78d9bd653mr459294eec.5.1769511336256; Tue, 27 Jan 2026
 02:55:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXgpKOHAmvZuMVSt@yury> <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com>
 <aXhD4sI6MHdAvgNT@yury> <DFZB4ID2H1D6.2ES3VEZQEGEQO@nvidia.com>
In-Reply-To: <DFZB4ID2H1D6.2ES3VEZQEGEQO@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 11:55:22 +0100
X-Gm-Features: AZwV_QhzKeiaMZmKnFN8ZOfxiz9b87vkw47uHE5aWBPvinYYZpW5LQ-iXLKFLzg
Message-ID: <CANiq72mgmBa8nA695Pxh6mSD5p_RKb+Eek+DPiiRZdvfdQ2ORA@mail.gmail.com>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <ynorov@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 11:41=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> The closest we could get would be a macro, that would look like
>
>     bitfield_set!(color, blue, 10);
>
> And beyond the scenes it would call some more intricate (and unsightly)
> machinery. I'd rather define the constraints clearly for users - they
> are not so drastic.

Yeah, our guideline has always been to avoid macros unless really needed.

Cheers,
Miguel
