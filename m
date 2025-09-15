Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264972F360E
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Sep 2025 11:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757935925; cv=none; b=MN2zUwFcnyLGrCnmXFa2DujeCk1Euf1GBDpdYn46hczFeNItnZhpdcGNYGo0psHmzij799Am60W8+tNBKXjWznm6kIsT6Tl4xS0wjRAk/vr0XKsi6ixKvbCqbeVTmPqSe7HomVb9J8EFgRqiLSDtWUwRhByCcLeNKtdK1uksqeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757935925; c=relaxed/simple;
	bh=lhjJlR0g/usWNJatZv6IWd+4bQ7YOG5GDqfYIhKPOL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F4URTchvDW2SOmTLNJFJnvfV+T1mmz/xNPQyjOk8iz75lB9AuTsU7kxg4ZluQYc1ahbz+Ruw2xeJ7VRopmENr32GGNnWNrcGjXEIRx2MoTEVuWDcy3/LSS2lQJDr06/X5NEwE6MFlfwAgL/FZ7KSIkcZ8a/MZcYUWiTvWsI5BPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkbYKpaT; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkbYKpaT"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32e78c3680dso115348a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Sep 2025 04:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757935923; x=1758540723; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeeqBjq0kQoqEVGA6Y2CLldAeUXvC4YRAFLGe03vX7Y=;
        b=PkbYKpaTOOLr0AAAI3t8SOjbfbmfUTqodfdEA+zR1f8rA3ZdhQQkOtVyzLZOLjqTKh
         8OrBSwHT+PUo9pBz9TJwY9MC2ySP3+VpACINqlJkiddYpuBsgO988jjQDW4eIxR6SCEq
         +iOxSHN9bN2KJvhwZ4n05N+COdesCdQ7nz6xrxpLGuztn5q+d2cDzJb0EVjb4Rm8BAYN
         JSF+DbPRfHR6g/DlNUhHOu4qG9k1PMRhWRb6yklKBLYtjpl+MPdkl3AHZlYKepKOdq66
         ayJ8l5bqDvWDTobZhp98MFK2OekaaEeRjP2Jb9JPuQ9DyoODezQCTgLxKnuw2HyOxQCK
         83MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757935923; x=1758540723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NeeqBjq0kQoqEVGA6Y2CLldAeUXvC4YRAFLGe03vX7Y=;
        b=M4n7cYkhvEFROWCfZKPGGXQ3qvIFd8RDbYzpgR50VxIE9TXm4FaG02Hy/3FhUN29q+
         0gKjpyny6NP1408xI551YvJtSfFeqaU9S/rhR7sCtNRnwEI+J794EDY+p2cksU1fLRbw
         ZvLbV+MVx9VC2c8RExCrwX7x+WRMLGv/wqgka99xJ4Y+CodeVnrvB2KJcdysdh69OYru
         bJMFexL0JINpLeAJeYB/kt1jVcsWtZyfoO91AID71Z1qsz+bwDoTb9SEFnMTBn4qVVYz
         pMwhrCcLBlJdAayP1D/FagTGdZ8vLbpw8QEUrNjhRAuknBT886SSq6C8C4GckvKgMJ5Q
         SuHg==
X-Forwarded-Encrypted: i=1; AJvYcCXXzgShklkR+AmYH5fa8KpSDclMweIhbP1RxriEtiM88X3OTEzGEa7rD7nENvfQJh31UhBEXra/nuhj/T7H9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6SEO+WcI/ErVg3xsQPZJaCgTSsp0dcoa9sUyS1siBjTGfReiJ
	3s57/tKof5Z8BnISwk/KBhkoxCJWp1Gg/KNQtfWzbPuehAXaFvYEN5AEeqo/Y5MrPO5aGhywUnF
	GRwV+PpVBKdafPUhwO2t53oHrlwMxfWY=
X-Gm-Gg: ASbGncsTzgx4ExKK1mSEJpfMerxml0/rzYujZXKeE86MGLJv/dNHJgCqxaabj3JZ5i5
	M5M1VCAGfMtHUalJ/H0TXKsM4OhSsw/9iX0rVl0YDYRyEONH1naRX3gtsfZNQrbQHPOKP+E1Nv2
	3t+Tu0I2ut1KidWjitvqsJAREIWTig0Iu1qXpAmIvUoLsBhf7kMQTIOCDiBJZRFNsRsKd8rhzP0
	WZ3Glii0sp0fSe4xp9XWNYDnohZP1ZRI6SfGcB/6+1OLfqwKmYtigCye5G/qLW4dzkNMV5TeZmw
	wd2hofVSznktXQhdZEuPHiAKeA==
X-Google-Smtp-Source: AGHT+IFLEChMwTeZv5zuFVulh4BpL4UJn1lGFgnTimd2jNCKBJYG8XZnkCZ7OMd8EBC3LUpilbZ/TDqMDVfAxrtC740=
X-Received: by 2002:a17:902:e552:b0:258:a3a1:9aa5 with SMTP id
 d9443c01a7336-25d21ad61b4mr80648715ad.0.1757935923362; Mon, 15 Sep 2025
 04:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL-mriJXvgyqy+MhoMs7_KSPe9-hOOpyUZbwtRX=_gFJZ3P0NA@mail.gmail.com>
In-Reply-To: <CAL-mriJXvgyqy+MhoMs7_KSPe9-hOOpyUZbwtRX=_gFJZ3P0NA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 15 Sep 2025 13:31:51 +0200
X-Gm-Features: AS18NWBtBXe42q8ymONrppPDdAod42jTCddg3yW5ar0tps4ZuWHC7zJ2DJ9o0kM
Message-ID: <CANiq72mVksRjOs-O-roM0oJVBxNsXyRf_NQhC0QoYB5gdtFuTA@mail.gmail.com>
Subject: Re: [0001-rust-auxiliary-Fix-initialialized-typo.patch] rust:
 auxiliary: Fix 'initialialized' typo
To: Zhaowen Fan <jaimefine6@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, bjorn3_gh@protonmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 1:29=E2=80=AFPM Zhaowen Fan <jaimefine6@gmail.com> =
wrote:
>
> This patch fixes a typo in `auxiliary.rs`.

Please see:

    https://docs.kernel.org/process/submitting-patches.html
    https://rust-for-linux.com/contributing

on how to format a patch and who to send it etc.

I would suggest using `git-format-patch` and `git-send-email` or `b4` to do=
 it.

Also, you can take a look at how other patches appear in:

    https://lore.kernel.org/rust-for-linux/

Thanks!

Cheers,
Miguel
