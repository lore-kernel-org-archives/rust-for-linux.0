Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787C1453A22
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786703447; cv=pass; b=kU2i8b3dugR9D7xzUchD0Nqk68X8+16G/W/Lf8Y6TmA7JHA1SV27H97jwKLcoHZyUPPfa+iZU2G2dlbJ7o7mLsYF9PpeFvzB0UK59bGVSk88UisGt57lJA8fd9+QQPfn+f3IVLoz7nWK2vMRbJAUtkK5+8E+HkZkCcTw1/2RSOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786703447; c=relaxed/simple;
	bh=/SEfN4vHBYJRT3QagL0O+k1OF0dddWY7eIJyIDHff3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALC2Bvx+SXkcQ6XJc18gvpNr2iwz345FPL1N4+DEdMfVj4XUQimojm8KDe/tKS2f3C3dhVU3vHiWM7Y9DIJtU9Pq0wjoyPqr0Uh/llBjAMpl6OWy8uo118xjuNHx+oAbC76+A0YcA+InEYeNHx1JJsNU6eIeZlHtyAIP/UXFsNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fagqbA+u; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fagqbA+u"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc8311c6ddso1164135ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 03:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786703435; cv=none;
        d=google.com; s=arc-20260327;
        b=a/TeFPV+4jN9F+OA3B249nacSD1vJdzVvDrSeqyhXt5xY8fLpQbn8p5yvIhAs3r1nr
         XjPtPgCb2dLNYKriJq9eb8BEXbEOxFrbMZAc/dgsYAp7W9NmSYsklVmB6oDprkszZy1u
         qmngpfGHcsq76ACrtpFcQVm3p0V2DZ+RB6+UBC2Fquty2s0lbQfzI8VrAhY0cpaUfQCi
         y2s3QYwdhuxIamClRyDZRAWttt+j4CnRlnNBDj1yJYWWuodztI2Eejsy72+3wHIJsQMk
         ezHBW74OWqbTEp/aqF+ZLjMtI38iPXpiVOzrmMrDjdn1nai4PpHUNa4qAtq7EQZv4Qih
         v8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3fehzsHa7Sd9X2tq+C9ScVdD8EMn+jQuH5aGR6j+hWU=;
        fh=UtJm8xCju5aHyW2ayPeOKW1/c0+y8wAZyEIbKDrN0wE=;
        b=PZ18/3Wiy1Er4A42fYzqZGRfDmssgHBe1Aewn5SVqvPhLVm4IMViQ7MmXeGQVUocau
         uR0U1VipBc4oLsecLq8a4ZEdb1M1ro7DpYYrgdgBASPximQLpX0yqNWaVwVqbtjW1f9i
         18Y4wA/98blyeMjYe0LkDRnO2uAXkmoA+JFTw7JU6zW0cSn63A/6X5A6V4PyyCsr33rq
         O0G8E4O4MGT28qye5GUXJ7Qgv7xp3DqvO6LwQPCLYuoKfRdgJK96/DdtXWBk0IYTHS0i
         KD780N2kEeSYiBP8MqE5N+sATIbTcl32iAu6OIAFK3Wa8uuBF8HfWtKnxtexm2xccF7p
         puWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786703435; x=1787308235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3fehzsHa7Sd9X2tq+C9ScVdD8EMn+jQuH5aGR6j+hWU=;
        b=fagqbA+uwaxycT4UOA3HW0wBgBgITkGVnnAnE6ge/8mMYz8dJOjKAycpX6nnNwmTtQ
         eFy7C8EqtGnkDWENAxuZw8VlzEawOH5abaSEjDllVxjvZlcY0BD1xKOntvRqav1wNK45
         64RZx4tln9lX/cc0zcIhRob6VzpAX+yPPy/yV8bvUrrw0NR6R20z6Z6/excqedHa+3oG
         yjxz9yFF3BxjoDWmNDXtcABzGqOVhYmD7XXvBIyo46l7pwO2kuvb1+S3Rw+fHZVXHbsy
         s28LbaVGVl22S4Ub2Ej5Ef/PQRhwo+fgNWufWI7ZIINFDXb7f+BRqQPKjrsZaAoH+K7t
         /Ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786703435; x=1787308235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fehzsHa7Sd9X2tq+C9ScVdD8EMn+jQuH5aGR6j+hWU=;
        b=H7wb3fQP0vC/BtKvDZbkb33eUA1Kw/3cTu7grRDXFNXLNtllaqQDEgUAqu3vpGl3il
         SUOUJKJkEAR253/xlbirqVaA514RUlIaSInLrJ/MXf18a3MrvyM2rQSZP2118sk2FHR3
         vJkn03MZ5UEubZ4uuUJu8p65f9QV28fcIozkImnk4+rjNz3FbDs+rpcuntNkqygVe/DY
         C1R2OMdxxTiRj6zG1n/bED2nyk+V1vFH2jD+DcMak2jXnssWbnBxQjgWDeEUEcrEEzY8
         oE99FUghb+OKJFP6coX0NE4vsZdUx4KVrO3zNU/HHkaxx97xoHe4+4RCcbXipU8pZhaP
         sGyA==
