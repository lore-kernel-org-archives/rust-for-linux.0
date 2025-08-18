Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5513314A5
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755542823; cv=none; b=dBzHatC9NXthAQmIu+r6StTcEYmpkFipdMpdeZqC+fsoHgZFS3++lq/jsIxrDKDcxOA85a4pjtFTcw4LROsZ0WhsFKv1wrzXCL9qWldsXHo8cSucBNRnMizY2Zdm6A+M6s+NnBtzGn6QqhN+94y646t3PWXqJ9pewpyybDHNVnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755542823; c=relaxed/simple;
	bh=3bIjF9BxojLYXU4GmDYtCEd68lCPChRFi2p4v+gwO18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hqstsk0FHzODXVunaT30y3oHh651ANFsEejK8V8/fuIjbGsCKn35p127fpA7bXLzAYZeb0B4UeFv//BeHAGzHDU+0jtyMv2y1dhWQFMnz9KiRNcFz/srWl96VoEN/9NDtvKsQZH8dDA8VsCm9Hye9QLg8gkzhZP9Mt7CxwxSACQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HVfFq4xt; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HVfFq4xt"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9edf0e4efso3164474f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 11:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755542820; x=1756147620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Me1o71bySPNE6ozhOT6isRZtcdCRFNLWJRygKFvabT4=;
        b=HVfFq4xtJ4K4VWaP5miOoUTHnq4XeGBeZ3D6LN1fu7SyHQ12sNM3fROXrTONT+QtPt
         mQ0wF7nf51D11vSrPLEBG6h8rVbBR/mgVDbwG5tkxCd6TAgEn7YX01YzCVSHC6gpF2vm
         APr6gkxn7gagtxNfFU7G1UvhtscG6kKm6RAOyVKeiLNvHfXEVYcSpbFn6CI1IsaAKC/l
         pXTEuzpHiXrh9J7FDbprtDb5lEcEmN5LuXvhzsFY2qb3aIZgRMXQ6Ndr1nqBtAv7s1+7
         IUvXXNpJgjuV9ETZUXAh8efL089zj0Vt5AVdnorerJnlvEG9x9VmfJX4xt96MFwhf7Bq
         D+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755542820; x=1756147620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Me1o71bySPNE6ozhOT6isRZtcdCRFNLWJRygKFvabT4=;
        b=dW/vGUoQh14iEQRblasNA9dLB/wSaDrEi+xKZKOKXgOZjSpe/yr13QV04cQpDSsWUb
         xmQ4OwsXboi0bpYKz9579Qt+QzRGEta1qioQOl4vDDTce0ZNHsruKDYCE6pBKwCdzVBu
         HC74Fix3krDkRRSUKQsclD5Z5xipMyTpk5rpZ4v07fout2D/jVwnEtozYpu/s++grBrP
         Gen+01vu18rdasZRXnhRnCrCwI2x3z9nIZLqWrfh6rqS2m96iL08xxQ7kTXGVBkJrmhg
         oKOX+OgEzjKqpBWNbB6+ToVUFegGMgCWEnXIOCNS7g0JHsq7z5pp+oZz1kDqC1e3/qD2
         CDug==
X-Forwarded-Encrypted: i=1; AJvYcCXc/9oMaYk8AnNaP6JJbsH9M+TWPr217wFwgCforzvGPWSEDckAw858TLpCkwnEKNWMx1KUU9sNVw+87zfrDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyfPC9v9qXYuTEKC4d9o9DKn4+uIdrBn6151DWG/pM9t7LhpGm
	AtkpUwrYpgSLKRey+Wpl1qeVQL+l+Bxvs1Svup27cUHlLIZI1DZO7xmDOSoDFy1h3AGHMbr7RsR
	JwzHyLUMl3pEgNzEKQvKb/SOmxZShoXd18etm3MSZ
X-Gm-Gg: ASbGncvLcpQm+bPQRtdoKBe8imU3CGCebdGCfrQT8H3KWSnpwRARNzxrbYjOoEY48Rw
	sOv1vAMnYsqSWkmOauom9UhE+uDrkPzGAmMf/hTN/O+7SkXaNJRvSNVl5BxL36hh0nFaNCOPP2n
	vxq6aalrK4srPEDKik3UzDpsDkVxeH/EoqfPJG0QXYsS1t01o5Hzmt+aR2rEjBUZG6ug0I0TcbY
	cXL44KLSDc76tNZzVo=
X-Google-Smtp-Source: AGHT+IFLXetOVp8U2f0VHdoGA8Qd25eyC4/86+oKYuuZu1tnTogajoOeu9n4fKnmqFulipmTJwqdd/mlNYD6PV1NV2E=
X-Received: by 2002:a5d:5d07:0:b0:3b7:9c28:f846 with SMTP id
 ffacd0b85a97d-3bb68fdd74dmr10640572f8f.44.1755542819634; Mon, 18 Aug 2025
 11:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818180923.192042-1-dakr@kernel.org>
In-Reply-To: <20250818180923.192042-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 18 Aug 2025 20:46:47 +0200
X-Gm-Features: Ac12FXz6gbvv-OYarFDJOsB6rcv3wq6rTkOI9n_bRh-TEbKfUIQz8PkeqvTnRj4
Message-ID: <CAH5fLghXq++6MArtGjHjjP0=s4m9Faue9kokyN7sR4vuHGtrWQ@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: add ARCH_KMALLOC_MINALIGN to bindgen blocklist
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org, 
	Thorsten Leemhuis <linux@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 8:09=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> For some architectures, such as X86_64, ARCH_KMALLOC_MINALIGN is not
> resolvable for bindgen. E.g. due to being defined as
> __alignof__(unsigned long long).
>
> Hence, we have to create a rust helper, i.e. let the C compiler evaluate
> the expression and store it in a const.
>
> However, if for other architectures, such as arm64,
> ARCH_KMALLOC_MINALIGN does evaluate to something that can be directly
> processed by bindgen, we end up with multiple definitions of
> ARCH_KMALLOC_MINALIGN in the generated bindings.
>
>         error[E0428]: the name `ARCH_KMALLOC_MINALIGN` is defined multipl=
e times
>               --> /builddir/build/BUILD/kernel-6.17.0-build/kernel-next-2=
0250818/linux-6.17.0-0.0.next.20250818.423.vanilla.fc44.aarch64/rust/bindin=
gs/bindings_generated.rs:134545:1
>                |
>         9622   | pub const ARCH_KMALLOC_MINALIGN: u32 =3D 8;
>                | ----------------------------------------- previous defin=
ition of the value `ARCH_KMALLOC_MINALIGN` here
>         ...
>         134545 | pub const ARCH_KMALLOC_MINALIGN: usize =3D 8;
>                | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `ARCH_KMALLO=
C_MINALIGN` redefined here
>                |
>                =3D note: `ARCH_KMALLOC_MINALIGN` must be defined only onc=
e in the value namespace of this module
>
> To fix this up, add ARCH_KMALLOC_MINALIGN to the blocklist of bindgen,
> such that we always only generate the symbol from the rust helper.
>
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> Closes: https://lore.kernel.org/all/8aa05f08-ef6e-4dfe-9453-beaab7b3cb98@=
leemhuis.info/
> Fixes: 1b1a946dc2b5 ("rust: alloc: specify the minimum alignment of each =
allocator")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
