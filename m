Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B5B319617
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Jun 2026 12:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782563216; cv=pass; b=DCgW3lQahhjcu0jEtfLq4snrKERf7cHQ/LCnnqmo9Af+5ZtXw+FJKTtQrnniAhnjRHQ7aamdjVBz/lOAB54BFPSSH/yXhNMX4dbgZzWEAZ7KdDcTwhnHA/wwf2M1Ux+7jXVvuCOAeYGlqMTjeVIdtPVXZBFTEqHb2zI9qMHf34E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782563216; c=relaxed/simple;
	bh=tiA1M5jTZ3Y/iPMgDja4ldkoTBXhRz6JYbn7HUdPCGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fouwQ/sk9UqUE6rtjvrZC9S1uUt9G/z540ddKz5YSwrBsTestyrpT7FDqa9DZ31/D1gb4QYQm3qsFssvZJEuZmfPlIlMAcyy844BUUsk2R3fiUOWZkhZDdH8pP0ziJLLQtPnGkexU/938f5fINO6xU8Ts7ldfuYaK8qId2FTG0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmpjQN+d; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmpjQN+d"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30c8f531a03so143346eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Jun 2026 05:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782563214; cv=none;
        d=google.com; s=arc-20260327;
        b=HtCDq5cGyQJnVK0RcWTmW4qDpvN/hXWJO2M5P7/ctGzr+CPr5dUSjstd6aRvIzT08W
         +/qxcvC1DTWlZ8T6I5S9s5PlG0mSBDbGFy4Xsqugk31HuRrM4nKuu0l0mn7ZhV0fwFnb
         NKAxUH+o4TPDYUF7nifcd88rr2vV1u48wsmvF/O+fRMW8tVrtsswujb7f6NCp9lxcO9e
         /M93IkPD35MdnhLV/Bq91nQOc723Bhx/zZ9bcahnVmvEIjQcNq4kUHcUqlUmjJIOUxVf
         0Tla4AN22Zq1TEC5WK8SUOrZKClLmfNOtqf+yqD8mBtR4OaMLT58Xbs6V2GaxUdbG+sy
         XahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FFA3P0ucfKK/nr2i/TjAG0TaOdJ/VCYkxmATJyLWDko=;
        fh=tGxuBPlG0KNluYCzNdk/zon1+yhUcNOA8YT77w5N0KY=;
        b=js+LJcf47L/Lme2vevbWu4zzgED8KNnWMbVompzyx9yOcSCFlACtkUZ1g9kQj7PGE+
         JJ8+LN36BehGD3lAHUGodT30UePj11PjgW+TomU6kCpnD9q2fU3f2ObfDeidbf8F0YhU
         w3xIbzheahbGnTymllqYzUEVek+1Qx0ztPZodpKYzSM10nuas1kPoI3PvMQLinLkHYFZ
         RmDmvg1W3Rz448n9LN0Bi65+t3ltFUIqAMz04TVMy2L0C/kiob7njtFp7zj7GKAUhQzP
         DMBCejQBVCJgzhe22z6OTORwg9dok5PoPGcDwEC/P0nCwY8NBaCNouY0hC7vU8r8ZKj4
         wJtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782563214; x=1783168014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FFA3P0ucfKK/nr2i/TjAG0TaOdJ/VCYkxmATJyLWDko=;
        b=UmpjQN+dbFsh7cj/TVQnupfZ2TWKdFD3KmaLWZqt5wrAlZOdMBFMmyvAF0qHYagFCo
         6hDiJPGGwmSeh5YioWD1iIYM+lk4VVl4qjK9DV4tQyx4aRuSQtWoSzx8pAsAE7pTYD0+
         U0O9nzz9i1SUCYPl5wGqBdfn8Cdb7zOivdDEg0SxgNCRMBAuq27G/XE0tYZ8Lv6GnQRM
         oW4ETaTpYIK+am1brMtlY3CR+egEc5lXcJVOEN4o9Wjrd8E7wR3TZVYkQlhTMbPrwQtO
         /pLywOlTx6c6JPuoRaFhtX7uQ1pd/efvEnGilwswyGny8UygqneNM6knxq4/p1OR0MdS
         833w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782563214; x=1783168014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFA3P0ucfKK/nr2i/TjAG0TaOdJ/VCYkxmATJyLWDko=;
        b=c8vAKgAe8huC+r1tmIPlQhN85yLmTvCDm/Omk0m7jzkUEk87o3+cUue+BbWGgPZnru
         wUjUbYi7qX9MmoUMWHQyoqbxNajd8sRRjmL/r5v3osNaRvAMLWCJlh3dYiN+L6CdVy5J
         sYZPapQ67vTiVTLirLTUDjnYfvBWOhgXAcrcTttJmhQFy2VcbhiBv5bfcNLSOBejIydH
         yn6W5XuVWRmuY8XZHe0TeQMCkMBqwkx3HdmK6mpPM6YuuIVweZ+nUzFHu7Rrb0gJXBEo
         BGRkFpi2FCxgIP8cXWrjoEHrbua1wAKKz2YKTjbKLO5dYTZFFx9+CuYuK6YMjud+zmaJ
         QWXA==