X-Forwarded-Encrypted: i=1; AHgh+RrKFgYKX2j5np0nXS47J7xRljd8Ao6e90+pGx7kvOKkSi40wLi7LXJozvmPhruYqw+oc3WCBpu96oWsJducCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpT4aKz6h8QqPYX/dQW6AhiF6HFq6YvxbKmEZwxAn0fi31e/VZ
	ZiFc0nA8wOJHDGG9AfXiPw7Z2KrMgnOK9jxZKAhj2NkJk/uszzBBouqx08gFz/TkXdTy2uF6S7J
	zRgjgEBJK1mK40uG5lRT/nx65IFH1Ov8=
X-Gm-Gg: AR+sD13NCkvtPCy+J3Sm1nlNoRvRX6fqKJgAJYsIJLua64ysOpyAmnUjVVAiaw4UEND
	HiNHFcvCfEN+HpJdz1uDuURX7qSaJvsPSeBsfGbobduOPAJbeCiURpR8LeQSGoitJH9w5BEcm6R
	xJVQJFHGcgrmIonkbnuqyr6NcjSoA8khK+AHTHDNlJbLuh0eyKjrJOwd/plhLFAsNPuzT8B/Blq
	MC27OiF3ABboN2TJDDrCE9X1pvxTfxf6ZbZHt4fOnOkIBne+xrdbC+kbNMNegTErOpenPuOofzo
	KPBcRqmpOGm3COsFpWtuZyANF5x7kfLNcEly2W6LQ//XwqoODHTMdndLmqAaKDzDyFUkwijWSIy
	rzOwpnt6eKQM7MC9OfJwpaGI/TMh8KQ8z5NzqZk4jn6+weMn+j/uIGehykSyU
X-Received: by 2002:a17:903:22cb:b0:2cf:7dfa:7f56 with SMTP id
 d9443c01a7336-2d3b0c5dd2amr40185465ad.2.1786703434950; Fri, 14 Aug 2026
 03:30:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-as_casts-v2-0-cb76a4d3a6ef@nvidia.com>
In-Reply-To: <20260806-as_casts-v2-0-cb76a4d3a6ef@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 14 Aug 2026 12:30:22 +0200
X-Gm-Features: AUfX_mzbSVhZjPvAzS9iZYtypbsJ35PZ4Nm04Q-zyNGgr6kR87uRIK7yu3xiGYU
Message-ID: <CANiq72=UbRsAJ2Hyk68HDkHL+TVzg9n992jMSO5Bt2iEDYhnrQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] rust: add functions and traits for lossless
 integer conversions
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 9:36=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
>       rust: add functions and traits for lossless integer conversions

Applied (just this one) to `rust-next` yesterday (next-20260813) --
thanks everyone!

    [ Added a few more intra-doc links. - Miguel ]

The second would have a bunch of conflicts when merging in linux-next
-- if you really want it this cycle, please let me know.

Cheers,
Miguel
