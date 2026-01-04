Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE27715ADB4
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 22:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767567217; cv=none; b=P4X5PHYzBD+9JLckJ5hJEQa6G7a0MeVlsqnCV+EodT4hMaihqBfUPHznkLKb9eH3r7eG7xGZaBsjrdkv1jGtqJjuuDf0xK2XwRuoEIipI7Ylo/lfreZJniQi80QqEA5kWN6FEF/AmpPhPxwbPpQAg80eBvFPwAXOBekj0Ir8s4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767567217; c=relaxed/simple;
	bh=GCxIi35KCvLvsVHaPlPEhc+KMiUOkEtASPIosYIAw3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYi+rBLpIOcXqiVI55hx0Ispj6y1ANDxt7SJADzeO1DEJbg9dDiPubycThhMw5l662Bo6HxDrtydGTwdND1aZitatgrjF+jeC5kNltqoSeSYQBY/mavZCut6FR1Hr0cVfARuZuR7Bb8SAndBKeKH3+RfnSawZjff0yYq1SVAQs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVN/upbj; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVN/upbj"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a110548f10so48715115ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 14:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767567215; x=1768172015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+JLg4fXvp32l22f4sa1Ylkuebme3t1lh5FZoDLRMS8=;
        b=fVN/upbjRZA4svHRUFcPrLfQOuEc+XoXx5pmXbh6UTU7FD6m9Z9/gKkxNJ0TBWVpUX
         nmZz07LQIUeS6ftug+CFKMptFy0On/xfi2/BAMIKEHi9pvZbFdbU04JRcVU3aAD8hICq
         86KIVIXPZMhh1AqmIooIbn/eVBYSYoqh+0g7+JKCDQ+KEDy4wDhgyUQfHlLhnCUeqNsP
         YZwQPV+/t7JPyycBMzj1mOoszLKraiJhz5/NBmYn6/tH24L1dkjkkZiTSOdCHpO4QzeZ
         a6xapg5lfrvBcR69lC6IG3iKdPDvDaTmOe1w/6YFcIV9iU3wqWbGyeyPlW+2XmOSuIuE
         /8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767567215; x=1768172015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G+JLg4fXvp32l22f4sa1Ylkuebme3t1lh5FZoDLRMS8=;
        b=Lrm+Lg79ZKl6m4pxav1yqaDxiI66FRFEFezW0VD+luMRV8xAY1DkYt1zY5uTFCyfUk
         0KQ7hwVKXv3Ze7fAIjUnOlHr55xWR3obxQaH2um3gzxXr8vx/1ciLJodi4+P8uKJ/oUC
         EhhpGlMC/46uX6XgH73HGnj55NeTgUrxYONw55wAHv+920u9cwUicitrtTVqxLB3J8Hj
         lnfQfm4D1iLyfmxYgCkjAfHnT2OSj+wHHoXgZFi3FMchhvhBmtA5U+8/hrZxWW4hS6vd
         JVrvGaRfK5/k7MXnF/oiGB0TQBUVoSzE1euvVbDSQpPsaiDiVY9uj481RFS2hsIcLZhe
         7X7A==
X-Gm-Message-State: AOJu0YwI+UeLtSfCH44ntC+Tyc5Ga+wLmo4wwUVYNzNOXTyuOgQ/NmSx
	GXz1x2u+/5NC252Zk2jjp7HM0osxJxMsz+n/qgmQxGB9eHg5ZymxBPjIGEdpUWcsdSn4N/B0xLN
	9oRx2OiUIYEShX24jYtQHW3FziUh0VWk=
X-Gm-Gg: AY/fxX4QQzl3//0SuhkQwKafP2vL8bxiWZPtkEoh06a531FimSmnYVufhBqsF1teKV5
	iMVrD4c6FxM/GPj6YqTaRVKeTp0e9r3HqWvW8SQzntfZV3s8r8QxUSzFpb2f7lBz0UTl9Tw5si/
	11kzc19L7RQYUJSWOsyViK/yExEoSkBNHnLXv4s6DIV84U8+8ZsxU9VgWXBtvWzvLSPAjSrsDzy
	nzKndsHgeEOh5IxHOT01iPRooZjeC3M/vI2BZrQ6Pe79ur0gHv8EUq8D7Bd6LBG6fSyAxohREOE
	GpCPbmdAACg+jTQyNQHLlzBY5G05iAhQ4Dz3A0PZiYWeMv2PF9fNHKJxRF9S6lf/xcdkCzbkiBx
	3fsnkPXHcQjFR
X-Google-Smtp-Source: AGHT+IED9DpQvL7LP2DUT8jjeL7+f/gyDe+cKhHpBRxxdk/3i3c0aDlVGld0s6eGqJw4FYr3tBRUDWLQ8BlKtiEnF9Q=
X-Received: by 2002:a05:7300:84:b0:2ae:598e:abea with SMTP id
 5a478bee46e88-2b05ec3d4d9mr15302169eec.5.1767567215006; Sun, 04 Jan 2026
 14:53:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260102084821.1077864-1-dirk.behme@de.bosch.com>
In-Reply-To: <20260102084821.1077864-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 23:53:22 +0100
X-Gm-Features: AQt7F2pBTECNPxGKYddsXif8Av9f2M3Wx6Y5bcZbkBx1hfFJn32NcrfOS4nrl1A
Message-ID: <CANiq72=8E+mLQu6Aq0BmNBhjpDr2WFRKaOAJBKqB+qmBrXqiaQ@mail.gmail.com>
Subject: Re: [PATCH] rust: fmt: Fix grammer in Adapter description
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, tamird@gmail.com, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 9:49=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
>
> Add a missing `and` in the description of the `Adapter`.
>
> Fixes: c5cf01ba8dfe ("rust: support formatting of foreign types")
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Applied to `rust-fixes` -- thanks everyone!

    [ Reworded for typo. - Miguel ]

Cheers,
Miguel
