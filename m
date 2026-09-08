Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0725632AF
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882410; cv=pass; b=LIFXE9PNOju4M1VA459vnw4tDHmSZbHDOnacHCb1MyRS9oTrT9qWP+jVVjqkQIvYM5h2dFrXGT955yTu7b8XYj4b8ROWGpq8f0iSbLbj3aBebut/QuFCEZYH63tW6OIV/3OaYsWkz2kH3diFXK022FFzYSMQN39adDvJgjiKpI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882410; c=relaxed/simple;
	bh=WDHmQZuMHbf5qYqxvV/utcQu5YS7zXBqPLQhJFSMwks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCjtmD0cCt1zrVtDd8WSxVVm9ieOdn9Ipj01gjm6r+sLBXK8HvzbIUstzdxPvlS5J5YcyeZTU8Feadmkyo8+YadknRP7KC17v8E/vRIuwH7IcWTTG2b98A7/xHA+HkJ2La+FfZOaeScnp6OiJMw7+W4YuT2ybPal13rwpJEz2Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V33dWjqg; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V33dWjqg"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad861b1so673459a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 08:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788882408; cv=none;
        d=google.com; s=arc-20260327;
        b=c/dJdw9M4eclHmFJNocBdNozvKMP9s9B3WgpeO/x1mMGWBsmpLTgxXUc9EPJfvIQR0
         oBbRN5w7CJz8sc6y1Ru68LIDAZ8XIwn4TBRmugPEuHBYVlXjXzNxPEyIU5kCRiOqC3rG
         taZPPhwIh96WbogH9KJSzDa+VV7G4AYAcVhkqPLR4mcpjFY92BGiX1BN0NbnODWabtMy
         0DNR0ZEC0usMzdmie7sdgGGzkBgl070kN1Z4WAdkdZ870n2d2d5HlIpVEgLsJqADjEVm
         19gvXHuM+IV+vNpuUUr97QME7AJ3skXdS0E4nJob0TC3nZVE6PcCSirDnRUcE7MFssYX
         ZfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WDHmQZuMHbf5qYqxvV/utcQu5YS7zXBqPLQhJFSMwks=;
        fh=T2XV+37ig/TPSHpgengJ1nw/MdGCr1QuJW7N7OFA2+8=;
        b=Tqpp4yyTF/RIjdw3pE5YwSibjjJGxwxHmsNcQwtiZL5siCmWAEf0VVTMa9kFjsP5Ic
         OuocDLr2TLDqAF7y/ODfgilAbXqaym93PtVRl6BVxRZRtj2ukf01MeEfGI7jSYTvPyik
         jOyIDqrjFCkAfW1avz5Vnv8wUgt7Yo20QYF1/Tak1aPymp+Qe20pzawWgIYTXcVNaauV
         saqKDHGeRxY5APcn/Sf5DLVzo940T6nqdDRC/x+OYqQvMSUYG11Gm0ZgFXMZ1deO+mj5
         zWQt+E+Dg65ERHzdjuyPBriXsHpfe5B+9s6bPl2sBuItb45ZBT5oU5mVSp4pf1xHwj2i
         514A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788882408; x=1789487208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WDHmQZuMHbf5qYqxvV/utcQu5YS7zXBqPLQhJFSMwks=;
        b=V33dWjqgqonodEsVOrgcPFV9kxRX6VCt4J3XRIcKlrclVTKZuiKXT8X0PGCOM4PD3J
         q8ejc6U5ijSHZLRkva4CLm/wMHE0qxQXOqC5mzAXSL9gsKndijMhFUBOi2hEyHXGnXrg
         k+3sVjwjPmPe++2yGMtMOCR/zb5j5/tsk4uAN/9JXjWTG4bfZDO4K+QR4CK/PCu8DPNt
         1K0AmbkxeSx4g5TfzbM3yRB7pKDRDLhiES2l+4IiTvFsmFxcS1qY92ucYpSDiHLyiw2B
         zU/c4wXLv9XXaiLe8lI4OeZ8jj/ZfKsi7OPY2LMSL7X51QhCBz73uZgWCQ5buJ37zT1c
         qqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882408; x=1789487208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WDHmQZuMHbf5qYqxvV/utcQu5YS7zXBqPLQhJFSMwks=;
        b=G8c2wKmxghtWUiGUax/3FbdG1jd4QS8t3kKvvenXbiDDDPcmDP8sXTecm3GOdTDt3U
         sNC4wksqpI9R66v+pNX66Wf5rGG9El3mVp44ELXmEYe9AQePxWRNk1y9B6bYKRxAVfjr
         OYrs3jnK2Qs/pGPdzbNjzW75oGZgqXMVPP0e3WSRDSJxCsuEn4eRM1TN3Kgd4Afo0axp
         s9HQFnp9f+XRfPcHjNaN9eYvmBm/zPRsz32VyspNZeXUh+oajgvkn/SXdi9Q2tJUwHme
         9JJipgjWLXXFmDEsrpoX8+97mO9bWEpyllA46oZmvVApKnUrCrSOo5yEeB71wcozpwrK
         Wt1g==
