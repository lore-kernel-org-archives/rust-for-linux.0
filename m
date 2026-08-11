Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26828442FB6
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 14:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786459419; cv=none; b=I+jc1vkF4XkIUC/i67bDMHFD0wjEHDisOkgo43ErY/TWC5IdTBQ200J3V1OdG1r7xHLtN8j8z6m/G3SZID2oZGidBOanSODyEhRm6KbW3eUR4eil7WEk1wCKss7oSwaTs1QQSLpEYTFfpH0G5tW+NEEr3ZgPNp6xg8b4C2na3q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786459419; c=relaxed/simple;
	bh=1P9l62yx7Nzv3bIICI1uduDZAxBz+2R2qseDQnTY1Dc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IQu6XKW3df9g/7pzYO9TTZaIuriRhbV0E3DOniCl5O4e1Kb0MM+xXRwFT45xGj4lttSu/e1be2xEqf62Cfpy7OzpWJX4jGOdxnA594pVweshxZj3T9obzpm+rGZdNMptcI9xorxtiA0dLG3+D1uDFBtWJuTJZ9DNecPzCsvImT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YySpyG+1; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YySpyG+1"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81e8fa1b8d6so42003807b3.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 07:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786459416; x=1787064216; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lhr48ORyh4YoiC1XBSoZDdeizVPdbIlhjfg7vaMIrKA=;
        b=YySpyG+1QEcz7DbOX2nr+KoWpfWCCS6OAJbRNdsQHuv4/Oz3WDj94RiZy+p/m1sXcn
         q+jrE+ly83G8SGTyvFIy8sxd8OeTd+RyKh7i9bZwFTbRUaW57miGC+lukgMtZWRDBQhL
         zzLTaWRB/ZoShZY+9ax5tMHPwdDiC8BQlLmP67KDp+igawnDeofcRhOP/bCeORrfyx1A
         QWK0VAKCv43pMAr1lvjZcWnQGbJ+Cvlu+gWatULUcVp+i/5Y+HYy1q6tjj4iDFOh2+uw
         1MGJASJTqm1DvvoV14wlEl1sNsehccWQaYDNkHT7VC2vuZdNX7LqYyUnfbf2St0dckWs
         AD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786459416; x=1787064216;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhr48ORyh4YoiC1XBSoZDdeizVPdbIlhjfg7vaMIrKA=;
        b=kARdhsyQAWoSTxf5tUPM3ItHUQSolQCjHgMgtKuRpM+QxIPSVDv0p/vzbjwTvEmLou
         sXhA3hbeT3RYIf5gIHdgBa56YdoxOs6I49BW/S4RJruKecG6rr8ZaQaYyi2TfV9bOfnC
         bMxAOGUqshigkss2AWlj12yNja7g8ow/0RPvQB1iXct9NMlyMAVzC3bDW7Q/v9abXhJz
         Y4Ik5/WYzcS9IsuNFvXbZMX3NjvZi+mMGM84OVtHWaMP4IXzGq+2Wv5AxZM2TPk/SY2y
         fLUbRV8Svl9Ym8gf6nMU/jBktCcqQu8whP548Vvg+RhNlUOoGc2uhJYd+QpEc/9cdWrI
         e2pA==
X-Forwarded-Encrypted: i=1; AHgh+RrZu7Lm56obJxjYdUj0uNyV4r7iZkn6eE6VxsAorQWeVcfayvi2VWUtilSFzONNlLnRLDK4dHF520OJYr3Kdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoc8dgcJKBTVPkwL4t1iTD0hp7A6LvXc1GFUaNCn10oE7tJ2cD
	FBxZvxOdx/YuQrL/vT/B1vvcCa+V1y4/vp1fChm1nHg1HuvFWkZ3nUg=
