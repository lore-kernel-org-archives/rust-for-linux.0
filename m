Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E522264A3
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769442324; cv=pass; b=nAeAYImb79WyMmhnZm93H6IbRsfwGeHMYtLaL4SLwseAxiyd80bk0WKttReDtgzeX2ufiiav9dPp+amuMVTtEg4lnj9953snfuS4x/2FDRA0SPniu5fpGeit3Mu5nHPFNk7uKvjHakEDwiwYeLwhKFpEErxdNE4CvIQKTIkUrWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769442324; c=relaxed/simple;
	bh=CP9nzGn1t1oOd4RwbuiYCB9iG1Ep+MUm6VrTXkq7Pm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sokR9oalkDJwhvIPKvE09x6FgoKONa4gl0Hvgt/NGShePcoLnrUEXaRnic//3ZEUdNTq7zACVVKu5XKiBfD9BDg7EJS2i7izN+P5tUAH9m909KSJhKNgKOWvg5bHS8SL2YL5mDvnW/Z0LL2EDweifxhZcNyxldCx9liYHroDKFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IgvmHtjJ; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IgvmHtjJ"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59dcdf60427so5486493e87.3
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 07:45:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769442321; cv=none;
        d=google.com; s=arc-20240605;
        b=EKAIPyhPeyXI3lB2wHuEnWjxMIIi7TXvC6EFJ0iki7CP9AvAPqbnMhJ7N79ks4RrDD
         Zlu9dZi8zA7UWt8cQaNelpmbQ5VsWu32YilMOwpyhG2ySMdbRBPRt1sgpX3l0dT9nnpA
         YaWIcPibNlZtBK7Q+MXk+57ZrI5Qdqumj4FJfI9qje70QQ9CXqUVJohrPfWApjm5p5rn
         hECS3ER0AsjtD93bu8RtG7pHLff7f9mEQ3tXUXjq10++jCexk3wG0tMbrThDnezLRoD8
         AEKsg544BN9geGAcwO47JFixTCo5QeojjYkVojo+IoXkBeukqdEO0lybiChHJwHILKtf
         v/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CP9nzGn1t1oOd4RwbuiYCB9iG1Ep+MUm6VrTXkq7Pm0=;
        fh=c1yBtRYuvjsR6YU6dmlaDuVnJG+mZrvP9fiMdlSNsgk=;
        b=V7gVtqQF4kF3xLulPZsN5VH/0/llBoxPA5rm2MeqB7eCsnwPs/zL/uv2QYmgsZHob7
         EU91E9iugT5rHmunXF6o6X6xed+IfmJjCkYBSf8IAKyakKGUWZWgnPQUnu7YJ0+4+DBZ
         5zWbVi9cSEdD63auWY720W7h5aU1IvWI5vA3/2wWNPnXzBXcWuZnm277PZSD9s1yztc0
         1bXEGyr00M+NbfC1oyWJbAbFPa2BW33qqS/E9TzzdAX4EnN1YU0EhL5BwSwXM/SFq6I8
         lQ0PoHhlbpFq1W1oNKNPb+btzVLIzOp/tbjyaKOVrT56SDEFRlfcNAKR5XpFyYYAorED
         5gKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769442321; x=1770047121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CP9nzGn1t1oOd4RwbuiYCB9iG1Ep+MUm6VrTXkq7Pm0=;
        b=IgvmHtjJpnmSKC5/weQ8smXIRHvaR2H6xsHO+OOLfKn8cyg0G9LYdzYSgPweSXwbjM
         sssuL2AG+scTA6zl35sGO6tWFOMxZ9jnbgEq8fUMjRd0vJHDuMCAxD3TS9he6AKWn8+0
         xSmQIJcqykAAHCr4/l64N6tB9Hp0CYtGHwSGGK70Dlv5HS60XaIOFlZ8ctvH3ioGDnrA
         6VNQyVlQsKu3mgA7g6aNPZISdy0qiwNjW898gVMnHaEmsx+8cFy27yi5GpGx70ukr2Dx
         9Xi6mk1JP02T365zPMxz3W/XfBGi5TBvfHZMZC6/KdxB8QQWaSnZRE/hoDiVL6LZ0Zw+
         /mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769442321; x=1770047121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CP9nzGn1t1oOd4RwbuiYCB9iG1Ep+MUm6VrTXkq7Pm0=;
        b=CmVN9E+K1eXNa2I3NUnlufdUWAj8ytGGSg32NBjG3yApwK7oRPVQRdqCohYiuAPi3l
         ObXccqmD4lTHBzdM/8IthHZImr8SnC64Epdt5JhPALQRNOJg0eKbCvZbBUrdT1HTbiZ/
         bYMxqt11TLP/kNEh3ZXgPev4joIEr/EQ7FMC+3a5DnX5C5Xxond/aMKCFeva9wQ27zgt
         xNmhyzzV16641oBMtwMC19sFrDetNRw50aQtnGLDsxk1r8g/wYEkpdHFv6bWWrwZLSpU
         Wc4i+empaMksKYi6fD5XHRiXwT6is16G/Snu7xGP/Pnm8AXOO5BXmprWrJdTPKpuJIv6
         1o0g==
