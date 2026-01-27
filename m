Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF983126CD
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 12:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769517290; cv=pass; b=GMpj0s1/2gJiMoYY3McuGCszeBAwfC1DHnSvynxFM8woUc/1zCEMhaDxGkVa8n2Yr1RAHlX8i+TPHXuWnX84zCr3S9a01ec62fPOqNn3r69UysEwYmRDd0SetAKCFmfISXHxE71YJyEAD4WABHgK5UE92U/ppWN1V0UXnh9wlyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769517290; c=relaxed/simple;
	bh=B7Rwnfrgo+FFKm7F9XauWx+tcpMrJ47UdZApDIIEScs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSD4I0CEOiJ/Fm37vkmdhxSu9rFHwP6szsHy8rOJujXj4iXmnqnJJNjikXR7yjDZxMvsoRPS9oTT5c26Vedm2R0lq3L7cXsxdPAvY0Ao+XAeGlCJiKKN5daVa9JgbCuTmJSpmGHB2AEA5ZYEPKU+idWB+PqUGbnYPFQl6nB7Vbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+wRrTAe; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+wRrTAe"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b79658162dso8847eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 04:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769517289; cv=none;
        d=google.com; s=arc-20240605;
        b=EhSeI0R7G2l3NVl2VeTY9vvaD2CS+sLs6GCTAfIz7cnYtdVcXy3JokFSRcaZbH2M4j
         GoE/mNnPKp/oQ51hBNLZgSDA62oDEtRFkBJcrLfIHI8uXbLQQL6m5a4z1uXJNxJbGYLx
         O73zcfufyZYYI8glVF7mLoXFxUH2/QQ90VkBDYuiHpz/Su9LwxYMnVwkfLKVjVfmEPVk
         M+5pNyiN8yJ/O/nqZtGszhOT80wSvjAfbqzkkt5o4hip4MNHn5TcxaOed5VMDgj555SJ
         z3L81gKq7UhGGBGtzQmFPZrcS+0TNd3SWuz32mOQgYrX/rVvNroa2yB/vAEdCxGN5D8z
         0R+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VrC3p0y0EzZfqilOYWv/ZWHgidPe0Nh/mmIkT+zxykM=;
        fh=lDGVzTmlxk9CAnN46ciE1bDPEFpZv0kq40TrL1HB6eM=;
        b=FZAGx4R4HxUrStSM0xbmV7H+xSAomyJyVmPx6obIUCqbFBKXmk68EuRPogmSYUVl5x
         7HrUlEIKJoeJHiz5TNwQRXhaTAK6ep8MMa6kZN2Krm9Rj6lc22WfBJqJZSHaKXlrAtps
         SV0TyHI6xSKT+oXgF8Ov9cmsitcnxn2tH0KvSlTHlJ+HC0fFyLrpbtLHa8/vogPtb6MV
         PLeZIfC+iqhpzL7EUWKGYEKQT8NeFGgAy8D55Tcyc/VQ4Dez7R/WPfhXRM+aCtd8F5IB
         BjhmD/JQ3guxHYBjY4AhbLCmTq8ENfUWFt/WNfHOy39pfpQGFvS4DT+HYSx6GCun9oxN
         uRSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769517289; x=1770122089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrC3p0y0EzZfqilOYWv/ZWHgidPe0Nh/mmIkT+zxykM=;
        b=W+wRrTAe7Pb+sMbZ446G6pUabBtcimXo1VygzotJkKKgfW+zBWyOrCyEbmyQzjTfV9
         rCgVq7JOusRd8KFYsKYeBJOe5GHDQxUBDek78j5p1/7CjxOp0mPr2H1H8sn/GEu9dMc6
         rM2gzL9cWt9F436V1WEifXY+OM6a+xFXsMmfaIyP2Pezw5FDOb48akC/pHAsIfJ2x1J2
         k+nahzDFyCPWWINIUTulJ/buWiMXQezFVVPlc3xC4mLKtjXAT27uqfjq1ro2ZRWeCBEn
         bX0pggCIZSJPOxs/VnKb5RfLZolTJ5hzapGdTOakzMkW7ScpgKH7HN9SomyhFUr9CUjo
         ijqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769517289; x=1770122089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VrC3p0y0EzZfqilOYWv/ZWHgidPe0Nh/mmIkT+zxykM=;
        b=X2QhbTLp1Tg6cebnIe5M/h3OuwOwQ+lexcVJm+zT1jbnc6JUY0N2iAFIJgZ2Nk/dv2
         SzVYIKaefQ7eQznYHs7x5oQOEOSrRBGe/UEKKLEzqky24WmZEckPBiid1udl2XHuKUny
         N0lhbfiCOXdx/OAj6UEDyorqHzUJ0L0qPRrdl6X24KR2Xx8LaCH9msEN+ETXpyt77xpY
         oyHZ/yiaJM+PlnZlS6aXsPjyzAe3HE7EY2c3JCXak5KiabtOiCReREvXHmmUwCVDVUt2
         LTSlcrxq8Fq2qeeWLLuGhX/TFdpyDkwUoeg6kNgkhkMgU1MeKoBP1X9iXfFK8sO4O6SU
         tvhA==
