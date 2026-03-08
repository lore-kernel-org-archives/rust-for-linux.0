Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6167114A62B
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 19:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772997389; cv=pass; b=lxkPLQ1zpamBDvB8mjuTZ+rxF+rKZ2CmPp5n2y90cB+hx/bbLTlY/skza8aGJ1ITJJc42Zxgb5i1I6vxdd0p0x4R18qnwFZ6Xvj5UsdNenkZ3ytvHHzOapPnF0pNQ0Z1F3WXEHa/cAGivXPZbeEd5YUEccy76CLo/deoT84VKu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772997389; c=relaxed/simple;
	bh=OoM/WBxM1I8Ed2nQOe/ethQEmYCVMbXjh/MzJXB7iOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fzbn/qxG6glu5qqCP+JpQlspl4w5raoLX4NEIhWgcCmRBTObW6GSulbrCht2LqJ/qLGCRLlSRIi8Hg40cUHNOA8lV2B9Jzvp7tq7zkSAKwlprP52t+jIiSVUY0AvMI3zZKq36UXz+vs0a5u9co7SgECLz+E5k0Eq8Mzr+8KWx4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkN1DAhO; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkN1DAhO"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-128bae6a35aso203744c88.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Mar 2026 12:16:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772997387; cv=none;
        d=google.com; s=arc-20240605;
        b=Y7msoNQ66ni7yUTUe+zmgHMOkxK8ypL/sB/HVbbqs3M0eIDrhtImsjsuLcEP8i2tzP
         U77L6rxiixAZeLJ5JRuKY9otEZU8psW+tSY0LVfXh6qf4te7AP7Obnon1aAATmZrPlWn
         wssnf9dp0oYCNXKAnlBvF2geRs612t6CFVeiYY2uoFsw/Xc95ymlcwxB2NaoJpQ4eNM/
         MC0nO1jKiD1YWi/9lx9KXzpDM1DJMbRKh3TJ878GK1KULh4l32aKo9pykXoH6oK6b7L6
         fz/NcMegAFZQAM0Wi+jFEhjIzjQs/D0dgoVScEricshsc/dDDVHUOib0nwISvWZ124pH
         Gp1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OoM/WBxM1I8Ed2nQOe/ethQEmYCVMbXjh/MzJXB7iOA=;
        fh=HFHgAlLf5SmM4T4HCu9uzawKwCGlJwD1lZ3M2GrPuA8=;
        b=Xu/aS47VNWhSbr1BY8ZucW6/+z8qmnm5gChfUc/WP+Ij/3eyaQSXCDguGm8cq+EjWH
         0m0Y+6XbGgo40R0A+v0GcQyPKDFvFjXzd9TWdi5WcbX4nI5BBXGbytPEB21DplYULYqL
         4UQfLm9csPIa1rdyYuJvx3manXXJmH7626IFzAu/Cgr8xJSiHgi8G5GGgOmMk7byq6nX
         qYL4EtZ6GHJAGG3q9d3ObSCCvdZcBJYxAxgvBuithijzmVVjSBAGTTYxyM0T1Xf8Tikz
         /SLOnDoyaNiU8L1vUj6iWmoUiBXVBpK+f8Q1CxH5f3G/FxuLTUVENq6VY7rE3C+MuA53
         MlyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772997387; x=1773602187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoM/WBxM1I8Ed2nQOe/ethQEmYCVMbXjh/MzJXB7iOA=;
        b=WkN1DAhOAklPngTa5C8A7Q0b1cURPD5QylwfWolGOBa1XhPuYVlo3/0juKEuKLi1/N
         44YlRsZ2IxaLdY7Kav7WtOReNdcVOOsr+OuM0ykXWJSpGMHtz/I5brGwS0/PpBNW2PQa
         In8tlKcFwj0yCZfYs7NIPPuexAV3XCjekv53s+9XVMTYPvoW7hMcv/vBgvmlBOxu2R3D
         u2inTRIx5IWlVrOIn07GH9ImMTDRZTF1kQkOzaRwkbzkg1BrEC8GhZ1MKzJ5BbzjGypr
         Bz97hSagdS3622NpND/eTodsWzTlUZcoyYsmgLOVg1qmiJLb5px4w3Ab1pmxffSSXJK0
         4sJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772997387; x=1773602187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OoM/WBxM1I8Ed2nQOe/ethQEmYCVMbXjh/MzJXB7iOA=;
        b=Lb8DEwo20uOztNCaykfn7GuR0p/4PAjR7uzMvCMu0gFJaToR2wb3UrkkNIOBUwF6Tb
         yDiq6cggmDF7PKApIBMFVR0GoxsTCkEQ7UCyyy1A7lWaKyzlgNQcabu3Z3xHeUsTQ19g
         KyQ7AYPkhR6mj9JcNz0zkggTDmnGU3OLvWWUDqUsuNombAcH9BEtFEkEeujwcevb1/GR
         rx218E84Sqt5Vk078rNahlOd2rZdx1rcpooe6uCLOdxTQlwN0itA9fLrS2tSKqyhGiz/
         UnvMOvUvYyLzwJjBEhh3Y0VUA7THtHJ9OqXNRTT+IoSIAoVNVl60H/OrgaAFS1EPzz2Q
         VWiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpxid3nH2WvpVeZ2AiKqRVlIGlyC4Q0K1I/JuhlUWby8APprOm0UKF3pj/CxlgnAu0P6e51+y4tEiaKsE8yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxAEDyTFzc96dGfNp4eTOP+7n3EfkDTHvJuzDMzZ275Z5I7Qjz
	RT6iopTpYc6Vw0D9EenjUNNZjDBepX54HcniqEANIthDzYoRP7tROvmWJohjTVdqwU0MAklrU4Z
	xuawZxNulLKql/jYIjikt4ptc3UniIdw=
