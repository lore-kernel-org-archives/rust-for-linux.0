Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B630C1D6187
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 14:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768659967; cv=pass; b=sRcHkS25RTCLVeJzECrOstYv924D1bNg+/X0cws1Npsgl/HNoW9o6rDhbjcP/SF+LxpfGHzOomx8K3HKNz8dCdfIMxVPvR6r5IYva1KJ8dqR3s6Lxgr37nTKw09m+AK/pMvU9y5iR4PDlKGk9VIXPKqu6rXFM3qeJvKC0Idpj+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768659967; c=relaxed/simple;
	bh=6I3ekjB8E1VMKnZVZd8dxWrw1GLq7S9KRWKs5xrZa8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xrm5V1bKIgKnlGey3Vyy1bhNM7NLMBQ5Gu3EXhyKg5GXXyJMd1ARC/BVT1IWlZtM0rTySF10EjTMp6DE/9VbNCowqtUezkZHgZ+piVLTV6opzFeJ3d4gGZjvI04N8lwkjhWZ6eOyeLIOfqvZnBNpuuSlLiamIlp+QT32oo9GZps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHy639Ng; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHy639Ng"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b6a868ad45so223822eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 06:26:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768659966; cv=none;
        d=google.com; s=arc-20240605;
        b=DNJzxBjydM9EKImOqiWXc5O1gGruMfsKN292WWuyKNt+aktDlQw7N+240gQUiTtqbB
         KOf48Z8WZheydjWI8eikGA22wxkRFptytiovxUAgUL7EhfY/R8Ep/BRkppUsSqlB4WxQ
         u8rp7dy0cYwojkFDJH72ljGdms/fSQ7X0e2s2lCuznhXcFHyWULJhv8TMex7s8zY1cfO
         7RIiBhqBJJ1n34/n/Ezxn4c9zCZDiBQhd8Kb5rLnwI6x+wBma7Ykh3FkxbBoHvyRHhIH
         fO3PV8ZhEPE5czbAM2cRbgshWwmfD3jPB4GX53wDxUoCc7UpKvKHjviSz7QHEOXvH4fB
         r9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6I3ekjB8E1VMKnZVZd8dxWrw1GLq7S9KRWKs5xrZa8k=;
        fh=hHux6sHEBQT+mV3Z/LxvfwQSOH1vbbqZhiQRGHhl9oI=;
        b=loayHF4lPkaKia1L3iKDQILYoDDsqpDz7bRzkQTAbfFl3Ip22YYybLSYmgQ/KJp3pd
         0TnOEnyO9hVeXiM3motHvJzsUqWSwnA/+iTounQD4fQW4dPL9x9MejSRAt+sXRTSHtDF
         Z0zh1b4TB2P6qnVxm837qDP6WnA/Q9ORKBLh7UHPp51pzFYO3FBE1m5VK6t1L0OZHMLS
         Ospx6+2UL3vx7Cr/eHu/zW9aaQnzUugCCQNfycZEp4FXVbTKduG8MgukUztgv2iE10rY
         r2X+mxG05vHf4uJqDlWOVSTFKqVWGWmFal5hX/lOvq2WLPD/J9kqxjthNePctyq2OT/Z
         EN0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768659966; x=1769264766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6I3ekjB8E1VMKnZVZd8dxWrw1GLq7S9KRWKs5xrZa8k=;
        b=AHy639Ng+WtBcv/Wghw4w+mtrHL1Al1tUWv69K8VMOEUV4LBrrDbHzjbPvszo0fIBe
         VpLnsYFJZ4gFnziFzzOC/D1yUWQ2u5ScL/7ACfTPtKxe1c4Wxh8gCZIvY8tw7JZiTcAI
         lfqTId0RdsEtKMuLrwvk3DYnId9nAOS0UPqOh9pRSQhSbTASjeurii8aDDbNqevOv4DN
         QeqgspVxtgY6Tyig1riTdbBWKQmxgeVyKkZzZqUc2jLQdETF4tKkYieuGca+l7Ho4Du6
         xsZJW+1gSObRJ0E+eiP61zdLSIsqvVFNIfnwjCqSeHgnmiGyO5Ci1/ICPa4FicKfTQqu
         cmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768659966; x=1769264766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6I3ekjB8E1VMKnZVZd8dxWrw1GLq7S9KRWKs5xrZa8k=;
        b=k5VQ+TkdqDC+/EyMZQUUn104qKibt4pOoPWlPpSf07TPbeDNRJ0SGwfdPpBs3fRARc
         ePNmdWZ59mX/cy7E2Lozl4ZYL2wum3p2Cxh+/DkbSipMTOxKcTKrpND1Q63UfoSl9itL
         l0BWO4oCuylqSLsV3uxz1Cilp7iFxl7EnG+jJiXcKu7qu/PWjXIEWfgYJhg6ng343oks
         2fYMGfIU2wJAur7LWJP6AzUmo3dTNyABbQZan1S7OiM9No1SzMSGKpqWDsHaK2mO31O2
         qOO+NgbNeWBEch+Mr6stkZZUpE232OpBKlqNDvUR9CYrJC5VWd55ds8GuwC2z0la/8DD
         qNlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9zlaIiDZk8/NibQFf7/SW6UHKY2Z5RtZiJsFpauj13KKf5mR3QU7yWdedxUt+yFGjQ6BXxikHK6qt+PyXzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIuBxcTt3WYeeAndL6SvDMwq8RLBbZ9akU11kHSw9fzLzvO6TI
	IhReZCgcHyCorZpPp7pjEwXRKYwFZFrBRrFmgl5gKGNUI0kH9t+YF0e0IrI2ZS3YtOsVdPMEkBI
	/eb7nFfeMAiLckS9lGL0R4HOnAO2OhdE=
