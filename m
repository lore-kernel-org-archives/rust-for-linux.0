Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FB53A7855
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 16:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949746; cv=pass; b=ZVHMnAksbnY0yV++1v0p3/UImnZEm8J9ueVHWhK/ZzJ2IjRwVJNAzRYKHaeVbxtDa4B15d1Hsn5tNsTyiR29ltXe7P31g28pudqjkSjJX+cuDsUTyygmhUChSnmZdRTbXeqP+cJsml5WIJTy22u/n+swMpBB60vFbnsh7wzBvA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949746; c=relaxed/simple;
	bh=vBMEUj7raBbmsyrS7Us99Qy913X47xoD5tUQ83r3xKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kRaoU+p1bRjXvr/QKO7i8WQkxhjTjwKUr/xjcvDpER6fVmlY/xoXhiZjAd2eLIveEKYJBgUWaiChSiafltyBr05OOo0Ll6Up1NyVmdR0byzap3saD1H2ICk/zdoVivrsVyu5boyUoDgTsyMX1lzmBrerCjiWMto/MgT1BN+5HsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PN8CwAhK; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PN8CwAhK"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bdb82b69f4so43147eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 08:15:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771949744; cv=none;
        d=google.com; s=arc-20240605;
        b=TzQkQsrBxhEvy6hMKAfxtdEVn17/XTTTfPTYJOFqwJmn0iZkhYUrKJjA2sfGJloyM2
         t/MSGZBHDnArlTxWcK5ljX+km8ij/L3tCFaj8W1G39QLTmIKgvSCPpOlQS/qAVuD+anM
         f6NvDUZ3iZl0x0ARHeIbLYQUNfA2mfEY3RJ1TQ79qswVYQymUp7X9GIQLflLeNMtgnjj
         cSaAYMoygGTn9kdLY5mgckVCQNhkJBn4i/OP+frSEPVpunyfsJ9Q6hhB7dJMBgiBwfeP
         z1nfeNsVd2Ps44gb1E3DPy114J4VZp+foK5/WGFPOnqSqpchkIygUbW/VjnmgL6l0DKx
         Ruxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vBMEUj7raBbmsyrS7Us99Qy913X47xoD5tUQ83r3xKA=;
        fh=phy9rIvSxeK6AIdaReZVhGIgtYfWrLrhAyshhqGLUJU=;
        b=OiAdCFRH0AI20S/qtZAkZzRkOC4v2txT9h8WVZcAc0TI8BTcxMGCiTsg7fgX6Zlnud
         FyR6N6OPWMy70dWoXxTHJMcl597bunVANOTEk4S9VzUscWiJgd/4ZjRQq25qrcjBGGLZ
         11+wEfqevZUoeSiFB+7EAsZ3Fu4gPPkGMDKoZmrEePkaB8fFRTBq9Hz5o0NRSt4CcN2N
         N7yqvbu5R/5L/iZ3pLsZFPf0ENkEC+ZIznnxfrbmDlJ7Ist+cgtX9VfNDc3iKMQMZXi+
         OwG7qB4ujaBu9n7bfSgXhNB15AickEFR634U5ZKO5CJAOqDdp7aK2GsDbVsozy61NasV
         UMug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771949744; x=1772554544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBMEUj7raBbmsyrS7Us99Qy913X47xoD5tUQ83r3xKA=;
        b=PN8CwAhKbHuG78YyMyYZOwZrr4A8Umf2qseRPphxIDtGZbGkijVJ6iS/avfIp1XtIG
         ZuMLoV+sqwok8X3yKyJ/CJDmZY2EQeb58p7IHipncTwnfd6Nmw5ZzKnWctbTQ1hBlfQ8
         UEn7KsOnBGjdlGPmUdhprLnTbEQp3FrjKK7CDVpL/GPSJSW70I2w5K6PkghI+T1J1TUf
         7qB7hOi89IHXLc+ZoZoOB6tRO3fB6k79/aPelUzotRnctmub2yhKmOkes2TrkBsJFKm/
         JgPi6U8dvkxAxWjJOuFdxQbtdPAzSf6TfdzJRetmHoLmfO6hcC+9JrVl3899HW2NJTvK
         kWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771949744; x=1772554544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vBMEUj7raBbmsyrS7Us99Qy913X47xoD5tUQ83r3xKA=;
        b=YP+OWlqLxdgf0STKZYlR1nsmMX0LXs+ku8APNZ1GBzieA/Sz3yGCUbm/X587rZFe3n
         9FAwNBN17kOkitBc2BXHkmLNKw2T0n4KCHWhVD6zaqsEHJhRNH7qm3hHPjR5iuWzIFq8
         b/zHiZ8ri5IzH0L4+nRwJ8+3PavbffXLWd4MpG0BMFb5jKDr2JqJ3M+jhYJXTcsNTwp3
         UqOCZdac5hniha7i7Ut7ZIJZ1VPZkDe+azTjJaFnriHvNO4HO8BrJUYwZCbq+/ENQ8EC
         MT35xzrfmX6KscupvRBZl/Aj0T0M3n+IF/15h9ws2aOkABoYDnCqx8FGrPnmTB7opS6y
         9N2w==
