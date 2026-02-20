Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8A87262F
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 01:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771549730; cv=pass; b=tlQRtr0EGp2+PMCcViNZBHDvLBzcG8dSABap9jroPmUa+glvGjgvRio3zB9Zmc9IwlFjvQWcZagYOO44u392qn2Z0uPAd05VayuQt8ztfPsckprUFktMQ448iCF+dsqxPN0AV25cDOmUOAlJgG/Bw5fr1vS1BlgPLG9NHKR5t/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771549730; c=relaxed/simple;
	bh=GKl4Ak3kePB5mweTaRAQBHrL+QimWx8N3YM9QBuzD5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PoG4WI9ZzxFIIUZdiefv9YlmxELGeFK7DXUQ2KledeQUAHktqMO9lT4sPUGcnHYbBv/CiJsKnvdX5cr1XsKczN0B+rEjA/iFTjBPnCNj1RdxuJNeidc5pag9J+IbgprQQUOCtNuabbhCCfX0uvn9J10Kr0xa47d1cSPczoXMToI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/+4jXqH; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/+4jXqH"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12736a0147cso138738c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 17:08:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771549728; cv=none;
        d=google.com; s=arc-20240605;
        b=PqZhCUT6E7lmYS4YqHSl2Ay+TaysU0n9tH+Q/xDqnhtu0qqQ1+9csg/yu0xrw/OVMz
         Ewe2sz5rDnh5MN8080v6zC1cthwwhLhM6Ur13AeiAjCTXbxU4FNych8yJ35XWJ4WLKcR
         66oCBh9IEdmLbupazS/jrnetnspowCZ4nN6eY7Rebuzv482RetmJfE7Bl9vkb+GhQWGx
         HS5yKq6ZYwpiat3QHzi8ZwIRwjrGfbbxjytF/IxdYy9dLwN9PbjtqPF2TD6fnkgH/8PO
         sdeHqCztrINcaqlRteaWOWa0u7G32q1bcwlnkApellVUJPxuu5GqkiOWDU5CcM3/dPdg
         PCBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Zh+5deos70/vX+uaYsAg3kTPskQ2Dqdg3LzYmhAdjc=;
        fh=brmhvye1YthhdVNfVBk17jfe35CnQB6yU58spAU/NiM=;
        b=KLzNsl0s+osjUmdTaDXuWBoZ1x3875fQQJ+36+l8ugPhffPYyUkd6f/D2lAne+yJyj
         xsdDpOiRttvlR0KzM3sT30wX8/n1UgP8qrck29T+OgfprHHG1EkGngf0zRKDCO3FXfQX
         hsviDHzfk49dwJ/h4VcVA57OKTelPwpzh5e9a5R5Hq5eqdIbf+CtHJaR/VPVUO/SgO4H
         v7fDCfbUwsnClFXSVDuDRqOUJi5z99LGyML+xmSCTqhRpEhexrPFd+kn3BEcSySiYJ79
         8Wn8Itzh8uVcIcpszeSO2GtnaYCWBpRX5h8aqAR8JFdB45uEz50rS2wl7wAgILtxQByq
         Xmow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771549728; x=1772154528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Zh+5deos70/vX+uaYsAg3kTPskQ2Dqdg3LzYmhAdjc=;
        b=N/+4jXqHb9zYlj618P3PHHEMMZR8iInpWIwsvAChS2x1wfwdLoubtV5MmjiXY8C8gH
         KeofD+EgHxzFRDA2qSVDR6WKl2sA3O9t1wo7JX7ArSdMiNj9TcHa2jytsIzfgmz2qs4a
         LXo7B7GV7U95O+hGkuj+IZSUgkKM4UN5vvgqkhaYspPHX2641Rk7cOghLG01P4hYv/Gv
         q4TGfUZjGEqDVDt5NXSZel6mNBNfAU+6QNXFV2NIDfppIG630UGUdTg3bLssWM68v9pZ
         39yzh1ibLAGvcQ1ryLg+zC2XI6zCcHNP1yPpkssCE525xBqcmA2Pt0G/V5o/0OFkdITZ
         TOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771549728; x=1772154528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Zh+5deos70/vX+uaYsAg3kTPskQ2Dqdg3LzYmhAdjc=;
        b=qDnJlVR+3jYphFCEuiCTQcURnnMU7adGltZWB06eEfyij1G/7E2o3NWHq5EZF22a/g
         wK2ZNvXGDM9MeCvfOnsQ/U+ds2crW98saKvHnqlg6vlF0vZ+zlDmMA091QWvWUfmq1/2
         udEJ7ypIy4aBMAIOo3rng8ueJJjeC/h77EkY1jiDNJAtUpJacBRyO2sXaGjhTaRIdbHa
         VqOI9lGqxfLQUVAN8HM3YsQInBy8Pjy5la7gDrzyYXgFueFbst5ktQSIVOGdzODNnkPU
         7haKbvG18Ql4LOGV/3rdR52zTaOBeXPVQrqi0U39Gxq0y2yVh6LuAG6HIM7GKo0GKkY+
         6oOA==