X-Forwarded-Encrypted: i=1; AJvYcCUZbtnamPS03GYAhB98DJ7kDVmPo28SInK72n+AwOiB3OSRtEYrwtNUXiZO7Ht8kmeJWafmBPUmul5TtZ1BPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwnEJA/J6y34zo77qWQsgP8FbtUX7SN1oUhnl77uw0UEYulhvO
	T++cVl9qHFS6PyrK3Z1U8XNU2Fr1HaH+53Ur5wTHy3rikSx4Qo3/AoP/cZefZXwOmJf3VCbhHao
	plj8u21uiDJBWPUkkjVxy9ftMp3GgvNCjQlLr2vO2cA==
X-Gm-Gg: AZuq6aJZnnKWOmfjtnv3HTK6n/8ODgB7YEdSgepuFrpxuHrd1tiHzBtSuSVnKTZ3oSP
	31+WpK0IIL5JHtoccvpxCaDEQXXq59ECe3t4C74Nf04bF6qWF1tQOOlPIMt4T+k9cQzQcaZFUdJ
	NAAJ2UOUE1kTzfNPLXjCsHlyyPofQef++LvjwliJ0WqzE1Xb3LrYSd3m2EN6Cni8fjDYsSfAAa+
	T6s/Fgrvk4GWBj0PmmZhVMZsaHDaCWrg980AUhAbLKNUtP/oqa0+Hm9FrDXJxLVnU4WowoKUyFm
	vCV6nmTGF/nnQhQDjTLP7yF1Ib9A
X-Received: by 2002:a05:6512:3e18:b0:59d:eb3f:fac7 with SMTP id
 2adb3069b0e04-59df3a821aemr1786755e87.45.1769442320792; Mon, 26 Jan 2026
 07:45:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008151554.340806-1-marco.crivellari@suse.com>
 <20251008151554.340806-3-marco.crivellari@suse.com> <aOaJlHEPzHcAdcUx@tardis-2.local>
 <aOeZ3ho6SHjmaw_2@google.com> <CAAofZF76TADGfF36gMV7qpZCHpXUYY+aOi_mFwrE6UrnkkQKXg@mail.gmail.com>
 <aWS5Yg9xScOR51Q1@google.com> <CAAofZF58s-q4WxOFYk1K29x+ceiX7rjFuNo498VVqL5AZckkNw@mail.gmail.com>
 <CAH5fLggwRc51eVHAtKO-nUNKJt98PpMOGq2Nrnivh047AGPMaQ@mail.gmail.com>
In-Reply-To: <CAH5fLggwRc51eVHAtKO-nUNKJt98PpMOGq2Nrnivh047AGPMaQ@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 26 Jan 2026 16:45:09 +0100
X-Gm-Features: AZwV_QiRCSICekXcZIXI4O02K95Hrd8s4q9oNSeL2D2WidwA5XK8uyS1hZatbYo
Message-ID: <CAAofZF4U_B=4vQF7iyYELyK0tg451-GnCHiK6VGV_z8yOxrz1A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: add system_percpu() around the new system_percpu_wq
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 5:23=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> [...]
>
> > Should I start with a new v1 about this, or better increment the actual=
 version?
>
> As long as you keep the history in the cover letter, either is fine.

Many thanks, I will do as you suggested!

--=20

Marco Crivellari

L3 Support Engineer
