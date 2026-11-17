Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953026;
	b=Lt9DOSp8/Wan93LlOT6vHcdbGUBtLtZxse1L7/pDKiKYxhxRcnVTTspunRhSN7bUUPi0
	 4U690Wi2THszGL8sH0Ihcr9dtHWwJT9w544Y42mBYM9YbjuasTDujOOEzpPeHYYrO0SsY
	 own/SwICsrzsoh+QdHLphkBacu00yxTdHkF+3Iwjhrmz+FywPB2eB3xKM6lrrCj9Fmpkm
	 VAL4hJ/04u0R+tKNmN+SVG7S7wuVJhYuZ0K/s3UMldF5rwWV11OCFTZfKoUsG3mcdpwTv
	 eZJYho1xBhIDirUguNn28xcyvn2Fr6Ye0wRjAjIQa3ZgI/VYWzXG7etd+RXSFaGCDqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
	b=trB8B12lXwaAg/Y7/j51dSwF7ROPs03NKaqvFEXHplljenex5IbnIt0c586JosBRBOGk
	 S1GJ/PJGN/yHtu7LtwO5rCQ0grtcDTnE0befyX2Lo+a4CPgV63bdsDrRHKrDV6wgoMVu0
	 Inf7vrnQB0wmVOwRxvTFJikXCa3Zj3Rdp+5on+M3gJTm8fwOeoA3yYowun5kv0vcgcBzN
	 MR/0w5T8POgKcYNERePSeX1uFxcMAKoY3inkbWe1UWg+HWGRZx7dZozs2rSjwJ+DR95OA
	 uwSmOcqwOaZD1ZViQXFXjb23CE4OesrGIfuJfGuWihP4HokOdHIBwRPW3ebjZwRxQTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CPP46e7p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A47606A330
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 22:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A47606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CPP46e7p
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb62d40736so14875e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 14:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953024; cv=none;
        d=google.com; s=arc-20260327;
        b=bgeSYtAC1ZEvseyjI2mHxe/zTnHMTCexgRCd44UU9FTnpZw00E65x65WoGC0hy8ySI
         pAKqnwmCp3KeAnoKuXNwTEUUDYbU3B2Ew7tWIHbrl3+Y6xvMkS7aSm0791ol5uc9Wb1V
         o5SPqWSXn0JT94F8gTrVFlH17UFYC6KBpL4Qgt3BUfWXLpzconz1WNxPizpH+oR14BRe
         Bl7u539Tx557mb0fMoX5s6qRz1e5fYyyevW+i6S8jHQX28AXd3mVHEJY9f8cPEokP//V
         AYnTMFhd/VzZrnjHPPv0kVzWKf2mLkA4fUMaixD+bKWcOLco7SuaR7rCInPGtXKr9Bt1
         SleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
        fh=nmLKMfhH2PtKXBG0BdXGS8NB7KJW9qW+2ieB1GVlsAs=;
        b=rtC4lvlnfLGdJmjwHlEkGy1uC7Fah3mo+ggp2z32c4RVuSHHqLhYXdJNtW1zGTR1VU
         KLzByiXNs++yeu5TCI22MRzeSkw+eHTXL6yXe9o4dC63ep5vfePlXksvUwVZ8Y1M1de0
         24s9MEIf2abGkFyE8KsC8P4hBeE4UXAvfhqJcPO0apuuC3N5cDIYlU0NmI+m/GtQIgX5
         RFdQKdmBGZu/wwY99oOgR2K3184gArbgFR+YYL1d2xEH1O49XNdDk5/1hAOITAPrv7++
         otMc2ItGFVqIWSlj57MIWKMp/n+mWNoLApEpQFfaAlUakosEasf+GvOhsCepWSini5eR
         1oxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794953024; x=1795557824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
        b=CPP46e7pW7D2EKCMhL3duB3Ttj1WkwUWH77GlFJWMG3egP2uW2EDozE7j0KlFfbu82
         vmWvZt+shRzbBb568r3W4oZ3kkanu+oVMm5uNOCMvdPl0pWGQkpSULb4Fcx65nx/1E8h
         1tjcRex227rHDsOXrHVd/vxcifMXCkt/PZDBFmmEYoObF6RbquX3XnSuq8jShWRlwaml
         opPHinrD942cE1SfNWFs7pFl0GS8kXIMGFpnwg9N/vQRAsLx4OwT9c085sZMxx2jDVIV
         skQMdpBFaqiPwYTJKe5pDaLkVpzIT8aBefHYN0V0L/pvzClyZrCrFwMIb9nOaeF3TJwg
         mLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953024; x=1795557824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
        b=kkGDa0VJblsOgyosCYwT5lgYvZ9XThSwVcJrcZIfYeUZIk8cTaPtCoo4Jh3niS5Vv/
         nH5+qduYcGCe64U8I2gnr+MWKB+ivPdjOmzMWbjCGv/u8y7uQKA3KyHWcgc1yOaZ34FG
         /KcTi5gVutY3DzC30ceYZN/J0xEfQG5K4xBo5MOL+xbKnT5GmPtPHY8eg97l93ckW86w
         GV43QOLL8+Nybnnf4zpFtHS6TXBsTsjMiJzOmM+EPOv0yuny2ECx5wXx105DrzuFaXKB
         fOkSGhFIvjxlmXoOAWR02msmGyImsKtZaW8yZFQ+B6YD93ZNZPWtAKfKqsM2AjOdLxE1
         1Xag==
