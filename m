Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F111335564
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 10:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772360085; cv=pass; b=FLRjls0PAI736jZkLwMnGv9/AkoSer1Fz6NXrLl4Nf91rM6qmFng5o34fVPAismA+Y2IUwxEkr4PkdcKVkaIWHxmsK2UAbdbhUM8S6ts9/NYtUWZch3AglLLiEL6ySIqJztdszdzEB1fgKJX58iLtnM9Inz7FnxiXbPh4930Tn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772360085; c=relaxed/simple;
	bh=cjhzWL5snQQRFL2q+0O1SEhe7wxxXvqWru9pPmmmonQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeg4K8yM9tBd2olSjpd4AYH9VvjnlU9PHTAu3yerz605M+RckiBBl3x1fm8XFvh6o2rlCbAImugYHXFkJgPJ1vxrAefH02wCxmJHElGeAtjAjczEMvzMJjyhfKgXwXCuXUKKlHk4zI07YH5nEBbAb0oqbPn15iuFkpzUIJ6DFf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EU3mVPob; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EU3mVPob"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-124a5810e41so222903c88.3
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 02:14:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772360083; cv=none;
        d=google.com; s=arc-20240605;
        b=D58G1Kk5WBFQsEaQFOiZk1HuRzSc3AKVuq/U+gTgIu0XQAPtvg2PkTWXsA0HJzey4M
         rqOX7cbHkVeBR6eRbEAEomcHV8rAz+oyYFRsBLlxbyWbXqvHnYIranQhsf7VqQv90FqP
         Cfpt2B2FWqosrsbELjSgoqTC2f9R8IoW9Wg4BvTkMcxsKrBT+FJ9QH+ccrikZlUdjXBb
         9GuSHdosKzjFkItabzYZWLD/c7bKVnHgAmZ1vI+FfM8hiToWMtP9VhCUjH3tg/UeUzjR
         B4VLgiq6IsZR5eETsDU3Qj3bNI9kQCU8W9xDiumcXozxvGWSO23BNS2sVaLZLzxRZWX3
         vO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cjhzWL5snQQRFL2q+0O1SEhe7wxxXvqWru9pPmmmonQ=;
        fh=euPrBXQyfqmvYIK202S1KLOkhyAJLp+zJ4qi+a/zaHw=;
        b=gAJPWTbwAKF216Y+eXABJmM4AEA9YjSeqruFMRdoDTFHbfNnyQFxr9MmwlSPJ0LWOi
         8MqalThjx5BmFGRnL2oaaDZ56ov9oUXMw0jPWMcUc6EDwFshq0mDQOrQ0weyGrcn3ZyP
         hv6tqVWVz3i5XFzu/i43n4NcUIIgzZIg3RNy/ARj7KIL7L6bU0tOMeS6FBqJq7yIKPxi
         zSYJ/clLLBduJlcYsn9nLk5Fsco/Z5opcJsUEPoUXRqL7aDTAJEYeZ1RPYWDhC4yK4Al
         8Jfgs1jSiEwJMOFYEob/Ktvz8cIPJ+4ImvY2Tzcr5nz3AX6F+/X2LjrfbqBuvDtOtuJi
         5Hvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772360083; x=1772964883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjhzWL5snQQRFL2q+0O1SEhe7wxxXvqWru9pPmmmonQ=;
        b=EU3mVPobyNztLU0bvCxiC4uOindkBTwzcybInpFt/twtUFUtJPu/F0v7yGWsCSNlcf
         TliW70KncYpqwGEOormfk0MvWutzy2K9F0LPbDCCPNELxq6IExaArngq8XZ1ulpI6ukh
         qtaFTq50k13LHOUoq7j8Xs8soPuLtxFGbEN8L9zfjTahfUltuRpY+2AAse9/KZ4j2soC
         VUHxMaJJJgnOWJ1itaFZcNI3QDgYS9FslfO0axYiPhJrWZh3ue8riaGcJx1aZS/d7rVc
         DUkI63JCVADBOkZLGYvnW/mPH/6Al40Plefu8lahNwNCOu+wps66bF2Jz1vaL9XbibUx
         9gGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772360083; x=1772964883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cjhzWL5snQQRFL2q+0O1SEhe7wxxXvqWru9pPmmmonQ=;
        b=u9w+z8zZFpyVjDiukSoGhx3cQPZW7rtnAiisTb0+g9x33JiFOv05BmbOwkJ0bjYFQ9
         Gyih8+7/z7dGE1eLu4py7BVJ8uaMcPdBsESlBG2rP2gNr33PC2ptiy2E+zQxExv8Y8en
         wUW6iJMlqyFe60PeMah6YD8mMnwzZmSi5tT6jb2kDkLbuEwaykQ0vTzg3nfRcvhFDLlo
         apAKf1rtO2uF7xXp7gwkie2haUeninydqOd8j3uQPlJUDSB+y6vjoUEo23j4J3q7BW1p
         U978AjrOSgkaKZ+dv7aq3QknSixYgfLg5Kp4AyIVzreSbQ/qG+o1EwLEozoEyfX5qf4X
         p7Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVqlpS8IhWHsXMKHfXuvymlU7NaBSOsworE0wrJ6s2xicXNVFdhNQ4rwfZHEtliV4Ge75NG3QN6o4tM5TLOOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcW+O5cAhI+nrAyxGGGC5jeVsVJ9PrRxPfOGlaIOi+bSzjUX8p
	/cVYBNlfzT3l+jFGMWRrhwEA5G5tOfefZyV2/wdoo+zzY+4IbC2jZJGo1utEpdBmFg1GyQpMDAz
	66Ud/AD5rsnmBBw34VGGsyIHQ2UGUFy4=
