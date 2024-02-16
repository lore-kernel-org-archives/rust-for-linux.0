Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AF21350C7
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Feb 2024 19:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708111786; cv=none; b=Kc/G0r2ZKiccEU/JwipYd8xxVQ9Zs2UzMqR5PxHVrFMbHyUXV1ivZF+xz1/a/vsxkxQ5lfsFouLJ1Ip8wJLxl/hHdgYUAkrftqWaB7ZvjHwEL1EREuwlreMyKCw2JQBR6xlwBW3O3t0qS2xgBF61qePAs28gJZRfxq9BXuSDebE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708111786; c=relaxed/simple;
	bh=FrQ+0G/PJXWgcIA6YJYR0gB/EcrVpQdE5ep0lBGbP8Y=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=h29ZTxxYyg6BXToeXHCTCd/92wLZOAcOt8KMUstFrY0kLENusQsSvyCrdry3u1r/xK78Gh+dMCmXEKqXqkVq0XRbhm4Z3hWMjqCuJ8mDTfUUvcc0bDDbPk4c9NsVXbKnEi4fQi8HIDgg7TN+aoPqyTmWo8tDSA71Vjff+Yc+k6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=gcY/K4KG; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="gcY/K4KG"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3db0b8b313so224658966b.0
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Feb 2024 11:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1708111780; x=1708716580; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=FrQ+0G/PJXWgcIA6YJYR0gB/EcrVpQdE5ep0lBGbP8Y=;
        b=gcY/K4KG4WADRghyJItoZtCizI4IiUb2JHpsSF24+sIqgS3/VMf9Hug32hthBakYiP
         gauWZa1femISfd85wBlG+FAVeRnCybHUmxQmn7/NmMl7HShqjZHcqatLgNorsQsOvgvL
         0COIBzFJl8BAMHWTnztdyTzwwysXN3Or2gXg0WnpIcwLS12LZ4FkXTtTYGggtUCwO/+H
         KcI/UkNOg6+UFEi6fzrxEvsrBiqpctoBjx1o4pk9rbLfKSpvJiKVNnFqZKmjocAdmw++
         TQbMLnh9AhFJaKDUw7pxqJjvKFGRIjjxE+PsYRg1VlhDu1a6tvfqeeSq+k577C0Z+dT6
         R9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708111780; x=1708716580;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrQ+0G/PJXWgcIA6YJYR0gB/EcrVpQdE5ep0lBGbP8Y=;
        b=eqdipaM3/sE0VA0kCDcjs2r/vnXPt9PhKUrleKvuyo3gLtK0YASRPqtNrYyUVWqa3+
         eOAVAM7FlwJZYsSrflZWUC6nYNwpCTzqfoYRuEzKg4HYUvGrjT55dq1SPmruLkfEeOps
         e7bYUDlfZL2P9jBlkckivDYY5G89vxte5pNYDejq3M62ukt9pkFXuWFwlTC3fAx6Caqt
         cBetvJMCiUyeEddGaQGhgAqhb3LtIepwmdhFhGhMyN8+jQxcbwdMf4gBrbbbch2XAPDj
         R1UH/zy1jfkQCgvHeZSYHjlLS+tfbJg+MZzaxZABnjfU18F+0szS3bHu+bHpmXzN/lf9
         lCEA==
X-Gm-Message-State: AOJu0Yw8ktWAIdsrWifuIb/8dc2Pab/A9rVhuj+sPDnG0y3bW7RDpaS3
	WfEWrqwOIQlmPR75O/YHV0uwvLFv0yyRJW3RNdbNhol1mNzB2AQeNXNvMa5ausc=
X-Google-Smtp-Source: AGHT+IGeuyEw36qmZ8/H2QJwTvBauwce9clSyMsEN8Klakn5r3lVNTCAHVL6ZeVHSe0V236yeHYYGA==
X-Received: by 2002:a17:906:b74e:b0:a3d:d7f1:35ff with SMTP id fx14-20020a170906b74e00b00a3dd7f135ffmr2019815ejb.55.1708111780248;
        Fri, 16 Feb 2024 11:29:40 -0800 (PST)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id un8-20020a170907cb8800b00a3df7003552sm277091ejc.32.2024.02.16.11.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 11:29:39 -0800 (PST)
References: <803d666dcd5b1f927590719c10bdd90ce2ba6dd0.camel@redhat.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Philipp Stanner <pstanner@redhat.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: RfL currently does not integrate very well with some Kconfigs
Date: Fri, 16 Feb 2024 20:25:26 +0100
In-reply-to: <803d666dcd5b1f927590719c10bdd90ce2ba6dd0.camel@redhat.com>
Message-ID: <87cyswp5ra.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Philipp Stanner <pstanner@redhat.com> writes:


<snip>

>
> Strong suspect for the cause is that this function is defined as part
> of MSI, so just activating PCI doesn't suffice.
>
> I verified that this is indeed a config problem. The entire toolchain
> is installed according to the official documentation, selecting that
> one compiler version that currently works etc.
>
> Setting PCI + MSI (and, in Hacking, Rust Hacking -> Allow unoptimized
> build-time assertations) results in a valid build.
>
>
> So, it would seem there are some "deponds on" entries missing
> somewhere.
> Is this problem known? Any plans or suggestions how to deal with it?
>
> My instinct tells me that there could be many potentially broken
> configs out there.

Thanks for reporting. I think it is fixed now.

BR Andreas