X-Forwarded-Encrypted: i=1; AJvYcCXEH/O5RfOrJIfXY3Bv5EAKIbFoaNY/2VI4TXwmNQKJTsuhrni1TD+kSsGhyrZf2gt81GdUDiQ5Y3gdQD+prQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZB8ITfCUwcYZ9OvvBfwmyTKZMBoAHtv2lhHE7xcUd3T/De58+
	trZm7hXGGhE3Huw79E/NI9Sjg8ZR17jS7fRg97hW/GUCCcIwUsH4insPrLicWRgBUyrwvuGCU+v
	KnHBtziYfDzaLS1uQQxpRK+pMXp904hM=
X-Gm-Gg: AZuq6aJcVaAiA71zLp0O5/lwoIcmP+WptUGfo2SMT9nxFzzxdQLuGFTMpYEHisyB1rS
	EjEGL7+sP5ysbB8fTuJ1tEB29uz2NcoZpGYXkGPTNu50cKFmw8IKpLaJ34CaSL+LfVrPOXcJeFB
	QWW/fM8Yj/02mUB7rxPZg+OWyCCue7YxbyTAoUPOzw61gPwjdAkdKMHZBbU43/jpwTIvaTU+YnX
	zKawQ+MAW0ybwcjdghBVw13pS7KZR5hwvYCd83Mus3jwT/1+7TdK0cgHXpjC1s8/rDP/Q6NXLK3
	mSuojK9suMH9MW6NR3LpgC653ninru86uKpdTG9LTLigjOB/j//XvDky7xYXs5q1Jj5TX4/AtV0
	wHX4AD5eTY3Kf
X-Received: by 2002:a05:7301:4341:b0:2b7:24fc:f639 with SMTP id
 5a478bee46e88-2b78d9042a7mr461869eec.3.1769517287282; Tue, 27 Jan 2026
 04:34:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87bjipq21t.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87bjipq21t.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 13:34:34 +0100
X-Gm-Features: AZwV_Qg5uwMDkOuNkwEWMq_ypFiOYne23K8dBi0aTgC4giWqrqKNEHIa0OCDbGk
Message-ID: <CANiq72mej9SKgPUo97HLBwDjZ54L0ShrjKfCPoSMRJZE88=k-Q@mail.gmail.com>
Subject: Re: [GIT PULL] Rust XArray abstractions for v6.20/v7.0
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 12:23=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
>   https://github.com/rust-for-linux/linux.git tags/rust-xarray-for-v6.20-=
v7.0

Merged into `rust-next` -- thank you!

I think you haven't changed your `b4` `linkmask` to
`https://patch.msgid.link/%s`. Please change it before the next cycle
-- see Linus' email:

  https://lore.kernel.org/all/CAHk-=3Dwj5MATvT-FR8qNpXuuBGiJdjY1kRfhtzuyBSp=
TKR+=3DVtw@mail.gmail.com/

Cheers,
Miguel
