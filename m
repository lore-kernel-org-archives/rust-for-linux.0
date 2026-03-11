Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CADA19CD19
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 05:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773208608; cv=pass; b=bG1/esr7BuD9vJwKsracNlajSMdr6+Na4xb4oFtfQ1WIECCjGThoJ0G0pVYyViq4JwAlTIEm6Cc++6lXi7MEvh1o6vO247QvkjRoRaq2iXVyNKlPDc3Bdo2uRpHPcjt08S2FgjW+0aMqcw3pf6gNuzCnsHLv/pNuiBj+5DkUQvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773208608; c=relaxed/simple;
	bh=IfAF5ftZwI5PNKitbUmyPKz3OSE/YAHHlOqkWEEgBRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUMavGGzNFgWDnn8rezt60/JVht+otcVDOdheoczUzKdVjj5PnU6aUf4PQ3S9BaIqpLfryge5jo/9/Htwr/gnnQE81DarVLvB2C6WE+FO8x/hS2W3R7GmAtQWWVA71zPJH6QQOB0hFFouCwmsJa1unC6ZEMLGT9mif9B0oLxlLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRRn/fur; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRRn/fur"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bd801b4078so1006794eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 22:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773208606; cv=none;
        d=google.com; s=arc-20240605;
        b=VW3W3Cl5wUgQc85m60FgRj+1LJYWOyYr2JWxL1oe9aEepnttCyZ0vIBCOIQ3IKl65c
         RX+07pzgmqrOTTYVdrBFalonyEw0jJi2QNMP7+08v4n0JNdmoJU2gosRvX0U0NIXKchZ
         DP2kIpzScTc+dP7E3DDxMFx4nLT+kUk3weH31924G7lsPY1GPjq+pDoYrWqKBxDbirCK
         3ktVZ61UBje3w5nAVCDIGRO4xFCwpnOUfMOfkEuEFwLePFo5WSH5vsrNyrg0ctpQxzV2
         l7GC2qA5BimW1tKLoKyKyTs44aSGW0SMldrtYleB71dyLU9eWQLQ1bDGQLCADdXUkEIC
         1IFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IfAF5ftZwI5PNKitbUmyPKz3OSE/YAHHlOqkWEEgBRs=;
        fh=1l77llYTXdfS7Azr/yhwkDKptLcp0oBFdJrmVkXNA7Q=;
        b=ey373b4TZ7RDVrEfXl++nDqV24cns4nTkD9PmEOYniFZB1tsN6h2CX7HwBu8wyz4yY
         tAP6B20kCoACGCrN8W8VxP32fkb4UFKxb7UdNmf6MEED5kJhuJYJkprWDAqKR0lTi+FM
         BcV93AtJ2qursh2MHsWMlYgkA/ObmCvnwndRc0cjdwTDXi0VoqOGmFDEANmzd+KKPfuQ
         VBHjor92Va/Yko4bdG17W9Mly6fHRC9uJN53MkSlcZFLsyLvTf0sVynbno6AwYb4LkCc
         8C/9iA9d4xS7M25Pwefy1tQTOV6FMjrJNZYIpKnLo/SRj1E2mrR1083Bc6p9XGo6VDAz
         OJnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773208606; x=1773813406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfAF5ftZwI5PNKitbUmyPKz3OSE/YAHHlOqkWEEgBRs=;
        b=jRRn/furqfT0Hb/2s9/5TcMXwGpdrXMTq8uShYbNl0TbEWeVPKGJ+73M9H46uDD8AS
         ESjz1jIEej6k+1bDI+l0bcaCa9W5QEEK2a0Lx+TyogHcTj54iwAcinG483pcVavDcBEN
         T1DSZpQ/PBAPEAVx+0bKrWd5WnI40rg8EqfMfPJwabVmCBsNy59ek6bbt2Ld+pyq60e4
         axn1AxAyyiFT6kkT4RCu6FaveOBTjpkCLM8+9VfmGibzrC4ZXWHwV9hqorafkmOklPmR
         /epS1xgvoKIOfV4tCxTWxvclK+Sd4OynJOc7JHmBHWc0XDERj30yUUVoFr4blQWJIASz
         zolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773208606; x=1773813406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IfAF5ftZwI5PNKitbUmyPKz3OSE/YAHHlOqkWEEgBRs=;
        b=UFBJSlgRP1W1UzmQ2+urQNF1HPTAzc6nyJMNUjS6zuQjBb9sDZ8BMmkM+ZXJBU3Hzl
         0TH4vn2BsNTU7YaXYVi1W3IWYnLBe8c5cD/6ijGJc/ADbpT0vajBzkuo+qqYl5BZJJpC
         oTdQSy5cUaFemMQRKUsmf/HYpGtd0fg7kPE/T6ep5u8Pxz5aqKkidCIICajNp0v8VbKZ
         vnLsuQDCG6/HAJs7P/WfFDK0eV7yVNzN2nqMk91Y1FZdwtYAcbl7LO17JrnxWL5ZY59P
         a606g01CbNM5dTCs6GSZzvP4WD2eRBsAjWXyydna8orpWvgWKbs+7CxHCwf37jqkmyKg
         IY/g==