X-Forwarded-Encrypted: i=1; AL+hErHaaTTvruEAiW4J9pY23vWWHKps0CEUKrfLTgQHXEcEN4dehxF/YvE170yaE2nY4GmqWbcrZ1e7gI60niy8vQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9L5TvVN4f2eHG+dp8yiVtZM88jSi+V/O4HCu8NBAkkax3RZCiD
	CBnm1EbG+KOYjyIx6Pip6o/F62ICdKUBBqPIwwXWpWiMSIFjjB9/38Qg58kX2o1A0pSiDFjxsZL
	CYJOd10CKQdZgrVxgCoG9S5rA4wtAdvxgcHRhzyog
X-Gm-Gg: AYBFou03OqrGnkw5wSMZ2R99pzEZyYntgFZR0GKDzbWwM4GVRqsstriZ0nRGUGLx5xs
	4AtIBL8I/uVYWPzSBiLh4G3juCm3YdCYBx13v/0R5VSZRGlufPyrH8qNS1mHoh0xlkNAHG9wINU
	wcjGTeYpoGz2yPz8gJE625gFzhKLLJdR9kiGfpqNo4MclZUunBPNm/EwtIwOcupxpfyLEIVyVPn
	m2PU18xx9pEiowCSyu+GM+wDUmRHnq/+UgZ98mB0QJVG49MPpmRRg55SNJnc1DMJSD8nGg28E6C
	y+kAKI7zDvTEXkj5PR/2NoyRDeTexCsegOzvpZpiLL/l/1wMQJPLMzJy/IuOvF/hxKao9tbGD2U
	CwAJfib0Pbq1vNuL3YXVHyEuuW4MyAH89WQ==
X-Received: by 2002:a05:600c:8586:b0:4a1:d225:6d7 with SMTP id
 5b1f17b1804b1-4bb7d58b5f2mr160695e9.3.1794953023558; Tue, 17 Nov 2026
 14:03:43 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
 <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com> <avy_9SPRaPSKD8b4@google.com>
In-Reply-To: <avy_9SPRaPSKD8b4@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 17 Nov 2026 14:03:06 -0800
X-Gm-Features: Aa3M54obldq6YruWajcrqkfkI0bnKtN_pPopxVMwZ7IRPXUGwGNOW9PukA8ODCo
Message-ID: <CABCJKue=wV7gx5D1PuBWOgWnAFC2kzGSFSqshun3=AoLg6b=_w@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Function merging should also be disabled with gendwarfksyms. It causes
> faux::Registration::as_raw() and Page::as_ptr() to get merged, which
> incorrectly causes the former to get the CRC of the latter.

Sounds reasonable to me. Although, I assume this is only really a
problem if the functions stop being merged later on, e.g. because
they're no longer ABI compatible?

Sami
