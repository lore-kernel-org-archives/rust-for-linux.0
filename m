Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C04101C7
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Oct 2023 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jt+P5IDj"
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7AF0E7
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Oct 2023 06:40:33 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d9a58f5f33dso1729533276.1
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Oct 2023 06:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697895633; x=1698500433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTrn1R25UPJsylidRsKpW1EKElzsfRscKY15iehPYVc=;
        b=jt+P5IDj6WfWuTxNyKJZuxu56+hONdLsL97Y/S2LVCF4UMOOQNqXLn7Tk2bB4l0rTv
         4kXnmSqWxRhsLk/O8lLgykCtv6cOGqlqddxqw5EbB9KHU7NQRd+bJ9MvSua3F1QNTje2
         4ERTwKjGjWRg9inzGjP6euf8IxEFe7e6ZAGBWDP4fBpVrvmoEqbMLz7qIG50Z3z+AvVB
         TdXl+3in89ES0NDYJeOztTXX8EQgZh7ndTlklypvWA5uViTsBYDAKcqCfQ29r5ic5r+e
         4JQ+Q6LUabfuLyvk3movUjm/i33Ix5gBe8OPZz7EVDr0H2shghTPE+CY8xTF9y3p7ZIJ
         cK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697895633; x=1698500433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTrn1R25UPJsylidRsKpW1EKElzsfRscKY15iehPYVc=;
        b=B20u4lUdV28qHAEAlu4voZM+wPXnaW2WSizzHwovyd8ghs8XP+PvLYse0HVNuPNtuj
         bTzo29AhmshEE22WumxxVvwM6OePRTqxvVSIH/kSVjEwBRXBJrftHDbZna/+UilSgYRu
         QxQ1HJHpV91J/K+5tELTQIpYVz8sp7gXJAKWbyF/lxQniVnsVcC2U0lOZEedzBj/g3S2
         9ogKKH57LsQxe+Tx/9aYtFO2WiKEqr3JYvod98aj6V74SlN3vdSnZXdWw1/HKHJ1aA9W
         2MyYhuDF3YZPo0t/yctKkrzaT8M5QQAorbikQX0vQlFHerfgfY5cYSO1B4BJMrBT0LSW
         6r2Q==
X-Gm-Message-State: AOJu0Ywqha9bH22bmx9vjjkfL+2F0NKQI69pn0jF8AhzCoi0VwTIAzuA
	V4TPf2zRRO1qI3GQ2vdMixb8SVK84GT1jX7NJYY=
X-Google-Smtp-Source: AGHT+IFfYCpky0NJXk2bTXgKCrg9nLrSyIUDv5CDwUxRBTrXgY6pjDysBVXBzDLAG7b3/5avo2AaDIZpEOCVlCKfpgI=
X-Received: by 2002:a25:4053:0:b0:d9a:c827:28f with SMTP id
 n80-20020a254053000000b00d9ac827028fmr4758123yba.62.1697895633125; Sat, 21
 Oct 2023 06:40:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com> <ZTKuxaIeX3QMgdeI@arm.com>
In-Reply-To: <ZTKuxaIeX3QMgdeI@arm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Oct 2023 15:40:21 +0200
Message-ID: <CANiq72=hpO8dP_B0=gOocCeaC-GDNQJx1MeA2HDZcEKDt4ZepA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jamie Cunliffe <Jamie.Cunliffe@arm.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 6:46=E2=80=AFPM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> Miguel, Will acked this already so I think it's good to go. Do you plan
> to pick both patches via the Rust tree?

Thanks for taking a look!

As you prefer -- ideally the changes for each architecture would go
through their own trees (we are trying to get maintainers of the
different parts of the kernel involved with Rust for their own bits
and pieces), but if you think there is a reason to avoid that, I can
also take them as fallback for the time being.

> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

If you decide to take them:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I have boot tested it in aarch64 QEMU and saw the KUnit Rust tests
passing and checked that the x86 side still works fine.

Cheers,
Miguel
