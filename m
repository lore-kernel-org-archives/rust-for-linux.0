Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496801DDA15
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Oct 2024 20:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728333513; cv=none; b=UvRFqIXUIHjoUh5fDHhYf6AHBCC8KDf6KAQsM7aSpD6lV5fNniZfQXYBF65uohv5hUOFTmIVNks3b39okdmD2p6gMUpofMuVU7sXrRmNsL1bwJx/MKl/f8r/Utbo4RIlUzK4AmyX7MpeAV7Kgj4N2Pesbgt94Aht7HMBhPW5kwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728333513; c=relaxed/simple;
	bh=d4wxyS52GUJW5d6CslPmEp4vtduOFYtWEDX21ZZ2vLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VF6Mnt3w+MS5r+kqPLfZrOeRRHtfQcxR+NeO3IC3RQJDfhI9IwZ+7FuqrHJZpgNQXZoeeffNqu6uIt86dDR9115GtyCpgsbmAMD/EucSSW05TSyfrfKqQfeksxHBFmNfIDJA8+VQdb7mlwDNxovISugx/o+9m9BItkDxOchmqns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2DM9StJ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2DM9StJ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7cd85502a34so890420a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Oct 2024 13:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728333512; x=1728938312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4wxyS52GUJW5d6CslPmEp4vtduOFYtWEDX21ZZ2vLg=;
        b=g2DM9StJGcek1KsbFBUi93NtLq5UyI2XZtgks2JOBYiWniuHZQT8GX+A+xgeo8ca00
         yQiF65SW0vFzzblrscDU4o76Bj5V2DiiyvluM0xdIEta587MfzOj5YKhWk9oeXRi5LgD
         UauPCwIeiVmwmBOSQ0ms9YfBpWpm1fjWoUGkmuJYC7XXuRbhZ7QEB/Q4FB6xkGVziwUw
         FoBytHxeSPUj6jKlYN8HKAaDCU35jq7Cv43nEMOwJCA/5CnpTLYgsy4IsKxk2+5Zy4jk
         hWBuDnnywQqZGq8YgmGteYszt3w84gfbCvyw5Bo73o77Al3c8nh0ykHWZSe2SLpPUs2w
         CoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728333512; x=1728938312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4wxyS52GUJW5d6CslPmEp4vtduOFYtWEDX21ZZ2vLg=;
        b=GpvgWJWUnrGTkFvMRFLycb9r0BTamt7Hep8UwKFRKEJWjM9lvf6hKWX/Y6q0M+sUmo
         lMrAdPNOgEzFDEhyVHtBuVw//4LAgfJCe93khKqwpxsQ38PMa+oeNkXJsnnAJ40dctNG
         2tLPTdojfbEMRv1wEBsnn0dp5Ztci/ARTuDVujoauShqhHb8IRW34W6K4lEOeieCpXSU
         CH6YHaaYXmAblIcEIF2TehkBuF8ZeBe8UtNFK2zzypN12KgeT3Ms4bTGxNG1srlcwLEk
         pCS+PMg+Ysrsxr4HpE5sORHWVbpfD52sBm7qV++cHwXsAdZHGsCSV78t+CR2Fvt3lk0l
         a+cw==
X-Forwarded-Encrypted: i=1; AJvYcCWtU8fOjyTHUoWlQTU36fWWgP9EE4RMzQ9GvCR1uovggPa7Xc1J+Bgmh7oU+JNqbGblj8MeMCJXd8h+Zldnwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAeAgJOjooBqfFRxSleuZjVO7EFUtLjmFUwwrFGMPqatpblbv/
	A2+D1Sp08q468Dy2OoqNl578/nDnEFGArWowsjX3umgA+Cq9yzs7O402gthF8osCt6RfSLBd1cN
	eCPVpANzzkX6uhiksMOMyqqG7H9U=
X-Google-Smtp-Source: AGHT+IFos+nE3k8ObNQustVl8mJ5VEAH+44wLkHNHhM3KCslyxq/9yYZ+vBi0pYi7TEywl2iBd30HOR0uXkn+3u0wY0=
X-Received: by 2002:a05:6a20:7286:b0:1cf:4d34:637c with SMTP id
 adf61e73a8af0-1d6dfacdbbfmr9080955637.7.1728333511738; Mon, 07 Oct 2024
 13:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <BL0PR02MB4914B9B088865CF237731207E9732@BL0PR02MB4914.namprd02.prod.outlook.com>
 <4071E558-FC6E-4370-B3A8-5E2B9ED65BE0@kloenk.dev>
In-Reply-To: <4071E558-FC6E-4370-B3A8-5E2B9ED65BE0@kloenk.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Oct 2024 22:38:19 +0200
Message-ID: <CANiq72mxb1aQ42A9ffLPP7jCecnEj6O4uxpov=d2fS7OZcgA8g@mail.gmail.com>
Subject: Re: [PATCH v4] rust: optimize error type to use nonzero
To: Fiona Behrens <me@kloenk.dev>
Cc: Filipe Xavier <felipe_life@live.com>, ojeda@kernel.org, aliceryhl@google.com, 
	Benno Lossin <benno.lossin@proton.me>, gary@garyguo.net, boqun.feng@gmail.com, 
	alex.gaynor@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 6, 2024 at 12:17=E2=80=AFPM Fiona Behrens <me@kloenk.dev> wrote=
:
>
> Would it make sense to use to_errno here instead of get, should the inner=
 type ever get changed again?
> (Maybe even inline to_errno, but that would be rather out of scope for th=
is change)

I am not sure if it will change, but it sounds reasonable -- do you
want to create a "good first issue" maybe?

Cheers,
Miguel
