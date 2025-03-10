Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D974229B1F
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 14:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741616720; cv=none; b=oWsYS3agSECllPHsuRbqm75+3ty3xoaZB1Dqy8z76mBT36/29w+gNrOYgoxDDL61I8b4s8QHFXN3dvAVA43NdqHSr+m8wTJeNZof7a6ddrVJy+i33wX/trJ3fZixA1la+2YX3DHf1oIfv1PxdshYXYVR4JARJOvOXm4emY1lN8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741616720; c=relaxed/simple;
	bh=t0CGtGU/RXSiXxcNeDxGhMlfhHaYbDatZfthEgfMIlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYsowmFcxsaF/64nD6UdbLPtvc9k0J4eFDfyUZbnSXjB0DYH3vGnCpLGZi4Y4+WI3vIeR+x7Ztm1irDyq8GeUdqgEVDc+otYiAH3l+YX01YCBQr2YNZ8Sf/h5qj93Do20RpKH8Dc2wh083os9EpyvXQ+7a5njP5O5QGTJqXB4ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLsp43fJ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLsp43fJ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff611f2ed1so1162331a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741616718; x=1742221518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRcuUCwJflcquDeYRTCyjJlblVLgcKD5WfvT7iJAqiA=;
        b=bLsp43fJIcnyESuf4Z8BriksNZ6K/w+ds+6pq/yDk1P+/VaMb/Dapu0CAIQl2fQiR6
         HqdzbxS4WwgGD4wa/DOR9IzfGy8R04LYodEXFrVKlMkxfiXHAp/zn4o0mthCYkfGAu0J
         rtYCyhkmi4l2Hev770Oed4oqhFLUep+W7OtnMmICKSKhG4mRTIRCcmtniZbEMyjQYco3
         T7cX8j34tJFMV86KySiCAr/ptViFSor9k3eak21nZ30cVODybYlNLrgVG+Re3nfh9/ne
         5iKhBMvWfEVMmHLRSKtyrLKb7PHLxZdHETgdW/MowOtZdkNnwvXFHx/O5U/1+aRn895V
         FLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741616718; x=1742221518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRcuUCwJflcquDeYRTCyjJlblVLgcKD5WfvT7iJAqiA=;
        b=ey5FYaLQpC+4K9Xo2Hr/WF4LCTAnJIquzKjzXSUzVi9rSWlZnK8JzAY9FwZGPH8yia
         /hz7+oZNKr5CNMPg/KyIPcaW0eHK93LsuencPfTfa7Sqj9dvzK/GKkWMOuOXm510vLGL
         j8ZpFRFHtzjFiabEhAgtx65OdAwqL2LOmfmDJWBQujAp99EHH86DV5WNcOtZ4PzzK2iL
         UK3Risu9nv3aYiTfXzsviQuNwBhDli5PHvB8QNVvIcFfwL/7CQzdR1+t0YsYqrd+tWW/
         A8FtO4qjQov2iXkx1hAoLBVg8y8U1IQl2jhzZv5+E2+FM4Uyq3W0y71GR6dhcqyRmMUi
         h8bQ==
X-Gm-Message-State: AOJu0Yy9AxCeQE2WsdV2NwPCqt3/TUFQr7j6yfiaIpp9Py8e3E66WQLB
	EE2HieR2/F4hCJl39OKRLhwjlUHeJnj8kLXUls4KogeC8q/L5PM6rolaNk6wexugmPKy2O5w+cP
	0kCbGfw7mNa3bJuvL/zNpEsqF9HY=
X-Gm-Gg: ASbGncsOYg/T7wA33lh7wx0WWhnyexgPBpsBhh3XJOF5rWn1GyBHr1Lrg/Eh2gPFfNF
	FLTXHmBFJhaRdyobOPDvmz+wstE3ziv2S4TuKeqtN0h98dHQk5zFAU5kRWEQ60Xn3a9ffEyBmfg
	IfPri5GNFwOoSOHfa0sLQLgLoSqw==
X-Google-Smtp-Source: AGHT+IHm26PgADBUKLhloGmnijeeBQSPdeYKL4IB1nM7i1Kqh4ikDelr9izas35Tlnk0sbYcXpsRbnyUki1ccUyd8iI=
X-Received: by 2002:a17:90b:4a4f:b0:2fe:b2ea:30f0 with SMTP id
 98e67ed59e1d1-300a575a10cmr5662153a91.4.1741616718291; Mon, 10 Mar 2025
 07:25:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
In-Reply-To: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Mar 2025 15:25:05 +0100
X-Gm-Features: AQ5f1JrI74C84LJso0F0CyNstcMS9k40I-8PKT7xwzbMUHrwZHQKxNMrZm9G9H4
Message-ID: <CANiq72nePg15KyeHdF5v-Phj116_iB15X6tP1g0amWN5eD4ebg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: types: `Opaque` doc: Add some intra doc linkage
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	daniel.almeida@collabora.com, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 6:35=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
>
> Add some missing intra doc linkage `[...]`.
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Applied (this one only) to `rust-next` -- thanks everyone!

    [ Reworded. - Miguel ]

Cheers,
Miguel
