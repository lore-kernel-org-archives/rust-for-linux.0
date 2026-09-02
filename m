Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D96456E15
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Sep 2026 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353371; cv=pass; b=qmiwX3kAzuJisR9wdPXS0BGJaAjvqJjNT6s00IsOyY2dMki/805VfX2jLFW+kDquqcQrKCPsjhD98faDnaXkGp8qJD43hMHqRWJgcugu/t9ete4//Nvkd0+P6FUIUmi/Wnw2wgXSbL4hWJJvj3eDCd5BdvYEWPGs5Jh4W5APm1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353371; c=relaxed/simple;
	bh=rsoW3X76HTtoLNHsJ97uKw51igWW8KQkOgOnpYBVO9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEw+Iu7tZt9b4M1OwADsUIm90XJDtjls3Kmqz6VtrEgbX+syWnZ/Xm0Yf6GoHHiZvHoDv4ub6//xK3swEWit24EtgvSrfdKNUeNmoouNHyTTHn34zpCgSI9GQJqPhW/zv18pTfyLXLaLGmMeOJk9pCWDfFq3+fvF1f6cLyXBbbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=SorqoUXC; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="SorqoUXC"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66e63afda8fso974746d50.3
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Sep 2026 05:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788353369; cv=none;
        d=google.com; s=arc-20260327;
        b=gdghGHQKBZWcQvVdV0aoEV8uB5oTXU8gglj8MKKyQVEHoT534KscviEzs5veD2A8lg
         lwAFWlCXCZmNTKa9J8vHTZtlRZJN9YzmJoswLizpkbNWhxRj4GB3mz6LdCTGpg/9foba
         oMqtDhD3e0vlHYpdAKEQELj3Pb7DGifzRylhJ3klFQP1s+Y/Zmrg7V4QaXYxZdvOB0KT
         USe6bq95yZbxoF/szwIKfxBA8eDg66NLrk0nA/9v3wuEqbt9i3rkUhRYKwae0SBk5kJs
         dZKjMMabV71B3ykzg35lKSESK5GOmBcc9Z2UsWT7NFblfF4bSbsvBC6t/UbPotvuRAQ0
         w91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ch2p+1ygk+wnRbKJXKKgzdmKdBItYnqirGmE6Tp7Np4=;
        fh=xed3piQbfNETWI1dkVw6cVXBk2fbI5HRKp+VWxcQ8m8=;
        b=DLGxkXrHwlKB3PlBtv9fVD998q3dI2af3NCPKXrVEvDZoOX2HrAPyUZiprZUd1X3/y
         TP2XSfHQVLDkVnIsvuiwh2BGe/Ys/DiDJKDLPOnUpImgaU7E3T9pD1XuAU6w0BfuGlIe
         14nNS4s/TujH61DQJaJjDaOeupc20Qne61dT43FYVpkhuXBgNC2TPfooMeXG2WJfZuFU
         O00iCibBql0P+vGdhBcpamOmJk1491eNj4CyvbU/Ef7ulBXAKISKvCnTqTkgGPZLYUxx
         yi8NqbPDTq/2s2hTM2Kn07FR+8twkQiwZpAGook8Yhu+9YJ70rGCXHQAdSnik+fYSdRv
         BaSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1788353369; x=1788958169; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ch2p+1ygk+wnRbKJXKKgzdmKdBItYnqirGmE6Tp7Np4=;
        b=SorqoUXCCN3ZqsjJ67mgDjGHciXx+CHsCd7qV3ePmWxhXH+0pV1kR+6jaBzDp9LBl6
         /YgGi2UXzUpJ8+3Np9qqmQbSA0/koCB6evmfga5c3YrBXwHyUr5nfAIvIlH7UxrMDEQz
         FlKonWXeHski95s8/U6FJzNnz8U8OKwVsaSZNiuH99RlDhgJiYQXMMMpvLED7KrywClp
         vAqkEPw85ox2n74HhSlDywHNid5q+7K7Up2OXAlIS89c48oOjLHEvP4KJV2SROhP3D3/
         ncrVUXq1MzbYv261jnPgjaDWYy3wSxTwzyD2K6gPkj9Yt+d0x+R0bb7li+kLa9N/cCWe
         5hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353369; x=1788958169;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ch2p+1ygk+wnRbKJXKKgzdmKdBItYnqirGmE6Tp7Np4=;
        b=WPiYWMV62nm3FvedF70NZ5kfVmyV4Ul549m8J1jz29SudC4GsMWnsGCpR2kOnd4IXm
         q7lVlfZajMPcAyW7jVgYUYsw3uypeCBYUsWGHEBuzHq18SM124K55otMB3bV9enkIVDf
         c/UoJKbf6LcEX+mPG1NCrVsoII4azHgvsO6cmlmIbGC8M4c5/L2RHnxYbhoowA4jruQq
         +Yk0wJ/81/6cVrotFoikQiKlTHa1C3y9V8+mWUKWeLp4c0gqtHQRfVzSlS1pr/TsNJqE
         UUyeZiiy2Gb+2YJS4Z9w2+3HSmQ7vrjG4tLOVWjmJeTnQq5272DmgrqCkEHdTMi3VQ7T
         JJWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKE23+uNEq3SOvj1x8+Aqd0NRMq4+kUgscLgtzhymtLj1kAjBrYuQglbefeXZJg91SF/+Srh3IRSTaBaX1qw==@vger.kernel.org
