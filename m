Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A37430BAA
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772360149; cv=pass; b=jtY4f5SVTit/YiA230Ol23kN+4GI5G4CaBaFloHBTSrLW+GIEC9spL46r6Zala6ssqtpAp0tA0m+DUZ3Arieap7Hk1XtlFIP3zEXbNLBAVGs6Y9f9EaNo7T6JKmNVUajsHZpgfR+CJ7LmPQh4nKdtnd9xd8mhypWQ1ZrC7N3Puw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772360149; c=relaxed/simple;
	bh=OLjAyN6Cl/Pyodiv3HXj5N+KA0Tf7PM3FolA2LBXiDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V211nTElIO1Ug+gbRgCv8LCg4LKqdVAh2IPjnOXfl1XPhqSTeMlwtl3NGosZComPnaEqvCeWlAUR4cXw07DAbV4R3lyRuCFLYp7CR+ebcaaDEdwKKT+omM2uEwIkU6vYOlb6WNWBZrX2uoACNnIXs7/yXKGvpCkOuueM5yZuyJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNzMNEBb; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNzMNEBb"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2be07cafe27so9799eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 02:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772360148; cv=none;
        d=google.com; s=arc-20240605;
        b=P3pdu+7OdD+kFmdFaKftTimdh4ZKmYDOHjv5FVjAzG0ZDLd6ZU3sC3+DZlQTbMRj4P
         T5nTK+OeF/knJ9Zz6KHNFeYpeA2cA4KJ5JbDEy1bXKo9jG45Jx8c/1+NVVWVzpLgmrt7
         vlHrjp8LU3RWLCtFpWT6omy0j0O9wr1xMUm/GzUBG0jldHIPiX4x/gXrbtygwCRxDIFV
         i0HGB0swQ1ldttwwsTuQQOawNsCMFU6o5TgMSTgnTXd4mPEMgUq3Tv75FaacSWpizLkT
         HmkIjaKhM0q4YVvCNbByWCtVFlTnJxzgKL9gdhTNeuQvtkXiZqEr0TaAAnEaI4EC4MYL
         0fmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OLjAyN6Cl/Pyodiv3HXj5N+KA0Tf7PM3FolA2LBXiDU=;
        fh=bQ+Z1Y/vYoj6am1CrA81HAirwZucmPZIRCiGOm6JOAU=;
        b=lRZQlGf/8anu8uBdcD7GP71YEbKueQxCOOVL4L1i0oKdvAoEERbpi8g02VANQU5afx
         9FR5AyVWaCY1yttmV8SMDMRmpAKRIa6RYN8kEklFZgU43JULZmGDNVvGZjkwHX/Qdha8
         9y/go0PjduoFv36JsVlM+8smv6bP/QZaDGKo50+GUpr3SbzdJdLgoSziAJwpFkYkTEFl
         vS616iAoBAWimoVXWbseQVurjS+nO+uo+RusdEA0wVtyISMxDAYyyVhYOnd/qp120Dxb
         2FDM0AjlYtxMnWNzcw9bM1Tak8KrWR0BnLKGJ3RwxwPiR4ZKWa92y44VtSYOhPoOPgk2
         cvAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772360148; x=1772964948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLjAyN6Cl/Pyodiv3HXj5N+KA0Tf7PM3FolA2LBXiDU=;
        b=MNzMNEBbqCropTfG2g26EbsRAul+rg9rnjkg5hG8/jZFKK47vL92WKBM2J1FApdG2I
         E1lo8bPRnG3/h/qYonhA6adqKOA1uBm69vju2WRSPyDLcPWXH4ZDlRN9WQKZAagk56pa
         U1kidPzD1oxj1Q0QQEiiOMuyn5636n0h6Q9IfkjG+lhcH3TQNY4WIt2rzAwhl3h2oLAx
         +MQHBHeYFvPcG2uzIagqgEK+/pwtsbXLB57mu0ZAu9td6F5MLEUuZKYGhCT/Qlmk1LoF
         VdC43N1ITMOyblQSpbo1IcW5+HTvCSxSZ9IzT06cqV5x6q8o799xYm4NeTMxgej7QenD
         na9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772360148; x=1772964948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OLjAyN6Cl/Pyodiv3HXj5N+KA0Tf7PM3FolA2LBXiDU=;
        b=aLGT3JuCnEISYcBm3IKmdv+3pZUtoTpUbUNoo86sZ0uw59grzVuMomRwcIJsSAZzwY
         uh25V5UrTVy+mZHcn2ihez7lhsAaxSpz7R6Wao69avUTFpFz8RYO8pHGyGLcDWMtK5Rg
         f/Y6/EINsimoBB+1WgaSNnmyCBNY/wMlQ43rVuWWIqisAw888pj32wyZ6IsVWrp6k8WG
         nBqMs0ZBVq7YMZUjLyMHiuu+g9dnjfnrIk1KqT3ENJnDdbbmumh3oCnTQxj6UbftOoLq
         T97rUpyY5oNU3Gmg/pTKHsiN1s++uuIL3MUrcRD8mEo301W+0RX+55ytE1rfN2iJjr7O
         HMAg==
