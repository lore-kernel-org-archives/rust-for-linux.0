Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9579833CEA2
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 08:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711771; cv=pass; b=pxi1sxdVkI6T5O0i4ckRyOtIlbcaZ2i3/GeQQqVEpP1cKqHyqXodcfXsrp47xq/McUaXHfvg/g8cqlK9tBc5Xug5M6MtrhXysEvBJQUQOH6SOJkAPM0k1c+Oobdh8+Ri2GAk6Jq4wOWbN//5Xs6meNDaWp00qdmABzIf6ZJP8oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711771; c=relaxed/simple;
	bh=F+AYKdYj2aQz6nJ8e+WKOgPI6YaSnBpesxFCe70pCfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OarB6nbPgQeEStu/cVOH958JQE5G9uCofrEmpFSZgtWcv0lNzHU/gP3km6peWeQwnEymNq9JvFgN+iF18VMN2+auAgbTpGpoYjfspyoopR041M1S7a2NNlV29fi7BCir+V11ui+UJDG+qHT/AwegOYI9gzXEjLzABBxgLFO7toI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyHvt9lc; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyHvt9lc"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-124a55b7bfbso185742c88.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 00:22:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770711770; cv=none;
        d=google.com; s=arc-20240605;
        b=cb/kfSOb9Zd8Rod7DP4hLMgPOvokDU0o+KQEy9RS8FkeDXrr9zQOtyXzcekxT772Pu
         HbdWujkkXBvlpkLiCoYq2yTyahaQt2BjJbJ5fE7lr+ZfyO4GjN4B7j7Q3MG2mWRSxRJx
         KKi9aasQ+OGg2K4dkM1e1BVlDiyOSpnF+/vl3y5GdGDciyqmP6FxoQ7k28Lyzx38qjOg
         LlEMtERqsaIGWIjnLjDrnUQAncG8hX97nIm7DWWuF8jly9BTZdb1tBORiktvLEbTBilV
         RTGR6OsDjD3g/2JCEUYpfR1Lx+NI9UbM4k6cfgxnjLyQAWOqVdJtrWC4Sj9HCFZbP4k2
         5Fqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=shjJtnASrnoyuISaERAPsmt/LqCJ0MRRnyZEjLgNklY=;
        fh=vm81tOLbPyssGA4Oj5xalBl1S0QlArGRxUPrsEaeLok=;
        b=RyLDywANe3BVAB31gbCZ38RTUbR6DW5d97d0lLSRYwzQoFefVvW4CDtjpItPjuZP9S
         IuWlID4DXO8sm8XmjhjjjP7yQCDyj0JTKOt2BaL313hU9Uz9EJcLsuxTEucHx5YbjvOQ
         TNuhK6K5ppvE/DTcpwOpu0pQUSdXcR3G667iUGS7Lf7l3r5q6jgILx2SQKjnGbzXEgjT
         paSjAa2A3zQfdZFWAe5EbR3RO6b8OUh95rxyfJjCT1lLd3+Ty9aRTU8o6hUFA+XXzhIC
         Xtigefgt96fqVKYs9yaAxBixXJ6sNVz0Fkn9+Jy0LCKNBG3zcBEaqmUETmWajL4JyClk
         d5PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770711770; x=1771316570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shjJtnASrnoyuISaERAPsmt/LqCJ0MRRnyZEjLgNklY=;
        b=CyHvt9lcZdhkePq81jZfs3kQID5qH1fXl6W53uxESQy/JWy7NUlqIGzDLoTsh5so6P
         IbaYEBuOXw2jgkzWjacnMxzVm2aKDAzyWMc59Wii4/83cNYmJLbz+yK2xHoHfjiNI8U+
         Jbihtul1GXSEJgGeykaVBh9GgMnFRIBMUvO1jHFdMQS5HhLv0msJUO8qOKaGwqiiQM3I
         dYlpXlvlGQgaZbwDZ/j9ILTk5zWyxIKdTumeZ1MhtJOR5a01V9FbPMmZidV4LgO18R8n
         eEOyOy1k1agumSYnsN/Ys9ltD2jdmTqedVSWpvyMRG7rwYW+zuf2zrGG2+y1ZKu5eTL8
         6IHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770711770; x=1771316570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=shjJtnASrnoyuISaERAPsmt/LqCJ0MRRnyZEjLgNklY=;
        b=GX+p64YBDDCk+fMOHimSPJ9BxB1i1oxMA7BpB8WWFrhxt95RFqNUCknxO8iApoM0Sm
         2Q5ryF4/2Cuy7gm/Qc+Q3KaY5D95v+cRfcsgZtg2u1IxAC3Ak8G4V0QdZDA5LyxqInXW
         YAwNtN1V5HMfDi/y0mMTJABq9tSzIX1Bjf1VmuDgEN6fYrDPeh60Xw4DoAnkNRl57f1o
         lIPLdrTkEQR6XqjMnSR0Id2vWiiRsRZFcCGeRWIzj1KO6xIFBadfUiUFxEOtOd6EpZ4j
         uoCY9/fuX0xayb6uxO3GRb8qrsoOqSyrz6FN++6lc2gCaB8zQM4YBqIs8kyfrf/h+F2R
         93MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbVLI+NWiHUCk5rF/LARLBrlUHfM1apUnZs8bSqI7K5My46K0wukWG3gmHCJUL6QFtOoUu6cmXbArr3bkHOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeDLTCsALbE9CGpfgykp0uUT0huJ4WJZhXMbU9mUIu7evqokjh
	NjkfbLEW8lBBPJtWcaGe9w9ec8rK+sABGi/ikrj3T/g6daANG9K/bK+K4rE4MCvNr6kIlAVeuvS
	2ed/LtTN7EiGEwjYoSw25nnZwoi3h96o=
