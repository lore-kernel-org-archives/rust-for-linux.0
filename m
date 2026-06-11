Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C962939A4B3
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167888; cv=pass; b=qzAg0m1FWmCIYyx6tW3VLWgkmOxe+n4YcN4UHrSN0qdc7vnpk/n4cKzvD8Ob6xpJignCO2CIdjEm0RYQEuPTSVMtHbaoQZ/fuZ58qTWnWBzgISCWdkMQoKdLeWUqzcJdxKM2U3fSRNp6JqRQB8E8xT+v0smjRtZpzNQF9tcXXV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167888; c=relaxed/simple;
	bh=Gu6SXLCI0/eC/AnJZSyIbfVO8bAqJ5On3y51xTlO4vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GK5txF6KukvJRqB1UK0rpr2k5nly3VOgFBfYB4iXOekkKEc6FNRd4M1xtTTwnRsQEgbV0qhXvfHvyjHw21AVwZZnvbp997O5wHuYOvakThKqC/VILkxC4U+kGulQqGiYAklzz5qFdbh9MeATlzz7F+hUw4iWz7b6Ve60zr/qUNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISCmgUN1; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISCmgUN1"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304dc707c7eso719008eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 01:51:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781167886; cv=none;
        d=google.com; s=arc-20240605;
        b=My8cGTMm34J6e03b0MAlL4iNG+fTL2YOYmhC2QrqRc8QzFG8lkYWMv5tI4e+raDcXB
         TSymHYL6WS/jpUhLqZK5UOfggc++bUbk6TTDJ0U7gvYgdwtBjzcpVZadaBm4Iyr3C8WG
         tc8ahV3yfBFDX/MMCGpLwv97WTqEXM23N6vitwFR1Xkav2ZmCXESECdJYDkg+WgbWN1y
         zP5M0OIqvRVWqGV9LVk6+9vhmcM4M4ZVkPkB9bc0k+ELWdQgfE07gR2wdl2Qi+tIdRNA
         zRqnH0whMhplQVimHzQoRhjOlpBFN5nHePzmxx91kopt4BXX9Rd3saUpdKLDen4kF5dj
         fLFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gu6SXLCI0/eC/AnJZSyIbfVO8bAqJ5On3y51xTlO4vw=;
        fh=UXj4Sg8WItrpjnPMN49ihlAg5bJjCGJd3Bk6kSp6lOs=;
        b=gN4KHANJ91zpfdGaXLclq8RVEDseL2zWIRPbv36/1ooMlN6sqmZXZ8A9UIwgwKFmM6
         kRynt22QpISJc0QUsgrin84vnmb4oY72ruEFrt3jImhKQnEhKntYwf6jJXld0iV9GWUY
         CRBpGwTovsEdKMrDKlNp2Z3Gq2emSH5VwTSeD/1DOTq5MGFLbS4FLT4D9O6kb3bWsf1q
         hpUf/sdF1e/DPhzOd1ibLbE4x5PYWgVlpXbtkPhityXCsKm2PVNft5etD7csYCy8x8Jz
         aMcp+0d9cjaUz/MDDchSppAAmJVQefuFpZdYhNaU7gNDKguE07JCN/S/PQUvjHI17Xwc
         j/9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781167886; x=1781772686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gu6SXLCI0/eC/AnJZSyIbfVO8bAqJ5On3y51xTlO4vw=;
        b=ISCmgUN127MnDQmZvuNvPua5E2Z3wejAYTONuNCTVxFJsgyvuoJa6RUjQdsaDOAcju
         sh2ui9Me9SP3L/dG4+Bvjoikthl3LxcUTCn3TNbexIIcMHXX1iSfQr8K4aTSpjVXLo44
         Ji7/nuwDdqtang3hiKJySGY1m3pmdlzPhCLJZFsRE0hQUGKD+O4i1xlEWF/l0Htra1QH
         Qj6DvqL9DewNlJI533GII9Ag2qrdtIE9nvyGz6bq1jWjaDWSwZR1lrBZIr/MfB+W/0QD
         hLvF0S1KstRi0ZgrIDgzP9JQaGl+72ez7/KNOLWQL9JKLBTu8zAvAsWmg28PaFXswxtU
         ciIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167886; x=1781772686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gu6SXLCI0/eC/AnJZSyIbfVO8bAqJ5On3y51xTlO4vw=;
        b=jGKdpcKE6aunfeLe0COCOAhZLm3HTtjKbEwdHu46KDlsPPD/0UFD2iFgCTL0F8t9wp
         Ke0IQPlJ0X0FHKJ2mfIfVBlNGI98rSUTKKL5ICgF/aNRY04S+Y9SMy69V7Ake6GI6ZPW
         6tpoTORornjHoYdxzulHfkQp3k7tI81aCrcr6XMpoffQzv67Kg+jeoTZZYw9D+4Ym3lZ
         HzLo8DoDQdvMkqO8zKJriJooJ/DD8uHIomk2FXAUDEqCnAzTiueYGUD4OcNN7nVdXZGm
         +45tt3XCqYk8DcYEgCD3ZCvVH8HdyhF+MYFcna+JUti/3qzGB0h8gMgC7g18d93KiaSS
         HnGg==
