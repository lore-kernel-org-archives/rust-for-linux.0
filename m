Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD672BE639
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 19:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775330675; cv=pass; b=cF6Cw81aMlcMnBEisACu4HgSkyMCwy0bxtQyyQ//DQLA19/zZuLWsLFFgc9x9eGVp1MBvYKdIF6RFwxy975uBakzapOT/DMj7VPOQl9BPcfQRqoe7kO1An4ln0jT5Zs3QEFZMJpDsjOP4uye+U8gqeSn0EJCGhwJGST8d2c8YvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775330675; c=relaxed/simple;
	bh=Jcu4VSvyq4iSIK7O+brI/wW6a9Y9hhQ/LMX5j2JUPfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PE5MFDMKkr9E/ptDEW+qcLlnPNuwFsMqserOJkDcqj87fV8ufJEighR8BWhx2u8yOwkUmEpQXroU+i0oUUBRuSKzf+qrgDMwke2gldBy6WW2cQqHENrzdMt0OVhJVz4zepeS9elVvgIGgyDfM4eC2JEDgLsyOFdjPalHdR/MScY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpP6Lsm0; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpP6Lsm0"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2cebe8d21d3so1525eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Apr 2026 12:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775330673; cv=none;
        d=google.com; s=arc-20240605;
        b=bMhijj3KeCywj95z+vMolJmJm1vVkxHliMk7ihnPyA28MnIqSKq6kIHx6lUA2Agjji
         9Z9l5LKAWbVvS2kuxFDrn/+Bmiw8J+s+1rOJE31k0F1BGQezEPZMrTxMge6xq/flYvrj
         LUrKEPL1dAHsGL2fY23rRI/aLz089n36TFOJbk3U+O8u4hcN2sntZVZdtcQd7gTndU+2
         DjoqBblmUGj03xg24PRZfDCpzNu6uqKqEttfGDK4AOXRK1XbBOawW2wU1+ZSwddiHutA
         o/e8B4BE/bnMziRBLshD2GcVQNFOcEpncFkp38hErKBQDTNH0RmZ7r+HeVY0/ZYaoYK9
         +ZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jcu4VSvyq4iSIK7O+brI/wW6a9Y9hhQ/LMX5j2JUPfc=;
        fh=4cCAd6Z8nXQ8nukgbOPXIN8TVEAZzWLpAgQ/ZuzpkUw=;
        b=ZytA11gRkAngJl/kybVEOyu+3DH+oaQS2E9p4qyKXrI97jWBCpIheB8RQmpNi1l/dY
         klllQni8FdElSKu1J1G1wFf8f/hj4yt2yXf39CiASHlAuyKmuP6qoHa3SWWL4NT2ntNs
         LYrNifq6pjoen3v0cUcHGMW9ivO251ys2onjOBCYaVFmohJ8WCk5PsKdpWWuTSKkQtAw
         UhoY7z8N74IabHXQ/A3taZ41dX6TJh7tx2swHr1D+uqhYzAqamDGuT1Fhkq63lNSNaqq
         aFzQljeKmwD/rcWgLkbfACv3hWoJ02oS28elriTDNBgsEe4hy0iHUw9jBoGoS/uHwXvv
         TqGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775330673; x=1775935473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jcu4VSvyq4iSIK7O+brI/wW6a9Y9hhQ/LMX5j2JUPfc=;
        b=UpP6Lsm07CktNFywEm5tpJvebk0MX6Sgba9Gf8DMDg8hqZ18ehnY7vMz93U4cXEWUS
         eeUYZYyZ2WDSfjasQ16SvvhdmNzdWNSpUnO0mhgIkrzhhrpI4hZYu84Q3JlGW3jOoxsF
         Ui9h+H1mxDh1RisWxO5vzz3ujlkhgsLSjWzbMZvtjSMedqMCNuQBJK/SrS8nOHvofNl5
         az90yj+cYBU7jmtM7WcvYGh0VKDqCQi5Kqypk0lPYNkz2fh3MhBhp+pJcRySQ/+Ynr7s
         dzSJaoCvfViOxhEQpM0URMvOdMbaLOUjzBJhtxpsaAHP/woDYz07PTwtnA1ctQDGmfxw
         aNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775330673; x=1775935473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jcu4VSvyq4iSIK7O+brI/wW6a9Y9hhQ/LMX5j2JUPfc=;
        b=Anr2G+BdvH2KJ9SPSzfUNeCUHa94loUa8tlX0lYhjf+3aPDP6Zt2qIL99q9/sJTrtv
         6YLCE+FzBxLLiacY/B1XBhUGsL/mfy4wiJTcZgtXC/6/NMP48OsLOP4LG7dUKX2CHodH
         5OW20aPqtmzjQ/6vX0CTB4q+0rYd+JHfveg6zN0piUWOKtdaM5/CBhanZTNcpQqykyYO
         +KlkuPFaiI0m0xM9z4NDcoiYpzc2EyAC2EtN8iIRCipgfv8qrc2809I+D73aGEbjOmK0
         E5jqjmbM0JNmIuPX9GccymJ9nRgZVmOetCAr7yhBr3ecblpczgSPz4fiI0Gyj+MGwuRg
         n89Q==
