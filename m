Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CE05BAF0
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Jun 2025 13:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748785041; cv=none; b=nf2fu806r3r5QuvojX+WTOuaa9GB+UqU/W50jEQXt72Dahx3qF/QCQuWuR4wwM4ZEYdrkjReREODs9o1xB7wmNSI4Lw41XoQj+RqlVq7dnhbXcR3i7JyCWZ9I/ZGEFzrDcgdQVABVw0BpDn+qoq+uggLGeg6vWd+MaLXzmsOJmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748785041; c=relaxed/simple;
	bh=TT7F8Of0B/PvQiptkXDQpuvHHwfhY6b2dVPxC6Axhj4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=COtoKQUJ3cJDMsTBpjzBXKTPFs8rzBm3HzMl0sIroASWds3CTEyHpumgGESWrqObnsj2+f/9DXmsgITz/PSYwEqVx7J14pmxkGIx3HlnjO0/NUt1HEsFmmbTxY/G7BLvfFqSdE30fTv/xGFmgPuyd+qnz44Afru/T6A476okr/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GASl4ZLg; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GASl4ZLg"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad891bb0957so626693966b.3
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Jun 2025 06:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748785037; x=1749389837; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TT7F8Of0B/PvQiptkXDQpuvHHwfhY6b2dVPxC6Axhj4=;
        b=GASl4ZLgslQ53MTiH1PVHqoKfI4EPBwun/g0noIXbooIbhIw13Ae6jJnvTjjkDCRWB
         qoldHe/P1V2ZI2s7etWa0t7lRfEAH1Kg5s0LM5UtEtYY30g77m41INqw/M2ik6KBiRPH
         vzMlDmfTm4ZUQ3b1MihJ9h5AhBReLPi97x+ww/293HPefH52BLtfqL7bmCFXYNQwcMih
         hcoV8s3JEsTngx6bM4oAB5V0kOcd9NihqOlWlPtEseLhzncfNbKkt+9/XDLOrqVM0Qkb
         5bQ2Jx+SLHNJwt5FjOsykSPx3FrVDWQTNGhPtiiEd6JU330x0DyAB2U7/UAWqr6+oUvy
         STIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748785037; x=1749389837;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TT7F8Of0B/PvQiptkXDQpuvHHwfhY6b2dVPxC6Axhj4=;
        b=CC8bjboi/FBwtelW455tnP5IPRnfgsDAFe+v8RRVkAwOeMR9SRQaxshFh4mFucR5NB
         UeladYJ+QQBup3CQgGcb+9ptCtT+MHtgU8Bt+iyz1jh+5PcIfSOF/n3bWbWav/SGzI9L
         N9s/QwlQyhEpa/nrA25/buAIeuKbVMHeMoFPiICr/p38EaebEShScCIa/6l4JhYwYZSj
         umelarBOqIcIhbxWW6uxpeh5WzuGSnt555WrcuC7TlsMJR1B0YZk9kz3OB+csbSONfFW
         YXqE7KxVyAyXv9n732rVfsMkFworZ1zdOmGJk1P0lkMyDo+/AW93+lzb11E8ZlKye8JR
         lR+A==
X-Gm-Message-State: AOJu0Yz4f3JaV80tyZoaHU6xqVr2V21szBTcp8UbTK5KgtgajIcsel2F
	2Tai31g+6C+ZDEFGsyoTYUa7TsHzr+RN0lp+dKLHgBnHeNrp+jEFEdGoHYBLDLBFMXhNMM0Y8z/
	Egh0rRYsDeQpfhPl81oUdNOfqDzVctgAs2A==
X-Gm-Gg: ASbGnctaCdlbC8/ex4Nqr0Zz4+ALeUzy1L4W3tBO+fF5a6qcjqRY2kDIolom3eaxZ92
	cs4hpbjMAbpxYHpq60BW/GpkZFXfghuwvupErQ8Fz/5cC6cVlgLwvFDHTB3f9bSDQrXysu8dcox
	NNjBAR62fdgo29jAonsp8mijEiSrZNodfjiw7tobIQFA==
X-Google-Smtp-Source: AGHT+IEDZYxiZfYZFfSbIrb2xGy+wEdzDvv5u7J5u5UzHtrp5j8syD7eieoOkZAUnfn04oZCZjfWgNmT69cxYEKKX/M=
X-Received: by 2002:a17:907:7b8c:b0:ad8:8529:4fa5 with SMTP id
 a640c23a62f3a-adb32580593mr1144600266b.46.1748785036919; Sun, 01 Jun 2025
 06:37:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 1 Jun 2025 19:06:59 +0530
X-Gm-Features: AX0GCFuRS-wVKUdz54vieLGBP66iIVom2DuXYjo9tCpsn5zvPulV_nSEdxBayDc
Message-ID: <CANAwSgRby9wCw4Z9YJkYdsn344dz24iLhY-sb2+6USzRjcrhuQ@mail.gmail.com>
Subject: 
To: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

subscibe
