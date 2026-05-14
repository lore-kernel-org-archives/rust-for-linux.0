Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B11643D4E2
	for <rust-for-linux@vger.kernel.org>; Thu, 14 May 2026 15:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771418; cv=pass; b=kxaw6NAc7wfxuhnMbZsFKQu2PY5iFK/g0tOPAXED6w3aimvTDUz47/v25hogC5B1IlBS+e9Vrbgs9DKPK9cSLb+O5i85W0GTli8ERmmLaYonHvPAe3S8kXqrt39kQ2dk69QmWgtA54F9L7sODwW8loCTmUmLTjWcIhRmWTZckRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771418; c=relaxed/simple;
	bh=Q1xiOWqnVIIhtfM/F9I+pHsCAuyVu9lKNInWE6ily6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=beSXOtoPtRBaxqukiYjpQXBJlN/Ak+CBinGkqhpdAAAvdc9Uu+o9OozU5NcqU+VYqtukN/vQvN9V6j3SPRBKH64dCyUY3QK2V7G8xeMaCWfHJlfUkVk3cyPvDaVbGlTUqAKwZ6YvWwevyLKSy/xdL45+ShTy3NbkodcbqeWgtRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flAQ4QHz; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flAQ4QHz"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ee4e75bc93so580270eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 14 May 2026 08:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778771408; cv=none;
        d=google.com; s=arc-20240605;
        b=M8zIMGKYgUSOM/oq1e8Vrbsq61X6R9i90BgDCLifNKc5rABcMDlclxyfGUt5fHhkZN
         fjD+OarCPWgIOvmqxAo3zuKqtw6rBLwMQyvhKzCsB1rZCiomq8267QW1Kl3zv/iFhSR6
         lvWPA/GJJHPqMAJVdPIvvs5vC2UBL7CWvUqhIFMq4VsmYT3bCESyo57SuKgtlDdqsetM
         Yw/PR1yS6fcxPix82bL6JG+MfKZ5VgkBeYdrLEiYHVeB00tT7MiL8C8cqnwWNovlQq2l
         a85J10JpXFC9VZyZOmOJAw1Te4qYo/AKF6p0mDwbUgw5TNloYvQZkm/I+LuR/2FPu1Ln
         kMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RkPjqCzei1qs4lsLRpPYWOszzEiBZY+5+KZ0A6n4vY0=;
        fh=I4sgf65jhZYhybOos+plhMUKWWERMiG+EyHXAIUs5y0=;
        b=YqxQz+x0ABGTt3KH/cpkbvdDeJtuKz1cTeBIYXWQW4zhhmczpC00pQDOJwxNFpd3zz
         UD2xc/Ab9hI5qqInD5bzs5/URvTx8phKDfASPbLuyTz3+5QnY+Itiv9ACs0ZtgkZEwHO
         fgwrey2L0mgb5a9nwB+Zh9DAL3JZZ1MILXGXGRHRqnUIFcPZGtU3EknZmTYDFhwV00rh
         xfbssECoI77J2pZoUVk5IivCqYQ+ynNgE08csGdDNzimyjc5PnOVBHGhRQS9tLYoC5Xc
         Yn1xSeWxtjsb90+GgNnRbqxf0+ae9Y7Gaplj5ae4epW4ckPaw2TZDYaz5erp3TNxKM9E
         99Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778771408; x=1779376208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkPjqCzei1qs4lsLRpPYWOszzEiBZY+5+KZ0A6n4vY0=;
        b=flAQ4QHzTCGylk9SqVDYtWVqzRwfqjNXoKlTmG06+XYjI0IKpncg1gpeLw/eoaXL7R
         rbXvfHtIE31JSTpAZjKK5jhK7Y5PSb9hmAsdT+WrWjNzKO4wCwPlT4L4AEKpkR6sktUZ
         Q/yp0SUypaeiYr01bhkagq1PGG65h1xs+WHi0kc5VTzCwFc3EMgSaTG8qgeJ+O8y9aBH
         pw0cbid/xsk7qvPl6TWMJcCctfic6ryIHar4rHAJwj0C8tqNVdISeqjzKe2Os8aYeGBF
         q0xBxsjOFJXWMqWwYYAV9su1JZQ/zD5vXppiOeNxiOYZwjR138/HoI924de97WE4adnh
         98wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778771408; x=1779376208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RkPjqCzei1qs4lsLRpPYWOszzEiBZY+5+KZ0A6n4vY0=;
        b=GWzR4CRFXskGQfh/QjE1mOiSUIdod1xBzNQoOYbLOLmNV26NkhvLYv/5/wGPOPlLIB
         SPE0d7dr2m4+Cmw6V5cwjuh8/RkA1rlM8Cp+YTJXMQr0WBxh9kAoIlgYVqY8gIHtW2zV
         gUF75wT8utcFJ8r/ZH1tI3Xu74WMrfYZUaPzfNRY04Tqzole5wQS49qJ866N0Iz3Tkk8
         Qhi1qecOR3+dRwJxa+OQwLEiRahcoxhpunO6d0La43HCrQDm820QL2jWhGZEuCrrhTmy
         h05SMiWlG79gv4j9fndHQZulNsr6sgrZbqKxhZcrnWkmoPEjEbG/TivPLK7HDgjAF9hg
         iiWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ICDM9NJvF1dhFi6e00Nfv6gHugi4YTeDIiuQoTOPICz6g+gkm3wadxF4GZMqHzvhslrYg3jo1tuUrXJv2iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynaF4EZ5RoZyIxpQ6y8vz5kHPDRvGqZD+6N4ZmDDs6lY2oTWbw
	jFlq+t1uyz1iD9+6c14hdw7HSOJQnWW7HK08BVCUt0N1YHayLcK1ojh0WG52BAOzRZ0f8dBlEik
	mS/4yPq3rQiCIV8ziAjEQDxR1fagzznU=