X-Gm-Message-State: AFuF++ngyVDHnM+QhI1awkqq4f8jlz+xyE1UYw1u9eAuuN2vmY0okzea
	EamUrbGs3CKrPH6uBVfO7S4Ed9DOThT2sUXtLsYcWynMA8Rz9myZXpxYVAzBEwRgVV/BDh+U3rU
	7d0ZGtasvv4D/dbolLA856pgnBm4db7aDYZFsX3xb
X-Gm-Gg: AYBFou2AJsomLo7Kh5irO7+5EvLK7uhYCB+t9qelFId/CLvcEYBwMPxfewT7Qcu+oKU
	VhXnUar6sBBXhqKU0jLIbn6F8vRTPmoMlxpyKoLssnQh7ai54dcCLTN7Yg4mXUnerAdCZC8XWpG
	S4/vMLIGuX1qnRPdh329z7lvneZTngOEI1PAR8sUqYZXDE1wj50L67+HxedKI3EgHtoHkPmPdDk
	hUghNe639ws7v311usHhR4CsQvLGAtD4Y257Xm4Sjd157AlnbT9TXQgXslaVlJ0mWqP8MF2B0u/
	X4rA+FldrFcO8VXhLC4KwaVrNYud4n+VnZSSSZ4wb+x123Ya6RegFiQ98OaOfBGpzQg5HdTqSyK
	SeCkaiFeoHkXtecV+rNK/t5ZDDbVnjBOdNQg=
X-Received: by 2002:a05:690e:4183:b0:66e:641b:f977 with SMTP id
 956f58d0204a3-66f9bd432c7mr1311760d50.43.1788353369031; Wed, 02 Sep 2026
 05:49:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826162851.2497-1-mike@fireburn.co.uk> <PTgvpjjPiVHpV5cb5AFpiGEjRsWtsYwuSeJJ8jwp3nn0KknPmUp9oGo1V-8erfbr4OQrH0c_RPZYYJWi6yV9FA==@protonmail.internalid>
 <20260826162851.2497-3-mike@fireburn.co.uk> <87cxv31yns.fsf@kernel.org>
 <3-IkUMhanJhClxwXLNvuF1-ncsHt6uM6GRmW78t81tKgo_5IO80fRJ9HZROE5RwlmxZhufdPXswcExj5j65ejw==@protonmail.internalid>
 <CAHbf0-F-KNQu5NrFcUw1JOwaVQJq5hS+d9OHTmV3J2Pi+hfOqA@mail.gmail.com> <87ik4qxmbe.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ik4qxmbe.fsf@t14s.mail-host-address-is-not-set>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 2 Sep 2026 13:49:16 +0100
X-Gm-Features: AcwNN1UMeKIwYlojNsoDIGEbdPCP3y4LKI8D7SqcrgpBy0NLocWYKVa4ZgbLPrA
Message-ID: <CAHbf0-GfEjax+n0H5FdCdsOUBRWhqpn=SvTL1BtNysDhvgZdSw@mail.gmail.com>
Subject: Re: [PATCH 2/9] rust: hrtimer: add ArcHrTimerHandle::restart
To: a.hindborg@kernel.org, rust-for-linux@vger.kernel.org
Cc: boqun@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org, 
	lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de, 
	jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sorry, I take that back - it does have a caller, I grepped for
".restart()", vino calls it in enable_vblank:

    h.restart(Delta::from_nanos(interval));

I'd like to keep it for v4 or does expires-v2 change it? If the
concurrent-start race is fixed there I'd rather rebase onto that than
carry something that races


Mike
