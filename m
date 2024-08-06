Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD3166315
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 23:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722986367; cv=none; b=OWpHyP49clf0UNMirEGh9P/tX6+TJRzDY3Ba5fi8CMrbPJAawpgv7MWGrAb54f+TMdtIPDDbgCinGtf4L2k8q+PBNN278VCFiRIPJpPszFfuV/wgD+TWAff4fuiFgltOII45/qKJNZPpJZufkysY+y8w5mvSrxdBidoSjV6f5HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722986367; c=relaxed/simple;
	bh=JbXqKpl+Vj+qPmAlLmNjjnYeFbSTGhSRWyST1wv5aVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZaP0kPZdiMDnhAd+lSXidO2nZxgfrfLL4SZSjwd/D0vzmSdTzRKQLCH2md/jEPP3L3othuN8Fl70KHVfqURSZ4Y/Agn1lHDC3RhSZK5pwIlpB0coA33AH/qcs/zD94diTCKYO9Q1Vjh/NVK8kjQkW/J7hEvDnlnnDWf1vauLWJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6E3/IVH; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6E3/IVH"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2cd5e3c27c5so848448a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Aug 2024 16:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722986364; x=1723591164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uX/neCGAN7Y3ei7TN/aocqKWBXdU57xf62JbSBbq+3M=;
        b=f6E3/IVHeLYL++cgDvuWT8+P/qETyfwnYm0Oj3RN7faqa0FZ6erCnAWvtxEuVltI8w
         rDvBkbvH67W+ZITXl/k9edW3PthurXabE1ifmJ6MfkcGiFJeQr/zgO3gtIApGr2qNWc1
         Sgoz9gwMIsg5m3kAcp+vUAcdQd5Kvvfl+oXBIDPe3dbDgco/iLTwdlawruNS/k3vfa6T
         nTcLuJJEch//dyrkTH+3qSsbDJwQIH+fhp+FAdHXg/MYSRjvYzyujLbWshcw82xb1u5b
         8znIVOGmqsYFBi9WqRqfL7wIxdzBLkE+zjocH3C/mYzIc29xTYX6l8qwViXfAysYA1+5
         u2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722986364; x=1723591164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uX/neCGAN7Y3ei7TN/aocqKWBXdU57xf62JbSBbq+3M=;
        b=Zq8/2us6v1kzXVcax7l8dxN8N1VZ6Ijz6gy0I3b2xPCNqNd+1f3bzhnskT0SaQBXV3
         b5RPOzQABc0hqu/2VZYhYcqBCKlMn2HYMoC1nJ882gs/o7N222h8FMSzYm+jRoF5MvgZ
         393W3toavo2/PGxBpFjiOG8vYMs/vhNCDMvtDheoZvvRHbd1YH+Y7UHMLiXLit4NMYe2
         To1ra6Bp4Didns/ISCu0/NhDrjkoeq2HuVn6Not6sLlgD0ydC0/d168oisSVPVIenL45
         2TzwTUFnGv3dDQcogWGsV27s2ijJjVe6qFdqOtvAJvZmfC6r8Odw2InGKexn6C6geeKV
         ddbg==
X-Forwarded-Encrypted: i=1; AJvYcCW4h3/vazOtx42cKRrWDvfBitOp1wysdKB/bdRX/wJTn2nTUVBhJEJrDmLEQlFhU++lzUD+k72Yv0XoHhrb7HjDtJZJVGNbAe2LJworViw=
X-Gm-Message-State: AOJu0YyTamx6yHWzkqnv4IcFdlsv9ii92nyc2ZddAyncG8hfQJE4zM/Q
	ohGCvQWU2J4xvo5j8Ya3JMM6o2VOY8zzQHRjxe6eI3XFLQ6hkpCvNNggK6PXZciuMijUejKL9RA
	f/Y1kl1hJ6qjhvTf4PGi2CZLYpfM=
X-Google-Smtp-Source: AGHT+IGR/arGa7A2w67PK0ukGxoNjtHOhp4+gnJFgOoDGkavgY7snyc7ineJ8ERQ709yPWfT55NuewhJNE8fohU2tRQ=
X-Received: by 2002:a17:90a:d146:b0:2d0:86a:fbd with SMTP id
 98e67ed59e1d1-2d0086a1d30mr12148140a91.32.1722986364404; Tue, 06 Aug 2024
 16:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724172713.899399-1-sarthak.singh99@gmail.com>
In-Reply-To: <20240724172713.899399-1-sarthak.singh99@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Aug 2024 01:19:11 +0200
Message-ID: <CANiq72=BV_kYbSw0YV019zTAmvB5VKHz8592pTTE=P8fBU-PDg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Support latest version of `rust-analyzer`
To: Sarthak Singh <sarthak.singh99@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 7:27=E2=80=AFPM Sarthak Singh <sarthak.singh99@gmai=
l.com> wrote:
>
> Sets the `sysroot` field in rust-project.json which is now needed in
> newer versions of rust-analyzer instead of the `sysroot_src` field.

Applied to `rust-fixes` -- thanks everyone! I tested it in a vim +
coc.nvim setup and that error goes away for me too.

    [ Lukas, who leads the rust-analyzer team, says:

        `sysroot_src` is required now if you want to have the sysroot
        source libraries be loaded. I think we used to infer it as
        `{sysroot}/lib/rustlib/src/rust/library` before when only the
        `sysroot` field was given but that was since changed to make it
        possible in having a sysroot without the standard library sources
        (that is only have the binaries available). So if you want the
        library sources to be loaded by rust-analyzer you will have to set
        that field as well now.

      - Miguel ]

    [ Formatted comment, fixed typo and removed spurious empty line. - Migu=
el ]

Cheers,
Miguel