X-Gm-Gg: Acq92OHjaWdHyfnI7LzjRWujMDwLXsmtoFVvyYw0p4TPvmg0ZfA8+wbrc1k+engcRjU
	DiVOCuDSl6tA3dnKPE+N3rHE+qhuyFCATFaPL1OSUZSyNUjASPqHBKqe/qW2UxK/uQZb8RtIFRp
	DNVtfaogbeh3/1bp19h7p6XkmEcziNnKPWOXq8IpTxaxjb1qLivZLguIaSWJRYZMybZ02v5Jgtu
	lDbLr6IMhIy7+fGl5a56O39IArzVqkcKnpoXj8yn4KiMbaUriuwGvtl/US4twiridb58p4YgTyY
	RmZ+xWMjxAiLX8LPLIme9JbzUfKB14WNcn0ZMNhBosIwiMDeZIOHSOjkyx4kHX/zBAvzvxGoI/q
	t0HeHGCHe8f8EEkFkb6sITVw=
X-Received: by 2002:a05:7300:2150:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-30119a739camr2362416eec.5.1778771408152; Thu, 14 May 2026
 08:10:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
 <agGRnHVTLiwobb9W@google.com> <20260511090943.GA1029560@ax162>
 <CANiq72nm_3KM4gMnb0x34oJk1+_8XrUz-43zwW58Mr1UHG8qtQ@mail.gmail.com> <20260514123539.GA1781775@ax162>
In-Reply-To: <20260514123539.GA1781775@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 May 2026 17:09:55 +0200
X-Gm-Features: AVHnY4K4FPfnCtiB6KX494dgF2K9qH9aUDHSKjAUM2cHs1-ctz9GH5wRqeeAVhY
Message-ID: <CANiq72nZ5hW545-k1jpjR=tbEuKigm3fBcVhuuafCmoYPZzq7Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: Do not select HAVE_RUST when KASAN is enabled
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Russell King <linux@armlinux.org.uk>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Christian Schrrefl <chrisi.schrefl@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 2:35=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> FWIW, I think Russell has been away dealing with personal stuff
> recently:
>
>   https://lore.kernel.org/aeDSTIS9-TDSihbX@shell.armlinux.org.uk/
>
> So I doubt he would fight you taking it, given that it is Rust related.
> I am rather selfishly motivated to have it picked up and merged because
> I have to remember to pass KCONFIG_ALLCONFIG=3D<(echo CONFIG_RUST=3Dn) ev=
ery
> time that I have to test arm allmodconfig. But don't feel rushed to pick
> it up if you want to wait for a formal agreement on the path forward.

Thanks for the context -- in that case, yeah, I will apply it to avoid
you (and others) further trouble.

If someone shouts I can take it out.

Cheers,
Miguel
