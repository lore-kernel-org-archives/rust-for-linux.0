Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FC33EE1E9
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787655009; cv=pass; b=aFSEs8M1C/Wk9eunr9Bez1G9KHhc/JNMOz75lP1BlyReLFFGIf8clikgvVqbjH8hPv0TnFgB9Tl4Eayzz6L1GkxhFnh9arcSHr+ehKirQWTTgP6qBm4qldcuINlgyGzZdeyMo/9HN/TVsoeiASp2fkHMp1cQvioGDmCsdqqXFBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787655009; c=relaxed/simple;
	bh=8CM0c5VCHgG6GRtZpmbchBuMPneP7Lvp391+bIP2aJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdtEgpzufHd6DiKLVR5tDT73rKZMhwsiovE6hPqOD3WLYbw3+iV+C7Na/mfBNacoHUTixR/imwna0bJTW6vxa67ehspvr03xRwawAnyPkc7OEoCKER9F5YR1XcH/7b80T+FWkQuSxip+0wIaHSqvQryIsxJwFJmoDMgD59vb20Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VD26zfFq; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VD26zfFq"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf110997efso7296585ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 03:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787655007; cv=none;
        d=google.com; s=arc-20260327;
        b=nCVa63Inooeli8exRHR6E1PNsZDlC9pznCCY+KVHfrpqsGyLw1EmSQeVX4NNZndfUg
         r1TNYg98DuWLX4V7Emjp4Lei8GqPtEfEA3F3JqwYwzFayFHmLI081lHEA35RhfYr+GWM
         v1mfAv+bBjB09GXP4lIZAb3MVQazaqy1xwSDESMK4l40G7BZjnNeU5D6eYtf499UWu0g
         7XJU/9/x/9eylu0XYFsajwoCOLZ192jcgBocjliEk9gdcJ2g6oG/vMz+fzOlSsTrozix
         8bzitqZdHPrRsAIdrnnajGFYWEmj5E5LYJI/nmvXi3H7z2ws3gdMe14OTmFdu0VvePgz
         3yJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YTDGx48Fam/DVg4wySM6raHQJQWJCW/1PnKCvP3FRiE=;
        fh=vAYp18oX6mHKkIEvP/SEAyB14rpzLClysXo1itItx18=;
        b=BiG+NVGE5CwH8HwEB9i1RJLzPdAAgyXQlNNXAyAv2fR8H8bjJR/wf+vqNr3VvdCa83
         0hpriwMrS1109BHQxQGKvlahyHMTCUzdVXvGF3KhBh1rqqEEhy8gxJ3420bJX+Lj7r5Y
         M9RoqRP6E8DxL40UouFHqebwTZRy6d0dqjj9vO6jmp3fv2igfciGah7t2yzdxJRv4/39
         wFVXm/uuiNXEicS3hIa8oAwLaAgkOLwuzz8JoqhWlNmAOOEowi8v02UDbieDHg3ZAMtx
         wZfalvsrmA3gFo7SzqtLeP7PF83eUv72BFdzc0VaDjJwESKWoG7KV2TAcBIu0VpX6xEo
         NQXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787655007; x=1788259807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YTDGx48Fam/DVg4wySM6raHQJQWJCW/1PnKCvP3FRiE=;
        b=VD26zfFqztq0YDje82kOD7rjP5lSB9VHJwZs9ZqSJhGnWMGTegeudyQwcoTpYcUOIA
         DrHxr5Opwfp7cTM++REYP6exzNTtk3fhMvWc41eJQpDon6xKZ+LTYBhZ7gKsSVIu5nc7
         X/CDDWMWJnxT2shJmwDAUJLFm2GwoTPKtZMelPviAmnH7wOG04wFLkyeKxTP7RdV7JpP
         MbmgOphr3JW4TIoP3aGhqUVI0votvpq1RjLT9R03blSiYcuVQ1IasCqH9bMBmIzcmUie
         Co2zSIE9G/AqZayZypTs0g5u7NHSO2yZxWWefJxv2Kk7QHaJ2vWbsOqW/aMyhZCabxA9
         8tVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787655007; x=1788259807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTDGx48Fam/DVg4wySM6raHQJQWJCW/1PnKCvP3FRiE=;
        b=NYMp9G3L8d1TyOfnKDt0NiB9SaUyIk7NTWw3UjpFf4bXgeHIcltVI9RCakX4fSPsx4
         vLWkWsVWmWnACRS+trcyXQ/FRFW/85ra+QTkhJV+8cQ6UNx8ivbX1VSyqYELJmMu44dH
         DPHQ38Whhyf4MycY2LV5n9KL2JW7vnLXEeUgQx0iMlCLzSg/9TFr5IN8T/cK+uiMzF/I
         Q29+iIiT3kcjrF+2a0jlOFiXoYqZBK2V10MyTgP4dkLnf8EdLTqZ0KqpGqk/S1LAQmkn
         pOk2jO30vAWLFsARi5UzbSCWBlL3cq/jLMBPzopSd5KT0p/NonPvZRxsTNS7rlI9MYT8
         xFYQ==
