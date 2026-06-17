Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD8B3B6379
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 09:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689125; cv=pass; b=tHSzQEY+EcDY+tS/CPdUW03xj3CdZaoTb9qwLPMLDa3jxcAABtZqogM+NAZvllchpswazH2kR0ZT6MzRDQAYzSU4BxdLCIElLRS8wjJ3ZuQ1sQ3aI17Z/WwHAN8TT9OPt81u0XVo+NPEKxKy2+6u51qcbq9eNKLMTr87V6jhvxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689125; c=relaxed/simple;
	bh=RHsmEOpdTksq6DnOMOyq7cyr4WnYPMI15qpsyYC8DPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=byX/e4rVPL7grNw49gqqK66nNfqC4JoaufN9QbpEmCJKsRdRObXvSSOXqLa7nb59drDSXFYvKa3jeSTLdNfDIYlFCOtcscPVz7bCis/+v5DNqx6HvwKxWTTNtLYhCrB/vpf7+LTIE9GWFrh4ZIDcL2J2LbSoHhgmNQdjlO/xly8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGTZTKE1; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGTZTKE1"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7e2f3646c10so62311927b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 02:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781689123; cv=none;
        d=google.com; s=arc-20240605;
        b=g0RKSmXK3+PwS2DY6ja/DcArO8GoWXqiWtPBLugizFPnXrXH+0Pdk2OIppcCW6c/eO
         0e68Yr82gGrZF6Ve/z3D9w3wxyBbO0CRe2kHKSXpApuuigm86QEQFhU433lgrVOwmnRR
         S+Snok57IulU0R3dr8FPFgUSgrD0M5beT2FKUr3U3b0zSSmE4gYYl/3T3BsiGg4wd2kM
         /RdZOVrOkgcZIgW9fYOdvTroR7X5ea8bx1Yt93A09a7jGM7F6SGab5oxr48aOL4GE4JY
         CYRZnSeqyD4cSR/U21YocqD9X9mEYZOv/CvsSa8kSgglryW4iw7n2KXMu0V87jXydyeS
         m8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RHsmEOpdTksq6DnOMOyq7cyr4WnYPMI15qpsyYC8DPo=;
        fh=wAlATuFWzGfUoTausNuZsP1xLV4ulVYSlOkGPyNfIlc=;
        b=ZfR38zJAv6rP+MSHfgMEm7w0q5jqFg3aBmwlrpdB8tVbOhlP2JmX89idGXXkgiM140
         eFaEn73fzZS1b+do9+bwcvKjey5GN0d+ojcxslQBZqTkbXNF8AYjkbD73Ni4ifXlavOe
         rTCfYleN7JZeNOHWCNWrlxjHFqFtiIXsnazrohkZk4yPHBoyM3AEe+DAL01z0Ulqm7z0
         9rfh31CRBD7u9dd2sZNbkdvznVurfFwogJU9iWrXCLO6Qf8uaBsTjQwkHOxGL0UO9fnY
         cjDPq98cVAvm3+hIB0Ge4egg92/ZkSnWEZzvERco48VHn/DV3M5IUM8ULq0gyGC+T5DS
         xsJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781689123; x=1782293923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHsmEOpdTksq6DnOMOyq7cyr4WnYPMI15qpsyYC8DPo=;
        b=MGTZTKE19mXa7EXq74eiNtDFFp45fPEvFYzMXfYTrWyUK3s5BAPsJr5yJ+099UmP05
         ARaK3W5KF6r7JvdmXxoTJlfVSwV7CCXOj3oxkJsH4RAs5ppJs0aN1jyhD5A2/eEz36N/
         bcdi85uW4RHhwHZ5xjdlrRJeRX3zNIjYRAoyhlO1mvigXGfo5b7n6AxarNqk/+ghqSpG
         vowoxths3EneHiSK+lX9Ctvf7fTZ4GdNcJm+P6WG/hRhxrFZsAcyZ4ud2Hc0Oi+awrdD
         k3AIq+uWl/R/2f32NxI5CTIsn/PhPnran2+dYZbNBiyG/7Ezpx2sWLbIACoCFVK69qrQ
         to3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689123; x=1782293923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RHsmEOpdTksq6DnOMOyq7cyr4WnYPMI15qpsyYC8DPo=;
        b=XzO2ekBp86yWoyDjbXw3EuA3UYTM98EvReXWdA/rTxiA9JypW8Mx4q/CM4q8eYGpCx
         DYvXcALlu0jb+i5s+Zg/PlVdnh9YIM4KCHxqL2xsHx/yNQh5stg+t1DOM9Us/O/SX1kq
         QGXOEd4cB52B8USes0HX0Y/oM7kHWZ1woF6fbqT1BPRwAjG9pQNpe83+O/0xPaeOA05J
         X9Yko0ajFZGCYZ7/A3Ap13JPQrR2cpdOwJuf7ZiGiNUjefQFhLVntQLxjpE3+ndd3Pbw
         vEkK0FE4ekkJ1avEvb4aGJnqS/+9LOZRGDH8PnehSrkwMtTGxbAsfbbU6ionL29A31Jp
         M7UA==