X-Gm-Gg: ATEYQzyzHLveRCbwKXPveka8N86YUwuiuwBpvW7i0xiX7mcCrls/sBD9Y3jc6UwI693
	m3gN2VQpGNOj+0pPgw0ILVLy5eOW5o/UwClUQIoRFBM+UUKWH0gvAdQrfujE/eYqD//svoMJ1MF
	peuHS0+xlUvghza5kxSxVGS5NVGTzni9U5+r5Q/W+AytkwW2N8ZBWum6Vz5h7VeTvahPLgylt8E
	s/NH//AyUt/kM/v+Ti3iIdznyJ1obYrFPPcsio6ql+CeReSWUTyao0t3V73GVy1ag6fG4yyw1L3
	I+gkpgJPtmZ95jjnHH0AsKtXfIChUfxj+e7ILLWgO7kWqFMBsBAPr7qi6elWNekcnQnNiWAY1xq
	sFX8WNBaw1qtowBJw5chXENz/tOOq
X-Received: by 2002:a05:7301:169b:b0:2bd:dd46:7a55 with SMTP id
 5a478bee46e88-2bde1b29395mr1334733eec.2.1772360083179; Sun, 01 Mar 2026
 02:14:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301020433.1733030-1-sashal@kernel.org>
In-Reply-To: <20260301020433.1733030-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 11:14:29 +0100
X-Gm-Features: AaiRm50Hlf9gIQfF7fQuV2aKb_-jNfTn1wuMZssAzS5fSsnh7bRKgXAfVYcviPc
Message-ID: <CANiq72m0pCdR3dijUiK2Qt-NDV7K-UMcu-HEakPh32otoGMevA@mail.gmail.com>
Subject: Re: FAILED: Patch "rust: kbuild: pass `-Zunstable-options` for Rust
 1.95.0" failed to apply to 5.10-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, ojeda@kernel.org, David Wood <david@davidtw.co>, 
	Wesley Wiser <wwiser@gmail.com>, Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 3:04=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 5.10-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.

There is no Rust in 5.10.y, so this is fine:

> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).

Cheers,
Miguel