X-Gm-Gg: ATEYQzwG+CUWA+LEyqGmmhPrlvrAMVV18mrckWtZzb+Nz/+cBi+5F90It37+WDvJqUH
	WOsbnT+frPV9vAJD60Maf3RZwzBfCRJ89M3NOFNpSoDXgPpC4iuEtYLZKL289t1+GhxxFrS/q4l
	ZxJG72n0Bl4wlfJt4XOXqTHNNg+cAVjVlIbH+zqwRTicOujkFeF9dL5VPfR1klIN7bj7gRCpqMn
	rcs8cZ2SPcdE6chMXaje4R7QM30LhzL7iJp2c8QHpNoWVfsyNA6UnCUGyt4QCKSZ+VSQa+98pcr
	gBCMkGkLvTc66A7B81U+Dfo6Jq2Yr20J/GaXF0pc4qbb2gYIO0Ve/Yp/hRPnSdgTlwDTtbANATk
	CdSPHgK99Lpoxr5gRWcULRBmw
X-Received: by 2002:a05:7300:724b:b0:2be:140c:bc2b with SMTP id
 5a478bee46e88-2be4de7afc2mr1754785eec.2.1772997387328; Sun, 08 Mar 2026
 12:16:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
 <20260304200715.76360-4-edwin.toribio.j@gmail.com> <389808bb-f71d-4c35-bfd0-b4db14268d58@gmail.com>
In-Reply-To: <389808bb-f71d-4c35-bfd0-b4db14268d58@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Mar 2026 20:16:14 +0100
X-Gm-Features: AaiRm52rG8puc9hF8MHCGxtrNxjJwwn-iuvjSDLwS0_IZhQ2jcoi98z_O9DHNQY
Message-ID: <CANiq72=Qe3x5xVQsFOd4YuD35mOan=mUt4PEFRQvStGnmLUcQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs: sp_SP: Add Spanish translation for Rust
 coding guidelines
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: Edwin Toribio <edwin.toribio.j@gmail.com>, carlos.bilbao@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 7:40=E2=80=AFPM Carlos Bilbao
<carlos.bilbao.osdev@gmail.com> wrote:
>
> In Rust, there's some keywords like # Examples, # Safety, # Panics, etc,
> that need to stay in English.

I don't know what the translations' policy is, but shouldn't all code
remain in English? i.e. not just section names, but comments and Rust
docs (i.e. `///`, `//!` and `//`).

From a quick look, at least I see another couple translations that
keeps them in English.

Thanks!

Cheers,
Miguel
