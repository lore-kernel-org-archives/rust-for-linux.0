Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CB134D911
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763035155; cv=none; b=ba1m+oRNJEIlyzMl2wCB5mLOwyKK9x/v5IErTgVgAryr9zrwKeK2fB7eCxWXR7OcdaAHfL59emvlCQBdgeFIuAuwG1mtvRee3OSzyx0EtW3c7uGKua1iIZU9pfvksL4LYhIyH2/3WrDCwAquGc7o8lLQ8xdsP8aSgP3LZHwBHu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763035155; c=relaxed/simple;
	bh=piE+R+DODWYPPHjD0pGzhLNR2aaWjsMLKfoosxwGZms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DROOg80Fi0Vd/+6IkGV/Jd7JAIIFezB4YKv0ugrnLFXyL87V4mfViXYwwF0EvFAtfLKq9iRPpGmxVyvcltoRxcPLg/FfzTm8547SDyC2Nf4xcV0WKZlQWZzazM9s2pdA1z+PtO6Udb7Yi9GT92jIsx17+TF4Q9tw2S5FcuVcieM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPYFMjtm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPYFMjtm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-295395ceda3so1075805ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 03:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763035153; x=1763639953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piE+R+DODWYPPHjD0pGzhLNR2aaWjsMLKfoosxwGZms=;
        b=MPYFMjtmF2zkT0JL/WICrah/g+d8C+cKznJ66MxhUhaBBUiSMf6DC1Y88EcTRxtspz
         cbMBPw/uaiLcz24gGy/6bvfyWDU5aUVolf2m/PweSY11CDUCsPp/togxhuJQRSxw+xiO
         RQjRksYhbY8vUaNqyjkRhW/+pZhXQD9CvpkTjuRIT3YA7nVfXS/CgLifvXWUcA62Lrjd
         4lYrSveMLAsuMdRtrfwm3DoeelFF1cBtOhpKspqAStpqhN4FL8g1WpDRm6LFG02SHksM
         6E1baFBn8jKFnmINNVyG91yaJMfLnxezi5rs0wxBljPSYomsZQAtFFYIqMOccGmm+XT6
         eKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763035153; x=1763639953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=piE+R+DODWYPPHjD0pGzhLNR2aaWjsMLKfoosxwGZms=;
        b=C3JzOgdvQXmNWUaLe1j06hE7iFKQr6xBfX2MF0D2xo0RbTQNJ1yuG41z6V8PsnvuRe
         EIsJjrNGyvtzZZrbo1YNFVdLTUkFDEWH41GpOwHnkPyTT/vYIy30fvG6ELokSyckYPxE
         pl8YoihIjyDp+KGh38EqXyzGFtrQnW9n1SUsWHTquVpeDgWBsOQHQARP4s2dpY8rtL7/
         NSm+67naR25+kcAmWEAOGN2vjx6UzCll5zIhDF40s8UbK/cvkF5l+LhmvGXHksCBk+nd
         0c2daRTddM2nyYYzGtd45J4hbltcIabbdSpnnEcrimHj8qJ5SqPX5Ie/ZqdNyq+78dJq
         vVIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX11MBUUMT1WaOSxOyrvnH2Oa8k+L7c69gdRHh82E98r0zG19yQWqWSPUiwi5SKqM4uNT4Sj9qwIEiMf76lYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoL9tNKSQD+0CkF32Mji2zGhUYIERhlz79MC9Me5V/vY05vcrm
	bBOdb2juFHlkqyVqz5V9Zcs4y52jqF/EQgV2F5hSw3kA8vzGEOUltxrF2SNXni9LlOsFHmpQcOw
	M8i4v9oi1Lmf0RpH2DzNtLiWmWVILUv8=
X-Gm-Gg: ASbGnctrHpYaBVIgYrpINLr8y1CN6wd16wmdXKQqylJ06Iwnx2uivpP7VsNp8os330H
	LhrtXQuL/HPvjk/GI/N1HUiopJUettz6pOzJSY1TJmOBhojplNM/seBXD5WiOQ8VAjoHolpJyEp
	giYqYsRftD5QLBTlfAXd+eF3Q3xiI0qKTM43e1D1aQYLByimpBE+uxHX1NkcMJsmWql4No1bwWm
	l88yLGqFqd96WljhZ/OUjUi4LhyOT6lvNLJNMTujFZlP4fRTHT/Px6Pyo1XR7ydabg/EP9BS9P+
	aHl9E4z3iXlJz6y7lBjHHBtq+dq934BP5arsqrjmrdSvuLOezPbFmZMnywh/zWeALSe6eM3yBKv
	OxUM=
X-Google-Smtp-Source: AGHT+IH+D8mikItI/8Y6u4gUIPrRb5tLtmrJuENgrbMSvZ0tfOZVAyP/NCtfZ76q8QGb2mFA/ILYSlBWkwz9/2ETygU=
X-Received: by 2002:a17:902:e80d:b0:297:f2a0:fad6 with SMTP id
 d9443c01a7336-2984ee1bademr45282445ad.9.1763035153039; Thu, 13 Nov 2025
 03:59:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113-create-workqueue-v2-0-8b45277119bc@google.com>
 <20251113-create-workqueue-v2-1-8b45277119bc@google.com> <CANiq72k1VqR7P7tY2V_siBQZrNXf_ck5aBkapo6M_6X=1P+nDA@mail.gmail.com>
 <CAH5fLgixPsBwqFdY-ku3AtGQHY+qa9m5oqMUshqdob7nzGQpag@mail.gmail.com>
In-Reply-To: <CAH5fLgixPsBwqFdY-ku3AtGQHY+qa9m5oqMUshqdob7nzGQpag@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Nov 2025 12:58:58 +0100
X-Gm-Features: AWmQ_bkW9VeZXUswN2jzNBepz02JOobTrhcASJoPSgwdewJn2LinH9hrzYbmObg
Message-ID: <CANiq72kamBPnWFg0nBCe4_mcmd66vW86ryiQnV_mTsnemxmjow@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: workqueue: restrict delayed work to global wqs
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 11:08=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> I could go either way. Without the next patch, there's no way to use a
> non-global workqueue. But probably is useful to backport anyway and
> there's certainly no harm.

Yeah, I would say then let's propose it for stable to be safe than
sorry in case this gets missed later on (or someone else out there
uses only the other one etc.).

Cc: stable@vger.kernel.org
Fixes: 7c098cd5eaae ("workqueue: rust: add delayed work items")

Thanks!

Cheers,
Miguel