X-Forwarded-Encrypted: i=1; AJvYcCXwOWpaufhMOX6xxE/dGvmkRZDjSMFSp9N31eGBIrNtPfIvBv43/GkMsfFDMt/nGGwKDChuC6yWqunRjMJHng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMPFi68cNXAtDR+VDxIxE4lqMyWFeEkYlSwOd0oY/x/3LAonvB
	x4OVL0LjCGRx8sSHLQpOUMw3c8odlMGlomGmRcQ3ktIlpIBiSt/mk33liosDLn2ottU32G8G5Nl
	gH8692nS3FC6CyYGVQQEG+s8OQc5YKGk=
X-Gm-Gg: ATEYQzw71lVGSX/IEA9GabQqvK4l6jVTcXG+0VphuSwEHziGK7hqxWP79lwjbmR6J8i
	IhCa5pT6P+rlR0INkbr6IHEOzQhO4xTrAyssH/pcfiNnkZMB0JBknjAZakjB51LSaWM7k775AJ7
	ezciMvVQ3bnYVtOX+Vjd1maRSBubhRR5AMT7XDIA0sOIdmvXWAbJv5SLDRrbLaPqJ+LvotbnMrG
	tf7869GGEey0NnYOwgHgS6OgYJg9jzDxeS+j1V3U2+sFutGWehIo8oPWwnYdEVlcx8qUZihNka7
	tkgMxpsfWc+SDjk8P0Q9Ifuvxi0OmudRJ5VXY5pt8UVS+BOjG6HsxHPu9Sjvx2JGgm0hnhz3TNy
	Mfd0Xuw+YOerpxy+Epi3iI5sLLMvZ
X-Received: by 2002:a05:7300:f108:b0:2ba:6978:2b0 with SMTP id
 5a478bee46e88-2bd7bd5a67fmr2747179eec.4.1771949743876; Tue, 24 Feb 2026
 08:15:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com> <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com> <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org> <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
 <DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org> <859ee9c5-f37a-475d-81eb-6f9de6d34b4f@nvidia.com>
In-Reply-To: <859ee9c5-f37a-475d-81eb-6f9de6d34b4f@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Feb 2026 17:15:31 +0100
X-Gm-Features: AaiRm53le2roUqYa4Jd9OPo9BPShlpMhNiyuPKhqHHVFn6yvlPnm_kCgXr8IATU
Message-ID: <CANiq72=2rE-R0g=aKWjZwQVz-GqLUQ00M+bi+ANrNu3+zGL0Yg@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 1:54=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> I do tend to agree with Danilo on this. Unless someone yells, I will chan=
ge
> the maintainer entry to "RUST [FFI HELPER]" for the next spin.

Not sure I am following the "what FFI means" discussion, but in case
it clarifies:

The Rust subsystem is meant to be about anything related in some way
to Rust; typically meaning all the things that are not covered
elsewhere (including what both Gary and Danilo mention), sometimes
with overlap with other "global" infrastructure/subsystems (e.g.
Kbuild), sometimes acting as a fallback for Rust code out there if
really needed (i.e. similar to Andrew, but for Rust bits), and so on.

From what I understand, Joel and Alexandre want to focus on
maintaining the `clist` bits (at least for now), and if they are both
going to have the "(CLIST)" suffix, then it may be simpler to make the
entry just that for now since `MAINTAINERS` it is easy to change
anyway.

Now, what kind of things would we want to have inside such a `ffi`
module? (apart from `clist`). Does it mean the proposal is to
eventually move existing things like `CStr`?

Cheers,
Miguel
