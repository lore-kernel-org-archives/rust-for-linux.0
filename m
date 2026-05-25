Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57042D9787
	for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 17:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779731381; cv=pass; b=JDuHE0OTVTvfnAXOiSb7s6EIEswwk0e5F/rFF6esYPpUCyidVPzwY/s5b10HavrH4UJ4kZ7AJNwJs9pNhW5JZKkWBZT8pdJToSC6uSD6dD/3teTjUAqigdwXt2BWzsBCtE2Ox7BcrxTNoNIZ7hN1elzGnZsbyu20Nsz5ICuI/uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779731381; c=relaxed/simple;
	bh=nPfNZiC1zD9OomRhDPiPn4VIi53lb5Y/DjjaFyfn8Lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VvQlzlKyzlLGiLxNs9asblJmpcJ2TR7aWD7P2Fzw44NKSRUAjnGzMKvXgE1EpRdr8qUdWaaZ3tUo0TkVV+1tyzmoR0Rsbx8Zi/sTXWSgGMotL3ROvVqRGtlLbsx52hZ0wkf73SkGS/Ja9UV4mzhhRFOz9rEWGEs5rzn0bQkzdTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQO66wcL; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQO66wcL"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f6e6a0a215so816073eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 10:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779731379; cv=none;
        d=google.com; s=arc-20240605;
        b=MW5egvnK8gaiMm+AnUXC4zoXw1pR0MUZNbTS3ql54QJ1jNgzKWIFPJSv1NTCdF43Mu
         y7f5y58a79GbEEH6bDa1BtFxlEe/9LhGdbkxIXZ/U7vy7b3y4GUWi1EXcs2X0CuRsvCu
         h26B9yDIV++xR9uDeKotYjXr0GfqQBZiFiz+9Sw3rkUiuVLPjiP/5wrd1BXzF86usvfw
         2Eb+PQm6mkDmkqapezapP7sPIYyWkcW6dCp7gQf7S5PzQoDFPMB7U8PS0dvo/JpQ7b5w
         gE2j9KiIIvV3FAqMf2tipMM+zcdH8fHaHy2qMMk9GrrurNxeaxrWEmmkdiJAB1c+xzR7
         xi+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nPfNZiC1zD9OomRhDPiPn4VIi53lb5Y/DjjaFyfn8Lc=;
        fh=HiwOPsMfVSqGcjPd6OnYGDqHn2u+XFmAZy4e8wgU34U=;
        b=Z3FXPQex6r637h1OivCNbiOpXE+j6GMUtpbmoNmTKJpgPn8Opm3SSe56/p0Q60rnR1
         7O6jMX1cZoDiJqCqM9YOzzgvIBW4X/LH8qKkVEBBFXgC9UNW+5d+kyy+vr9X02svzbMd
         27Ha4iNIAguvfGyJJ3NvC91kZFmlczAYd7H9UUyilCP/Si00Lqd72hOqm6zd1/4bxC94
         Enkdw0TersCr24DeSTckaD3HU80nGvz2277EavtSuo3ZKpk2nyuUUSpTvTvXyOFLrMcj
         sjVeY8J8kkZkuanHBq83Z1j++DHPrqRnfngezdOHvjh7odz4Q42TlxfUddRcg0G4eTlL
         hs/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779731379; x=1780336179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPfNZiC1zD9OomRhDPiPn4VIi53lb5Y/DjjaFyfn8Lc=;
        b=bQO66wcL0z5zIcTViNJ6I+iYlBR2dPiXphTnVWtmozZfsrcMcdzzAJMPyi/GvWzVz2
         TpQ7owXGqOJp+jQn7YVo1gEZohNSSdN9ICna16a2FvH2O4cdNpYaSlBcmCzj40Xd+7dB
         SkJQAFGd3EwiaELikkJ3gTg5uUf172Mdbr6WpGXfn3Kxdk2LA08LPtaYhkQ7Mtd+zwih
         XE8hnA4xzaIWawMqGXGYggXeuCAD87RjZ6s4hkaVGcMkNF0fN+ch5BTic8gy4uR68WPA
         x78IgDifhAvgfh8cDpIeYLrAr9idfp0UQLBKuB9eFAp/nztVgjLYzbBZCh377XUZ/UNu
         +nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779731379; x=1780336179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nPfNZiC1zD9OomRhDPiPn4VIi53lb5Y/DjjaFyfn8Lc=;
        b=CptSnVqkojfHkEITCXUyGOdPqU8MoBfqMLRXu0rItG1nAEWfZAqsaRqIhif/jaEphZ
         ljlKMqKu8qxptWltEfauarOqhQweTLRJDTFoG3tOOrwvz9bR3eeou/2jI0UEKEJe9IPc
         cPP+HPSxPH26HnkzeNiVScOBaJqzwiC11sU5BDjMAK0FiVqOXN9rHhk3WGqZhE7JcCKG
         qAzTwdbwlBFInPAv5eTybldqmZJL2317Y6+VZGWW02iyuhqqckroqunCdS8xW/s9g6jA
         auvA4WY9b5HLz2STyjNLZ4UnfioInkaWM/09IDGQwdbyJUTks5Kve/Cj7hhPBG0atp9x
         j2NA==
