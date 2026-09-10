Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C7D4BB266
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056885; cv=pass; b=u0dk4r+fVbSeNptHRgixmbDNCLCw9sUPrXtyRpNB/liVvE1s7zDTTuaw6Fn8s715WrR3Loi27PKW9Gn/bMpsoGfR+vYXQUKhUmWPj9F4m7w7njDiOAJVGVWke9SRa+KmZo2Fj3JxOGPo2SJ8q3BE61lRlYMad4toQAM5gjhLW6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056885; c=relaxed/simple;
	bh=AIdeJfpL79Jnckoa3vMq8Pu7laRqtN2LS+kT46oxafc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJBj+uGh2ksrfacKld1jUclqceci+Vozkz1HCAYFt8BlKL2k0KZGCtBsKpqLqcO6XAHobLI5EsmNynAYbHPjtx8yxhTSE9tuWGFfy8tM7LbBl7SDgBxvTQsZvH+wMQ1I5vZdxjR3Vgu4Naj7qH4mn3Yxtr+C+g9wcNff6M/2GuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3gozuAj; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3gozuAj"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1d189a400so37a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 09:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789056883; cv=none;
        d=google.com; s=arc-20260327;
        b=qKzWoeK58hQvEkxNPIIX5pXcm6ECyjEuf542cSWlOCh1wmSD6msejoW4qR3DML/afA
         h3qmaf4L1iagRzsX6sGVVh0FYzRr9tjh7U0xMx3TIiw/B8S6gqw8B5/TxCzCXd/khIav
         Wb1Em7N6Qw5Qfk8kvpz0q1gFmuNA+qvLZXQ0DRsvDbCpOxE1WthDAjN139+HF26CeBMr
         4xywMdPjUUFOoRS5HlXYGD+lHusn9X4pZ+72ge9dJ57RmtWRboewTfoyZTKR5pg2fCUU
         RoxJdDQrXQSs+tts0ibn99mduZ268yZUdWNCziYVq2H0iqIlQuWodxIxdTzKs7Kvtb5w
         PHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AIdeJfpL79Jnckoa3vMq8Pu7laRqtN2LS+kT46oxafc=;
        fh=KU729isP575GCYptcf0/uaOGImSCA/RiwTXVH43Pumo=;
        b=U9QBFozvCWsEH5CkDA+h9cIS9Wsx2tSvuf0A/gxRXN0gMrYvQFyZTAEUw7ytg27hCS
         Hy5cWamaCNIh/n3kTQy6x+TrIaAs4DDXAvUyJNOFjO3dwDV6ZKm7SzZI9hHlyGy+sePg
         Yt/bASADrpwfWmRK5p4lsaLDOm6sjTDoT8Zhq7Wn1rURv5JofDuD2j6SM8sO61+Y7TbL
         Vt0tPA0xGzV72e4sLNTsJN0HaSNK/FMphiURPcTBgOTrpVZCRKjimwiDPKbCEzfYWJw8
         0+sGctgxozdLBPJLtiqOfsRQjNY1ZDrXFveCHX80IlpIhhO1B6pie+T5/ORB4nce5MO/
         x15A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789056883; x=1789661683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AIdeJfpL79Jnckoa3vMq8Pu7laRqtN2LS+kT46oxafc=;
        b=F3gozuAjfDDbMeZ/dLSy2CXjr+RjB/+c95R3VRdJY9j2ECNnpTLl8Ln0/Lsa3i+JEX
         o20WRjxX1ZltoNB1JmAgHuVAuaIjPxEo8VOgWNy+leeH0FUSFgibVbT8AJcrIvgJmDXH
         qmLqVy58lsjL2JVFPjtlCMeURg8mL7ZasrPHhYHjYSl5xLCBAAvVQbUhcOEvxE4tRyUM
         lNA2SXaxmN8czo1K9iLlb76i49BLzFUi96zKi9dyF5/u4ziPQ6ZcJAU9Aqf1JAzkUZaN
         h1BcG2aQKgJAXkHLkhpDLlDglKIkTVEA3TraZg/u+YYW3RWb5kHwwLnYTb42JnRZx528
         TIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056883; x=1789661683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIdeJfpL79Jnckoa3vMq8Pu7laRqtN2LS+kT46oxafc=;
        b=ShRcORrj6Txevkf3MvWpv7Vc0o4wZAvrylGY8P1pX1ablevkNrgyi9D7ebR4yXLLv0
         E5c3uChbWE5M/ON0Uvm+WTlRp9XsLTVQRxu9Vb/ea/1JmVoSYmwEdaL2OuorqVEIIFSX
         Nbl/8eg6YUL9dytlXvx4eNmokwf1fcoimsj7AjmZkh0Igv0uO6gl78tL7p0QZ/v8dOtG
         uJ0KCLGqgFapFazpIjh93Q1YJyY51XMd+qNoEPrhYAKa8PH28tUQ47EjDFOKenbVsIBB
         xKFSr0gQQjmX+Hjdmq3S9C3s/PK6HqRA7Z/9YxBN56/FhzfLcibfM9aXS1DLg7h/WSM4
         aCrA==
