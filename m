Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B213655CB
	for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 12:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587869; cv=pass; b=lwwgNB3CgSgDmfDL2LKF48a2kKx/q3sviDgmcwNNwueJBYjRy2V67+gzjMiMi1cAnbOA/xkhx5Y5TFcVglDlEUqunmh5pS+tybHqlEpIOszA3f/eqUD+jumhEJMjCCn+YTz0HtpoZNXjOjmU/HkRfZXo9XE+yFZzXRa5v/ZF7c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587869; c=relaxed/simple;
	bh=PLQSI2THlOQqiY7RD4WJZ/OaMfhEcNpVcgw3SQjFw80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fr9EWvmdXuZPRbY5Yrf1e8RI9b7tleQ111uZV+pCkuIci6g03fJc5djjYnJNe9qeMXCnrsEZAxFxQ6BUL1aayeMDHxre6uFzJHtvt1JlQ1JODZtf7amcIyKtwdHajmniR4FYoeymNaND3Kxw62IefBk8Qs+7eroH/AXq38w0vqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4azMIn6; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4azMIn6"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-13246a5110bso508769c88.3
        for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 05:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778587865; cv=none;
        d=google.com; s=arc-20240605;
        b=BCaLd93ydGMJk4RVLJfBWrqHcO3XpvWTqoFx/5hkrU1AsBng492vwl8mr2LQLu0+oD
         mgBq+bNIu1P1SDMhE+c4jrU53LiPslpCd1nKiyy+nixZBqiows9BnhagKYq4pgSNnso5
         z+Flt/HJ2ObKeaaNp8gUSUaTA/Pn032go1d2VzMPYtSbZtM0T1BobDAb6UX3762pH5Th
         oZBcIXnEp0aHKFoXgNxSelDrk48xKLBHMOa6voZ+GITWwKE4lZVSSoLCsj5Jt9I5puX2
         djmV3yNDw6A3lf/DnWDLqOMI37ZS3/Nv6pwRilFFVAPxxsVw+fcnt9kQpxycYsjLOsMm
         e9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/1DE4R0T75WB7Frrzm2cork3VfeplgbAHvvAU8r9cGY=;
        fh=qBhIFW/LK9F17uGrvu/YQqJi+kLs1S+bL2EyduQhZbA=;
        b=d8qgitKDm/Cn2fp0k5nHd819LwsglAv84RqCFdcSdm/nI3m5ahIMcLLOyYOZh2Unnt
         Oi53uZzr/P3gXvvzmMQEsjl/rUECIuRp1MSrghkMY9IjCv0UGurXDgZbZmgPiQxU6r7I
         6kMG/78QflJobGm2YQoPqgF760V7s/Yj2bLu9vdbyoex90ZNl0+cNNyuk1miqHf2vwIM
         4D5nDNXNwBAmCUP+5ZPozWRSDJG11b14bTz09oEtGb4TN1HEyJVk9/NUp8Nggg/8Tfxz
         LBTXypxtVUqQNcwxbQl2TM5VDBpD1Wy2iAWjDfQQto0gb1rO7XfqY6LRNHZ0NToNc3bG
         /lhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778587865; x=1779192665; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1DE4R0T75WB7Frrzm2cork3VfeplgbAHvvAU8r9cGY=;
        b=f4azMIn6eLTZLKES5Omd1DARpcgV2BNvalJ5j366PaWM+xwpX3GxGiJ5Q9tlYERiIS
         Wuk5MehNk7Mu7L2k49WdHa5t6P5RAmZOGc8K4kSf7PauohpRHjlI4r9+cA3220fSGxzP
         SIjx44oH2vIjdoa649P+nXy7d016CnV4/C5e5uYZ8AE5IAZKtquHWRNuQSwjeeeYwx0t
         eRE2DdRmGPACMYBiMKWY3GnyqeQmt9fXY9S50XjaC5jxe6MU0lUG1IB/3hQJLfFCWaDZ
         H6hv8XVyOO7s6iujfZ1XqHGEK4GwvBuf+KXzoE+FHgfJZavg3N280AwH9xteky3XP3wM
         oEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587865; x=1779192665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/1DE4R0T75WB7Frrzm2cork3VfeplgbAHvvAU8r9cGY=;
        b=UtmiHeFGyoaNuXC0fbJDWw1cWNiefkRNycoj4OgeMcozyQ33IsZAmh55F3YrybbfOC
         TvwYtVoSpsJGoXYY6LUIRuUQKAP5KrPHBubMxcE91Y5XObE3Sf4GNey2sLeybjMvimZm
         ASE39rNH2YyQnnVhpxa06o6vqQqwM6ohXgA4YWMieegFqz6nt6dV27QIUhGrztxBICO4
         ejVEkjYPOhoR4D4PZQ7t4Q3nswx0w/lws2Z5cxfzBlZkbjTYqkUg+LkxMPCG6hJVscww
         475dt4zOhWvuBKvLmROZ3B/83Q+K7sjnPk8hspXRd1VRFPgSkkAePmyz7QUmmBdrt5uF
         WFwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ip9Q1bwe78EnQTi18xhVrfnTSrX1vDAMxvNM1ZejDmdwEjbP3kKzgdPjxKePanWzCEq92fvGdXOYKl1djjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP91oKL9AcpjOODeZ30z83dZCOiX/UBb7yHY4zrHfXN65ZRTAc
	onEXoV8FnzpxKfATW5hM0/6/54/yYw+s9ZPpx/cncyTOu2G2edEGOcr6JmDLAs5reZe7yP2wdfE
	coP2Hxd0xGC55RdE/3jilJCxuC4HVFLY=
