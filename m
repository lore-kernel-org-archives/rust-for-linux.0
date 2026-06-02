Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E1A330652
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388172; cv=pass; b=L1PDVuv0VNAH/pDPqQUgtDaG4DLmHe/HCTJPlZchpcDWxJwvsE1FzSt25R5YavUzyfhZZqxer2VsPK25sOYDzGcmPagByOOGJ9DhmLPRe7dkmUd1+io9Dsis4CtfVUIjza6L5GjkCY5Ad1nmt63ZLw1MmvD4faMZDRSwv9nCyK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388172; c=relaxed/simple;
	bh=vPW8wLW+xTLNb8dxBfNISJORukiYVfndRQqDrDRQtJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dryagrTxJevZw8MMDhQlNbTPOGJW34q1HEQH2EBYmGdCCkUYoRW8fEay0Kmn7JRU3MJNzhfDICM4LYdCC5TzPVB5URqm6F9YgZdO77wju4s1NuqVkvIah4LQjKl3Vy7MyrhxQ5nFBsak8IGXmKmZA26kWJR+p4wA8Bz/wGs6qgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiuOTSup; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiuOTSup"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1363f6f7535so483419c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Jun 2026 01:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780388168; cv=none;
        d=google.com; s=arc-20240605;
        b=VacnoL5ZuNnv/fIY6w5cHX4n7cLiCGvuir1MzjEd1Jz+axfOX0uGZfsCVGBSnnlM81
         9sw1eH/pvNObGQ166O9iYCpjpuxdxTaHMKL7R2a60XTpBQVeDkmjXr/bANWHBQhPR4VT
         2w8S2Q3BqJ3NWA/fZi2I5Xy0uLfIpsbv9G4vZ37Edq74U7FuDITffjZJgWda+Zbww4cO
         1Oh81FDUim3qUtEQHZCYKXMFJziUFVhhfZETHBpFPZjUsou6ZtQIuTr0Ijz7t2CQlUsK
         G10qyB2TZbVOnTcjSozkC2T96rFjbEHTM1eO5xlG4pXS+WzEyr4NyyXCy3uGx3JNyBRG
         2arg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ch5pZyCWm4hnwRyszRObv2D+1iLVbXGqsVV4DrLX8U4=;
        fh=HVtsLWpCsssPN8VUSu777sp2C1eEiOgEaO2Fsped3wc=;
        b=H46BW+To1A1v46HWtGS0m1CSEj/SiKUgAQEA+B9mjQNAXKHt8YiuRg+UW5YjC4reLF
         o40oEnFVFmPx0gTVAV/5bADDgKpBSesiHudxroOEY2KSoX8deAsxrRlZwrwy2m/uxAtC
         olEspm6ZHz6wKfshvxsP3VzrDiWfyddM/TdA5tieOF6npQQVSj47c2jOXnmN9Qx+taJk
         NzMHJDnOAdceBwmWePxagqeM6msW3r7V5XbXMbUzcOekajFxPL582/3cgzs4+Z6J/NNz
         runMaIRFqGHSJMiJCzAYBU4/Y1/B8CmDXhmBZvmVyUMRLqiarWBIUMwQ/vMg99/C878Z
         d2+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388168; x=1780992968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ch5pZyCWm4hnwRyszRObv2D+1iLVbXGqsVV4DrLX8U4=;
        b=PiuOTSup2AeWIdIePo7noWcVlGZukB95pFHkXd41EgxH9ez/3MLFX8Q/Zn1KZ09/U3
         yOVQZJogfDTp+5Auk3gQt+Xi/FB6rT2iWU8/0jLohFIpXEW5U8uVjUSYgnwx10VZwaGl
         /lW8hG5HbJ21gEZ7UJqSQa9SrPT+hNY2Ly57e7lN6RBrQvS217BQA6rkipkLD5h9ehGg
         xTg7JrtEJN3YkViB1zYD1R9c1KqP7tTKcuG53dkou9WlMO5np7Hzn2f38UdLrWUehJUl
         wftmXdWDLbYWygQSsx+LDZtdtqQSbKQccMtXC8kcj/hR3EWC+w7k65f2cFDm9dYp/HMg
         fCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388168; x=1780992968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ch5pZyCWm4hnwRyszRObv2D+1iLVbXGqsVV4DrLX8U4=;
        b=AYJ2K7ZSVnjgJxdwJZ62M1kJln5ZJr3ZaGZ6Cyf1GUI4rdoGZGlflRGENIRZxKmL8U
         czl+pxE0wdntiTSmClnawe4nXnjDcMSDXjQxq1WCmWONT+t0H4ZRaglKpDL48fa5ZP3O
         3iMpJgqC2xSAJ1+fTxt76QMitLmWrxvqtsq85B5XcX4qWvnRHI8tGgh6lWNwp4tkAsM1
         ZsaKsynvmK67ktkvI7mrrPWyk85gGmimUzSsUhLiT88Qj8U/Z+CTqOx4Clc1dsDf0u6H
         7QOcOdvnWUzp4d8QD5Vpy1GZ63gdSV/FxaouxmznkXYA+9/WGnvW6avaSIja6mBpaV15
         jK7A==