X-Forwarded-Encrypted: i=1; AHgh+Rowo+fZzg9VBYgRUv51Jh4E2MsfVbWHfSQr3M9u2siYRi5XVxjNMRFEEOTzKi1r5hSiNOV+rTDnK3AWLDyuLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyojUw4xPwlnsyEn1/3IZyiplviFEl1Zui2QI9nbakF3z865WcV
	jxWkKTNPo2xlCycRwZDwOzTqG2rWn956/ZC4RwzY11KhnC/z39KSq1yQn1UWeJ2zS7oKsYBYMtr
	io5NVc1GlWwfiZG0cW6Q/G0fRnoWHtUs97w==
X-Gm-Gg: AfdE7cnwYbCJiwFMw6fXpwHvEWSHkXei76bieuGfJJG725vBmAZbyS+B4uvJ94d0rzW
	QdmgdaB9meiIZFrTOkZg83uZ3oljq4E0QBeXCseEMrLrMUGwIRHfb6OjjlOi++iYic8TFXdLr7b
	9uDt4hoi+z1zl0zrUQGoD2KIGRFDEukARdjHxgO/h+pqOdzCzacMo6EK/sV3ORhIth97YPAAVW7
	15uiNIk91dozzDQgpdGESM42RhqxVhr+eSxpQ/2tCUKv51yJZ7gvgB45+ncMCFZLf92OTXaBkj0
	sQ3Bp8JWga40SSoJL01YqQTnxpqivihzlOb4+KURtzgtkgwVtxUf56VWnCohpPHF7tUqjAC/DGb
	EX7wqb7N78mrG9iB5QHfPkQI=
X-Received: by 2002:a05:7301:608e:b0:30c:a4bb:71c9 with SMTP id
 5a478bee46e88-30ca4bb7593mr2120179eec.0.1782563213899; Sat, 27 Jun 2026
 05:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626183630.2585057-1-dakr@kernel.org> <20260626183630.2585057-3-dakr@kernel.org>
In-Reply-To: <20260626183630.2585057-3-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Jun 2026 14:26:40 +0200
X-Gm-Features: AVVi8CfTJDNVo1KxD-2qMWkEFrV45PAxG53CiKejEkAqP1d75q9UdnCynZyU0Y4
Message-ID: <CANiq72=0OOgc6NtbpF0Ysdk3ytRWCGGbWg00u0Le2AzQmKGKxg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] rust: types: introduce ForLt base trait for CovariantForLt
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, acourbot@nvidia.com, ecourtney@nvidia.com, 
	m.wilczynski@samsung.com, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, daniel.almeida@collabora.com, bhelgaas@google.com, 
	kwilczynski@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 8:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Add a new ForLt trait as a base for CovariantForLt:
>
>   - ForLt (non-unsafe): represents a type generic over a lifetime, with
>     no covariance guarantee.
>
>   - CovariantForLt (unsafe): becomes a subtrait of ForLt that
>     additionally proves the type is covariant over its lifetime
>     parameter, providing a safe cast_ref() method.
>
> This split allows non-covariant types (e.g. types behind a Mutex) to
> implement ForLt and participate in DevresLt / registration data patterns
> that use HRTB closures for sound access, without requiring a covariance
> proof that would fail to compile.
>
> Both macros share the UnsafeForLtImpl helper type, distinguished by
> a const generic N: ForLt! emits N =3D 0 (no covariance proof),
> CovariantForLt! emits N =3D 1 (with compile-time covariance proof).
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

If this goes in at the same time as the move (as I assume), then am I
understanding it right that if someone else was using `ForLt`
(trait/macro) things would either break at compile-time (which is OK)
or, in the covariant type case with no `cast_ref()`, it would build,
but someone could in principle have relied on `ForLt` providing the
covariance guarantee in unsafe code?

Acked-by: Miguel Ojeda <ojeda@kernel.org>

We could take the chance to add some missing intra-doc links, but I
can add a good first issue.

Thanks!

Cheers,
Miguel
