Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4367315C3
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Jun 2024 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717423437; cv=none; b=jAtKTa/tovQQEwb+kqBuykYwZCSfOSJK908ruBCkez+jY2jhm670rkJZLLkEQzvF4qZzIKAbtizVXDHaVwhnX8pija6hPkEAQEInjdlvabWolWlfcx1J7dHVuYLMwVrI33r42jMbDtDuMPGHs4U5DaM+vgeWrn3sLhmj5qtyDwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717423437; c=relaxed/simple;
	bh=t4Eg8cNAbl5yB/LkU3zOb9pXkkWJg15k3ewWo2uXCWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0CSULP6yjvtF5e2t+PE0b2UWup8TZxpFyu6+IsVMUAHu1r88hrAEVCan5ViKwSUj/fcHWUTAijvjaLkw1Y8nmRm7xXuiG/hqlm5z/jqhjlXZ2M+mEOCFTJOSTfWmayEHlt4Y8YMtUsTO2064EXKQBETDHXRNjaikp161yj4SYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ga23Ldpo; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ga23Ldpo"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-6c55e3d2740so1777196a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Jun 2024 07:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717423434; x=1718028234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4Eg8cNAbl5yB/LkU3zOb9pXkkWJg15k3ewWo2uXCWw=;
        b=ga23LdpovP1uVyj3An/9JsUQmXW4Z1uar937M5aLU/h8Do7VURllvn4DObw8ecEtXr
         mWK6Q6QRNpSxLL1mFnTNw06HNRBkbVS4DNAyQyjA/gSEgywU5nZHISytG+hlJ5QPtGuQ
         Px15FOhXD1aA6bIQSzmzv7rFRuGY+YTEo/3YSUozlYcocTC9AjOBo9mmNG/SIELfTZfv
         +bb0OBj1o5zBZ2PmaZe/hxUD8CCKNVf/eI96BNAD+dtL7Z1K7DZ/NO3GGih7cPQOx8oq
         tFVbZNnhBQV4YEfEj/lE1SlovVBx9vkkBOvEHasW/CmUIMKCHvyHqyLgz3VvDO4LuLxj
         YSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717423434; x=1718028234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4Eg8cNAbl5yB/LkU3zOb9pXkkWJg15k3ewWo2uXCWw=;
        b=YvsKlyn/xtmWmyO3we18VENy/pYrTdJXnY3u3UyMuJwG7am2CbVQLVnCeTG4/5WHXH
         wBf+vbM3DXuaGbQ7nAxncjKxP7Nk7QlUFHlexRuAPj9FnMemdgjGTmMoiC5vmD7VL6Wm
         F2Wk4rcNVnIgbONPYHGNqeyXNXFE9aLHxjTwRRg2zIbreCWVNAOS7BL2XUphcZfP/2KY
         Mklzu4jnzzJ4H8e+PC8jhdx7M0U2knXGheaIC3R3wrnP65DnujrPXsm1e6bYi8UBDxBO
         rSFshN+T/KQvqfbKFSxaHSJgNgq2/pfsmn0skfxPkKAO8yrIZZoAH65klTksGkdBYw6e
         FuJA==
X-Forwarded-Encrypted: i=1; AJvYcCWv1wfjZ8vs5R2H1vk2zD61pq4V8F01OBour6Y4KiuB9U6crtozql4d1Qeo2kh19EoBEExfHrcWpQ6HwaiuecQzxZs5ALYgoekFrRa4vho=
X-Gm-Message-State: AOJu0YxJUU4FH0j5aMHi6awWslz+v8R4mOjjllP2wKeUjhjBWHaJIdnK
	XbMCVSFLsstZ0BlqaIqqo4yP1yDRXNgH+mxBBWqYDVos4hInOSiIpMYobnTM0YII0Vpp70KGRe1
	dKfMBeQ1SlTh35NNls/2mtIS+JR0=
X-Google-Smtp-Source: AGHT+IED76X+bAznGndGvlzwjiIwgHWbjL98LUkLwCD2/084Rb4eQ25sPwWeD5FkkuMhg4XAPFrPqzOMRG9OTKPb8K4=
X-Received: by 2002:a17:90a:fe94:b0:2bd:801f:dabd with SMTP id
 98e67ed59e1d1-2c1c43deffbmr12620882a91.3.1717423432925; Mon, 03 Jun 2024
 07:03:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240602231749.57111-1-fujita.tomonori@gmail.com>
 <20240602231749.57111-2-fujita.tomonori@gmail.com> <7551876f-a7ff-40e9-9458-8b4b205521e3@lunn.ch>
In-Reply-To: <7551876f-a7ff-40e9-9458-8b4b205521e3@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Jun 2024 16:03:40 +0200
Message-ID: <CANiq72myfWCyJP2MaDWzuYYvFF3-E3e-Ukowe0c4o0qRcBWSaA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: net::phy unified read/write API for C22 and
 C45 registers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org, 
	benno.lossin@proton.me, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 4:02=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> I've not been monitoring kernel rust too much. What is the state of
> the build system changes? Can we put Rust code in the subsystems yet?

In progress.

Cheers,
Miguel
