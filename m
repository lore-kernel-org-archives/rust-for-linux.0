Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B8A23F417
	for <rust-for-linux@vger.kernel.org>; Sun,  7 Jun 2026 14:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780843840; cv=pass; b=kpnnmqcmaY/sOqBMPEV14bcWyNhj+CO5gyWxBXnoFpCSe4gePp7vwrjWU37tMZGegaYkR26bqjTo0Z1cUcElV2BGC7CoUe0HhLupXw2MJU11BOaGLQ4cSUCOF3+F/2BeVpxnMKX+3rcIIZzsweHbAwDAIDlOHc85kwY/PN7666U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780843840; c=relaxed/simple;
	bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqFhH43Y9SY3bg0sOlsP3NCjLDX6Ok0RN4TH5KukC4Z6bMO1/8I19P9Ix63iusgO7xm1DIzVt+zy+KiRjHF1LgLO4G7Eb+vG/fqSx4mPMJYOsNksTNEfkNsdo3ASLEAeo+tPQvnTIm5lnaARy4Vo4fYax+rI9duV4fKJ1XSGMSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=syrkoMLz; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syrkoMLz"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304da3b4508so341741eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 07 Jun 2026 07:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780843839; cv=none;
        d=google.com; s=arc-20240605;
        b=Dp9yTMWdX47Ykzz89+3tIQv4fWlhY7/8a7KrKSN2KOdPUZQ5yEX0XjbemUNQ/T0w3f
         vHDiZA0R+i8bHbSIhSNNIPqdaHE0oFBewy7Q65wA1GdAUPP/XItuWxvOnlIHHqkgMcri
         Y3cYmeZAOrrqWCoOxKkEPH24VCYeDBLNaFqbrOqTrCEQXww9V6eh71BZKz6M6n+shtfx
         z3hrUDEv3znc5tANrmVDB47DnXyjGfcYipUGvkSc1NKcRLtswPM8cevw312VFl4yLJia
         c9Dx68t7mnyllg+YFW3wTB8Xi4iQh0I+67nIsGy1CqKqvybVu85QlwJsTvtPDWJVsSkk
         nybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
        fh=CJVcNsdBRzaN7JgxHGCgOoIJQRR4nlZTgActjIgvQDI=;
        b=DNWfG7aD2NXYYYniU0eF6lscOYlkccPtOjW9nJfpeM4P+QzRQAoVSr3gDpaQZGEKNG
         D56YdiFjYu6P5gs5Xk0thEHgnDUBM7+5zAKnB/jXCq//+vYdHRsKLgo5dnoPQeSo2Ibp
         OWfrFQ6s+IcML0AVCuKo5+Ytn/L1ywUtqr+GkdEBzmUU1qEofP9XYdSUERufUZryJeza
         toOlBKZiCf3jJzIAgC6s6V2Uf7CIs6J9dtTk+WDXnoxvSecUo8Omyt5DsVHnUD8Kf0ie
         L8a11rtbAT0g+4lSHykZ9LWARt+CEspNgMDh1cty0+0No9N3v687MNAfnAxM+ffVxHqT
         9L6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780843839; x=1781448639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
        b=syrkoMLz84RXXGpP5IR+4NLhd8fi1k79HUBAwBSr0U1wGAlaTdWceZaa/vtT0MsTvG
         kLxqBDphZf1+PYf/l4SaNu5S2+SKXzMfvcy2LjE2hc8HTHEaXEWOSC9F78RRYmJr1vEf
         VSjzXTXXIBfEZZWqeQR9Y+ZaiaqtAGCLZK0uFz2r6MQN7JX9Ek4dZtOtU/X5GSHjUw30
         NWcCtZgoXw6+7L/1NYSEgj5q7l85eSIk9G6x1pGfhENC6FHGaAbpnk8TMzJmPyfZovwP
         0uB6hzHTp49MUzlapQFN+NkVLuPeJYanJ9ehhibH4Fspqv3o0JHj3ecU+pEgw5BImy7y
         bL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780843839; x=1781448639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
        b=SZG3wKTDoaSvG++lmwfYCbuitbuDEU3WdOPIj5O+paD7+zu6qUE6Q+rt5bWPT0ZPKY
         NlZR0ay6uHoa2566hvi4STaWOJz7nGxJ1ncWewP7enJ3reNfJmvJeu46fXRx8Xl8/FWh
         4Ku5Wv/EDsJVoLbYOAD0pge2qe2DDK9BQLYvpH7m3jvr18oY/gnPcW4A1cJ60HYlcMoy
         GsrM/mNFVVg1PmBC+GnLYoSoCMr9Pmva/oBI+JlJyNQSfaHASsEGsVFzsIZrXROOP5oF
         MwrS4SYrXswNg3Sbf3jjDxbBeJYG9yLbAu4xjEuGvRo37AhzGtW0k4OWOvzvBV4B7XVC
         wJpg==