X-Gm-Message-State: AFuF++mwYerCYIWgy14LwNrKel6cegNJ4AWmfrWEP2sdwofVrUKPxITx
	LiTEyr/erbLtnm4pTE+l4DfJc9K2khhQxEHzBRb87m4zbTbz3GcYOwoP3FqR21g+YIeHRD6o9xb
	0yOUjAnhjdnj/xk2U+uuffAbdq/UmWh8=
X-Gm-Gg: AR+sD10zZSYFr2d49r3RqTM6yd8bjjSMXnsD0NPEATGfiniiD25PJhfl8SCQ3eqRqAy
	qbjtq8Npp19HK70FMVZefmJDz2MDXeJQ3H/n2QOwXJNnpbBaj2HtXGSzFMO+2okIB+Cplnopb1r
	INe7hBBPDOF1wkcHn05rZsTftnLBUDN+iXSetDylE6cLwLWJxB7cnyD/j65zLmW5MdOD01XxwnW
	Tp1GEzOhCtLnxInrNbuiePUYThmxkOe2ojYviUa7yYUXtw3Rtijusx1OwNSNvZHIJMnKSHjGo+1
	elwtj6Uq5OD5LrJDvvn2rjGKAu2zKHaJYQ6t/TYyKoM9e/Vkbrbqtbk1X58sGLayBEtR04Qca5x
	X5ig4eCvsgL8WWpi7ks1pIR8B+dt6njl6+HM9DWtk3OrSRwWm5RVG+/Vf8sVS
X-Received: by 2002:a17:903:94d:b0:2d5:cbd3:8eb1 with SMTP id
 d9443c01a7336-2d6e369e87dmr43677755ad.3.1787655006809; Tue, 25 Aug 2026
 03:50:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2026082516-slapstick-nearly-8986@gregkh> <1d80b800-8216-4731-830b-bbf055ab6e6f@linux.dev>
In-Reply-To: <1d80b800-8216-4731-830b-bbf055ab6e6f@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Aug 2026 12:49:54 +0200
X-Gm-Features: AcwNN1WxrduxLJc1OO6MfyUOTgeRQIEnx19ZlhV4LI5OkNo8sxelwbNis5_rIr8
Message-ID: <CANiq72krVngy9cC1X9q55THEC=5Od_Bbo5=V5ax8jZovW6ENtg@mail.gmail.com>
Subject: Re: merge problems with char-misc-next and Linus's branch right now
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Gary Guo <gary@garyguo.net>, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 12:05=E2=80=AFPM Alvin Sun <alvin.sun@linux.dev> wr=
ote:
>
> Gary has already posted a fix:
> https://lore.kernel.org/rust-for-linux/20260813163951.1102583-1-gary@kern=
el.org/

Yeah, please see as well the other conflicts related to char-misc this cycl=
e:

  https://lore.kernel.org/linux-next/20260805-slab-rust-fix-v1-1-c4d4c1b69d=
e2@kernel.org/

  https://lore.kernel.org/linux-next/ans8lsGbkro4pO6N@sirena.org.uk/
    (the diff in that thread is from another conflict somehow, but the
    actual conflict is very simple anyway)

The resolutions in linux-next should be fine.

My overall list of conflicts for Linus is at:

  https://lore.kernel.org/rust-for-linux/20260816191926.230123-1-ojeda@kern=
el.org/

Cheers,
Miguel
