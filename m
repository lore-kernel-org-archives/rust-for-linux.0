Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F3018A95E
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 08:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729067128; cv=none; b=b1wp6gQjQI9K6WknVM2LBG4W15wtIBuVsijixgmDRo05Vrep5Sne5R1bidPnhp9My9mTpZTgw66qUSd8txI6PEG8qPc89mkiqG+6FzF7g4iDpX5egvogvc45gTfexIiRL6s17lNFYDEdk8GlIQgDWR4DdOV7T/cu1ql8IVgs+TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729067128; c=relaxed/simple;
	bh=GdAyAonw0lhETMxgs5zFKVxDfwdt0gZ2m2246xw34ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R04PkVkWVANwgZ3XIEIGa0vDaE3cnUhGwZ3JvJMKIu24V5V/l2mwCjS+W0CSFrRgqh+hB2qkgYT5UNEMTbnHGC4velE/4JiiE8o7+eUDzYcNmFhgoc/g41DtFnWk+CUWz6pSqIzFfA4JOkl+WDx8aIgDFPqTuM/SrLXUgdRQSBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rZKWlFK3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rZKWlFK3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so988325e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729067125; x=1729671925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdAyAonw0lhETMxgs5zFKVxDfwdt0gZ2m2246xw34ro=;
        b=rZKWlFK3Xwm5lj3ojiOxX+gQ3IT1PWqEHPdOB2/+wntq2GEmJ8kWJTjt2VyOI2IVuH
         ORfeuyRiYRh+jJ62sPu+DAVJND+l96QvKMOUHDuizozSlhoRN/yhbjV5UhUamGtf+6PZ
         VfHdCqyjNX0zouv1WwkVRLq0F6HMcCFqd70zFbE+R7b5ts8id3ammLeCo9scfGdAZfLM
         9lBK6/iPWXlA0Zsdi6yhPyoDdc9UTU7yLILiVmBxqxVi6uYezTgUnhTnn+3igfwq0jvS
         yE2PXimnu+NIlNYrIRrr0EnRR/ybVqPg/piaEynBekLUa6ehKufeIGUP3gLZ8Dauw8Yf
         sqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729067125; x=1729671925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdAyAonw0lhETMxgs5zFKVxDfwdt0gZ2m2246xw34ro=;
        b=UkHzYUrbqzRfzSdO0p/9qQJsF4NkayDZ5pvhDns+QzoiCMt4TwWOzR8lTvz1NctSwE
         8Y1IV2LfQGdqSYUa9yzthMFs5zZPuMA0jfGaib7GlfJ0oV6O9iujWisagVe6soYHYICP
         fNno071H4XMfjYrgj3pctN7lfOTtb5U0r9olbmb5cs2WDHvNzX4+/U4dNlbo4fAG4azR
         EWdG3MbAtQkdpcd6zol2BcU3+k7YZz6tD37qfOKO4WaADJuw9nPIys/Gk4ecOC7WEjLq
         he53andrMBetSgC/3avy9RdVfx970uwO458+PHOxc64+N/HJtoGhGzwHdlJ9LiXeomCE
         NaLA==
X-Forwarded-Encrypted: i=1; AJvYcCV4h+ZkwMMZiw4J47XIvibt9cDPBGjJxYsI4feH7RXCyYBJhmx+harTHjhteJsN1+473WmfdsFFqZccWO85lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz1T7PU3E0Ls4zqV/+IwE89v/+yAdDLDCue6g964TRY/uO6Djt
	9Mh0WLYzKhFT700blt+vj2hsLCofVnvGkI0uS77khPRb7cR5uY1gqsXZ47A9JTbKeNsRglWnS0X
	v20il9wLjEOTeeWd9Mbol/fWu34bEILGVsBdE
X-Google-Smtp-Source: AGHT+IEApi9dCVmH+iFfN2VYbxBm8PF+pe38gGf01vU4SF+ykoiE21dcj6paXzZPtBxSH+8uzj9i0Ryw/Y5uTcsq2ik=
X-Received: by 2002:a5d:4f8a:0:b0:37c:d53a:6132 with SMTP id
 ffacd0b85a97d-37d5fefa845mr9658199f8f.31.1729067125280; Wed, 16 Oct 2024
 01:25:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016035214.2229-1-fujita.tomonori@gmail.com> <20241016035214.2229-4-fujita.tomonori@gmail.com>
In-Reply-To: <20241016035214.2229-4-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Oct 2024 10:25:11 +0200
Message-ID: <CAH5fLgjKH_mQcAjwtAWAxnFYXvL6z24=Zcp-ou188-c=eQwPBw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/8] rust: time: Change output of Ktime's sub
 operation to Delta
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, anna-maria@linutronix.de, 
	frederic@kernel.org, tglx@linutronix.de, arnd@arndb.de, jstultz@google.com, 
	sboyd@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 5:53=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Change the output type of Ktime's subtraction operation from Ktime to
> Delta. Currently, the output is Ktime:
>
> Ktime =3D Ktime - Ktime
>
> It means that Ktime is used to represent timedelta. Delta is
> introduced so use it. A typical example is calculating the elapsed
> time:
>
> Delta =3D current Ktime - past Ktime;
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

So this means that you are repurposing Ktime as a replacement for
Instant rather than making both a Delta and Instant type? Okay. That
seems reasonable enough.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
