Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375831E51D
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Nov 2025 17:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762709490; cv=none; b=XQ3moOsmxujNiJ5z4gocqCFKMII48R2SYXWKOpkOO79mmIQLg4cIyztSpIg9oyoImDjJHCJqExmZWwWZ4PvVTYAnFaRt/SMxSOxxCS5LmqLN6t+OAE6oex9JOstH3grtW5I7J4ui0iJGFuDENeQH732dpxQH8uIEiVHayzWl010=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762709490; c=relaxed/simple;
	bh=6p2OCxuKe6yiZZgZiMiVCRGcOTGgN9VNYYsa7kbeu10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YsNuNMj1uEGBlGnfOUlvnUY54xC4eDE8WcGe5SKz3qNwmZZzD1eDBF2U9xS3inCr0M82e1WITrh+AaLAuWnP4LjvOZeIsOu103Y/qrlHYZ7Juv/Jb08dDu9bnlkpTHhKuBQu9lPu97o+rjcdw9nDzo/Ni58tbf2kN1dfMMZ46Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLnH1VR8; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLnH1VR8"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297e2736308so575265ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Nov 2025 09:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762709488; x=1763314288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6p2OCxuKe6yiZZgZiMiVCRGcOTGgN9VNYYsa7kbeu10=;
        b=LLnH1VR8eibg/eGyrKKXLfFuaT5zheF+NJ94HAIJFu2PoUZTcBoghffy/s+Devul/u
         Ovy1M0iy+CMt+fQHlkHS2vQFLj6YwtWyh21Mg8JF7hCIm5OnouKj2PINw+70Krw6c4pe
         N84ZAQxbZz4K9SbbDX7WrBgBWlrRCHiL81QCpA7l3tASx/ox0OiKKtMGT9oNQaDtv8pi
         lMegKJsnSCM7NCikVTPEv+YGex+V/4mi+6SzVfeF/+jygngLRc8nF07XMvr/Q+HH4lww
         BSvxrleeP+TZ5uKGG7gX4I/huRk2ddNNpt15ajV3G4n1o6edfiW8BUrZOi4sI7x4X84z
         BQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762709488; x=1763314288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6p2OCxuKe6yiZZgZiMiVCRGcOTGgN9VNYYsa7kbeu10=;
        b=jXucIK7qEFlmFqBVSsickG/qlHj2j52KRqfun6/3Z6h2hz8+61QwhKsNlA+PdWJl0F
         6ps12oGfgRqsanlRs/wg6NJGLeVeyv68OSemRcdaDMIFA47+6OW9VGGZmknJJETrNFEf
         e5/G5q7xa2QoYPdI0SkhsNDs62ErX47moZjL8YJ8ywhOW0s4srfnufAkwCrDtgVnCciF
         feOcdRkph5RRsk57Hu6RHpRe7G7IpRkIgzogMgnlBY/K9xdRFPaU5E6HrRe/ZYH9kaj6
         LVrEOCnfH04u7AQbaig+03DSEBwBwRrRqaKFAiUlXloGvxe0yYnDCPlsrP8HP8zMHFGx
         9Z8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEDqeGnK5qTjb63qHyyp41iI0SftrkO+NzY0IQcmQeT2DuasH0OmW3yGiBeuHXLnAFbdrFpAFYh4plfkthXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBcOVqmN8FBJ7sN0lmjMpEPdBbV0dGsGVxAjamswCMvqjJFqqt
	xtI9p1phq8k5nNJb6nErQhIOzar0i3iqkVgUcLDxi8kyW2Etyd8urj0LPFphRCI9A02R2cC5eBS
	XJigwTWybeXp4uDDHedXz752VaWvkNVQ=
X-Gm-Gg: ASbGncuiNDeW+3C6uIOQHh7rRGk6FkvHxjTx8LtsoRG6GJocdnRSuiaUTkKbd0I5vCY
	IpFesvdBwCzkz2J43+2jG6VgaPJ1yWnYRhxEzZCZM6WOe4CBZS3B4xu2dhQecdnMy69OnOUWaw9
	sxVHbp9Suv1HskMRA+7sw5u1zqvFgc3k68eTXM+3693dInOiJ6hp4uNZkNOWiEWvpFx7mFUbm28
	yQLvGJ0EL1YIYl/aYMGxvY0ybQoykYrDBeRcXmaDcSS9eP54a7K+1Jy/b6fjT5ulbqNuPp9u/n8
	DHCs8emry/7VpHz2TvspGUTNlCDAM6lpF5leoJIvBN5hCJtiHPbQo9MYV++DxpUG22ep0+fpyi7
	/DJs=
X-Google-Smtp-Source: AGHT+IH5S5DR7+jnjkKyBo1RbgQXhaiyp5OSJ4YE1+F7QotfjXYvXmFS4NpKxLGQdUSETl2bBlbBfXz1QNw8SjtFjcw=
X-Received: by 2002:a17:902:c408:b0:295:586a:764f with SMTP id
 d9443c01a7336-297e5743fd5mr39547975ad.11.1762709488411; Sun, 09 Nov 2025
 09:31:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025110452-diligence-share-98d3@gregkh> <20a1d4f3-1fa3-4789-aa7d-385d33ea9324@de.bosch.com>
 <2025110402-banister-speech-7228@gregkh> <CANiq72mENsw=uVUbMFzOor8ZmoeurX+0hiN49fhzBgqMWMM-KQ@mail.gmail.com>
 <2025110413-universe-aerosol-2e83@gregkh> <CANiq72nXfq8EJ+-ib044+zGbr2N4hJ_Ygte-4a_dmx4A3S+dng@mail.gmail.com>
 <2025110856-down-hypnotic-8490@gregkh>
In-Reply-To: <2025110856-down-hypnotic-8490@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Nov 2025 18:31:16 +0100
X-Gm-Features: AWmQ_bmH86d0_SD34UFJPIhPkUXuca4FJLm2RY-IzHZ2DGrpKNYjcDIuITk50lw
Message-ID: <CANiq72nhfDSXBbJ4Etxnn=tjQ8eFOWk8PMDa5iJidAvMibgE4g@mail.gmail.com>
Subject: Re: ABI mismatch build error for 6.17.y and rustc 1.91.0
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 6:28=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> This is now fixed up with the patches tagged for stable, thanks, and
> sorry for the noise, I didn't know it was already queued up.

Nice, thanks for confirming!

Cheers,
Miguel