X-Forwarded-Encrypted: i=1; AJvYcCVk/dv0C9SvoPXreOgLlqr8n4FQvM6KCh6a9Gf1x30uMDWtdUqvuPCeWXL/3ySpv6fzIbQ+cpu4inja0c9GdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGY8XP9A862z61MbIWbu00ulj3IJ1id1erzvzhmTu4UUFA7FPx
	y2rXzwpOtnK1AwJmU0sBaWo5DRDAIvymErl2HDJ03xvCoyqtZ3+HB60fru6y6SHscztmuXto735
	Bl77/20YDseoJGK75VGIe6GX369/BwB4=
X-Gm-Gg: AeBDievDXLzY09FjoFAKnuiF72jzG+CxeMqRc0KhoqS+gd6KRBvkiuHNPE3TBVT++w1
	bHPfdRlOzM2q4lL9Ozax8cEofyrAMR2pJQmYqtgy0yQjSjgWKQOV/OVntQ1kYZNcxK/9KxuxZAL
	uljTRZdNxB+XSxBCMNrKDb7/y98M27HjyEP9ku0vnPQyF81CyV4+81uDM3xuot/S/bhgRpX/8ob
	HCeHpgD3v0N3+lrArRf1SnA9WTa2wCvGVUGaZGtjxIWj95/98f5dCogoBa7vFmxO/taWjR/NqEA
	jvI+pQYgmanmoYD2vzBQkOV57Q89Tx3t+dmeUa8GTR8mqvQ+H8aUjw6jEora9yWBh1+JBvqi6Yf
	8nHQVAh2Qp4BHSAjSsxIrSxcPHEZOlwE1Mw==
X-Received: by 2002:a05:7300:e8a7:b0:2cb:de38:c76f with SMTP id
 5a478bee46e88-2cbfc16ec47mr1626878eec.6.1775330673458; Sat, 04 Apr 2026
 12:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404-update-rust-i2c-maintainers-v2-1-42f929828eb1@linux.dev>
In-Reply-To: <20260404-update-rust-i2c-maintainers-v2-1-42f929828eb1@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Apr 2026 21:24:18 +0200
X-Gm-Features: AQROBzDDLdu-MXqH4ITix23KL8oc0WhByOrUPvOhUEmbpQKCRHIai0SY48ss3FM
Message-ID: <CANiq72nzNa29_YduauW_qwPq9sLbYa+28ykq42_bbfLnOqUm9Q@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: add Rust I2C tree and update Igor
 Korotin's email
To: Igor Korotin <igor.korotin@linux.dev>, Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 7:01=E2=80=AFPM Igor Korotin <igor.korotin@linux.dev=
> wrote:
>
> Add a git tree entry for Rust I2C development and update the
> e-mail address.
>
> The tree will be used to collect patches and provide a basis
> for integration and testing, including linux-next.
>
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>

I imagine this will go through Wolfram.

(The patch is sent from the new address, but the SoB is the old one --
Cc'ing the previous address.)

Cheers,
Miguel
