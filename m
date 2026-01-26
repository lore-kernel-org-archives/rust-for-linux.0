Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC181155757
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439347; cv=pass; b=mR61qHmSngc5Tv/FC7iRVLmpLopQBCtp8etUF+2B7w+LJs2WouEo7CagzwKiLWeN1sr0vxPOIom69wplY/UeeT82jNDERrtylBVy7uVkybYDqwEon0W21LQkhdNgzZb3nZHoQ4bXP5p439VOvC9q0AfBKipG20n7QxfcP/O30jM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439347; c=relaxed/simple;
	bh=yDXkwbLoe0JpbaEGdkx/WtBIU7zcYcugQgQQ6ja6C9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pmnC6zyox4GA3bGhH4snYJSqQkZ5W08e6Lnmu3V80qT4wijTBGqZ78jzeM8iny6kBfY7zoK6d5S52/1kIcX+x5zxGsxaFrxaQC3Tb8Yb6MwLX+pWqcAMcJuXs+275SEvpJ+r/mhjSMKgXr6mp6R54gqJ7cz8wua60DJsV8yT3Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoDmaGBv; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoDmaGBv"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1244bce2c17so348278c88.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 06:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769439345; cv=none;
        d=google.com; s=arc-20240605;
        b=IDT0dijv4eXaoHaxYHdGXXczPONwTTGVQJ5AxlTj0Ys9bNwEAXA5Hab4P5HgRzPBD1
         VLr++HjPJkfOf70IBnaj0rU/ccNYK8kI3X5TzFQ2jxz+TGgAbVwRzq43GrVWM0pkDFj2
         K4exwKic2gtdvy1PqnUWCZV24MGePCYT04vSyhr+H3mb16or3/PVA6Tpkj8ZV9cx/KDa
         LZZkp01G1intBTNlEhGYB1jW9H2txvIT4HuvjFy6sAGTuBI6bkdXXQSU1p3KZgQN6yDP
         U8S4Es2kOvcx3KM5jaxH6ToV/fVReg2sk6bomT4s9S4kahrwiD45U/JEYoQIsYGYV1vr
         E+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yDXkwbLoe0JpbaEGdkx/WtBIU7zcYcugQgQQ6ja6C9I=;
        fh=vjwgKSkrWL6oES3Yf6vBr4LB+LRSFeLTOi/vF0VkiRI=;
        b=JPUcHqyEQEII5nqsxp5Zg32BZkvkZTthxLoOCRI9Jivf+PJ5sc9QIWZ2riZKHBDQLB
         2aI01Jw+W2mHfp546C3pzfnykxfftoGi66cyGMgeRpMt2fPdN9HrHiPljRJZ3MF9O5pe
         MSD8Sjaxzv8cET3Pl8ya7Gq4IyH4Oe7pU3gWksO7zPDpK1dmzi0Pc7frpgjUiGADLlq0
         pfWQb5Tup1VUMkD2Mhwy/WRWC/kxn/xCtbDV41JeExUjbfHaj9ZddeyfpLVpnPAhqEYK
         y6M2NBWqXGB4KLTB4EJDUW0U+Bb5f0mIWmU4LZlG8AYGwNFSv+ht5UOoITU6Rgd0COs4
         wJkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439345; x=1770044145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDXkwbLoe0JpbaEGdkx/WtBIU7zcYcugQgQQ6ja6C9I=;
        b=CoDmaGBvr2E01/eohu/sfB3p/zsf1+no7S/WL6fw2s3NS7BD9VSlAvtJzCXLG/M5Xc
         hWVQ2OfPz45kl8Q+aQ3B2n9VcGD3otrhAc8PSKqEg5k3Hs51nCBgv3PK72gnRDet0ZBX
         DGfFOo7X3Tigq8PCfnrRW1IjdFSr7L6AkEBRBGK36n1wfGmt+2SAE9Tdk1/0QULDAXxE
         SBdWy7XgEIaANmaeYDZGq45uCRxeUKD3zVLDXZ3jIlw6mXVfZ5ZdwCteSbbV8/yFOEfd
         O718vdCEqMVbRkTApsm783sIYdW1V9IuSmsiBPpcHZ2/i9JpN2eoRQ8JwAxpVP1XYLgh
         RY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439345; x=1770044145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yDXkwbLoe0JpbaEGdkx/WtBIU7zcYcugQgQQ6ja6C9I=;
        b=GYSRMQHpIPcFkn3fL8Yp/6iwvhyO838vub7kpfuACgrVLPmd4uBk732C9qxWs/Uogg
         IvCJgb9u0Vk26k7GM7E3uV89Ot2cxTzSS0osDDWmxVZiGAjdc0gLNP7D93hhOnxFJmqF
         zOe6EN9h4E9zxt8t7L4fAkzcZiXyU7dx0J5sMGbbe1r4OHmq/Oq5QCIOG4iAYBkNbnWM
         sAA3bRkqm7xiBmXM6bxPrjmq4GqlVbot+8iySsHDEcvomzRp+aOHwIdtjaI1rQvwRHsF
         gqCFkso8XG/AKgsin8brdalrLmhWCMvR9LLulz6JP+entRX7NH6AhlbIbexW3I6KjFLb
         NSnA==
