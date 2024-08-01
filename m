Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D481A7F70
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 14:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722524048; cv=none; b=rgseztCnkxVg+A6RX/NErxPdSUoK7vPCyqgHGwKFihjYEpVhKGnBCylfo87R+yaa+ecpn+Al6fcD8T5GqR7rUbiZAL5inZiRAeDUWojz/ju9zbRFOaSeMZCSkyKKdrx/za7hMhcKSkzRoV8Qs74DYlrg4bD0g4sNFLlLu12w3b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722524048; c=relaxed/simple;
	bh=88SRWxOKGMT+pDvc5tDniKNYoUKlzDumGAA1uuJmbSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8sMbAqEtKZVJx+3CqXRaRi4ey1QLHS1H+lWl/3Mg+xLK22XlJe2N4hzxP1JZUkK+BtaRJ7tYoy38HmtBDL8G6l3gpS6YfKWhdnJrab2jWX/Dd/P8qdXt+bQQLXTYft7M8xEMA88NWVqvQThuIreIxCH9GIzCOex/0SVD7O1nO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zdHFh7jl; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zdHFh7jl"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52f01993090so10490204e87.2
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 07:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722524045; x=1723128845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88SRWxOKGMT+pDvc5tDniKNYoUKlzDumGAA1uuJmbSo=;
        b=zdHFh7jlUTq/60sRMQsPhSsXo0x6Rh30HHQjPrCGMLusJLbe9iVIJN5+2z0DEOOMOq
         upz/ImDKDEFORHoold8AI6Lc11f+sEf07xy59g50t5b/q02KFnN8cviQZFDNPcPGTEuP
         1aSxQV5yIQdcfSMGscMB2/Dfygxj/lQcawa5fuzMkNRKHgbJhWEXsGM79a0tveROjseE
         2/MVKZVtHSFefldIlr88wJkCR8pxS8/8E3NqGhKrUtXMsLa2fKmv8U79vNPXrB9xIRrf
         VLco7NqukdMius1SivVdUQpe+zz9tEjXj8RNemRO2zjBGvRxPiWmDVW7m12SyKUJPFY6
         zvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722524045; x=1723128845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88SRWxOKGMT+pDvc5tDniKNYoUKlzDumGAA1uuJmbSo=;
        b=JdAc8cMtPcpQmy7vQs2WBxBWRLzHgNBDS1Xk+yYQYD7hqphFy8zP6SrDVzT4NyFuzf
         eWjyCCGgM3rI0h0JqLQqfag1MxGb6MU390zp1pUeLWcuDkYQxDfWIt8dyGLipLVuQt3s
         35sAIJwyOnNehR88EnYaBMTwRyyBRvyzDMjI5ZdeffI17FIamk+RmqvmWW5E4rAwGkRc
         tfLdLzqEXxAkJiIrGRSz2SegmrYrZD8aWSIgTTXIeQurSbI/gSmetkndTTi1iWOXJ2Lz
         Wz5lUmiaSFkSi4fN1n1hQlV+LM+vCXbsUx9MiPj2DRY+z9CKlA/PxiGRbEmfmNSZNuJP
         6tHw==
X-Forwarded-Encrypted: i=1; AJvYcCVV3jodpNyDsrZ6n4OZnGfMZY64AOhBK12Z+aRidQPIdHUCWgfjIu2gtGB+8/EF3kRNh2Zqm6PmgqAHa4GJ9I118hyfin9Qh//KZvOiTvc=
X-Gm-Message-State: AOJu0YyLQK7awCHRFZkcu+9YmyaRZ/g0UiGzp8E5UY8d7948QYhCwYLi
	EXpSuLSdnwDmK5EFGJfzrpjaudU837a9VzGK6O2QlQNI0+yMI2t8basBs3I0wZ2jCQV4Pmn1/kR
	ILT97hUSWTTRHwZeAcZ1B1XluLbAl9kGbf2El
X-Google-Smtp-Source: AGHT+IGS6PECdayQywdeyyvbPEGDV4wA1A0/YWtbHt6glRc+EcG+BgYjN3vWR5zth1qceTxw0AnntGI43ZnY6C3+PKQ=
X-Received: by 2002:a05:6512:220d:b0:52e:a60e:3a08 with SMTP id
 2adb3069b0e04-530bb3663f1mr109813e87.11.1722524044665; Thu, 01 Aug 2024
 07:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-12-dakr@kernel.org>
In-Reply-To: <20240801000641.1882-12-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 16:53:49 +0200
Message-ID: <CAH5fLghEXkAm6KuuQf5R088Vud1cOsWCAkqK6Skz5_OrAoV_Ww@mail.gmail.com>
Subject: Re: [PATCH v3 11/25] rust: alloc: remove `BoxExt` extension
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Now that all existing `Box` users were moved to the kernel `Box` type,
> remove the `BoxExt` extension.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