X-Forwarded-Encrypted: i=1; AKwUvBx4l01pMaGu7rXSZtv7d/Z6ISRYUn6fsRohBxMZ970iG8cDKOt22VgD7C9+hQVSzP4340BTE3Zo3RXWdTM/RQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lMEZawWwjVmZOa9lP5KiiZX1CgcrLYH2NQ2raH5kCSNjuO111r
	okvaFriNLxCZlduJfgRFPpb0KFihtiUi7FtuGEKIR5+yE9jzwkHNSW1aeG3Y89HgxHhudnBDVMk
	nBO27n7w0rByFVlCtvEp/WWp2zTE2XqI=
X-Gm-Gg: AYBFou1cpmFVxKALPvgvQsPt/aQlkh02RiP+FsHNKEc3cGi88cR3Mo+ByT0Xf0XJiwl
	KL5S/PZ8BhrgDd6tI8HhhZYKo5R6n6EtJlSLG3zlZohk7H4XqjHZGVTRal7Qehsl4VhnQU9i2WO
	g7h4McrnPyxsfBLWxJK/ZnUD1dmnGkHMEhRnnFqW+7Tq8kOVylsyb4w0FUahOL6bGUs135Eaydf
	wNQrej1mKs5bhQDmpp+m4QMcry/JC4kk6DYSlXCpkD3gqjZzPBzTHrPxbGIS6n4mwylV9AgBDsj
	5lXd4yvxGZN9O2dFMqQatQjb82vg7FlSr6jNEc1Zyy+GLTu6pwKhQuTW5xA3TC4xVBzFObVD/Ur
	0AE/tGjvKfrNtQhE/lPlYlOLsMXR5RApVJt6O+U4+LBykd4LJyHRQLei7+qBm
X-Received: by 2002:a17:90b:498c:b0:398:a2e4:c784 with SMTP id
 98e67ed59e1d1-39b3d5c4449mr20100311a91.1.1788882408145; Tue, 08 Sep 2026
 08:46:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4da62a4b-c4ef-492a-9a27-b56bd4784acf@suse.de> <1b3d0eb2-9e9a-4d4e-b8c0-ff966033ef03@leemhuis.info>
In-Reply-To: <1b3d0eb2-9e9a-4d4e-b8c0-ff966033ef03@leemhuis.info>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 17:46:30 +0200
X-Gm-Features: AcwNN1UZy9klDHYXIQdjFGVCMKJTy69JyKumGJIN9nRq9tK-al_paSfA5ZANsw8
Message-ID: <CANiq72mUW5d1dOQDgpYjuKoUaZAi-im7j3v30Wd4KTDznmM9zw@mail.gmail.com>
Subject: Re: rust: Build error in DRM bindings
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:RUST:Keyword:b(?i:rust)b" <rust-for-linux@vger.kernel.org>, Mukul Joshi <mukul.joshi@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 5:35=E2=80=AFPM Thorsten Leemhuis <linux@leemhuis.in=
fo> wrote:
>
> And I already wondered if I'm the only one that is running into this, as
> I reported this a few days ago already. Pseudo-patch to work around this
> can be found here:

You are definitely not the only one! I have been seen it in my CI too
-- I didn't reply here or there because I had already seen the other
replies in the other thread and I expected it to be folded or dropped
the next day or so.

But, yeah, it is painful to have it in linux-next.

Cheers,
Miguel
