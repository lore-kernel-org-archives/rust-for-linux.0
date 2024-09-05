Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D1419885B
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Sep 2024 08:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725524373; cv=none; b=it4gyBPcSoH6Kd86MOWpu6BccMjpBrSr8HKdz50OmmdK/w/hV0/KO/u24WPzy9WueL+H/X9FHy/ZNb5Mupjj7CpKqVY2Ihf9W5UOzInZTdoyIL/457fLUIqEYRKJF0bIkZfRmXeH3ukfzjeUMJiwxloGpmqYFMOOwQm2SN0WAPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725524373; c=relaxed/simple;
	bh=+BWzxJkQFe8ihuC1pXeT6ySQPYwRlKg+/UwNcRKMcxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njNRA+4hgSufrWVWPUadqBtpyRktosBmTqWMsfb+CjmY4VSFAf/yX8sm+8DpTsGwALLQIClJvoYdH50fHKDz67x2vNISzSvAFtz2xF1pJ5LvTsYhGKPDHHzZjSidoe1sqOkA1jkIyHdLwcRUtItX172N9RIn7EHf/W6qO+z+qCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e3x/kxrr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e3x/kxrr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42bb885f97eso8921435e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Sep 2024 01:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725524369; x=1726129169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BWzxJkQFe8ihuC1pXeT6ySQPYwRlKg+/UwNcRKMcxU=;
        b=e3x/kxrrCOCNnNuzQQhjZMPaFnaFEjcsJJnlgFjMtBWnBPy7p8sNmNHx5pICdhXlyf
         R+2uq2cIzuwNNAnNTaT+YnOcxv6JHTclQ84B8Iq52c6JFHWm8JXGtOi6Li2D98p/JoP5
         F6/U17Mze4c3lMD+pHexoGJ1saBaKKEUjKLCBxNlphwbQ4MH7faZZAWScZCfU0AMIi22
         R3oVGCVWiM5VA84qBzQby5ep9cqqfUpnPkxHm/mRBVW/LFf1HNib7uITNdHANbHJ9UNK
         vg7H8+isuh5uw/cwtOvY1BzVq84bqBUn/vDANiHk1h4zMg7Pj/xT065VBrAONEFs++yF
         EXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725524369; x=1726129169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BWzxJkQFe8ihuC1pXeT6ySQPYwRlKg+/UwNcRKMcxU=;
        b=pdI01DSPgBtc93deJkJMeFI65JpD3Mu6i0wr++gMSDOmYnrDUcuCTUipf4AypCFdhv
         hSmgH+Dwt+CVJxNweOJqpvvNksRpsuyTZgVNGSag6BifSoswTS0aHHH+Q2JtZywC0jEO
         v4P3T/u2NuEbjSsEloroafOfGiG5Kl9uCQV+eLUcMjcDCIXcdTMlPGj5fuQ/zA/FXeis
         HnQ0DAUY+1YDViqrt7dN46ZS8xdK6hntFNFm0bCAid7BHA3aGGW+bsOmXtcQRubUthRA
         iuVUt9KxdrG5oRoS4NMPoWJuyZCYVB7DfMKRSxP3auO2I+tryPuX/N0PDrDUfzAaKPLZ
         Qxug==
X-Forwarded-Encrypted: i=1; AJvYcCUOrLaigZABOA1ey2ZoG0lVEw1w8j4cXTMl+6G1u/3H8lIhQvPVD83WS5K0XUHHZEryXk2KaFkS6f6r6Pxpng==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe7/D5VrN78F7s9AQ6SbcY/ptKYJgzYebMovCikIF8j4aYra3y
	nhJmvvlyAy3KyRXecbLJBfMGeqvQ3ZQPlKKBGUMMWYUDeEg+4xKRi9D9lY/To2iNqF54a1FxyEa
	S4u6YF9JLle1HY+/lHRe6QvLT3GADxvheEkGD
X-Google-Smtp-Source: AGHT+IFNtCG98xrOuozxty2PtnqpYGo4wzWpPlBR8g6UOkhcb7n2BIa3h2BXieak9ydWu3vH4GF9VvFlUfjcTo8Ol5I=
X-Received: by 2002:a05:6000:1a47:b0:374:cb8e:4b43 with SMTP id
 ffacd0b85a97d-3779b37c460mr2850625f8f.32.1725524369228; Thu, 05 Sep 2024
 01:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-20-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-20-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 5 Sep 2024 10:19:17 +0200
Message-ID: <CAH5fLgjfxSOmnPsk_673qNdnpVoj1W11LD+qgKqBG8J7sm-u3g@mail.gmail.com>
Subject: Re: [PATCH 19/19] rust: std_vendor: simplify `{ .. macro! .. }` with
 inner attributes
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 10:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> It is cleaner to have a single inner attribute rather than needing
> several hidden lines to wrap the macro invocations.
>
> Thus simplify them.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Are we ok with changing std_vendor?

Alice
