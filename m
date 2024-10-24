Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1871F81AA
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 16:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729787641; cv=none; b=DKdYe/C4WyAkliPIbX72GFYWaic3quiUtj0sgwEe39SbpQCA5xKsuUmIqG8EEAQ0F0aFoRXYSpUVbteLCat8HNvaW588xH4cNaBEklYx3FZ1d4L06okebcKAKsMu5/XdAdz0g/53q0si2BWGFvIYZGMbvoa800PmbLZc2CQNa18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729787641; c=relaxed/simple;
	bh=a59n9mMFIOunZBRmn+IghEGBlvq05f7lh7Yjxinmi/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQ25QpcFa8jQik/5tZRCE////J44LKuCfiWFlE7V99tywVthabGx/2iEsZSUAjtKbl6KGDyHi2d7h8Q0O9qTtKlmDJOKFXkeCw/gmZ3Tk5lY4NtjRjxVy4mnBK3q7qO8WS+oiJMC4eZtQKpdAXCTOBP9Ik4Ce8X0EAVvGZCVyWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yd6QbzhT; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yd6QbzhT"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2da8529e1so165998a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729787638; x=1730392438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jgf9/kF6Phh/cea9fXZ6PPLNN5/4MqKe6HLo3MEvcDs=;
        b=Yd6QbzhTPxk3fKeSuivBFM5bEaDC0CVnqrlqs/L4PrpZsPYfdWRMyyUQGtWJgZ2sOm
         Jn4QZBeULcnOOTEAy6/O5jvekoPtBVb/pgAHBttXhJLAanmrgjuTanznbXDo8N7kokRK
         t2oXNa0UhOch7hKKWBI201OT+zqEifms4LCR+g37dExv9TPo51L4H+ACggCO859J5hZ3
         3M9ImWdKlFNFERzveFCg3KP/WgpzIpj/wnuYfX2ZKabcDbpN9KDBDPjeDNlE9smfVR8o
         mTN9AgvUT0b45EvfddxG9BJOc+Ar0m3UE5VSRehWLdBJ0qrvsZo3vA+dUtpoHiFbO7zI
         T0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729787638; x=1730392438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jgf9/kF6Phh/cea9fXZ6PPLNN5/4MqKe6HLo3MEvcDs=;
        b=dBIHRqu1aYIK4VOg78Wrv3rqIU/C7oBCmZLSX5BxcqRp4SciKRsUzNfdpzJn0Duz9g
         CB5j+O0ekHpE63jKXg9r7YPvporxdKXaC/141mU38MBaiRM9zhPLtPzvTaCbvOl8UO2a
         ATpEj4msKuJJyZzbP0g6+nAT8ytGKipYuT2QPfijMNpB07BeA4Y9sKerwnOMLIsAncEH
         TBcffh0e8QVP/1OwAkTPhZfpA5onhuUBBSRAfpgWKF2swuWrbDMFnvjCt+9QCLLpsO/C
         xDB0KTR36d9E/PIm2HDoja8m2JuxnAoEu9CYkkQb6PzixhbEN1PgDTDh/Qtaw3SmQOMa
         BRYA==
X-Gm-Message-State: AOJu0YxB8sacuqawZoB2DAGgXwhD7692Bqnjf8RRYqoL8gpiW869vSNM
	seu0CqZRXaj7cbkTn8RTVC4JtkORNlrEg0Rir3bSOmfgnVvzgWLsTpjXywWHMOxpOf+76WDVdQq
	TJZa+aL6GamdIadScOCT31iC20fs=
X-Google-Smtp-Source: AGHT+IFe8bVylHtONVGPs1Bk0PhRdlbMsWJzY3WDHd7CsL9Om/nrIu5xgQxSVnuyLUhM+Cw4LaQZzuSTTxj2AYXAzEI=
X-Received: by 2002:a17:90b:4c48:b0:2e7:8a36:a9ad with SMTP id
 98e67ed59e1d1-2e78a36abb4mr351962a91.9.1729787638266; Thu, 24 Oct 2024
 09:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002050301.1927545-1-dirk.behme@de.bosch.com>
In-Reply-To: <20241002050301.1927545-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 24 Oct 2024 18:33:45 +0200
Message-ID: <CANiq72mQ-jOApfeu_JgPdFpOL5oYzhHrDRXrW2bUhPQx2FzgKA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: types: extend `Opaque` documentation
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Benno Lossin <benno.lossin@proton.me>, 
	Nell Shamrell-Harrington <nells@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 7:03=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
>
> Update the `Opaque` documentation and add an example as proposed by
> Miguel Ojeda in [1]. The documentation update is mainly taken from
> Benno Lossin's description [2].
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Cc: Benno Lossin <benno.lossin@proton.me>
> Cc: Nell Shamrell-Harrington <nells@linux.microsoft.com>
> Link :https://rust-for-linux.zulipchat.com/#narrow/stream/291565-Help/top=
ic/What.20to.20work.20on.20next.3F/near/467478085 [1]
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/291565-Help/top=
ic/What.20to.20work.20on.20next.3F/near/470498289 [2]
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Applied to `rust-next` -- thanks everyone!

    [ Used `expect`. Rewrapped docs. Added intra-doc link. Formatted
      example. Reworded to fix tag typo/order. Fixed `&mut` formatting
      as discussed. Added Benno's SOB and CDB as discussed. Shortened
      links. - Miguel ]

Cheers,
Miguel
