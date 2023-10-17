Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E88381D8
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Oct 2023 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvqET7e1"
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4C4B0
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Oct 2023 02:24:25 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a2536adaf3so73992417b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Oct 2023 02:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697534664; x=1698139464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEU9LOWHiD0msIxYzPhVENUpCcK34MLbRnFYBN5j2k0=;
        b=UvqET7e1MHVFVqx2OdKgQHM+ShSOjrwyiDlLzbCE1u7FRJZnu4c3zAEIqMD/0k4FAk
         OwJq5UTy+sivA8HubFtIRwnhUK6mr5/llgj1cVlA1GD6f8RrmvLGhrBSN2ABNP01OqlF
         a14L+GvACeo/c1Xg8Rxgv5CzPBufNB1Npfz86VXnTPaXQZOd0V9pbZeQI8NLmfqi7xnB
         Zjeg40KbAB6vZxvtAZKoA15t2f9Aq/0SQCd7CK5yonCU1ThZiT1z4Q1/UmZa3CWSIcmK
         fsUWimLQ7bYDApJq+8Wmk6SL+zSTU3rmGecOWH94QdPrRjOdUyD9TZ6cnEgsV/1QbRDw
         Bypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697534664; x=1698139464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEU9LOWHiD0msIxYzPhVENUpCcK34MLbRnFYBN5j2k0=;
        b=mQpjny/sFnuhHaZy/M/9mrmETnziAuEf6q9k7i4ipFqq4eXLeFdGSTcrj0y3RFcIFi
         onwVbEUnpBz6DTTynFn1vRAaAAGQ9B2kqvGUocbf1xC1+7pzKoZDjss7w3MmaUkLURpy
         mrN5NGtpLkXs1fAlan4VvRN51ys0Z9vmxSc/npGauJSZehUSo4olc74PvsWY0HzaWb9c
         H1RlZCs35YUtTv3lpz+FKgB7vzs08I6Cob3B+mclmVLDsTrlHght0ikPT4f/UvLmrHq3
         rrK6TbDKuMd6CoG4ao+IGs/7vt/GSxtbp/Br/44mb2YMeULlj2U5eVuqAHRbWWAty+5H
         hwxg==
X-Gm-Message-State: AOJu0YzGt1pC83axsnTK5onegTFkzB56UkbtQ3pQNsPfOIJN5OpvChVR
	iMdT12c/qmaWEi+bjkZw+GrCwGv3zZuwSXYEvbg=
X-Google-Smtp-Source: AGHT+IFaYigh3iAuwEi8QiMq1MK1LvNgsPFzVtiLOLzMyGhN3kOwlFWq50pEaIbTUEbhfKNumyxl6QFZ8DNd/D2YLWA=
X-Received: by 2002:a0d:fe85:0:b0:59b:de0f:c23b with SMTP id
 o127-20020a0dfe85000000b0059bde0fc23bmr1560304ywf.46.1697534664601; Tue, 17
 Oct 2023 02:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231016131523.1521965-1-Jamie.Cunliffe@arm.com>
 <20231016131523.1521965-2-Jamie.Cunliffe@arm.com> <210bae78-4f68-4bb3-9ebb-f3d9d07eb9fd@lunn.ch>
In-Reply-To: <210bae78-4f68-4bb3-9ebb-f3d9d07eb9fd@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Oct 2023 11:24:13 +0200
Message-ID: <CANiq72n0=RsodKgK-fnJNZTFHYYmzSh4WcWrsR35A3ohg9TERQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] arm64: rust: Enable Rust support for AArch64
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jamie Cunliffe <Jamie.Cunliffe@arm.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, steve.capper@arm.com, 
	Asahi Lina <lina@asahilina.net>, boqun.feng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 16, 2023 at 11:47=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> It seems odd that adding arm64 support requires adding to the x86
> Makefile.

> Should this be moved into a patch of its own explaining why it is
> needed? Do the refactoring first, then add support for a new
> architecture?

That would be nice, yeah.

(It is needed because they are not using the target specification file
for arm64, which is something that an architecture should use only if
required. Eventually the goal is to not use it for any architecture).

Cheers,
Miguel
