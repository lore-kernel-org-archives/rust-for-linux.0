Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D5D86652
	for <rust-for-linux@vger.kernel.org>; Wed,  8 May 2024 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715179700; cv=none; b=M36DXV0NZ4A+RXZousH7vxHsIfEpU56PnHSQ35Bh2uwXMuvYTNOSLt5h8qylZyLFbxvqm6QH0A6YcuJEi704OcP9lPgkstTQ0kml3sVi7ju70jGhaxYZWzY6Vq5F8s9S1w/y5GFU00VI2Iqx0GFNIuPEFI4mYDQRmcP9dXhzwhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715179700; c=relaxed/simple;
	bh=otMq1ex6rs/b97FHiNn7CN1wFMSWg+zCEEI+p3NMUVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZp0c3OpDXkulEL3pgzCjIcFfVUgUzTUM0LsDCS04g4hoZIAr/V6TAWE07VPB24+1vOENgcVAHrplRiRGKMFC/rqjEPDVsgHDJuRQD9KYDlLz89u9GdJ+oaw4gGAnQjpryA6xb3vbIsCDqmI6WVFOKcctgroHNWl8L8TURiYsdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpH7lnOX; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpH7lnOX"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2b338460546so3378799a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 May 2024 07:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715179698; x=1715784498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otMq1ex6rs/b97FHiNn7CN1wFMSWg+zCEEI+p3NMUVM=;
        b=lpH7lnOXiq29xRqKFIAEOVOTsHNDFJRINq7hZtisQdatc2pN8fA4krrHBikw0Emz1l
         DnA2XvNpLFb+X+mrX5QLzV9vUoegsPuzeoosGjHL57FCvtPk8PCgCu1+KxCDC/gBdzw5
         PqMnHp8Yig0/85C7D843qsWJPyfzsPZicwyHxXNw+JNa8VbZXp/Lyi5ZTEszsBxeP62S
         Dvx/8s66IoLyM1IeLKpuviITicKJgv3vYjScylBea95dkCtbt9VT7OgwvEdKlCyMneck
         JN2+775+xQE2gg/AUT+Oq1adXL24RJWNxWaGZf+q2T1GVLob9luk7Nx8y2N/F9ZvVkvF
         my8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715179698; x=1715784498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otMq1ex6rs/b97FHiNn7CN1wFMSWg+zCEEI+p3NMUVM=;
        b=jkemnlKjJH1vGUm0/mmyXIM1OQlK2b6xgOn7ipFolwR5nJZG5rDJiqTbXjzkkCOYJj
         XWher65zSgCDc+34GPmS8IBlVWqvxJv8BG/s5baMVaLMuAJ3h2I2MJYsjg/X/YRePF5W
         4LyAw+9+mQmt2/4LcTqSfDLQ0nmZybZ6ybLYURPL8OFkZKBXGFPubY/yUPhGfju8GqUB
         ebZ3BKfpquti53tUcEwAAXtDHbhc+gti4FgAMXjhIN+7OAwfBP1yvqgFn8M17xYO5hNh
         cNncXjThThEVBXtRzW5HFgnA/+Kd0X+pY7T16JsCjQ0kBRyuy+I2oOapP4KVtizDt3FW
         uNeg==
X-Gm-Message-State: AOJu0Yzk0UkUx2Al/CRenNqj1nRkm5cccnqafc5hZm2C5Tn4Wrpycxeq
	nkYLCHHstgmbwyCyMAgZQVKSXcanxsts0WAAswRmVRq/fM0fLr2VrZ6FF7jr1IMRBWrgg/HHKxd
	Fc7PU8KgnfaxvJAGgDCexBHwH8nI=
X-Google-Smtp-Source: AGHT+IEhyYC1R/2ywDi/b28zHnZSfRWnZ+d6NgSKpFfHSdkggzGIVZIJvpehUTA+WNlhGHkGPtv+oe6NyNULLqcddlo=
X-Received: by 2002:a17:90a:88f:b0:2b4:fcfd:7b5b with SMTP id
 98e67ed59e1d1-2b6165c4fdcmr2611334a91.24.1715179698349; Wed, 08 May 2024
 07:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501123548.51769-1-fujita.tomonori@gmail.com> <20240508.081144.1308480380091479358.fujita.tomonori@gmail.com>
In-Reply-To: <20240508.081144.1308480380091479358.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 May 2024 16:46:49 +0200
Message-ID: <CANiq72nHkadpMt9wMTm+BJ5Up-EG6ymay68qi+56nv9uLXXcgg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add 'firmware' field support to module! macro
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 1:11=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Miguel, can you apply this to rust-next? Or you want to change
> something?

I typically apply things that were sent up to (roughly) -rc5 [1], but
exceptions can happen of course (e.g. a fix).

Do you need this to go in this cycle for some reason? If it is so that
you can send QT2025 next cycle, we can figure it out so that you don't
need to wait one extra cycle just for this.

This would also allow us to get the cleanup to the other "Supported
argument types" together with this one.

[1] https://rust-for-linux.com/contributing#key-cycle-dates

Cheers,
Miguel
