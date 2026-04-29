Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530A53FE355
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 12:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777467151; cv=pass; b=kqOmrdzsQeBGqs/9gWiCLFU7j9WU5r4dwwhBzjy5Rx9Ak8hcwOVRlg8d8kS55ueLD72v+L2oulPT1hgGS0k/TCylYJ/5tYQ1XjYVcaH1+fxukHhpD7pMeTdQmNFbPLD6sgvv6w6f0f0ClmrHtLd3dbPbJ11Veo/sF8xCdaw0yJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777467151; c=relaxed/simple;
	bh=EqJjoPB0QzUXNbWp06xPCuzyg8lj2fAXwhNqHbKz/S8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXyoukEHTa9WCAgyj8AjA/GDD27iWvUx/GTPOJ9TS5wyAdqwGtvjcxAqF15fbOcxwM02FYAYBLQpK/G1/D+v6mNDP/+ZI2zssBB0AWA/TVgJN0EXf2ZQEnRQZInOZZjW3PZO4+zoDH1MEKhIUNOUkhPzRnpWzyRo7YPnpWA1LOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKohGRhf; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKohGRhf"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2e92c54ba73so766374eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 05:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777467148; cv=none;
        d=google.com; s=arc-20240605;
        b=cB1E6pJPCVhAxKSHXfduhEFYMWdBFhurG1ODeDs0CZcIhBEe0UJtct6rsXpz7oPhN3
         9EZ+wNTS2IpBZ/C3jUI7QkoADnL3J2RzDg0dWWC8xVVNLJfzeQcdrjw7sfzKH6p0s6PD
         rtSn5zmrh+L/V39qZDLzSGfpfpxyKOmO7OVz4vXcCDRLQTVlq92OgvFDBQI4mTp8dL55
         CVk3sjcBOEnDbD5xfS5uWGOyLY79DKak1aIbWjVdWPinAX7fUKpQED0DsUgmxbOd46KD
         08JNVqWkrxekASabhBv1eNbMzaDsYvrbED8G9l8MAjD+AwjiosyPGitPGs8Zhwxj2WN8
         5BYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EqJjoPB0QzUXNbWp06xPCuzyg8lj2fAXwhNqHbKz/S8=;
        fh=i4weRyTbsD26kET+3Lj1W5eR+deZmjcNCMBZTfdZmqc=;
        b=bdIhgm65O39djysI6TiRjujOu23Kylgc185Q+UU9esBJ5Q6eFrVo+OIBRM+Z7eUmmJ
         UQe1sJMHmO4znyUBmc40043BPIy+EHIlsng/HO8sBLFIvm4gl/WFiza8IjMhcPMSazcl
         coTMhsaO/QyWNgqncNNY+vhwM5kJ1fNBkFjsyegYTI87lLCpHCq2VKFmKOvkKr955+ax
         NKna4OhwgNg2vl/S7mUXlbL6HkOhQTD8BvzOt1CEvRTM2P9qbttIp0xKi3RZhNp1Zm/2
         H3RA1xAVIJr18LBULaTxA+oTwLrY8grQ9YHwS7b6nfRvlYhim2y8vgOqqPwv8jL1wwqH
         M+5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777467148; x=1778071948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqJjoPB0QzUXNbWp06xPCuzyg8lj2fAXwhNqHbKz/S8=;
        b=GKohGRhfV4825bvcOKaw+3JP6Hv5GdYxVam6DxmlouhOge3WCG9A7l+va0seUxy2kQ
         4+UVoybmS6dG9Za3TOIfOMHpEZgt/e1SImqeGpQrEMKmhJu5J3DYWL6MXa34HYtEcgXy
         FE8NsiBx6S80efbPmTRGX6ztOHhCIHWCBWznofOMCL7szjFdiACZYdGJ77VYh1AdzQ3l
         iy03mo7V8cnUvq7oTb0kGjtmoPWsY6V1Gc2Jm4sy85wbJzMiyOFxqsRxeL3cJ6TXGxIx
         cExE5wCTjAY1MKi7QSrfiSYoUZ30gkUhLR1i0JnpLYt+1JaUJXPArVYe+dTW7RoiKsgz
         8hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777467148; x=1778071948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EqJjoPB0QzUXNbWp06xPCuzyg8lj2fAXwhNqHbKz/S8=;
        b=sbP2og8qTHgq9bsOlwVayI4wbQvq5wFejbqRNLBuc1A2Nai6X7cYdPbkW5o0h2NCaA
         sCbD4DRtMwdC7oyZxW2NmcezZsPK9AWFoQtIW4RoGlVnZo73E5/lufGod0F30Ugewzip
         PkHjujscy4MWj+VsYh6/sw2shnobkLTVQ6UpQx+6gARSX7rC0wx+1pfJ4qy/F7H2ndU7
         yxK+2DaTXtKQD3kbZGbWV4WCaW2aDYywBlsP8mc8HJaXB7S0eJmnszqwoUe+UUZOMg5F
         MAuoP0FkVYGuUK9pvEZyhJ+JwxfjguUeh1Jwi4CNUoNRSrFBVuiFD4aENZvJeD8AmjIR
         XKoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9paaUxsuBo1h73KQBP9jQJechaB4Jz+GWCNnivo3ywwOvudoIGoeyhgIEgJ8wqycjnfisVrFla+uo5fI970w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD/2igiTwFe5ehglx1kuF728Sr1QC0SAhd0qqEEs0bMubMwlsp
	fHq/Kf8Jb16KonpVE3Wf/ljUu82zV4ctiBgFk54raKrkl7NA5+uhgbj5QHGhp2U2WOWMY6zEGId
	te+Ugw3gsloKNLNC12I4Ac7VNv5TLqc0=
