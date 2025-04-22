Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C04227D789
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330979; cv=none; b=Whi6X8RRu7QpMeZfzmsdvOFqeWVJAvAV21QLQeLWU4L+jseIivj/f6L5Lo0L8q5ThaTawf/RKmqLOxc+lm6sVdCNh4xLfjZv+BEUTZ008KrovKXSKkwBOvk6o3XYKrO7yBBLiD0lf4syjuKIyuxXjTuVFTTgpwsu+4FTpLJW3u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330979; c=relaxed/simple;
	bh=nUBIy+i51QSYL7IJsatUnmyU8m9DmJceXIUnZpp25mE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxRVlXD/UsI4/ERNVmOZgGxZ6p2Z8BeHihrK4J+TE9xTo2zgSJlFlwg97imsMfUqa5RSFti2L3zDTscTlNfiGviSzUGWQuoWtcW46/pMvhxCjqxcZhSj0+X8Hk5Yryk4lAWSGHtclFk1mzutV5J4mCvKp6y9puGpIAjyfI0qQas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u2c84qCa; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u2c84qCa"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so3279350f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 07:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745330976; x=1745935776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUBIy+i51QSYL7IJsatUnmyU8m9DmJceXIUnZpp25mE=;
        b=u2c84qCaEaDJi6zertXrh2sVzOPGL7TKc99nPyBGQjR/qhSkM3TAFXb/Tbzmm/2HDh
         gvuZgTIJsdoz1A4ABegvd/D51FhyS5NYyVQYxVBpbO50FsiomVNsRcyxe34FOseBsFoa
         6d8yHPzld7eZ+c05QBtM7RF0K+Qil6G3WagoSBwyO3+9860QPmkFxEfv64f/WBpv0O5S
         qO4TOiMoUuHTMW6hqvlTGoPWXi4RYhY4YQ60I3kCEQW9LOWRRNWwdpOGxsJ/X6TTj44D
         0cR6dFl7fVVkaoQZ3ku2ml9g52viMV75VSgu8gxSZmLEVs7UrtgS2dMrtBadHXlHKHC6
         /mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745330976; x=1745935776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUBIy+i51QSYL7IJsatUnmyU8m9DmJceXIUnZpp25mE=;
        b=OfZcIMosAa4IjgJS3+auQeuZX53FTxm5gg/HQWkWrN4Q+ciMGkqBfn3/L6FFQBpegU
         2C0j/HgFDtzLLGDnNCdEOV6WJDucF5XdDfHNbx436yxbqAIY2oBAU/gNylLGKYSnpblN
         8nJlXrlmYvgdbHIsOM1T8xrwRsGqJXYXMqtf0G+N2YEw5p8fuoUgQ3Ahsuvr9OJVaC4m
         zPPCMmGODrZF41ZoZdbLc5ZD1CFvYJ6ENcT9AVR52iTyiPIg9q17CnVILJBhbRvQteWc
         evVA4iTMMq6XKxImbPKBYkEhBgr+RneR7puuzkDQoGpawJgFf/JprTt+eI9SoYslOdR9
         HGuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+DHIflmd+DmJk0Wr/ydXn3wIV5F66/9V5SW7Vl3McA3xHEJp2pKAlY6gnY58ReeVbjy4L0/PlM+wVxgZkkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpUJJL5SnJ/wOuudJLGmU6FVXBGo1Htsgrbg8lVAXVIxTUxn6z
	b0uvyL9GJD9wlHm0505uRNE+/xfjkMpwM+Qz55+nye1tbOVAWvq0grTEZ/kSQE3A9Q6tnjvZ/YT
	osEDDN2WZ/P7BJiTHNjjtQ//AZ39LhTnZg61O
X-Gm-Gg: ASbGncs90PU5rpicwZy0sjFMI+RUoBNmlxRuK/JMy433HEg6Rc1s36IUqHnLJ+n9TbI
	evuIcaDrPepMwa6Yc32fBXPPZSkfOb/DppgdZ38oNC3p6J/FzGGHB0C2To9/LXQjkDZ+L7aBocH
	AbTnMUtyuafq6qICfv08waKunMqA9NsPR9M9CefBwFIU38eH1knOTMBP3DwS5V3qY=
X-Google-Smtp-Source: AGHT+IGwScacxzzijOMYqxF2+IsuIQ4NgmXseaPx5XZpHVl/ayR+TnwBKHbV/nBatZSqoI4Mv/F9u+SkhmnIKJyE7K0=
X-Received: by 2002:a05:6000:c08:b0:3a0:65bc:3543 with SMTP id
 ffacd0b85a97d-3a065bc358amr191420f8f.35.1745330975703; Tue, 22 Apr 2025
 07:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-list-no-offset-v1-0-afd2b7fc442a@gmail.com>
 <20250324-list-no-offset-v1-5-afd2b7fc442a@gmail.com> <aAeiv_mfAT_6DwCt@google.com>
In-Reply-To: <aAeiv_mfAT_6DwCt@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 22 Apr 2025 16:09:22 +0200
X-Gm-Features: ATxdqUFTO7mUJE5Nhep9GfGkL2sugL58qUOhU5o43dLkiY9ui4CHl0bP1YBoKaY
Message-ID: <CAH5fLgiQJi8UhPcydPrkbjWO_--m=z8K=A9xnn33jDRYwT0+eQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] rust: list: remove OFFSET constants
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 4:08=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>

Sorry this reply is to v1 by accident, but I did run the test using v2.

Alice