X-Forwarded-Encrypted: i=1; AFNElJ9+oTRgp81i169Bye7ni8f9hjD//fmX5X9d0I0hx/mNAJxZ9yuzaycQYGqnvq5pJ4Zrir0r25GuJrglfPsPWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB1oMG0w+/vx4WMCQmpfdDIRTJvx2QSfsKQJPPmDZsAdZvST40
	pXUNqVf/kiZlwZaSx6DclEyTPGEuUkxS0YXHDlwyPf0hXLA2Yz7IKna+wJn0+V9d7ZpayVBHSQq
	aqLfWGIQ4POg3bLx5WZBXKKlVsbzD/+Y=
X-Gm-Gg: Acq92OFxRo+vLHyp3IMsq3Q1iZxBF18SMIPUOzN8BYs1sHpkQoZRZhrmhWrluWnQ6Dl
	K9Tr93gGDGHL0xKNPpZcYpHLdntBtozGNGACGvGazyMCcaQhtBhqcfB3EbJG0QHmSLJ2eBPxg1a
	PBu+yV2OTbNRVQMWuKQrYQuBR4UGrfuqldmyEwr4mMdwEye6rmujxvezTXNM7qf5piHezu73h9C
	2HATtnp8sArj/G3RadgJP7VCnPwpEl1gFCybnIYyG4INRUUiqI94RYZ2sjlIq+h7OSrcc2GLFpd
	wpQuV16akwv1AhMwj4z2ucYpU0beld/2j8y3skAIB0Lt3qyyh51elXW3ISShhhMkuTXfoDcfjRj
	wEfNRy35IFilOqJEje8Q4Q1Q=
X-Received: by 2002:a05:7301:2b06:b0:304:2af3:5fef with SMTP id
 5a478bee46e88-3044921564fmr3206406eec.8.1779731379003; Mon, 25 May 2026
 10:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev> <20260521-miscdev-use-format-v3-7-56240ca70d0c@linux.dev>
In-Reply-To: <20260521-miscdev-use-format-v3-7-56240ca70d0c@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 May 2026 19:49:26 +0200
X-Gm-Features: AVHnY4IGS4NWge_5oO5mtK6gWsE6gPd3PI1zRry3kpNJ_3QwcbAxHC9OP1Zg3x4
Message-ID: <CANiq72k7p23yTLL2Mq5nVr74oWCCCNuxWSdscU3YgO+2sYCEhQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] rust: doctest: use vertical import style
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 8:57=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
> Convert `use` imports to vertical layout for better readability and
> maintainability.
>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>

Please check the titles used by previous commits for files, e.g.
"scripts: rust: " would probably be the prefix here. (No need to
resend just for this, maintainers may fix it on the fly).

The patch looks OK otherwise of course, thanks!

Cheers,
Miguel