X-Forwarded-Encrypted: i=1; AFNElJ90u3c3cFhJiri9qlVfUp7TTOg3J8xugxDjVnxEpTn3u6g9p8RNnEo2BZRZ9vP/jM0423fnrv9z7y264kvuPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLH5NzijjWNbJuCpltQoZl2/VMGglPG3sxYaPcJAxYcZmPGMUX
	V0CnBODgPSqXfs2jY2hU1Xajp9rLBBZlY0UFRXP+TnzqdXqOLPNo0DeEv4FJUmgLDGbMq2IGWS/
	GkgQRqW3hJDHDP0+1zDpFswkFXtU8laM=
X-Gm-Gg: Acq92OEw2VcIh2/V0cEWFsIYtm3Dd8jNrf1n2ZUchYyF+8hcCLC00pHN2aYbcoW+xam
	obL4DOluOQ6k6vN8P6nCfr0MoSegeCC+DIy78tNNdLD2Cesb+UejRiWpBVT62EEFLcBA9cZxrl/
	coDSfP3Sj8COrT/tHVzaBX2YMIQSB0/H0uJmYZv1fGRHezHYZwsuAUyQ08V2hpqDs9PHGIjTjXv
	RAA07ogEoJmsjexJuvh1aUC/aV3mMA6TnJUK3R/8+asbTHJ2OtliYu7bwz5wa6xHgk7r+dQF1Ee
	77wIir7ChExkdPgyNXlCPifoq1yizjHgqxk2YaUivH2hEyCElKbcZgxeHL90UdgUp3YRZA2HmH1
	CsNCF9NHh+jS3A4E7waWbTLU/cxmmVW6yFA==
X-Received: by 2002:a05:7301:688a:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-304fa6a2df3mr3064799eec.5.1780388168347; Tue, 02 Jun 2026
 01:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530184944.10459-1-contact@jkam.dev>
In-Reply-To: <20260530184944.10459-1-contact@jkam.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Jun 2026 10:15:55 +0200
X-Gm-Features: AVHnY4Kr2rO_WdzWReX31YPA6BhQ7X-dBlpTnNN1R-LvP3fsnSXU7SQN06u2DVg
Message-ID: <CANiq72kUgSZ_xD4iFqUftY+r3Q1oL-z2qHdZJDSSK+J2opxWTw@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: make `*.long-type-*.txt` a target for cleanup
To: Joel Kamminga <contact@jkam.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 8:51=E2=80=AFPM Joel Kamminga <contact@jkam.dev> wr=
ote:
>
> This cleans up files generated by rustc compiler in the case of an
> error containing an excessively long type name that doesn't fit in
> a single line. Such types appear relatively frequently so the risk
> of generating these files certainly exists. These files are purely
> compiler artifacts and are not created intentionally by the build
> system. They should be added to the `clean` target to stop from
> cluttering up the source tree.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1236
> Signed-off-by: Joel Kamminga <contact@jkam.dev>

Applied to `rust-next` -- thanks everyone!

    [ Reworded and linked to the previous related commit. - Miguel ]

Joel: please check the rewording.

Cheers,
Miguel