X-Forwarded-Encrypted: i=1; AFNElJ87bCaJ5D4Y/STL0tavDIAKvDEC/+MW/6xqtAInBZHqDRkvT4SoG45TW1HrE5c52CEkU8PxFSjIWW/Je2310A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtsjnXD6IXzP4P1eQ1jSO3cVQsBq5Ej5uWK0FuEywVITZz1bST
	Vs7dXqn/l/m0aQoadH2joW3dmyINpH63Fu3QrhXFHE3Xl/HMWGwuFyOYCXQg/SyyQO8fiZrDoCt
	JAsq57CFPqcusARatQfRRQxSSeterTaE=
X-Gm-Gg: AfdE7ckOUjjyRUBg0y2rf1CZ9EKiVlQ6G+EWfTzZVtc9pahxaVlGjC7eKWEe61ibPbr
	YhvtJags/bS8/cSXqUhm8NfVhxrcq+9bEoMBi5/OY5mRFXTXls8gwhY577niSXRfE+7rLciGJrb
	9G8qyke6TTgcdXdv0OOkswK1e/2WdY7eFO4UIUP/oVS4K7iAptdRJ4qvZ0ca/o++5pq12syll4G
	EUwNNiuq8FY9d7yGs8pSj1UG5NQhEd3utTGKPbLzJ6pSORSj5nrUqGXdQJC7/R8GEfcbg==
X-Received: by 2002:a05:690c:7205:b0:7c5:1d66:8cce with SMTP id
 00721157ae682-7fe5d3a880cmr29777807b3.24.1781689123528; Wed, 17 Jun 2026
 02:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522172558.137415-1-ekffu200098@gmail.com>
 <EVf6DmYjRgc9Z8zBlhnr91GpRuf3N5tmTkn4IhjmvHkC-hsSR_A4DrkMA6ow09wNFGPk4Av7N6mSYu-DgiHwfQ==@protonmail.internalid>
 <CABFDxMH8icJ2HAw0iTotg0ipYSGDX8ffiTv3e4SmXu1vQ798jg@mail.gmail.com> <874ij1h6gn.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <874ij1h6gn.fsf@t14s.mail-host-address-is-not-set>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Wed, 17 Jun 2026 18:38:32 +0900
X-Gm-Features: AVVi8Cd04rK3fteVZOsXk_SB16xjhosacb4xf1iMYsmxyQvV4BU3Q769LZq0NDg
Message-ID: <CABFDxMGcbv27RAR3Ywq2YqVcrKWV9tHW1q+HA8e9dST-Vh52rA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: time: warn and assert out-of-range input in
 fsleep() and udelay()
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: boqun@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org, 
	lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de, 
	jstultz@google.com, sboyd@kernel.org, rust-for-linux@vger.kernel.org, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 6:17=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Sang-Heon Jeon" <ekffu200098@gmail.com> writes:
>
> > Hello,
> >
> > On Sat, May 23, 2026 at 2:26=E2=80=AFAM Sang-Heon Jeon <ekffu200098@gma=
ilcom> wrote:
> >>
> >> fsleep() documents out-of-range input as a bug but does not check
> >> it, unlike udelay(). Add `debug_assert!` calls to catch it in
> >> debug builds.
> >>
> >> Also add `pr_warn_once!` calls in both fsleep() and udelay() so
> >> the clamped path is observable at runtime.
> >
> > We're now in a new merge window.
> > Gentle ping. Any feedback is welcome :)
>
> It's on my list, I'll take another look as soon as possible.

No rush. I really appreciate your time.

> Best regards,
> Andreas Hindborg
>

Best Regards,
Sang-Heon Jeon