X-Forwarded-Encrypted: i=1; AJvYcCXfqbgg03af9EAALp2EXHVkWiZxnC/cjqRusnDc6JZZau4SoucO/XH0NapbvWinumnJmIaME1gRJ+3SuG2zbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw83eihIj/qKkg1frUkSsinKj8d5aVBsZ/BPus1nyn/jwn6+1R
	FP7av1wTC6QxU9wQSDy2FrSj5AY7xwrNP/HUkE7U21sH45gc0+fim8cL1Mca60JYdZYcsrS0ay4
	znj7m72duCGi4rjb/WeN0pvxpIjgYbDU=
X-Gm-Gg: ATEYQzx/JAcaXtY4w8zA/6au4OlvKK/IEj0S38uhxtxqcwpeWCJTvmsk0JhaPhvfaed
	FDxmpo09Iwe3Zogs4jd8zmwKjbFO/VNN3jioH7qjur0uho/M965JZQAO/vkCYfUk+p9nBhNC30L
	pvIUUsCCp1lBg+g6H1rzCVca0tU3eOHTCHnlXiq1URZacFsd1zzW9Icmvuqpk6i/ZFnlbZQmLrL
	uZBf4hc+WMLdVtzdD63JW+xiZemCh5t3J69OBN4Z/zXVt7nABTDagrIJZb0/JasRdYR61+D1nF3
	CnIHpquoVzphX1xGlsR9W00g+4TPlB5ckLXYuoxsmP9kkUAdeuT19akil636OQR2vJaPTwnNCmS
	oNXPi5dXXLga6gy+rMEofqaE9LbsdtrDPzn+CGaw=
X-Received: by 2002:a05:7301:2b84:b0:2ba:7d5a:a816 with SMTP id
 5a478bee46e88-2bde1cf86d3mr1483133eec.4.1772360147987; Sun, 01 Mar 2026
 02:15:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301014811.1712317-1-sashal@kernel.org>
In-Reply-To: <20260301014811.1712317-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 11:15:35 +0100
X-Gm-Features: AaiRm53Mn_sI7CLf0OIDQIbu17GJvtDjkesw-GOEaJbDV6oPCitKioYLXDIX7SM
Message-ID: <CANiq72nDynqELOzEFjf9sqhQ9deoVrH3ZiF=A6Tw1L+dKu1Kdg@mail.gmail.com>
Subject: Re: FAILED: Patch "rust: pin-init: replace clippy `expect` with
 `allow`" failed to apply to 6.1-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, lossin@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 2:48=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.1-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.

The Rust version is pinned in 6.1.y, so this is fine:

> Cc: stable@vger.kernel.org # Needed in 6.18.y and later.

Cheers,
Miguel
