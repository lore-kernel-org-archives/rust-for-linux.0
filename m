Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567F420EB
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Feb 2024 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708893024; cv=none; b=mSXpygh+vaE/NjNgQedpOQ+d+AYyBtxhziJrXzVBRKxT/6D49Id3IEYAEmCk4f/iTmOu4RjCbb3vgiablZv7sCUsFNmnKvkpu0/U77c/tbwbDvc2XPUXZSHCMTRepvXu5SBp4/ztRkB26sG3lCTC4B1Z86FeaYNrqrfNJ7ztcCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708893024; c=relaxed/simple;
	bh=RTZdSbEGxrd89GnAAY+1wLsjBmzUld82GoW5/u0e6FI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+D/WepSTgL5dhjo3ab1/5gGSnuszD2gTVDbExokOa2koSMWiJxiOz4jzeb5ZaMtJQ3Ro2RIe4zgBguooPRJptKQxfQOfh12RKQqwVLlibvYyUbqkQn8MSuY69K1uZnNfmm5QAngQ+9DLL95MA4U33CvIxTvk3QulScSrKrhV8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLjFLyHF; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLjFLyHF"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e4f5e84abeso170138b3a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Feb 2024 12:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708893023; x=1709497823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTZdSbEGxrd89GnAAY+1wLsjBmzUld82GoW5/u0e6FI=;
        b=cLjFLyHFcgoiWL6kmdCCd9qlUgbo11UdHL8VVeKEfkas3XY7YHbDN+XACNa5/ZaL4X
         KS3ENB0LX3GixFRiwsaybY7FsOTAd+wTmpV2YFn2vAKRP19a0rsygvLJXgSsnOYhqaFM
         nuOmvRKkKt3enBI8zz0kUhzC1fV78EjDDs7YZ8nxLinIcYHQKdXNCwnHj/Hg9fosP2v3
         iC6y1KdTmb/YQ6uBkFId5YEtxmhoxdEl0/RxsXoS/cTssEMxl57DwvWNlL5nhHF6Js95
         yxx5NSOZiU7m/1JihZJG2pojlHOoFpY3BPMVm0EtYn3Tv1DCgum+jTUHeukFIXlKcwKo
         vhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708893023; x=1709497823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTZdSbEGxrd89GnAAY+1wLsjBmzUld82GoW5/u0e6FI=;
        b=iuP+Neo978O/sjxoQj9rlRO+0HUMCQ3RqVspW1lzTaHXg1QxLZCcGgWSfKY0021edN
         yEuaJtOTaKfU/Ke38B15T2B7ctt6PuuFgGVv5THxjHJbr19piHk1nKoJ1fWoGL3RFUUj
         P20deH59Aa8S/mtiUIIRM0W3ERJtCLlw9mHEsAL5p+BtNCcanm6EQlrGNIp1bHyaRD1V
         FbpSuuUgRkG0kNWPx4MZzlnSm1F0sBdaSnQlDryPrD0fA0EGDkyItweApM/W2k557DaF
         J6eetYnUT/brl+z1Zw84J5/HSkzrdU4MqhuOywft4SxDCEqms2mDpE0GhRDbcdbkLKzf
         EkGA==
X-Forwarded-Encrypted: i=1; AJvYcCW8V71l4pQJYNa78cgy0TDmPa9Bml3uwpbo1D7uO0SQAaTaus8wRTfaszb7704hERluVxPp6TpSCtAIDCJ+rSoIpGgZqqAj1L+2J4svPqg=
X-Gm-Message-State: AOJu0YwVy87LHa1UmTSsECCUquCZTjkTjv7svj6Z7/SHsN638zRKtmI/
	yZ8nun/xgpEGSaltGEr0Xvwo2+Kw3/1HznHyfhY5av3lihmMMUsZ2kR3nfaSGPw4uPE/DMsX6Cj
	vhZkURgU96vxx5qmmzlyR/H4FRKQ=
X-Google-Smtp-Source: AGHT+IHRXaxrTezSRmeS6RHxUMpMtgcwV7P580CsFPn4DgyYF0nTxCIh8Xzq1C0Xc5LKaOFzHIZ+LedX6G51cuwAOuA=
X-Received: by 2002:a05:6a00:2f96:b0:6e4:7a99:1af2 with SMTP id
 fm22-20020a056a002f9600b006e47a991af2mr4280043pfb.29.1708893022746; Sun, 25
 Feb 2024 12:30:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217153315.56128-1-mcanal@igalia.com> <CAH5fLggPRcPc-5C8JY5FR7jQMbdNoc89EU0_QAqhG=6HiySZ=w@mail.gmail.com>
 <83571d1e-5710-47d6-9a6c-2a0bb5ab5e5a@igalia.com> <CANiq72mvqfu2akoMGOj-N0tUOAnvTMOBN1dYA7CZxcJqpd6Fog@mail.gmail.com>
 <0477f3cb-84e0-4ce7-8196-cddb7dbd1448@igalia.com>
In-Reply-To: <0477f3cb-84e0-4ce7-8196-cddb7dbd1448@igalia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Feb 2024 21:30:10 +0100
Message-ID: <CANiq72mkkVNw-nT4OuRp4amoqtLp8wsppEXzBSRYzOOX2k8bHA@mail.gmail.com>
Subject: Re: [PATCH] rust: Add `container_of` and `offset_of` macros
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Asahi Lina <lina@asahilina.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Gilbride <mattgilbride@google.com>, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org, 
	kernel-dev@igalia.com, =?UTF-8?Q?L=C3=A9o_Lanteri_Thauvin?= <leseulartichaut@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 12:27=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.co=
m> wrote:
>
> Considering Alice's points, I'm OK with their version.

Thanks! Their version is in `rust-next` now.

Cheers,
Miguel
