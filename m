Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FD232720C
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772389065; cv=none; b=AkEwOseuvev12QLS8leqxK+2rbDQxJjZTZCjj6q34v4/2AqYnrugfPzKxiE0FBJQ0Sbd/vK9k8F7wGECMKDR/CB4DOecGojv4rPBqspUmkdpS2WAp7oK0bjbUYHlBBkCMqlOvSSFIDIGsWQTmuABcLXYlxeU0z8cMPT0XhjAM/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772389065; c=relaxed/simple;
	bh=i3Coe7mHx/1q/bt1lktQ43Lv+RICmHSAbEawJT6BFLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TEaB8WcBhNRqg4SDJ3a2fd3eos7tlC17Z2sOmzZAQulRk0cNLsu5Fj25QBPPieuqrIUblpgFq4ugsLoL1Mh1T9UUsb0qRG/N3/+0j7PM3/MAsmdkhWgVS7Jyog27L3eK6WR422Hc2o6+LgXxAoj+3vpqnMO2UU7/LBEPBPvgbPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KzrIxBk5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KzrIxBk5"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9373af81cdso447128866b.2
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 10:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772389062; x=1772993862; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5qhGyGsXJ9/tAFMFzwHRznymGmjUNcVZ9ynpOMQhLUU=;
        b=KzrIxBk5Elkyl1foUErLJ8p5iT5vhc8SUX1uTdn0S7DHc1jZvHTus1nitRy25/6e+n
         THq6qp2c3T4qoU2Bju7U2kA05CMNcuKTDMMUSGjeiY7wOgqCbXeH539jc0j09K3tc/9u
         aor64BqJCI6qmFvP4X+SwKBOWtfRsAR2dhxY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772389062; x=1772993862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qhGyGsXJ9/tAFMFzwHRznymGmjUNcVZ9ynpOMQhLUU=;
        b=Y95/Q3UhJ+v0BkFelxvpVaYlrfeTuHtwVfXTc6EtbhuRZxPU90tmple8aD1+nFrhtq
         rax6PbG5EZl21nCZgS5FDe5ktmMJucpnte7yX6375JnheDhRJJ8QAsTTsEh0wjU/tq8s
         BZRznovcWjOtg8rTAopbAesQ7hXNHNcvgfeUHbBI1DtJlkBt6hbgWUsdCR4GDFXFxsro
         SrSqFeejJGUfJpLWxG/fzZ+F2dT3ls44pw0oACXavoazMRIAMKeEQaITy1oLmPpCSslm
         39F8i4cg/sAJ8X/NMQ30zn7zHNjdA76facEgq+oxW1KYqamB+25qflSuMuNQcDhMfBVE
         Sdqw==
X-Forwarded-Encrypted: i=1; AJvYcCUMLDLsk0ouLXEpEgu7qyirJ+SvGLOT9TQ9UR9lsIA+7m5BHOloQr1K7Fg0jwqTWSRPaEyjkg9ME87YuczEug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv932NzQFhTMqO55g97ZV2Cdo4T2sgG/lRuD2HXP2VUi3r1OFf
	Kacux2WsDhAp88RPJm468eeVk+zv5VYzn2/6ZhrloEieeeC8LRBEKL1KlqlnVsciVgvDB1EibgZ
	6sgQOLYI=
X-Gm-Gg: ATEYQzwdvM45wKPfFA+zp14bsqYZr4Xv/wGa8rhBJ9r3WXvbwbtGBnKeaa/0dsPIUYC
	lYGtdO4K/DjCOnWMBfJnTINHAny+HBQPOXqdbKdAZ6gzR95DUCQuCrKOIRHd9X07DQAiE9fPOMx
	wYJ+O43b4lO7RHSbeMtPapgDQoUk3W0dti9CgKg0oFHRH1NnyRrMQnzeI5YwVpfSGAZg+834bPk
	AhW02AgFFkF4N+Wynhof7lHDb5jqsLOxeaNmtYdkDZvSZw/ttsCJuNoJ9eYQsRnbMgX9Ymd/rTt
	ofr0fY+KII0m9gkcAbWiyxgvkuOOhhCGnWqaOLwGdbWHrqDyNK5iHJiu5jb5iKF3j7Rqin45eaF
	PCkQMX2BcA80KGgSB/L3poRv/hi5TzNX7lt489VIuh5wCHfqGcGoajwwqbC2umoPX1yJ08OYKjy
	/3eMdAi9Vp9GK6ddxABlr7UfP4kEwzld44ukHA60HjJgxHBLQ6PsYngibcK7dyMFcDy7XnWDmL
X-Received: by 2002:a17:907:7f8f:b0:b8f:99c2:1abe with SMTP id a640c23a62f3a-b937636ce40mr666272566b.10.1772389061895;
        Sun, 01 Mar 2026 10:17:41 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac513acsm384938666b.18.2026.03.01.10.17.41
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 10:17:41 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9373af81cdso447127466b.2
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 10:17:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNWKhOFN6+c6x7o9DL9LQvyQuRFNUBorGeVacieHBNpRaiL1css8qG40oz83j2SnSE2638hE25RlyXRrb0kA==@vger.kernel.org
X-Received: by 2002:a17:907:6d11:b0:b87:7485:b4bf with SMTP id
 a640c23a62f3a-b9376180f60mr604929966b.0.1772389060956; Sun, 01 Mar 2026
 10:17:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org> <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
 <DGRGTIRHA62X.3RY09D9SOK77P@kernel.org>
In-Reply-To: <DGRGTIRHA62X.3RY09D9SOK77P@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Mar 2026 10:17:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=whAU=_wOO9WnaeO2HZVBhr6JLOkCSvToPqHyoL90dkyBA@mail.gmail.com>
X-Gm-Features: AaiRm52NQg0Dq8eSC_WI0O8y8HVmFVEoA2whrGx34VJgXkMjnIUoMhKJPi6tm48
Message-ID: <CAHk-=whAU=_wOO9WnaeO2HZVBhr6JLOkCSvToPqHyoL90dkyBA@mail.gmail.com>
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Mar 2026 at 05:04, Danilo Krummrich <dakr@kernel.org> wrote:
>
> It happens that quite a few busses rely on this, and there is a possible race
> condition that can lead to UAF bugs in the context of driver_override.
>
> I think it is rather unlikely to happen though, as it would require a user to
> change a device's driver_override field through sysfs while the device is
> matched with a driver.
>
> In any case, this can easily be solved with a separate lock.

Yes, if it's literally just about driver_override, please just fix the locking.

Use some really simple local spinlock lock to just copy the string
into a local copy when accessing it - it's not like it's even some
arbitrarily long string afaik (how long can driver names be?)

Don't use a huge sleeping lock that has other semantics for something
trivial like this.

(Or is there some other driver_override thing I'm not aware of?)

             Linus
