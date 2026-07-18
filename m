Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AE5264FBD
	for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784395654; cv=pass; b=PdIAxw4iOcPUiMwc8go6oLbxMpCoblfeDib4g7FjYpfCH4pJxK59c36JQg7CZb4g6gruYeOimU0TSb/i/mXKyHCwc9b5L7rG6lkPqneNTVpMgKjlGboa4s+7el4UnVePHg0Eiyzn7iSJh/yIexNhDwg6Ynon5Un+aoMYZXhjfPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784395654; c=relaxed/simple;
	bh=lfrebF8b1+1qASaIgSEDdbl90XsCcIfjSI9Wojzf2aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/YTIwFMIFdHTwwIdLp4CgCA/2NeVSisWmd53yX8ygyr5C2obptBtvaqr0OHOvBkWwKtuK25fi6uodb69U8ysfooeiDSUF/Ce6Ff6lzl5RVFvUTXExjmBdNmzaGcFapV9ViEm0ydO0mCs5uqrYKL1VDZ53JRIoAQi5XKlKpLOFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dy4+DexT; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dy4+DexT"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dd1cc8dc8so860647a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 10:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784395653; cv=none;
        d=google.com; s=arc-20260327;
        b=mBRbnc8IWL9ctCucQLaUjTsJzKI2JjdAA3DrMcbi72u8QFeQEBaxDQslV9KvXwVAF8
         B6M2BgZvxlkebbMOiw9yEWW+K9kJ1b13MLba2S7EleKkEFs1/13wot0lmrligEliEXeT
         JJJEKnQQd73Eoceb3bYqMaJjqOo2Nh+hZzcffPI7SdoiVuZ4+A4uyCmLwQpCiZrut2Hs
         Osguyom+kjVcZeto3h/j3UM2o5kjF6o3b3E6jwXvWPjPFWmk2A05OwU87AR1tdWRUmTy
         1sV12laaABkmdsi0H20WW7q18/pOR8VMnYiguos3ezj0hXP01+AoN9+SlKpXZN/rgM3e
         Kb+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mqqux9OfCrOFCnukdDW6Dhn3g9FZWSv9acx0ZQuSvSs=;
        fh=PS8CpDsN/GPXxnLkDc8ue7maXefY4mj0nfiW64Hases=;
        b=NIH2jJI26BetZIhVDN+RsVU4c2j/FaFw/J5gB5rKj9841ldnqZMDNsmh0ktZIy10m5
         oEBh4eVcCRRi64g36ALpW4Szt5lobIQqXWbgeiJN/9ljGLL2Q0ji6FiS6MTVbckhSi8t
         21xZ+Un/fYcmVZXtsPU7dt83o7x7natDm64xKgwp0WBnHdVE7bAFKe1W1DlDil3WIB+n
         CpzHwMUFVmprGmTwxrA2rG3SWQSCkPnicfT0ZagUnGxvMaaMkt23Ewp84uEzTRpoDkLn
         HCzypHgupAAo4pQv07qGsM+hq6lWn0lmCPD5ayshPUo10eHPzGlLLmo3Bm3HgeuMfiy5
         TZsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784395653; x=1785000453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mqqux9OfCrOFCnukdDW6Dhn3g9FZWSv9acx0ZQuSvSs=;
        b=Dy4+DexTgy1FFQ2YPEK6zf8xQ3tgxAn913ntYKyCGQpnogrAOGSKxvjLVDgwyGBa67
         uWAB50UFQu07dLwHrKzpnjNgcC//BhMTUY8etwdkX+5c2MlYpfJ8+iXHCFRBzh1B9z3e
         icTJw50i3N26BQqb2klrWa0/CdlYwuXNS81BtVGgzKXi3XoY1LwPzAdX0BIi7iFQKGIw
         IJm1zEHGUNW5Hpc118rBr/z0AaHgD4pfOWJACzlhK7B9fabhQwvpn5lobWJlx06Cjzb1
         bimAyiTj26S8ezFBQzFcBU3S3Xtv8vOyUJFUjm1lRLmZO9dYTW2db8tPVlIoTTfJ5XEh
         Di+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784395653; x=1785000453;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mqqux9OfCrOFCnukdDW6Dhn3g9FZWSv9acx0ZQuSvSs=;
        b=YDUBS3xGPlOshJX7QOU/Craf2dzu9K5Z5y40ZZ3h6Xyf49yvcMEsfYbfq+JoQENH61
         /PYI/LQYZBzS1koPqgGaykm0zonWpwUTIK8Cnc0Vh2ckblsYMXC9tbN3QYp9chjRPAIj
         BgI77+engNyukCa6y8plH2bsZ5igVfXByPz1wjQbj+WIpY3WPwioxGIRRq+km0Q5DxDV
         vRmP+KBnavtew7TgUgq5qHoWc9DPhtQaqCdy0NpieSv/LaRHnv05of2X+JVH6d35w/v0
         6yt2t6u8fSpbssYjahmP5M/JrSKkJm4UK2GIDXDUFjBYFuEJfu3AFJpQWBGtKnIAvGRl
         NYoA==
