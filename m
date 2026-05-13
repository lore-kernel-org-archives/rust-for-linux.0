Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167EE4BC009
	for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687576; cv=pass; b=Aa9KDz//hM6JUUgr/00Qk+FcTFPqU6Y4d2kXWjzWpUuUM4cZ4IPmr9WpBLm5VXQoZuhwt3Ln3/f2WbzzqCM+wwg7ur71zrOJAChxZRQiEkSy5TenlEZjGvb+x0E6jfKJDPqhcAo7AH92L5Fs5SyYtDmin00l/7qd/Rhf2aU1Rg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687576; c=relaxed/simple;
	bh=zASBe7ByZeLu0hE+izBfltpFmuYzTuAbAv8KqHgRt6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZAv8EYuF8vCcwDZwyIyQ05mjV8iD9Qags8edRc+TpfJfeTUt58G1lL675asulx3yec3+VkNNFNL+1RAiaSX83yC0paJDwwTt72WM0MJZa4nWClhgqv6GdsLrgX1CXUt/8WBEzsHk7CeHLgG4fqPpgnaHRP/QjEPh59d5Tvqzkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3YYctmR; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3YYctmR"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f5879d63ffso373762eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 08:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778687574; cv=none;
        d=google.com; s=arc-20240605;
        b=RIg9JfMtlRt+sjjtg/H+0Bd94+1Jm/biKiQjBHWf4+xShszG9vm9q3YbOGzfixY03T
         Z3BuyA3eLmrFzm/n27uPWO76/0G7fNdUUSdZq1zxohKW7sP9njdCKD3PmtAy6TbiM5rn
         9R99k7p4/iVIqYxR3jPtKLNeB7zl1wzn2WxgT9/zusEbaUDWcYsllCon+DWh7HM7Xbmd
         oqhsjyl58+MeA4cT8hYgx8aqA2otGtpNq3mu67yPepkSBRkzHeo7ycNrCqZUq7zmriMi
         xuDcn42L4N6XovtuxS7rDhloznD7aa58yvCHk9T8Alqc4ko8yXmjCvTIeUsyJchm3BuD
         FEXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zASBe7ByZeLu0hE+izBfltpFmuYzTuAbAv8KqHgRt6g=;
        fh=5EVR5dl+Dvdae8jwPEAdiceahcC2zTHRiIPz6bP97iQ=;
        b=DqFntXrphReYsMh8CP1aWrD1KtjoNyG6wX2jyEdxmlXo51bXtTgdZ6eIuRs2AwhDiV
         +qMRs1w3VL4F/x+bdZbwPeWxQYMEi+waVNYlrjByNQCOOExuQkiOfiTdDLhKluBiOXH/
         CYfV2zhUKTSZiIRM/9rVEsEnyDPPlZeaWucU64LM6JmZsKkFJ8Ssb3GAxQvccal287cb
         m88iFG4/wq7Xmya2HMyJ7HkHG2WkFvJ1BJnrl0MKtiwfk7A59RsPw0zGWT7GpE3hPbAd
         kOAgaZq7rZzXcJVGzCeTv2X2CgDSImpQxgdof5af9aYgpzwTmV8KX1B92wv5QPDJzcUN
         fQng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778687574; x=1779292374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zASBe7ByZeLu0hE+izBfltpFmuYzTuAbAv8KqHgRt6g=;
        b=b3YYctmRjLeTnMhENHoZ7fJ4dEn2jjGSn4fB4hht63P3d4CDJEkwNIp2lCXZlEZBxx
         hygo2jTJqN8ZItU6TNXU21Ov5UZpt/swvWHiSN07zj9M2rZPmNJl4/j9Jx9YC0CQhhug
         14VHOnW/6SH0q03ju94DHq1C6OPWoPbFBWD0/1ELz3/ysT8yjevxgx2HZsnrXEtHs0Rr
         zye7NpEL7nAJ+ZtadsBRzkWDFclDnozWcFUiLxR1lTwvjdLjH1YhzZRIfCbjbUnDvBb4
         dI1wJbz4SMiDmmN6/bOKg52yrSM8Bj2B/ZUKVw5sx0f6ti1dQuHNT4sNiOEQqHzdlMLG
         7dfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778687574; x=1779292374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zASBe7ByZeLu0hE+izBfltpFmuYzTuAbAv8KqHgRt6g=;
        b=DycQJnnD06GYqEak3FUqGNjln28WpQxLWC5FbAr7XN2JTQ4RO5kzJv6bhN2DjKd101
         x32nIN+oGFEoPtd/u+5ttIu990tTA15exg2kA6y/X7vuoRxKmE+qDrdZ2UAkkrfjzlUs
         0wXIhzKVWxHRnrA1IExrWoxLKe71537SEuBuCeell3gFK/CxbuAvnP5zV7Q0J+Sj6TQY
         0bJj3+3/XoNCDFYHRolut4MYpQKwVTkRTIp723rUyZhwvO2dbTX/RhzDwNASXhY11mrF
         aMOAljWRLReaeezkoM8t7w20Wr1HZ5AVF+JezeD6VPtc1u+2LKcgNwitXwA8qQtzYyYN
         Rpbw==