X-Gm-Gg: Acq92OGMsvyIhGuN/DhoqYjrAeUnbPRvFyVnN/PxJ37789TksEAiOnU2scZdUfaI2d0
	TMZJIsOGbS5Hdih4ZLuE00qa/Xz+5WfSwlKV1QdC2rktTDawQwapIZM8rotFsy+wy7IblUM01ST
	2I2RkCnxZcD6hG/iMOW8/HJ3THxkMK/eYCIdCeEWShKa3wheijB7vmV9Gwb6aeO1Z8MTYjn7c/P
	v3Otj7KeoeePZVLvW1NHxfXZw5/LhXeRNZPXGVo+YwNl2ughVEm4AV2JYRDQfpGi/5pTX9MsOo9
	laEk1GsiXHWvMELvX9JMoo15W5godGTje9Hx5EnuHRJrCA5PNIDQshFvQzOCNYJG2XV/l7VOEbR
	D6HfE7HaB4W7dIlS6RDbFMpo=
X-Received: by 2002:a05:7301:4184:b0:2c1:7ca:cec2 with SMTP id
 5a478bee46e88-2f56b41d828mr6700782eec.8.1778587865340; Tue, 12 May 2026
 05:11:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512105920.2426293-1-japo@linux.ibm.com> <20260512105920.2426293-5-japo@linux.ibm.com>
In-Reply-To: <20260512105920.2426293-5-japo@linux.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 May 2026 14:10:52 +0200
X-Gm-Features: AVHnY4JA66zDTee-Y0W8SMQMil_3cXuAkrCNoATQReGDAID2X6wPfI3OU52LmT0
Message-ID: <CANiq72=dD5fw6XmLJ=zSq_k_ZQy8sLLMs3m1xjX=UTpO7tLisw@mail.gmail.com>
Subject: Re: [PATCH 4/4] s390: enable Rust support
To: Jan Polensky <japo@linux.ibm.com>
Cc: hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	ojeda@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, rostedt@goodmis.org, ardb@kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 1:00=E2=80=AFPM Jan Polensky <japo@linux.ibm.com> w=
rote:
>
> Signed-off-by: Jan Polensky <japo@linux.ibm.com>

Closes: https://github.com/Rust-for-Linux/linux/issues/106

I am happy to see IBM getting involved and being able to close a 5
year issue! :)

I backlinked there this thread.

> +KBUILD_RUSTFLAGS +=3D --target=3Ds390x-unknown-none-softfloat -Zpacked-s=
tack -Ctarget-feature=3D+backchain

I added `-Zpacked-stack` and a bunch of related links to:

  https://github.com/Rust-for-Linux/linux/issues/2

Is there a tracking issue for it? I linked
https://github.com/rust-lang/rust/issues/150259 for the backchain
feature.

> +       if [ "$SRCARCH" =3D "s390" ]; then
> +               echo 1.97.0-nightly

`-Zpacked-stack` landed for 1.96. Is there something queued for 1.97?
If not, does the beta work?

Either way, I would prefer waiting until we know the actual version
number, i.e. without `-nightly`. It is just a few weeks away anyway.

Thanks!

Cheers,
Miguel