X-Forwarded-Encrypted: i=1; AKwUvBzEe2VOCl12SCOBN7rGOwNAm6Id/klREdSkvVzyMnZuZf8JJoM9+GMoxQik9r3cAT9EKCzGXTu5sNDa1Cb8iQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nfR+8kx61R95lY0QXmvbuWwQtacgjDJM9NyzVo7oDleN/K++Hb
	jm+tLUEKmSL7hIGp8iaaCOMVCB7jKa7YAEZqAuzC7o8S46rLlom9KFbrDcKX18ZMrXbJhIIoHGK
	oEtuXdeCH+FL7dLzOQEx8YxGLo3d9f9Y=
X-Gm-Gg: AYBFou3vUsUUlsv9dTS1AA+TNuHHe8NgUEpPuoFAz4mNFlzUchVXtaKusLDKAP1GGAT
	Ct3cpJ0U36D9ZqZhAKc1SlJWUa6prwVmFWQquX1a2Z8PA1+6xgRtPqQlsRDdJzcDKuYUPPvqE33
	NHeXrLz/P3A3Y7H8ZwbVmqrV0X2SlXMg6bW+PEJf1zZ3qLzcpaOdbRPoUzYJDVom6SyvuqAnAtX
	At5nrRKwMGLfDetcFARoIUzKaCWecgRmv2aV/77pXBYMmqKyEtIzAvuSmWZ45+alw+utcfWcYcC
	7KgBYaKAUwCqKM9JWTTv1uD/4sqUyg4LKepJ1rYRPBAWU+TnYslyuPH9o0vln0fvuuIe2gju4jD
	HqU4/3P1kq9B4cPICRTWeRLFd8j2AeRH1ryR2VYeHNikNawig7GSbxPwhCyo/rBDSzrlAyrLwY6
	OYc3zNFy97Jqd9CNu8mhwen04WGkzDPxMKRnD1jtaurjzLtwPVOI0=
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id
 98e67ed59e1d1-39b3d8377camr37403886a91.6.1789056883468; Thu, 10 Sep 2026
 09:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828024335.946-1-nils.lehnen@proton.me> <CANiq72mn2vvCL2VP8yJxmzXM4n+jfV4R7arUcj4UXSi04y5sfQ@mail.gmail.com>
 <CAHC9VhSuuNmdRQ5puaxWh5ez3Dz9LhtAmZU40SUGgEAL8Sn9-w@mail.gmail.com>
 <CANiq72m0yYRj75RQBRprcHTrqfd7=m_OnZAAQfZdO9T3dfUQdw@mail.gmail.com> <CAHC9VhRjjJpv95AgF6cnOdh4g3gC4zViRoiHVehMLx-Fv9b1vw@mail.gmail.com>
In-Reply-To: <CAHC9VhRjjJpv95AgF6cnOdh4g3gC4zViRoiHVehMLx-Fv9b1vw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Sep 2026 18:13:00 +0200
X-Gm-Features: AcwNN1VxW1A9qw4fmjGeQ9XUhu8Og04GW9DSoVdDsQNP46Gy5I2b0ZJEDU2k5-s
Message-ID: <CANiq72mY_Sjg=WnfEEhSx9XZiqwDgqZqSqHa9Tsc4-qR-X8UEQ@mail.gmail.com>
Subject: Re: [PATCH] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Paul Moore <paul@paul-moore.com>
Cc: Nils Lehnen <nils.lehnen@proton.me>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, 
	Atharv Dubey <atharvd440@gmail.com>, Ke Sun <sunke@kylinos.cn>, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 4:20=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> I'm not sure we have a "usually" yet with the Rust LSM glue code, but
> I'm happy to take this patch :)
>
> Since you've already reviewed it, can I add your Reviewed-by tag?

Sure!

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