X-Forwarded-Encrypted: i=1; AFNElJ9xYweH4k3l0IovVyG50/v2nUXXgLaxfjGWYA+prBi41Cka0MAt+SEPAKbm+T5NSqHfxxyHs1iLpoR2tMj+fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIK3qG+YsxLjC36TPQ+y0e1GU+JXo58w1WHJtxtwfrUFAX1xR5
	OYygvky4qm3+kkvGY4pFRoT2sFakjw0dYwUZk4759j5uEQQ8MYa1PdqCh8QEiKPPUZ4YICuOdG2
	sPjJhRwirl+2rW3/1SL0BUb/4xPICZ7U=
X-Gm-Gg: Acq92OGZlcBi14RT4ZQUD8rOnVOqlqV6MCxoNMB8IWFBJ7JSUVSQddJtK7RyLmQO+At
	sIDXTmnxBK7fHEkT5SyvxI5kzikxbEeWyLctE0ddJQjMi9wtD15OUBHXbenpzr2z7yYgQ+yR89A
	kSoqYYZecUo4bGdSfsQ+Zgl6RiiVlVm0EN4ll8W5VwgMikPUfqB2rrYV2KSCoSS4RhdUqaed5YR
	rCcuGFDpo1nVk3RDTvczi3ifO5v6et7M8D4uDX8blNr6oRb0D1rORj5bTmgFd3kN7PhJ4iptDly
	0tzDyAOIsZIuz+njMRFKHrw70N/qanYL1UNL1RjBOT7kLA18H3MMs3kY3Jpnoe7ewT1K7SZvyR6
	+cTlLkh5Jck6dMLDTF/hB3KA1XnBfodxTmQ==
X-Received: by 2002:a05:7300:8184:b0:2da:b05a:5a7d with SMTP id
 5a478bee46e88-3080410050emr652555eec.0.1781167885763; Thu, 11 Jun 2026
 01:51:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DJ4Q5J5OILOX.1KCPFIVUFN2VV@garyguo.net> <20260610072947.338278-1-ojeda@kernel.org>
 <DJ5A6AM2FDGQ.19T1Y9N1T6JST@garyguo.net>
In-Reply-To: <DJ5A6AM2FDGQ.19T1Y9N1T6JST@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 11 Jun 2026 10:51:12 +0200
X-Gm-Features: AVVi8CeZqdEWXPdGh8thUTK4-wo6B8DARvooPGXEOY6tr17NX-f1ZHtJHf1zMrU
Message-ID: <CANiq72khOCLC5kG5vWhDeXpHv6n7Yo9Nv=PewNS0D73AxUDB4Q@mail.gmail.com>
Subject: Re: [PATCH v4] rust: make `build_assert` module the home of related macros
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	airlied@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
	fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org, longman@redhat.com, 
	lossin@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	netdev@vger.kernel.org, nova-gpu@lists.linux.dev, peterz@infradead.org, 
	rust-for-linux@vger.kernel.org, simona@ffwll.ch, tamird@kernel.org, 
	tmgross@umich.edu, will@kernel.org, yury.norov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 2:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I think if the re-export is of form "use crate::build_assert::*" then it =
will
> still be the same semantics but would be appearing now?

If you mean a glob import (within or outside the existing `use` --
same behavior), then that makes the glob import appear in the list at
least, which is an improvement because at least people have a link to
the module (i.e. but not the individual ones).

Or do you mean something else?

Good first issue?

Cheers,
Miguel