X-Forwarded-Encrypted: i=1; AFNElJ8aLU5gqY9Go19doKyPGzt9oFNh0KNC753v1Z0FJIZT0i8ovBDnUoFkYDwOO/1baJxcxQJJrJlneToVyuKbMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiNKnIE8vnmThvTlTdcwCWeA2dT6OazwfCtMvYeRFllXWyq3wO
	YEePEZ/61JZJPP4d094T2BV3MXgwqlvpXTg6kRUC1xp8JPx2Ip560vX1l0Xz5N5kxucvMpBu2tg
	RzOX6HKD3UAcWyMUTM5s/YXWvPJcQN/0=
X-Gm-Gg: Acq92OHrzplu7+N+y6HGy6Dqvt53Ok1Uym946IKAQ3WCU2799TnpvzZ7Z/IPz8J/5fx
	QZvKr71aJ50yYA4CHs2qTEasIDcPS0FBFnV4l82t7hLB74pGlr3asVpugb9lHzM5mhL+F7+SxsQ
	HPhnHi3CBkyDdFgcrDajkE4WBdCZfS5GFacipWrSAwwqkHHRypDasfBHtmJXRwwTuxIEcanektT
	S0gffmFwkMc49AYWnHATgIpto9WZ/5j53gae6Ozd8r3pZZotVq84pbIHTnyu9xZZPi3FzWRUtTj
	vny1iwpLXW13OFVzlZPeVfIz+pgLLbmvEnixUTCSTWKp1uLJXDrGjKyMZ/u78yOoo8U09VC2rcc
	HNHi//zu80QXddGr9iGjfU5s=
X-Received: by 2002:a05:7301:290d:b0:2cb:8d2f:e235 with SMTP id
 5a478bee46e88-30117085553mr1095439eec.1.1778687574140; Wed, 13 May 2026
 08:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509203808.1142311-1-julianbraha@gmail.com>
 <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr> <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
 <5220poq2-qq9p-27p0-3sq9-50q1845n76n0@vanv.qr>
In-Reply-To: <5220poq2-qq9p-27p0-3sq9-50q1845n76n0@vanv.qr>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 May 2026 17:52:41 +0200
X-Gm-Features: AVHnY4IGMOl_bQlWYRPsiusXrrcSAS_I2ISamEAFUJAQs39YxFfM6FwhNGHVvT8
Message-ID: <CANiq72=QahBNGuwx8H9kA9HYijMi+H3RmZ6B8YS_UrFy6xW7Vg@mail.gmail.com>
Subject: Re: [RFC v2 0/2] add kconfirm
To: Jan Engelhardt <ej@inai.de>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 1:28=E2=80=AFAM Jan Engelhardt <ej@inai.de> wrote:
>
> Linux, and many other projects, have run on a "The system version is
> king" model for a long time. If libelf, binutils, gcc, libx11, or
> whatever the dependency in question may be, the project trying to use
> a dependency would add a few-liner patch to broaden the accepted
> range, rather than trying to re-provide the dependency as a whole.

Definitely! It is why I mentioned "even better", i.e. if it can be
done using system packages across a reasonable amount of
distributions, then that should be the approach. However, sometimes
that may not be as easy as it is with very well established (and
stable) C libraries/APIs.

Cheers,
Miguel
