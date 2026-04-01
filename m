Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B435E30CDAE
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 17:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065562; cv=pass; b=InWGGJymWxZUagSBFOcPgRAl+UlkBePyjp1Ri6BL2SBB0I/ftQsnD4o+IcutCj4z9EoMPyqdlViu7CMoqmjwRMkaZJo+F9pQi7I3cpQ/j2MuQ4cMHtouP854T4HqUPnZY1uTsKzsH6ytpaEWRgD8o43n3T7bfCtns08yyd2ZRSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065562; c=relaxed/simple;
	bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfnnQ6Uol8OxGeUg+ifuHBqc2Gfp5RaFouwkmfOsCYj7av9jYwuiKvtQlz0QcoOZmBdoiZeB4fUgKmwDiwsGFzGXP0CYTkusVBhXxpr+tFxz6aeCwiXMS/pWJBzTddlUO3pznEFZlvUPQDaYiGzhGBz2Lk7eOw7wvw+CnFlOkq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuSB1yrt; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuSB1yrt"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bd801b40dbso11953eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 10:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065560; cv=none;
        d=google.com; s=arc-20240605;
        b=laJE217owwUBBm842JgBDlOViVfYvqcx7fhaUoVQURP0/txrTFeHBf9NBJ2qCbFUik
         CPWQxN9zuZvy7lwL3PkEe96I1A5S1xgPVorFIYBS4FQbP+yR4bYsu1Fhc4ppIZeNBPD2
         Ip5sDquy3TgvloOcQ+yBn9APOndyl/+dSUOtEp6rRiuFT9PUvoykGYpF+BlMq4loHnXl
         nG//T+dDnYlSNvbOxJrVj0CSAPoDx/7StLKQaCYl3DopcpiRaxdyRqYm2BdrZHeA4jDN
         WE/GXHw4HaqmxZtYPoASmMSqZkGg4QWvWuXgEYMbucdOTszcwIhJg5UPKyZEZ1OCFb3r
         Uxyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        fh=W2rhHuu4k6hkv00Rcsi2DYa/HrIwcvRaqXkq+ZnC3FM=;
        b=edXh8nanjFN7IZQThuqbOQZefYNd5ION42cz+BUbdWPw4hSlYuwjemMfKAccrkAI0b
         La99wFmkH2bKJO6u+IIgRaMOrCHi25NFCY5530xQWF99unwQVvQmouoZvG+I9YbVY3Dg
         uDEo0DhDHB3R6fhKN8YYHXIfW5JDKXI5T2ySVSaBaeC5qhiaCRy5SOIRxOy5qCPorlmJ
         yNH3+I0x+9cOP8EOWVgoVOksAvtMzQRCuhaeeZ6WXiKGLtVVmLbc/Eb2BwTf5fh1BWGb
         kgC9Cj6rievnQPsXV0tdSQPHCfpTTKcnt9/W4Sg7jeTlCSllX+vd6bkNcj3ieAFjVHwP
         9SqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065560; x=1775670360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=KuSB1yrtfd8BjsI6YjeWCq5wxXfLwBoKXUpCsrVo6QhIUPYZyH8YZscFQf+sEFQGSa
         TZa26pVuuui5NNTB3TMLCTlNQdZUd5bNv5ckyZGKLMzmdHhcy7khKoBsPqwALzvfTqMx
         Tx4YahpYBU96LprRTqv163LXmagSQ2UWTUI5fXIc45fHuZJGblCH1AeRl57i/ejTj5Mm
         qxEZ/P7i0pLCCFWwjWNVkYKtF4Ldade03b80tf2gtS6iOo6Vr4UtiKUQABYe6b0oT8sT
         YwPzJUkCLIYKqge/KqQi71RrOh4/b3n6UY1Gp9QJ2fd5NIK8vlg3P30n21TqlTrKxzN/
         SiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065560; x=1775670360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=LsS3QcpR0mP0I/JcJhiabfwIoqXob5pV2m6NEEoYtvCe+uvKfi/aEQXbPbeOuQ+5LG
         77C4S2+dDf2xcjeJCizYtEZkSpNhuYDvwecFnKF5DzETOw60DppDSMqNGLeWBD2cp2l7
         UANoatRgW2afKHshKfg1adVo0LgOz1Z5BTvyl/8OyxQ5Gvkcd2hGtkNTWrFZ+PD6aMax
         s8vMCl4EN1lolU4H3z/OIc0JG5pEKE09zDR2BZiTVz+DB5u4AZurXnCOtQYRpjZRpB+u
         goqwFwEhBUdmvTsCw7QQWkAKam36MrhhuvPH7JAxFhDPPeLOy9KlqCg7tiY3jkLpXczD
         MJ0w==
X-Forwarded-Encrypted: i=1; AJvYcCXcr7k9k2EkCJ76alB8EfN72KwYyziWHHublbpiiP9zto9AXxbeB2V7HBhHMDmBrEqzO/oW5C2T/3LCYpSWAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvybcihrLJ5xwXR6GTZ0am0RoNG0J/sKzmXs35Mya1qqigYnaR
	vExk0UilDbUR51+7JB7qV/WLcLcKi6zvi77Xowok5YzXV10+iIJFS8zI8LYh8pB5Gfa+nR2AdjO
	lJ92/LDD0ykn+nufQtKcqJnaZOo9/4mE=
X-Gm-Gg: ATEYQzwQx4QX7r++tWk34Ce/V2mJqDHWoZTe6utVmF7MNB3jbav1X06x1Ub7GEUZwQM
	Rkmu6uG6ZPnhidizmHE/EOseFX05ksQ/bDCRB7arZdqDg38JdJUwT/oqQ666memJc6U2GvCgwKX
	rZWU0m+0LJ8XUbqSBSDOEEhsNF8edyvQn2fnDkVOe6gFckXnavDdb3lFs4qzetNu7aAIHMN3Pog
	9ipab0HIJO+PzEEKEn9pO3F26AzseCOqchy2YR093g8I81M6J7QDrLJtXnyzIe1t4+lxAlhYAcw
	2s1/Xl80oQIRK/QEb0P7uBZ2jmwGevD+Xn0NL8jwYrSAUMfO2l5JOLVev9637iOs+nvOvcFt+zg
	dPRQDo73jaaMeG3eEcJpN1l84nm3SjUBgXQ==
X-Received: by 2002:a05:7301:2c05:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-2c930798a4dmr1033595eec.1.1775065559731; Wed, 01 Apr 2026
 10:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-13-ojeda@kernel.org>
 <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
In-Reply-To: <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:45:44 +0200
X-Gm-Features: AQROBzDasvNfwm3irNcxLclKgLrVzocIHNQudR_c4deB-93-CSbalwIa-aYY_TU
Message-ID: <CANiq72=8eVKk0gqyvgWM_-VSsRZY1s2e7gx9AbAg+q0dRRYO=Q@mail.gmail.com>
Subject: Re: [PATCH 12/33] rust: macros: update `extract_if` MSRV TODO comment
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 4:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> When I write the comment the intention is to enable the unstable feature =
and
> switch.

Yeah, that is what I meant as the alternative in the commit message.

I am OK with either.

(By the way, I wondered why you mentioned 1.85 in the comment, I guess
it was supposed to be 1.86 instead originally, i.e. "above" as in >
1.86)

Cheers,
Miguel