X-Forwarded-Encrypted: i=1; AHgh+RrMqHTswqdZFkOw8RWxwU4fr2NJn+zzjxcvB9JGCpb71JsumCw9KcoKrazAW0w0+J/QS0FOus5AvfPfD6uFYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKXvoupRwAPDt/zyY0W6pqGDNwHEO+3SlmF4mjN76F73WEHUnM
	mQn1Q0BSofUy2xqQZckVYOrcFQiRJ5Pkdy+L14mHNJ/74CqpQ7m5XuVS/8kXf6R2IZdHEU4Swpv
	CjCbMdkp/RPjzIS/7LGdqV0NxbQBiL4I=
X-Gm-Gg: AfdE7clVOPr2GNBirUHO14fs3cUPTpe0j2P7WJrSAjkk7f6i577YQN6Bh51tStJnwVM
	McH6bWr8x+7Lh0LRpK5N2l8A+MLlr562pK2Latt9SC8CVFvKADgTwA1VUGajh/EP+HQXruvU2TS
	uyE7s90RgiHKQkNqsIENIyM+g/iRFUvioYqDRNstzRQ9L9LQZsTHCYNpOC3BPjhSBn8yXHRxFPP
	DoVepY+jiRdNsp4rJKw4M0MGSoEQYlaio0OfjXDlDQf+ymPeIQu+9qy+juNTJ34rEpImW8Tr26a
	Q3EC0gdu1i9dUd1VkoxDP3O9csSXLd1/6r6teAWuCbVXZ0ZO2ynl1mBd9RxnAEUuFwSOBthma32
	98g==
X-Received: by 2002:a17:90b:3bc7:b0:36a:5438:cff4 with SMTP id
 98e67ed59e1d1-38e4b5220e0mr5847091a91.6.1784395652941; Sat, 18 Jul 2026
 10:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713225235.3243480-1-tomo@flapping.org>
In-Reply-To: <20260713225235.3243480-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 18 Jul 2026 19:27:20 +0200
X-Gm-Features: AUfX_mzIJLdIyAU-ainCKC7dEe1k3zAetrPHWsseCwTu6XTxie9v1ZXYWXcie1E
Message-ID: <CANiq72mTuwbuSba679a11_ESKz0fbcpvj98S41gyRt1EXOqZxQ@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, lossin@kernel.org, 
	lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, 
	tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 12:52=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org=
> wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> The ceiling-division idiom `(n + d - 1) / d` only produces the
> correct result when `n` is non-negative.
>
> For example, if n =3D -1000 (exactly -1us), the old code computed (-1000
> + 999) / 1000 =3D=3D 0 instead of -1.
>
> For negative n, truncating division already rounds towards positive
> infinity, so no bias is needed in that case.
>
> Fixes: fae0cdc12340 ("rust: time: Introduce Delta type")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-fixes` -- thanks everyone!

    Cc: stable@vger.kernel.org

Cheers,
Miguel
