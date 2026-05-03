Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C813A6B76
	for <rust-for-linux@vger.kernel.org>; Sun,  3 May 2026 19:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777836367; cv=pass; b=ogMCb12FlrzwEV8IDMr23dKstrd8Lr3ZuMULMXFAi6WmfVE7Qo48/NDPnTy8eNf9PrkkgX0SbmSPkPKajfMi/q9mimD0+c1yA6PVOvm84Q1tn4kzCNAlp3Nyog5NT0WgpUpSV6Ev524BvCPxvoPLn8LquSH6zoCzj9LlAuorBZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777836367; c=relaxed/simple;
	bh=XG8UmKg83pU3wa46ae11h8XQSd0IMy9ZOQoi4a221jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBJyc/qHcMaMXhpvNn7t6ad23iPBiY5IxFzf1r+f+T7XE0Vv7v+aLOMsawQ3FMkxCaCAebFzXt1VGhyoDp8ugKPvNNTVT3Bt9UFjxjzQfuWMjRizafJZJVtngWuGwaqcszv1ca2K0GM65DAG3P7xeVxNsqjSIqBFveOP5WG1eDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpAhrsiN; arc=pass smtp.client-ip=209.85.160.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpAhrsiN"
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-50e5bea4045so29176261cf.3
        for <rust-for-linux@vger.kernel.org>; Sun, 03 May 2026 12:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777836365; cv=none;
        d=google.com; s=arc-20240605;
        b=HzFqHr1XPx+sCLdfOJKYEbYdHiiZiYlxwthUjLrKb0m+pzUlBc76bl2UeU+JGUTrXw
         18GLzrrSbOgebvfdYvN9km1Ln8wGMhymt6REplrC0FvauPzUCvjgNy4VTs06GV2LxVo1
         3O7IyPw3UsABWEzkGSN9JoxEHRsQI7+7DU4+7Iq+EobzwUxxMHAbgMLAxKYkr05fM/BS
         ko9k2ZQhSP/rKckkbDdxTboCF3naSP5c82yz1k2dZ3r3JB1XaZ2UzKauyugtCJH8bsQj
         0qeT/PGOIDg/v6omazj5tdOoeeUtkqxe2N2luc+zXig7vptozzDl7vyAJx//j0SL51d4
         9bpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XG8UmKg83pU3wa46ae11h8XQSd0IMy9ZOQoi4a221jo=;
        fh=PHBx7e1MiKJFfITPqgOLnwbPDJHEOay0Z5r0yYz/7d8=;
        b=L/7zGyw6byeNOuuFNwSpYQqQg700kYaT7WiZ8M8hcKmdp6TTR9KUEpcaVug+CqOBq4
         nWU9p05euyxVVDuZdGsidqWXz9mbKJBp47uEXWnjKuZcfIObUYoqMktlgAP9RfPNpaxQ
         CTm8BbfsNmdKh3KKr4v8elhSTlQ58HBFnbE0clXGQhWSpULs6J6ODYKLwkiYyenBgVmn
         HWIbIt5DQ0IPZEfpiPV1OEyfSsPCkppUrsAB+SSaT3s+95bXVWnS8KHz5f8N7zmKWMTF
         k55GYzdpLoB978clvpmM0xbs6zeZYclt62CcfdJX48K42jRbSGP6IGuvJDLROB1EH5+g
         dWQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777836365; x=1778441165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XG8UmKg83pU3wa46ae11h8XQSd0IMy9ZOQoi4a221jo=;
        b=TpAhrsiN1w4MuUK/KvhoDfwpfknywP/TchZIP7VXEZlnXDUtXU2XHf3VVLtqVTdpHa
         60XqD8a0azjGaFiM5UunFpakszAQM+DNoShaQgLHdnVadbULFDu2vwbw7SASACzD19y5
         Wj47b+C9UDD+jLni9eCF0iLIXMbCHZSwK875B71D385SJqAV12dHooJzlwyv+xhqH+3J
         5byLzcj0LJ+3ygOtXEVCCwv5qoIT2a8A7x/VQwtY9YUvt9S0ge5pNxwARlWGRBKUBZ8Z
         mW0JkKuW5rAkAJx1O60fg8j0atdcwf5IHh9jW/omh1JkHBVt4Inx70wUn6b5m6HuXisE
         uUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777836365; x=1778441165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XG8UmKg83pU3wa46ae11h8XQSd0IMy9ZOQoi4a221jo=;
        b=Yn2u7Y27efjFnVqWz+hShPLSSahJuO7jAeWMnvk2FTEmc0Y6/VeMAW02pSgFTdddMi
         a0NqlnkJ3mjkTSjWqJNs1kJ/XiP4d9oQkH7XjE80ALuTk9nfQoRugFQYwUdON54nzTQY
         bi11XgGXoFNOjo9S54G85Kj5zetCKliWEqSPc2DVHx++tOL/mtbgMZzJGurNq41kBZO6
         Mis2VcebMQUxNxpRoxl94YVUyxh2IQXsrs1+6MY0JF4jSIZhXT4ObnRhFsWUp7a3EGzI
         1cPsJZSIWTUEpe1OqhT98vRW3rv8RdfRgFYdghlnypN4j4x83tu31ZDC68w0C1QX9TfH
         p56Q==