X-Forwarded-Encrypted: i=1; AJvYcCXNSi4IZa0M5srdePZFtoI5XKenwbCX3JsOAOiHTP0aFq84qXXutpX0ZD9WiKPJKuBwzHdg6bIGioPS5f//fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxROIX5L9x3O895DS6Xz8UkF2rwsV8q4kEvbmdHuPhy/Xn10yMZ
	sg0x1F5Wl+qrhVyLvyBRI6bQZvRNgGov2S8zKhJ11LQySWjf4ZxBft0Hu2yhznKH3j6/OWJPCiq
	mMevUpGRrd0Ot2xUI7kH6pflSZBSvTHE=
X-Gm-Gg: AZuq6aIjXycIu2t0TK3QaXIDd2Cg/xyjMwVKzcEGIJFPnCc0GhBIv4O/Y+cZkjdIK54
	E2250M3fFso78U92hppJz8qEyb5hqUYztxI2gZoY0YGukubNy3DR0gFWNav/bKS6WRy1fiAovW2
	tmnpeBgUlJi77spRV6JNIbki0e4Oj3KhBp/rlz8rL55ijyuyCHixAZXB6r+oMWR02isTZR8koi5
	YfARxy1HZJF74gM6jAmY4fCHh09vVlNqBUlkWAyF4rQeLniywYYpXWJYBuh7fY3xGKrzZ2xYTpO
	WV4Z0JKjfpFHlV67AHkF3hddXzdZeRR/nIjM7yfQHoQohMn3mFKDcOFaogTDAYQkieXvW6Uj6Tr
	mBkKHEkub7VG6K6nh4b1FveiP
X-Received: by 2002:a05:693c:2c05:b0:2ba:7d5a:a816 with SMTP id
 5a478bee46e88-2baba09cea6mr5293706eec.4.1771549727949; Thu, 19 Feb 2026
 17:08:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216131613.45344-3-phasta@kernel.org>
In-Reply-To: <20260216131613.45344-3-phasta@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Feb 2026 02:08:35 +0100
X-Gm-Features: AaiRm51o-obmzy4pYlYDNUV1wrkJLUxZpogWi59HE2mqfpTZBOza6sr_g8MHzdc
Message-ID: <CANiq72kgsgSW5tPj3xA0DLhJS8yBS_uDT=xDbNE=rf8t-H8Qzw@mail.gmail.com>
Subject: Re: [PATCH v4] rust: list: Add unsafe for container_of
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 2:17=E2=80=AFPM Philipp Stanner <phasta@kernel.org>=
 wrote:
>
> Add unsafe blocks to container_of to fix the issue.

So I don't think this was tested with `CLIPPY=3D1`, because there are
other safety comments missing even after this is applied.

Please note that `CLIPPY=3D1` must remain clean for all Rust code:

    https://rust-for-linux.com/contributing#submit-checklist-addendum

I have pushed to `rust-fixes` the patch with placeholders to show what
is missing.

I am not sure if I will keep it there. I am not too happy introducing
`// SAFETY: TODO.`s, but it isn't worse than the  status (the comments
were meant to be there), and at least this shows what is missing --
our pre-existing "good first issue" [1] may motivate new contributors
to complete them properly.

Cheers,
Miguel
