Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A569302CAB
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 20:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757448894; cv=none; b=X2DOFNiwbDFGsuFGngnWXNDrOniF1o/c3YuJXafLIBjB7iMff5L/gM/Mlia8b9nsr3HcJ4hXIyqWeDo5pTRZvcA9clJ8BiikoWn4pY7IPkxCfPemG5Xv+M4zsOpG5FxEzsdUkwmNjhzwYkT1Qu1Q4gT8w1RxOw3nrKr4f4AlJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757448894; c=relaxed/simple;
	bh=0RsLYpIdBCFq2CXnIllIIUx06sgVvgCrX54kp3Ry6Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ya+2wdHdsg7khScqjX1BClx5n0o8iIms8pPhSrRCscu29En0/I4h+1T5mQPHAuXoGkvEMGaSA7WAKztl7r5qQ41/fEWfzSwKfB7jY4jQUp+XqMA/9lAH8ueCbrffkq8KEoxUCR1JViCZoPNWYrMkza7NAWalhqRgTJf55IPlGhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WB/TmuGi; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WB/TmuGi"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24cb267c50eso9115455ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 13:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757448892; x=1758053692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RsLYpIdBCFq2CXnIllIIUx06sgVvgCrX54kp3Ry6Rk=;
        b=WB/TmuGiRWgLeL+HxKBxEx9Lrl9rg70jzCxSp82/rZODI8A/epK0bddOnTiqMnpJHH
         Qlo3ZdVOJImOsv17+c9MQPmhb1nYYF4XslVlskgIcJD/9PkRBD52Tavz+SK6gDINsUXi
         wMgcnRu7rCGX4PRo7lx9uWtcflDSUznsXEZFGLdbyt6EXIBMNcz6Cewap2XFz7TC2FMr
         lWALxUtqfacWk3BJlKrgkUJ+70Ydrp9Te8/kSnfKU/7rIc1mN5ApjhZkaazD01dH+Szi
         sf3ROAkTACsyo1XbgTiSPlhT6fbZLokBWHnFvgD8zVp9+hOxOFnHVor/WotT+PLVzq4E
         EFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757448892; x=1758053692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RsLYpIdBCFq2CXnIllIIUx06sgVvgCrX54kp3Ry6Rk=;
        b=XpQwKXhGSW63KUMRj+8Bbvpv662DjUN4q/yF37ZUPGmo15+GeL+f8DT3R0eMpeHNhW
         qHV+jfm0HvlUh/aecvzCHowrz+Yit9oAjtGDrDhTM+VdwS0ysJSR+2K5GGLVPwbfxEmb
         fpOwwwaP0/LX1ZNeI1BlL6tB68KVH/7u5WxyrCi91aWtmnJVTxe6BCYJnc4DvJbgIss/
         XCVsoPiWJa2hlu5WhLngTOqYSFwh2Xn1c/Ky/Ov9yliCYZMLmSRjO2M8WnvpttDt2dif
         ca8WAHHm56ofRCyGaD6dUsm4/t/h1VUO3bgU0XhTyA4vo0VdWs/3rzDVBCWHu9d8ydLa
         wHCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr2wsXyVYQjert4eaksq7ODANj/Jv+jkIqE4GPG9jK1Qh6xT+lxpNNGetg6fSdPhI+DdNP4Ccb45HaQi0KiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+IyuTm1RtyinLc+jBOxQYZMgFIxRx5K4hvLN2XZHQ2WhmMM6f
	p665Kqna6gsH9qxbqjIpE+Vo5AF8FIXtffKzZakzh1wL2dFz3Y/8y/EPecAzKPK4J1RwoSXjJAM
	Cu3PfBusNYpSygcYsQoJ8YMsIfQEiLiI=
X-Gm-Gg: ASbGncstbuKDkAEQo1NWFgRuEsTvyBai0JXJx0qscfftm5S7PMu9jed2N78Zc9xDKgw
	9wADqdHagzhfFhBooOAkIn2BsRR2ftp726y/s1xqp5UVFj6RUnkbJeSj4pqN/FKEkMPvC9JRg4f
	3Mjn2GsqCVJeeRad+i/YnMUL6b4nAosNUVgczz3oNfAqMHL3Mop2poqWB1GdYcIhekST8xQjsqG
	2w+CVFH3nitCRhOeyVovgIFE+BmfBMkkMC/VP0NdEHNblFTIT+Ymt0ipYhLE0bxOEyqb7RI4Hhf
	MnO1F3so5ZfvdH0P1UFrIAlKCQ==
X-Google-Smtp-Source: AGHT+IG8l2Cl0crbnUXdUU1gkjVHq4CtZSPylbc0kTpXl7tI3C1ru4Lsu/w7cyIRw74CZbstsu1Z6Dk+uaNPN+HTnJo=
X-Received: by 2002:a17:902:ea01:b0:246:ed8f:c63e with SMTP id
 d9443c01a7336-25168e74592mr84188935ad.0.1757448892145; Tue, 09 Sep 2025
 13:14:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909092707.3127-1-yangtiezhu@loongson.cn> <20250909092707.3127-3-yangtiezhu@loongson.cn>
 <CANiq72n7OSCUzycAQXFybx6BSVnj3MWAXvZj7U=AWf_UQwmO+g@mail.gmail.com> <CAGSQo01mQfcU1EiW53be1hcts0c1p-HQAab_HBk6VcVmhq3n2Q@mail.gmail.com>
In-Reply-To: <CAGSQo01mQfcU1EiW53be1hcts0c1p-HQAab_HBk6VcVmhq3n2Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 22:14:39 +0200
X-Gm-Features: AS18NWDg4ZT2JJKp5Wn_EDsPG-hMufN-5mAXel2614jBzRLlCVd_Ejc82tjlxds
Message-ID: <CANiq72nkim=Nn__xM118Vut-Bhyo6Na3RK-F6a0pCxN-M7Xgsg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] LoongArch: Handle jump tables option for RUST
To: Matthew Maurer <mmaurer@google.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, WANG Rui <wangrui@loongson.cn>, rust-for-linux@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 8:06=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> I think this isn't needed. I added it initially because Kconfig was
> dying when `rustc` was not on the path, but I'm not sure how I managed
> that, since `success,trap` should guard against that (perhaps I was
> doing something wrong in earlier development, fixed it, and didn't
> remove the restriction). I have tested `rustc-option` with an
> intentionally missing `rustc`, and Kconfig doesn't seem to be taken
> down (and it gets a no answer), so the change to the macro means that
> doc warning should be removed.

Yeah, that matches my test then, thanks! (and for the patch)

Cheers,
Miguel