X-Gm-Gg: AZuq6aK2FQqco/EsfNZpKCzQYr68w6b4ZDLATGhg4/DtQAXPQCQhuaw8dXUb8qdCVvE
	RC+GXjFrxMAEFHCRUBr67hOZhJvLtzvnv+f5xUK1Y76u2v/axe8eoyiQyVVd+A4gQtR0j057ywh
	Fjb/zGmY2BHnwrw8TQTrOv0hmaqiDdRjI2s5pLqOY/5HuoOtnXlYUYwDb3KnDJs2luh71YzURBf
	joKxIqZW+S5jJhxiyhMCFGbEFYmUgY1WsRJw4/IiOH9LJjQJq4+xS3Aqp0HjT4CT0Bv30cKM6G4
	PUu+sIsidEMm7bikLBP7Nh1McIa2FgEV/nlxOOXiKm3pbfCuopdOygWaGCKhe97gHd1Qe5cvES2
	WyAfibaWoE9KIwjJ+TYI4MzPg
X-Received: by 2002:a05:7300:3721:b0:2ba:7322:6bcd with SMTP id
 5a478bee46e88-2ba8cc89047mr179670eec.3.1770711769563; Tue, 10 Feb 2026
 00:22:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210053756.2088302-1-mkchauras@gmail.com> <20260210053756.2088302-4-mkchauras@gmail.com>
In-Reply-To: <20260210053756.2088302-4-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 09:22:36 +0100
X-Gm-Features: AZwV_Qj75jgKNxxldUxP7x9MHEjb0UnbouefGOQsNNhG76ZuqB3-iYmqrnpWbNI
Message-ID: <CANiq72=nc901311qq3C_Lg7rZObFjTkZ7sQoCP1UpufOOkp3eQ@mail.gmail.com>
Subject: Re: [PATCH V5 3/3] powerpc: Enable Rust for ppc64le
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 8:18=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> -``powerpc``    Experimental      32-bit Big Endian only.
> +``powerpc``    Experimental      64-bit Little Endian. 32-bit Big Endian=
.

As I mentioned in the previous version, this is not a valid level
(same in the previous patch).

Thanks!

Cheers,
Miguel
