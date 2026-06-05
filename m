Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FC83CF68F
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648603; cv=pass; b=IxMIKBk0jTwZvM++WVuqZx5L2Ir89/Y4yS0sjaZ5hxwjHOg1wPOJH/baYV9NCNWxXDgZHFOHlU3HF8jIk0yp9Y52bkyFCprgWQp35miKSZSdhcMR+I4fI2ZCdKoF9r9rCDgerM1P03sPwdifAJ/sAcA4OzklAh/T0remJUmFfOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648603; c=relaxed/simple;
	bh=mSgvPmECu35Tw7MMm3j47U64E8vDrNkepG2EWMTevfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ft4EATY/xjmva27h1ffn7eUFOdgZ9K8Vk5Kru9PcrqTkngpGhHQLUFwEp4OQI813Q8BbtTVAytjbjuA5lNvjzsMZfsLeythvKFIvEsG5KWU6cgaO0IdryIe9aj9dMxu0BhmoMgPfSkSM9lMo+BOcqncGucPGXy7nDRihA3jhBrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIfcH9t6; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIfcH9t6"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304e5d3cdfeso72312eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 01:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780648601; cv=none;
        d=google.com; s=arc-20240605;
        b=bG06vLIO/Z3P5tia9AqLK+gasUpGAtIV+pySYsrNivDmrFbnl+DSWIb+By7rCcwtpb
         Gjdm3dkMvmv6rrfUJ3eZOXe9Jju5nsYiqyuVtMJ6TcnRSi5DrcZlvYi/7Qrm+eTC9dYk
         53y7dvjFU2+nQ5qrT8UUIL+Iewv/0zg5HcbLTd06geH23zAbzhra/NvJ7vw2VUEUB1xT
         3WGagkN7eMfH04kXok5xkUd0qSix86j/+Ojj931zn65FgTr3wmoCbYsDYubsbBq7GTzT
         CsmSPijQAkt3ikBpu3oP3ZT/2z5QaIG6YlGLQUpW1beJzSk+Xy+/yrdZz2UOCPBBV6nK
         WQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSgvPmECu35Tw7MMm3j47U64E8vDrNkepG2EWMTevfs=;
        fh=lTfKDltnaGpGzAmUO0aIU5HB9bZNROLWh5ALejWrrCA=;
        b=YyFK1Rh8gaogSbSNfkFORjzyTwpg1kvq1/OQRIDoOWW24kZKVMK5j2bXJB/i/GbjlL
         YUDrDwDOekvVkiX4Etfr5llWMFSo9ZcjjFFeU1KKY8M195U1xj6VUYKvqKwYdjswhv/M
         BT4FLyuo/8ulpHQg/MZr24EIfvfUG1xu9xX4g++mDbQMb4e+mRsoFCl1MscUshEbRHXn
         CwbSoxEtdBc2wnBDNto1Q2SmFOfETdEUnhNpvnDSyeZpO3PgxpMS2ua/uw27EYwBjN2M
         oELIn+0cWDyu8jfdKL1CPsDjD9+ZHACUC/m6Br2XYgDIwJt23IAql14hh6H3cz/oObvy
         fWTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780648601; x=1781253401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSgvPmECu35Tw7MMm3j47U64E8vDrNkepG2EWMTevfs=;
        b=dIfcH9t6/Mmpp078bY3/a2h8QlPtCyp15uHGMBrOk0YDgea/7qQzrvgB5VtGycVtFJ
         nHWTi1sF7Tu0ffhV1rgxBGAYzRMXmfjOuYwzrPzhmqAfv/SlPQOst9Q3NBisuAIcQvy4
         v0vZSj0z00EO/ggyb+19JnIQChZEc9z6geixOv3cxakeT8nXZYtcZaZMax2CwBu3pfCk
         dcF99nldhGsbyWgxCtKIyFZyAf7wb4QDtLToNbtKpmqPlrIue4YVh7/vhURvySgFAwvk
         ocgzOW2GuAXRlFOdUmm/+/KbzEukENBKyGfjp71PuGbf0N54gy9F2RubqwOfCtKSd5v5
         p5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780648601; x=1781253401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mSgvPmECu35Tw7MMm3j47U64E8vDrNkepG2EWMTevfs=;
        b=Sj5ijeOr1w1KNGMEMUQ4GqgNzNy948IvDVzHbv6NvRh/xOOJRlEG8z11R8NdSY9uz/
         9j2RLceTvhPfCdkj0UmuwK+Mii0S4nksLNTmJhQS4tpP/iuamebkhB0EpAYFlbgbuZgd
         NErgWZgPOwhc7TF1K6yeBuvF7ljV/STJOwohXdjG8ByIihOpxL6ypUP4YZCJrjcrVCXF
         Ey2ewABTGNLxve+SE4FFrZNLHgcRdohC+XxQUfmr+bFzJulXDR3emh2z4m3Sgw4AIMhH
         HivRuKI8d33lIK6vasohr/cR9fnLMVmYE476wGLy8VXJVo3LTncbl1bq0cyV30KF5TFi
         1C2A==
X-Forwarded-Encrypted: i=1; AFNElJ9zkoPqZAPQj/6xjoxCwse0wYqs/P1bFhnZ+a0ffyez6A34/7dxjkUwFsDKPJgfCujh6ehSXR6uUuIHSAPGBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/EKnx41Yrz1WJxBhuA0lEGAjr5oM5DXNLWQX1by0ccdUHiW6F
	zOKhXLQy8HerY92p07nHMlpnnkB8UFDWjsc9z1O98oYffJgnimiqTq6ykJBZySY7aWSsxMfWeHC
	W5oLG28qbffoEPwPEeYxplWJREJsjJlM=
X-Gm-Gg: Acq92OFj+0+y4NzHGBT8fpf9vG8ktfbshVa22PIjAhJnxQ9OPIewzhymgzKXdVIDOL3
	QruM5jjTr5ZjYLB7yhVbrgnNo926ChkokektkVY6PmF0X9zyGYPYy9hRx8wIMOyh0ude5S+T17n
	at56qEclaQllFO1Zff9VYVOa1t1uviUro434rd3HEd3v3FqKz05FthZ4gZ0mUraEzDdkmh4Hyt7
	40WgLxTWFrKnmr3UG5lWon8Yz3faIl8BVsP5ZFZiagipsWTumjj4zXKIy4RJQcWjLMhdYbuA2PZ
	8vCuz+mGkozYtrlKqJ4Ng11JtqLaqKALi0iS6ow8O8Qz7OygEQFISBMZeIO0tiVsmJQukI9X9oe
	8DEXDYe2k73Xg6en2ex+J1mWzJKL1Byr1FA==
X-Received: by 2002:a05:7301:9f07:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-3077b5eabbfmr547169eec.5.1780648601370; Fri, 05 Jun 2026
 01:36:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com> <20260605-nova-exports-v4-4-e948c287407c@nvidia.com>
In-Reply-To: <20260605-nova-exports-v4-4-e948c287407c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 10:36:28 +0200
X-Gm-Features: AVVi8CcQyHZaxrVm9l3w8nQkPTRE7ixo9gqTVbYy1F9Fup8-NkOcmlFkT0pwkvM
Message-ID: <CANiq72mFouTJTKePtQsDONZr2H=JbAEZOuGO6LoK4EVCSvAFOw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] gpu: nova-core: emit Rust metadata for nova-drm
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 10:32=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +libnova_core.rmeta

This should be already covered by our global `.gitignore`, unless I am
missing something subtle here.

Cheers,
Miguel
