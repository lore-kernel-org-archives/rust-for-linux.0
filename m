Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442DD433A0
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 20:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731873979; cv=none; b=LVg1P5GbIsuWzn6/2nqV0ve0LjOJYtIjXUz8iH2vzeK4DpvdXMcT6PS15CD+V+hhgHqxBrV9HJhvlRIKrGFIg2A1tyUrTX+Ngo5xW+5g/fmbpVA+CWpzYPw+6G1wJSef6TKEPqVGIA65/SdIT4DsH7xWJ2F+suP8qY2fzHQauvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731873979; c=relaxed/simple;
	bh=VPm6AkpWeVT++9PdwrfzU1wGcTVzHRyT4HYmACj6kcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQcZmfRf1dUv+dXxTDXUq0TfqUIsNLfJwXXIgJCC8nQ4fxExCyXYeoSqVT+AQNT/o+moVNJkwXCaNU0e4wtmQuC8PDUUEj9mfxUWky4I/lhMrn5JmVKKw1ID+vrzO67l62omJuCKK4nBj3UGzbvCWaxWNFCRsUxSQBkI2GXFKps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJ+OT/ap; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJ+OT/ap"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ea22159119so211833a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 12:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731873977; x=1732478777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPm6AkpWeVT++9PdwrfzU1wGcTVzHRyT4HYmACj6kcw=;
        b=YJ+OT/apfikSGrMtEmyA651OXVdVeC0Xw9VTo4BpQU4ofNE/Se/4v+OzScr9Em+WHw
         Bl5xs0ypBCy6Pf8HMmzgPTCoGwzAZTLloB0Bqs/GFpxZx9VyFBw1Nkz3eGZDY6SAXpLn
         jU8AWRicG95dOe/uKtrSmFPpIA465mpin2rtt41sVDUkAn2wIcKxUnjX6Uu0agul1jTa
         0UZFRjclQsGgVc9MeQScD/FrECew8gFgGW13c3TSd+DN5o+g2hyBxBGsK8VFU7dZlcrF
         4u/I62MTM/GEqxHg1YUI9lu/4cAIsNPTWs/0mGODLxUlDeO8U3H2/MbBJ6kPClSc6kX/
         TSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731873977; x=1732478777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPm6AkpWeVT++9PdwrfzU1wGcTVzHRyT4HYmACj6kcw=;
        b=jJM70QHFlRoCkNqB6ABddbMha8M34nkZzOWP+AMS22KjoVItmmHKwUGO/tqwgBsPiR
         zeQqXAZNcgyGzuYeoUjcQWRAKourX3qX4kJtsqrMpmtXTWFr1sY9IAEfXxXujzce31gp
         chsHaXOY+GTW5IEIseUcLIMiEi2MEQoQ16juRDP6rdEX6kdblLClq10p/Zv1DDA/XdFY
         ZNANcjSOqrVENynwzfoND6gAD9Ko6asTIBjXBSGLMBL492LAXXrprVKoVSH/DLNW3JJj
         PKMYKoXiAVNkCl7wZvCH1HScaf6797PE2w9vk36GnzJMwOj1lAxy0rq7oDhGDJM8WkZT
         zRMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmU6Uj0/JIoGj3FAoEQwmPIxdOU88IEeWinHUQpFhXC19Cs8Bk9Xd0Z3cldNoZasYbFpqwIDlgEArQa3/cAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoc4dODAlVGg/cNySg4Ue69G+FBglzqJcwoHEq+UP026Zc6Di9
	KmCQbfrk3AxMDzCxQ3+D0hMxeLL50fH/2OHcM6QJz8XcH2r5mdUUPZ2vcgEYZmwJEf/J8XP3LIs
	YXbP8e+71D1O2TiXkIGchmVvmzTU=
X-Google-Smtp-Source: AGHT+IGc2Ea0CD0Sr7cNzstflcF4YJXIWuI7wGXHAGM08aoNQERDMMrU0nsseB8sCRKbrSnHAALtcHfiLY27+asWkqc=
X-Received: by 2002:a17:90b:3a8e:b0:2ea:853a:99e0 with SMTP id
 98e67ed59e1d1-2ea853aa30bmr72385a91.5.1731873977430; Sun, 17 Nov 2024
 12:06:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116195221.373332-1-daniel@sedlak.dev> <CANiq72=hn_-+RmhdEtqScrv-=_mFs4AtGCc177khdcU=3GjskQ@mail.gmail.com>
 <CAMFZ4eTrZo1YLS_7eOwLbuzLfmi228_FXHU28F-xq-Pai60CXw@mail.gmail.com>
In-Reply-To: <CAMFZ4eTrZo1YLS_7eOwLbuzLfmi228_FXHU28F-xq-Pai60CXw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 Nov 2024 21:06:05 +0100
Message-ID: <CANiq72mDtJmNEYS=dcoi=UtgL6-Zm9ShcmXgLBW+dED9Q1XtHw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Replace unwraps in doctests with graceful handling
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 17, 2024 at 6:17=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> w=
rote:
>
> Sure, I will add comments to the individual commits. Also, since all
> patches try to remove unwraps, I am wondering whether it should
> be one large patch or multiple small patches?

It depends, e.g. sometimes it is split by subsystem, so that you can
address different sets of people and so that they can take the patches
independently within their own schedules and through their trees.

You can search for some big/tree-wide series to see examples on how it
is usually done, or read e.g. https://lwn.net/Articles/585782/

I hope that helps!

Cheers,
Miguel