X-Gm-Gg: AR+sD11EZY4moNW2HIap1FKlsZwUZgJvFgMsK3zVncS9XAzPhbnKMtTN2x0wTN6r/36
	JaIK0eC5CfyHfBAYovQYEePyimGLRfsYI76HGNJ3r0ntOVpN2e2iQA0p6NAKdwhKzFsxEjz/IHx
	QvVE7PhsaSS54fidjNOFv6LvfAHt4WSOFFtHUquLJphjAnKBoB3MZr6AK8okv8t/f6tPRzzKj31
	VpsqSPmgcmYzWTF0kotQKoAwc5T0wMlP07IB2rHhXY3BOv3FUR9293TdZY0tMO5o/AM+qD2kedv
	dZ5jcDoUuXHLYeisliuPOC1/6aExb0OaTG3Nb9fHM3Ln/ORr5t+4/jYsRe/oFp81LNDwb268i1A
	bdzygiXjftNivq/DFcsez+b2sP/1L/SdFYSm9BjU6L0vLN7YlC0nlt/Kjumrk16pzmx8ffkeGaC
	Ih9z+ak9bwN1tFQfB2APE+enAH2OgWVp4bRZ3ycFIciir1goY2cYF9h1V9/9ChoIGo/fYQwfm3j
	9zx70Z7oOvZkmMQ7rgqpAan
X-Received: by 2002:a05:690c:9e:b0:7bd:cf35:e33b with SMTP id 00721157ae682-82f2cd0550cmr25224097b3.17.1786459416049;
        Tue, 11 Aug 2026 07:43:36 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-82eb5fb7a22sm11871067b3.0.2026.08.11.07.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 07:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 11:43:29 -0300
Message-Id: <DKM70AZE2094.3397PWQQ3TC3@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel-mentees@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Sashiko"
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH] rust: i2c: avoid locking when calling
 I2cAdapter::inc_ref
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Igor Korotin" <igor.korotin@linux.dev>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.20.0
References: <20260615201141.8920-1-nico.antinori.7@gmail.com>
 <DJBDWVUWH3OT.1GDEIJT0R4UTK@garyguo.net>
 <DJCA8F2F93US.1KMA54SKQ364K@gmail.com>
 <DJRJCCGCXYOL.2O4HP9N37SPAK@gmail.com>
 <178628144572.5226.7072490581990266256@linux.dev>
In-Reply-To: <178628144572.5226.7072490581990266256@linux.dev>

On Sun Aug 9, 2026 at 10:17 AM -03, Igor Korotin wrote:
> Hello Nicol=C3=A1s
>
> Sorry for the delay.
>
> Yes, worth fixing regardless of real users -- inc_ref taking a lock it
> doesn't need is a real bug, not speculative work.
>
> Instead of adding a separate Rust-only wrapper, please consider splitting
> i2c_get_adapter itself: pull the increment into a helper, export it, and
> call it directly from inc_ref -- no lock, no lookup:
>
> +bool __i2c_adapter_get(struct i2c_adapter *adapter)
> +{
> +	if (try_module_get(adapter->owner)) {
> +		get_device(&adapter->dev);
> +		return true;
> +	}
> +	return false;
> +}
> +EXPORT_SYMBOL(__i2c_adapter_get);
> +
>  struct i2c_adapter *i2c_get_adapter(int nr)
>  {
>  	struct i2c_adapter *adapter;
>
>  	mutex_lock(&core_lock);
>  	adapter =3D idr_find(&i2c_adapter_idr, nr);
> -	if (!adapter)
> -		goto exit;
> -
> -	if (try_module_get(adapter->owner))
> -		get_device(&adapter->dev);
> -	else
> +	if (adapter && !__i2c_adapter_get(adapter))
>  		adapter =3D NULL;
> -
> - exit:
>  	mutex_unlock(&core_lock);
>  	return adapter;
>  }
>  EXPORT_SYMBOL(i2c_get_adapter);

Excellent! Thank you for this suggestion and the explanation!

>
> Heads up for v2: Trevor Chan has a patch changing AlwaysRefCounted::inc_r=
ef
> to an associated function (fn inc_ref(obj: &Self)). Not merged yet --
> rebase onto it if it lands first.

I think it is better to wait until Trevor Chan's patch gets merged since
it is in v7 [1] and already has been reviewed by some mantainers. If I send=
=20
this fix and gets merged first he will probably have conflicts and have
to send a v8.

I'll keep an eye on the progress of that patch and once it is merged I
am going to send this fix.

Thank you,
Nicol=C3=A1s

[1] https://lore.kernel.org/rust-for-linux/20260628100731.64885-1-trev@trev=
rosa.dev/T/#u