X-Gm-Gg: AY/fxX7Ho/4m6s2St2vmVbgBn/EZ2F1hjchFbPFcTvXsIg8zxkAcDy+4kEZPYOWEsoF
	puCN0T1PXAkvG701XJrTPS1dOttia2BT8852E90XhsXhbKnqUe+C5OJ6a0S4cs29zZs2sUQa72k
	lEKGaVSA/JSg8OdFxpUQ3dEeViGPlKil84ZKoxOr2gxd3crKDYxAvf8Aj8IJJKOdgYXFf1MjbqS
	UjQqJWJ8jR59dW5Ee9SvhvAZWURi2oHAvhnRtmk7OaeQRbjOmA5OBs99ZEAjysEaxVZ6Bouxh6b
	/ZN9FUDCqBSZ+03ddr95fglwdUodaDoalsFu9hXut8jpNSNZxB0WmIk8mIHSfvu9ACysvNCa/KQ
	szWqtv+U42Icl
X-Received: by 2002:a05:7300:df4c:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2b6b40e44b2mr2629049eec.6.1768659964254; Sat, 17 Jan 2026
 06:26:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117094710.24301-1-work@onurozkan.dev> <20260117094710.24301-2-work@onurozkan.dev>
 <2026011725-contour-salary-d3d1@gregkh> <20260117140240.15d1120c@nimda>
In-Reply-To: <20260117140240.15d1120c@nimda>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 17 Jan 2026 15:25:52 +0100
X-Gm-Features: AZwV_QhFy4A2Zynn1rTen7q8dcuc2-wIF1pSD5HWCNOcNkB9PHsr51QcOT7qD3w
Message-ID: <CANiq72=Jzr4SUH3G5AWS4iLoN7o5gM5s6+K_Y-fJk5uuFnMDwg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] rust: simplify `Adapter::id_info`
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	rafael@kernel.org, dakr@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 12:03=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.de=
v> wrote:
>
> I don't know what "rust golf" means, the main motivation here was to use
> a more idiomatic Rust pattern.

I have seen some patches recently arguing certain methods being more
idiomatic etc.

I would like to caution that the fact that a method exists doesn't
make it a good idea to automatically apply it in every case, and I
don't think using a maximally functional style is actually idiomatic
in Rust to begin with.

Even if it were actually more idiomatic, the idiomatic argument isn't
very strong anyway, i.e. what matters is making the code look best,
and the change needs to be a fair improvement -- otherwise it may not
be worth it to shuffle the code around etc.

In this particular instance, it is a significant reduction in lines,
indeed, but I don't think the original code is "annoying" at all -- it
was already easy to follow.

In general, I think authors and maintainers should pick whatever style
they think suits best for each situation, since both can be overdone.

Cheers,
Miguel