X-Gm-Gg: AeBDievG4DbJMQHo3/Ge1zpEw2e6mz/pTx1pTG7pp67NRCnfJ2mCgLKFTPigQUjXMtA
	kvEpwirK1U6gCCUITSEtMJirJNE0GjyIHsVhGxmfCUXC0r+5cB7eUEcxv2QYcelnuKakkh75bac
	JFuD7PDFvodROmRmtMM18p24mQpgx2U4LCCjzTHGsX5VXmo2ZjoCFsGvWEJxh1QS28e+bqtZxmw
	lPq3ZCzPwqM73MOytCdwxQW3uesvZumDyj9O9YpYtC2kTe/Ce+GjDI1IwXJQ0/DeqNqOOIUR+SY
	KtXYeOhkwc6fF2VSJ3j+hYeK7NIztCNBdw/frip5jRP3SZ8KS8n1zBy1R+5gWFNNx3NHhrKYx9F
	hVGyZ+s6fWjypUH/JfOBkTcwU37vemVIPVw==
X-Received: by 2002:a05:7300:a148:b0:2c4:acef:291a with SMTP id
 5a478bee46e88-2ed09b6b8a5mr1583361eec.4.1777467148218; Wed, 29 Apr 2026
 05:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260426105932.2270364-1-mkchauras@gmail.com> <20260426105932.2270364-8-mkchauras@gmail.com>
 <afGT_RB1-PZVKzE3@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <afGT_RB1-PZVKzE3@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Apr 2026 14:52:14 +0200
X-Gm-Features: AVHnY4KoUZeS1E-bxbPJDpxvSamSjAegTpsH1f0vqRtt_t4Wuwp8ZSXNfFVNGW8
Message-ID: <CANiq72ncgvqJ_TExZP9ebe6vGroYReGzqn8NuhBCPpNWmnnMVA@mail.gmail.com>
Subject: Re: [PATCH V15 7/7] powerpc: Enable Rust for ppc64le
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, fujita.tomonori@gmail.com, 
	viresh.kumar@linaro.org, prafulrai522@gmail.com, gregkh@linuxfoundation.org, 
	arnd@arndb.de, tamird@kernel.org, mark.rutland@arm.com, lyude@redhat.com, 
	lina+kernel@asahilina.net, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Link Mauve <linkmauve@linkmauve.fr>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 7:17=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> Upstream issue for powerpc64 and powerpc64le target.
> Link: https://github.com/rust-lang/compiler-team/issues/987
> Link: https://github.com/rust-lang/compiler-team/issues/988

Great, thanks -- linked from the PowerPC issue:
https://github.com/Rust-for-Linux/linux/issues/105.

Cheers,
Miguel
