Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ADF1C461C
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Oct 2024 18:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729534428; cv=none; b=IYdVfiH/PoQHpRUdfjWuYkrr0GNICPX0R7WqS6oCbdx21oafVdsuWQlyed3B3G2wmkd/Dc1WtfmRpGHn4nshKVLjMn5Dx92etJeA+J0ya/RpSH/Pk+B/dO8s1E6RuaBZ3SbqNOcLw9fwh/X0j5KHzDtDqbnNvPSHKac7sT22NQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729534428; c=relaxed/simple;
	bh=JKxH4jdNC+8ikI4gnJVtEXRWNfxn1vnJa0KnCXNIeyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgzzGaH+MrPa43pvTiHVPTzapORcSRafxnb9Ljm5WKRU60v8VPjCBKmB8mliLb42zG8+zWm5M7LHnE3LkbwYxDfKlVn3kIMEGEW5sC6AavDkT/8djbu4jX+p5iKUj/uZ6c1h6aiYL3XJQsPcKItAPomGxbe7ga24KNfjRuad/kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=af47R4lO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="af47R4lO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20ca17bf0d9so3511355ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Oct 2024 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729534425; x=1730139225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKxH4jdNC+8ikI4gnJVtEXRWNfxn1vnJa0KnCXNIeyY=;
        b=af47R4lOEIVnkJF16/jt1Uj/kIfNfL4jq2no/T4komSfWYzPnmEGuZVHukiDc6NWV6
         Q6zjjqhEKreXcdATHJ8lFgbbKzBwUrJfdZVALE+fnD60/SiZftQiHbo8K9mYQNk3+Nw0
         Tzvz/wuZl5RKDSDNg4sH5EhQQe8Q52kIuuHsWRmegy67WWbBmuDMM3ts4YE7xwaNYfxY
         5DMR++QnkPOv0JiNqsz6i0uyM+nzf9QWDIldMUxSDO1dkI8U5voyxeztX0sxbAtab/Ha
         zkw1hNEc+E8BjTkNU3SXFW6y5ND1XiKEpF5B7G4ENKz4zOxvEugeashooPEkIdy2ETtQ
         vQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729534425; x=1730139225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKxH4jdNC+8ikI4gnJVtEXRWNfxn1vnJa0KnCXNIeyY=;
        b=CqnjP/hizkiPXnc/L9UM16FxraikCtmb9kfL8NV0isKl1i9hDFsHih+eryBTCccomD
         N/Z87w8oO0UmhYaJJ8cBKGOrHU6KZ9JqtF6mfDsCIBTuehSwyGO4F7Sh9zj4eZ/eqFvh
         bd4cDaBXzUCTwdvSYfBZxbvsvX78MeoVHwTdia/jaAa8Y/X6TTeJgVV04TP/Mu5nfKVo
         mKq3wOGMf9I5WNAGFoM90WVNxANv9Ofm/jjJgmNUnTopPG352eFyB01SXu3tpw5gVt4m
         LbGgpEDmWg5/CecSLdx3de6ZcAJwHqlTOmWhUohnOhRbtZPDIsBnOM7xZvV0/NGOaFQt
         nblQ==
X-Gm-Message-State: AOJu0YyFVEiTstjHzfY26Ts8jne1FZMEU8Yn2rkpUqoguzAeHBD+Iz+H
	hbza561S2BbyzSXMUQ8VrXJJVCmsoN8bgVuUl6+prCR1mbzXDewZBSv7dzTKr34h63V4q+XihZk
	NnX/et7/NXrONPvehtSn90CYM/EU=
X-Google-Smtp-Source: AGHT+IG8t9PSnyCKZj2VPMuTu8sLCqN+wo8t6nXY6br+hqP1wqSNiUFMSDcASm+KMDU/7fTabhFNdvhcIknPayG5g8c=
X-Received: by 2002:a17:903:185:b0:20c:f648:e388 with SMTP id
 d9443c01a7336-20e5a79f43bmr77925395ad.7.1729534425449; Mon, 21 Oct 2024
 11:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZxXDZwxWgoEiIYkj@ohnotp>
In-Reply-To: <ZxXDZwxWgoEiIYkj@ohnotp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Oct 2024 20:13:32 +0200
Message-ID: <CANiq72kg4_-dS9JExxhPnhUSAzOhd-hs_JwLfOJjptkCTpT9Jw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kernel: fix THIS_MODULE header path in
 ThisModule doc comment
To: Yutaro Ohno <yutaro.ono.418@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Danilo Krummrich <dakr@redhat.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Valentin Obst <kernel@valentinobst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 4:59=E2=80=AFAM Yutaro Ohno <yutaro.ono.418@gmail.c=
om> wrote:
>
> The doc comment for `ThisModule` incorrectly states the C header file
> for `THIS_MODULE` as `include/linux/export.h`, while the correct path is
> `include/linux/init.h`. This is because `THIS_MODULE` was moved in
> commit 5b20755b7780 ("init: move THIS_MODULE from <linux/export.h> to
> <linux/init.h>").
>
> Update the doc comment for `ThisModule` to reflect the correct header
> file path for `THIS_MODULE`.
>
> Fixes: 5b20755b7780 ("init: move THIS_MODULE from <linux/export.h> to <li=
nux/init.h>")
> Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied to `rust-next` -- thanks!

Thanks Yutaro -- there is usually no need to send a new version just
for picking up tags, maintainers will do it for you :)

(Of course, if you needed to send a new version for another reason,
then you should pick them up).

Cheers,
Miguel
