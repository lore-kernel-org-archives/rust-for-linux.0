Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841081DFCB
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jan 2025 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736689567; cv=none; b=UWDKn5VRNtHz+L2d/cAe9v/hZyQDlKR6JWsecCYYyvMz5V8Ed5jDaE1Ew7dAxpdAzIKSaToNDK+868mwcr5J9zkes0ERdSbMLkzz42sltN7irY9kVl6yQkljjtWVnU+VKGcUplt2XVS3dl8Ayco/G+eSqizV6CLkc/0G6tsUD1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736689567; c=relaxed/simple;
	bh=R3BzTibY5PGUSuTCXfNftudxOrpI7scmnB1foW1a7BU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJTy+vQ2l5aMSxP3Y+VbvNmUy1zDm9o7DKP0seB1dhuZhvoEldkaYmppauxnPbx0hYFWcmr157Fe+DSAEgD01ccPjTKrI074gBApuERU1gBlevEudmJjJyEj+bs4OGgl80krxzEgaSe4Qo90EKAgOJgR7srPPUw+lqS2gbL/CKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZiE20opq; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiE20opq"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ef05d0ef18so751773a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Jan 2025 05:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736689564; x=1737294364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSb16qaaauTohtEn3Pv7TfzOgncX9nl81yLRvtpnJzM=;
        b=ZiE20opqr9jegbWYg9/F1/lC0FusyBY5jkP9uQ7BFJg/lHsak0Rl2+g86SBDZ9BfNp
         XD/oi7n4icpkM57LCIaY0X9k84+sXOUSp1+QHFMRaQzfEsJuIzcwLCdBpobilY2qM8TV
         XvX7nz4gCYpvp2GHC9YmaUR3yK62JTew38s0hT67irezHcFDWNTAuyGd1IPDyIOWXDMr
         7utkrcD5UM5ro+zoCyAvxYWKAHs2UwEq+HYXkPSx7iJoXPFTcEYYJQubAS/galntMomd
         sgKJNdxOgf7v+p7q0iqMleZCzJ2X/cNal6HGIl90/KZbML42xvXo9sJDsbkyEJClwRnn
         orcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689564; x=1737294364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSb16qaaauTohtEn3Pv7TfzOgncX9nl81yLRvtpnJzM=;
        b=ZCNspt/Q1uwYSZutBFVP2vKcKGUu9s67oT+7INdbkxXTetlDtgQXZMTT8pCqaTj9s5
         ugVv3OBXOKxBYFbpeFl4YRZeAOMTKZiWVFOmJZBe1uAmzTWNk1h1KIP67Z7V50yCWiQ7
         9/e1tSUfo+55rxb6WYPk4OcSogyvH4PXR/MgAXan5DdtRaSMtQ6DwGJdMGl1AN8TUcWP
         Y3KSBG0FhRHHTfknknfbZhyON2VfYrOjITr90eiH0So7KgegHPZiLWNAoVmSMrqFxukY
         Nep10aFMnYZybfr5mYBpPmi8A802tuDjElPCWM/DFzeufru1zREL/ipjcy+wL/K0UVUM
         nk4w==
X-Gm-Message-State: AOJu0YxDjKQWCbpdqJvTD1TigEWUBy/K4jCBZVB74UFJPKWNBFW1C5Ma
	OtZ5x4YTnRq0SWI2gNdQZ+rKka8Q9b+qanUtkQdZN3R8dICyE3H2LHQc+XOvFx2ZAJEl8yURuu1
	0UppE6n8T+xMeCUJobqoC0zYuxU16x8FJbtw=
X-Gm-Gg: ASbGnctPt0d0N4zPvwEKg5IwquU7zdQnVawYgrv7kE+ZgAyVe2VP5t9O5r+M50aY5Ee
	/h2xHzTQPpuy5+PnaV7GdEusa2WLbPBC0yeSbJg==
X-Google-Smtp-Source: AGHT+IEna/vdEMp44ipJMc0YleYa7/ion7n7Y6Fz5gUYZb5kGBgA6szXibyUFtH0tu2GU7ooT7z440XgCv68RjjOXTw=
X-Received: by 2002:a17:90b:2c8c:b0:2ee:b665:12c2 with SMTP id
 98e67ed59e1d1-2f548f04e89mr9615290a91.2.1736689563248; Sun, 12 Jan 2025
 05:46:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107062134.2981602-1-dirk.behme@de.bosch.com>
In-Reply-To: <20250107062134.2981602-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 12 Jan 2025 14:45:50 +0100
X-Gm-Features: AbW1kvbxEuGp_myBBHs4laMHnT3V_tmUfVQHvfLoDcfgiVSgTAH6aQzM-2ow7Xo
Message-ID: <CANiq72n5Ooz0Navk7iDGdwca3sk6fJR-W-HtFV2gead2n9s96A@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: Add error handling sections
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 7:21=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD=
710v=3DhQO4xi+5E4xNALa6cA@mail.gmail.com/
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>

Nit (no need to send a new version for this!): I think these should be
sorted the other way around (the docs mention this for Reported-by
only, but I think it makes sense to be consistent, so that is what I
typically do).

> +As these example tests might be used as examples for "real code" they sh=
ould
> +be written like "real code". For example, instead of using ``unwrap()``/=
``expect()``

Somehow the wording here seems off (to me)... perhaps it is the
duplication of "real code"?

What about something like...

    Since these tests are examples, i.e. they are part of the
documentation, they should generally be written like "real code".
Thus, for example, ...

Thanks for the patch!

Cheers,
Miguel
