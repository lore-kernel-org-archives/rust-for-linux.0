Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0A635E521
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762897383; cv=none; b=nbiwmfNoa6/xWG8SKqyfl5jmzx8pkeaIbXYwjGfZ90FMcd4vVbyQgjI49lbZfIjo3zHuVvB9OpSBMD21dCX1LU64mIsd0l22/RyCnWKawX/cfeSj1qe4Jcv3ZagLHRoWSm4rCDj1m6NQyIuOxyq/bfiiMMOIUtcd1VIiA68ndrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762897383; c=relaxed/simple;
	bh=ZZv+K/fFDGV+gZWlXfXLjymmoMUuwVsPVX7zhDgcopc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XUY6W3q5hN55jXWryIUoXJI/MfrBsyiOwSxYnaIpweKKVXBUIQ9lDNXuDma4jTHyjn65Y1BDYpbL9aZUbayRNO8bCtDP99prDwg0SQ53b8YE9R1JiIEBJ/33AuGQ/MtOsnuEcQSec79v2IXpDyqv006ROc0WGdbiz9seOkfH/mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/j+0aqp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/j+0aqp"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297cf964774so189765ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 13:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762897381; x=1763502181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSfVh0oc9RXaywPAC1hWcSaHPVTZDxfU9hrdV1REgi4=;
        b=L/j+0aqpRHASc6624TnSU5o9FDGip47y3iWdpCAWO7sequUc9aw/e63uQH9oJ0X4x/
         quBgghY71rrwYW2Q6ir/nYPR6TKY3yQUQrAbJ9iqglM5yNcmt9E0664QKBUa/9Ki8bLe
         dY7DB0yGdfKsY4tZ1/xnwhlC3s/CQL56uxXHLw5PHmA4+VJD+uicMqnf514Nki53N07a
         HSjY8QX0xOmwIqMao+3BbMo1mYkSxenrr6Q7zX81TBRhAE82gufwbk1hbluK4pV73O8d
         HMe5uKdyceTFPOxHI4M3ew1d+VpxyPK5NCcNiAgqIWmlnlApldjzPcZhDULGZOhH1B4L
         5wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762897381; x=1763502181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nSfVh0oc9RXaywPAC1hWcSaHPVTZDxfU9hrdV1REgi4=;
        b=ImnrNmj9FPIRgB40LVWLRXQIgC3TV2F5kWHSBX9XURvbOKvL0xJE5g9yWRzsy5BpMV
         aqW167dEfwWyH8Tc+zOncL3gPjKNdXsZeCC8LEPEyi7K/ctIOKTINxFX6q+JP0igEQ/G
         mHpwXNeh7W/JoJC3uKIviONr7IjVRVakymC6VvYg5SmP+4uPeMfIk0L+pkIIEcsnGB0i
         EWgTHyBjBwn6V1KGSCWh7LMwEBikUxGwsfie8C1IDMqmyo7uqyPry5vH1LTx39lGXUmz
         q0ENq1e5ivutmwtv+WUFrFOAxyaVMtURdOYTpUZ4Q4/D+7e4CAA/cue5lOCl9WUWKqOG
         SPPg==
X-Forwarded-Encrypted: i=1; AJvYcCX6W8OXaQA/Qgz66lq2H6vc/7beVJwHsBzGUFREOvAJ+rHv0VLesi+ZJbFOTqzntlkUWYFGJ4es6valFcKBfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFDRNd/LDMTdjCvOVVQ8BhPe610zi+x6ioC2UZ8DxaeJVWMBku
	lVXh//jC/jlghYtXv+IyMboSv4SU9qKlk+y1Ado7IoX1ga8yWbK+Ueg8Wc03LSQOBARswyXs4y6
	JEZUARwUK1nkj4oFQfTw4qOuwtIqmfxU=
X-Gm-Gg: ASbGncuhqGbIv/aPAR2wkGfU+1CS9+Isjt4e3XaLdX6O7EMkzUi5u5DKi65SJbdfEAP
	d9kwEpzNLqkmCizLYCkUn2GsRDizlow4TSzXH5PxZWOk1i45CmwA/fAy0/dSM+c5EmIsv48OEzv
	05S+LKT1bqLz63V9AJ+l7/g0Ix/DoJXIVxsPVLy2VyNW32/+zsSlzR7Bq3tw66QTaBfLyoc+dXm
	AjZ0/1Z5hytyOrW/JwFMuNCGwpudBtnDHDN9FX4tXbiQFFnF5G8oYbv9I5yE4Vw3vKTmKux+ghp
	SDRTwgqgrDngZy7RAUkke+U/tWgRilc9sTdyNGlH/uKVqZICr2O7/mvsHyghNZ6E82uKhZdppbR
	NTM/SE1Wm2fHn2w==
X-Google-Smtp-Source: AGHT+IEpTybz6zwdqEECg8yrSg2QKnFKSW6eCvp0gLr1gM2ywPpyeGPBpwBGbfcgqP/U+czw1cIJyW407NanMFX5mvc=
X-Received: by 2002:a17:902:d486:b0:295:54cd:d2e2 with SMTP id
 d9443c01a7336-2984ec86ddfmr5683095ad.0.1762897381186; Tue, 11 Nov 2025
 13:43:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106.091026.1308953895982406095.fujita.tomonori@gmail.com>
 <aQy0zxs53EAnntwR@tardis.local> <aQ21xajAygTbi582@google.com>
 <20251110.182150.1392834304602894143.fujita.tomonori@gmail.com>
 <aRIPgOPvi4uhGQcM@tardis.local> <CANiq72=REF4mdB=g45c=eB7G6ocGa5Qf4PhqD4zbwrbCP6N=XA@mail.gmail.com>
 <aRIY6Pc--rlrJuCN@tardis.local>
In-Reply-To: <aRIY6Pc--rlrJuCN@tardis.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Nov 2025 22:42:48 +0100
X-Gm-Features: AWmQ_bn3EulQLEGkG0Wc7dyOnvDhB3Cc3JKONllnx8DS3MDDKWdA7OKb_Su2UqI
Message-ID: <CANiq72=cfyn-KnVwuOPCaz137pod7d+dZoz18NKHn2MA1J7zCg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly once
To: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com, a.hindborg@kernel.org, 
	ojeda@kernel.org, bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net, 
	lossin@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 5:55=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> That's very good.
>
> We do have a soft(?) rule about commenting the usage of memory barriers
> in kernel. So enforcing "ORDERING" comments seems good to me.

Thanks! Done -- filled and linked these:

    https://github.com/rust-lang/rust-clippy/issues/16073
    https://github.com/rust-lang/rust-clippy/issues/16074

Cheers,
Miguel