X-Forwarded-Encrypted: i=1; AFNElJ+EzsDk6EwmsReO3DWxaFpVS1LCAG7EuPtemjpUsxPsJDMHE8AfP/yTPSSX56m0c5e41Mq+885dmsymbIZ4ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwavTvRpkVd0Hyn+g2YXmtD7MTwGNBMJi+ge18MfojMzoseRScW
	lU5eF1dXdAFuNZNNxVUg1zbNT2wYPGyBQXRPh0etQcclReJA50+n+dgGRffqQY3JQFgBXxXf4ds
	Wu54jX95ykl9DUboIgCCP0cwcCx7WTfY=
X-Gm-Gg: AeBDieuy+gOiqxzvb4AF53bo5mmXJKf92XdT2Bq4rwW6PfXb/VvaXhTr5zM0yEOxEbL
	FTOsQR0FUp7Ebwqx9zZS2qQDYfBGRkOoN+UQhsBsNBJDPU0qCWnRcUN8zUkYzR7qWwW/XZtlpeH
	6DbZOUixPD2pJora9cmyNIoZtp+qoDDMqSO+3KW0sZ5HRg9SYIsgZuhTaaFkbmy5tYa++kmqDvY
	Uw/jXUoScbcBxuCdvefnpQHDcqz516mu4Z+vniYlpaTp8jHbIVlFOLkROLZ8bN3a78Shr55Av+J
	topjKbfxPzCbG7KAhjgA8yAHHliuOl74+rTA2O0oFTUrS3254QaZQJtj7ckFWTkntq65OubqGii
	TfnvO
X-Received: by 2002:a05:622a:30a:b0:50e:5fe2:83aa with SMTP id
 d75a77b69052e-5104bdf1496mr111994061cf.12.1777836364623; Sun, 03 May 2026
 12:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503030801.14080-1-enelsonmoore@gmail.com>
 <2026050340-kilogram-prissy-a833@gregkh> <CADkSEUgPtjkKC684O3qB=koKDPwJoUj-qU_4Z_18NAU_+bBqkw@mail.gmail.com>
 <e12da6e2-5e50-4819-a5a8-2bc675da4c14@lunn.ch>
In-Reply-To: <e12da6e2-5e50-4819-a5a8-2bc675da4c14@lunn.ch>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 3 May 2026 12:25:53 -0700
X-Gm-Features: AVHnY4Kt5s_1C8ObOd9tow1DeOBNsioFkEIF5beY5wz6dDacfl0-oSTa2HpU6_E
Message-ID: <CADkSEUiusP8WjOAPTZjAexu1hMukWugXow45hzvfFOYvO2bg9A@mail.gmail.com>
Subject: Re: [PATCH v2] tty: synclink_gt: remove broken driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-serial@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Haren Myneni <haren@linux.ibm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Qingfang Deng <qingfang.deng@linux.dev>, Julian Braha <julianbraha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Andrew,

On Sun, May 3, 2026 at 7:23=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
> Sounds like a whack a mole problem. I assume the recent removal of ATM
> broke it as well? Maybe __has_include() could be used?
That's a great idea. I will investigate that.

Ethan