X-Forwarded-Encrypted: i=1; AJvYcCVdCpaN657olISyCKf/EiCAnRTYuesYLOKcxQ0dZJQ42rDvoXx4lkQhdvpU7hKjJehklt6zIrC2902luqVSBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcjS3bISIaaGpKk1RdfIImkxVMR9Dzm/y2D00rTyolq3Hr/AzR
	NdzS++y8P2liThI5jACYEsmxZfBzJ0nMnZ4Q1pQr6Su3d+l75Td8Gi1oy6U8Sl8IrBwzQTVBldH
	3GOMxxfCrNyJpAUcvqQWjqyMf12fJhq8=
X-Gm-Gg: ATEYQzzYt/0EJqsT7uwoOuwHdVVVZz/rcppzJrs6T2432weDuPpRw0gFDY7a4A9XW2g
	devWIt9mBrRfcublUO3pkE1nOFLtzIr3cQaM1TQ5RKDpcmxYWk2jlTwCxcDTJ0gUBzLvz7GA8m8
	FKbDGWZBvkrcB2PQr9qh/UbMadB5Ipahq0l6Q0W5RnS8lu9iAzTJpkgYhI6142NQhmrS1hphbNE
	iIlyK0USk7/Tgidc2S0gF6UEQLEmv/A5hRolpqYddDXlFx72eRI1w9xYRJeDWPD6wnw2tccHBxT
	H31efCB0xvB8TEqa00YD+MT7RWzlhZMA3s9/AtZwuL24IolHespge/3MtGUkkIMkSKq23JafsIH
	q3Z0VrqDEJ0vwb2f2d/GU/qg=
X-Received: by 2002:a05:7301:688a:b0:2be:1f56:ed0d with SMTP id
 5a478bee46e88-2be8a56adfcmr283199eec.6.1773208606293; Tue, 10 Mar 2026
 22:56:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225102819.16553-1-mo@sdhn.cc> <20260227132713.23106-1-mo@sdhn.cc>
In-Reply-To: <20260227132713.23106-1-mo@sdhn.cc>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Mar 2026 06:56:34 +0100
X-Gm-Features: AaiRm50nK5auv5AgoYCnff3sOr39v0ZCLalsa928K5d6pnGRtrjHnMIXMdLmuSc
Message-ID: <CANiq72krbKir91s-sVLt4v9k9qV8PQTLrH2uhMdByb882CXZ8w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: host: use single executable for rustc -C linker
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 2:27=E2=80=AFPM Mohamad Alsadhan <mo@sdhn.cc> wrote=
:
>
> Acked-by: Nathan Chancellor <nathan@kernel.org>

Since v2 is fairly different than v1, I would probably have dropped this ta=
g.

> +ifneq ($(words $(HOSTRUSTC_LD)),1)
> +ifneq ($(filter command\ line environment,$(origin HOSTRUSTC_LD)),)
> +$(error HOSTRUSTC_LD must be a single executable for rustc -C linker=3D.=
 Got: "$(HOSTRUSTC_LD)")
> +endif
> +HOSTRUSTC_LD :=3D $(lastword $(HOSTCC))
> +$(warning HOSTCC expands to multiple arguments. Trying HOSTRUSTC_LD=3D"$=
(HOSTRUSTC_LD)" for rustc. Set HOSTRUSTC_LD to override.)
> +endif

It is good that this gives diagnostics, but do we want to make the
logic so involved?

Did you try what Gary suggested (a wrapper script) and it didn't work?

Thanks!

Cheers,
Miguel