X-Forwarded-Encrypted: i=1; AFNElJ+KxL6YZKNAeW0VlJPTPDrAmJ8syQVCMBiMJrCFAsNDvrvwsu0Sy+AilwWVIwsuSQg6mSJ/ZEro084SIbcHwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw86WYozQ9ogMHyKW/A7x5lFmO4tw36IwHEcT4cq3uwliO5LZOi
	q+ilIvxvrQ1bDSty3246fCou18tk5odLoTS1F97uYl8TZXnb6rqn1kiGZCGhlqTy/7wQDT0Qv1+
	uYl5hxUVsdSKFyz52CkOY6pqHnuY5FtA=
X-Gm-Gg: Acq92OHzsKyYv8hVzHKN6ChZv2sn7ruCvmMgWDa2FKLDDE12Gd+nEcmM6NIquBrw4HM
	rWbLeeMiO4Craw88vdYp9b5Y/Z9B9LRjEBPS+WbPA2LkBMkidaGqg3GylkQshoRD+3ic49LESlM
	/1dqMm2lXPZ+pikNahRpkCeMHKuAH2F+8hwIH7DZ/pqf55Spys5suk7DVnlSXCB8phG8Wemmyli
	W1SNEM8/HyaIMJsgD8VURmPkBm9G2RMG9dJ9nm+F83T9uGrq2CnlcRTxv1BIJ+kuQhB2vV48IHb
	zDEoVRBWsES+poqP+8NUcds35SKDLgjIwqUCjcyYlarrz9voDAAmp+pX3JPvPQlTV1zFZd2IjDo
	ENd2pRtzrFaeIathzTB0ZnxDPIbnNQ+yL6g==
X-Received: by 2002:a05:7300:5723:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-3077af4a612mr3072058eec.2.1780843838713; Sun, 07 Jun 2026
 07:50:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604192740.659240-1-lyude@redhat.com> <DJ2G8D0N6EK7.2PDDSC28O8K4P@nvidia.com>
 <DJ2T75A5H6Y2.ISIBOQVMAO4I@garyguo.net>
In-Reply-To: <DJ2T75A5H6Y2.ISIBOQVMAO4I@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Jun 2026 16:50:26 +0200
X-Gm-Features: AVVi8CeFi5djIGvrvuLFIe0ggcr2ckGO7PwhkagBDt7mLNkIJPuv5Gv_nWehfL0
Message-ID: <CANiq72=qKckJXFJU6TDKf1yh3a2wBS4SQE9fiGKpVOYWYtL8QA@mail.gmail.com>
Subject: Re: [PATCH v18 0/4] Rust bindings for gem shmem
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2026 at 2:17=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> IMO we really shouldn't use Clippy to generate code. We spent too much ef=
fort in
> fixing codegen issues that are only present when driven by clippy.
>
> We should just run a check phase with clippy to get the lints only, and t=
hen use
> rustc to generate actual code.

Yeah, given the trouble it is giving, I think that will probably be a
better approach medium term. I don't love it, because the original
idea was to avoid such an extra phase, but it is definitely better vs.
random source code changes...

We could also increase the symbol size-related variables
(`KSYM_NAME_LEN`, `SZ` in `modpost`...) only for Clippy builds to a
ludicrous value. The extra phase approach would avoid surprises more
generally though, so I like it in that sense, and has the implicit
advantage of avoiding someone using a Clippy kernel in production by
mistake.

Ok, I can take a look at that. For now, I will pick the other patch.

Cheers,
Miguel