X-Forwarded-Encrypted: i=1; AJvYcCWX/qKC4ktWuPsp4Ud92WFbH5XVTVSkbQz4WTBcQwPN4Heh8umMtQmiPR66DNtOoyAqAS0V9lA4uqQcHEUsmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEAP1XOQESEo+1RPou9hp7y9x55EhIxQEd/HWRbf+YXIxBc67D
	sGdv9N+rpEEv3UMY/WgBnMJmZ5yglqFRaP+topnOSoJzjZdc9wHztnkjk4YRv8PaFP6YSv5DW1k
	g+PLcEUVNkv9b8nBeVEWudHhuJepupxpTQ9vP
X-Gm-Gg: AZuq6aJqKpVmPXZKoTb4xuqadjwqRwDgRV8bf47LUgFQVsAoO3SrFS0rHZVR8ympiSD
	Ih2pQPoqe9SL0STlYDQbCeg3uVXBGf2KQWH5i4NRqB/plsQ7nawHIP5NLmpoEo/RijCPEe8EGtd
	SSFc4jTKaImEIr4co6FHiR58lAfaGeou/tGWvi7LvKu05+8mGmc2ZL/qt7C6+/+Re/1Cz3/QVbd
	Q+Q2Sxz3K4JwC6XOF+61lycRHoFI3nv5MqhOl5X+r3BnYPYBXhLhBW+ogkMCUlNfU1OEnP7/Xmd
	gzzP7+Uye8xp8ofv9z9WkE2tPOkv+9Tgk2Tmv7IBo5M1Uj276uNVVmNpqUMZh6/ngwErdtYyz2Y
	k144kpQvWZDHJ
X-Received: by 2002:a05:7022:7e08:b0:119:e56a:4fff with SMTP id
 a92af1059eb24-1248ec94400mr915655c88.4.1769439345081; Mon, 26 Jan 2026
 06:55:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-tamird-kernel-org-v1-1-b390d329b0b9@kernel.org>
In-Reply-To: <20260126-tamird-kernel-org-v1-1-b390d329b0b9@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 15:55:32 +0100
X-Gm-Features: AZwV_Qinpad6s8L9nt5NJB2kGMookRYNBQgAhs214sY05Ab3Xj6c8JRCKsBo2bA
Message-ID: <CANiq72kESpKLdtAUj7rH5vCgKKgFMP2GihB2tWBZcuMW46Y4FQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: mailmap: update Tamir Duberstein's email address
To: Tamir Duberstein <tamird@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 3:46=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Update Tamir Duberstein's email address to `@kernel.org`.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Thanks for sending the update -- I can pick it up so that it goes in
this cycle and so that it is nearer the other `MAINTAINERS` update in
`rust-next`.

Cheers,
Miguel
