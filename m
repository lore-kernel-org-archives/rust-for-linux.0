Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE87262A6
	for <rust-for-linux@vger.kernel.org>; Sun, 21 Sep 2025 09:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758446006; cv=none; b=pyyteL93RQHXRajJkALe1sCN8WuI8amU4Q55M9XDv3kIPuIDvXy0y2fYFuIRnpSAmNqo+EWX9zF9VL14ESNQ52BPFzie7GqsJ2bsRdQ8ZEKk6V3xDlXX1YzrH+Cyrp8A1qqsimqPo4x9Bo/kvabiQPmEzDxRV76bPoF+1PlPw4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758446006; c=relaxed/simple;
	bh=gSufU8JIF3LVsmcBJIqQE/Y8EU8O84noC407rRmxu7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIyCvvsCD9Pfg2wSBm9dfUjGPye5imuvml26gtWpEvE765YVPWCS+ugVCEfnBsg6O5fgtnp155nUyHEPVz2hvR8bwi+tLesoR/6K7xMqm5pQzDmic45oCmzfukWWCuYxnxQj+YlqZSGK4kWPuCcBcXdalTt6cZqGWSSMHbQdtfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePkpnDhi; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePkpnDhi"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-26808b24a00so6331585ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Sep 2025 02:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758446004; x=1759050804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSufU8JIF3LVsmcBJIqQE/Y8EU8O84noC407rRmxu7k=;
        b=ePkpnDhihE1To+fkVZrzDieNHd5qGOIa0i+ivMdhGI/gBrwquAUuMu5/2vujBERa5Q
         H97GCr2q+JfGrfvvIx56oIoMEY6bY4rjt6MDKLGxTI81ydMX1kBSfZClK0xGuHxarM1N
         80tfya2qk516NfUsMR5ee9gJ0O6Ilp/Vw/Ou3v4RAdRIQWWlOzxRZrYj0/7ponTHJ3lB
         s9mGjf2e6s3mARZqvVwAxSpYvHRZwEwuvOG9v0IpW/FdqBgC4i/Won0+JnQzZXOQgJ5K
         scCHZFGaF2L9s0sK0sNpzN8k9KBMqlf8yKNf9++oN0fHm1eFM2mv9ppTOe/UkpJBnbpp
         74PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758446004; x=1759050804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSufU8JIF3LVsmcBJIqQE/Y8EU8O84noC407rRmxu7k=;
        b=BZlI2RArIJorQTgvRVAks8bvpUeUP7XUAXmckal23QzBeTXY7SFZOjm5QThNFNNVvm
         N+w8ml5OeCwSPUPX4N1sj0WIdhPlZoUNaeppqt8D0hZ4vj7cor9TGRkJoGPH+YOTryWN
         5v1EZgrj84VKOAzBz6u0f7cFyAp76xRZOFeutB2bMOd4DJuaXr2HPlU8NLYdIrUPVqoi
         cpKyoCbNdiwW8VJr87Fv2Ru8HBSVoeEu1qF0L08RRZk6vcRtXXttOsHw242h8krQr+fT
         Akch/wPGCDby3gP7Dd6Xio55wAtu8PtVu6RzpQL43VgMwNsMg/BnMe2l+WWvduMpxv5z
         elbg==
X-Forwarded-Encrypted: i=1; AJvYcCWZw6fD/dkFVP0F215BBX0C8sw/G4Od3Ng1bkISJkI8YlKfGtju0h4CEQdr2jFHAaIFpMngKr2qfZltd5t84A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ZLxPrtgfD2x9q+sccfNpoVAlHV8sQNtw6X2uUBRVpTYW7f3W
	rtWT4T6Dn/w3TqmRWgjgbTDMGINaeK2q8mswEt25z7trL0u1TeOti/o6GvCsA0lzxgqR9vbRZPB
	WF6pOH2gmUottCalOXwir5X9Z+Sw7Jcg=
X-Gm-Gg: ASbGnctOH8f564mbTgrDiC/SXruiVv2jl/QtCeI+Z2KO6jFodxk6jHD+1wmtFlYqDme
	hakrpN+z0s5LrAJUdszmzJRgByb+oDa0/tFOS7tnSISN8MuohrRH58ziqHfsMGYOWoBtz5FcKyp
	DQrrIxfZoatucuQcU9wMnuas0RwqPFlqgqDnitNQp38xAub4kfDpc8cHjkX6Ihqn9dhgljIjH3d
	AaTMAxcEgpVOAXxQfqFXCoSY8utOnWA6Pvlpl/w9JZCxLvFVZc68MBExY/0RIBYutuaHDgob57C
	X3gy/cpAV3uKI2cskyj4yUIP0Q==
X-Google-Smtp-Source: AGHT+IEEZBGH2IzO3aNMwNCO6HHYoCeMwtPjKVajKnUsTtgN3Yo7ThUocVDXKU0+1Pj7nlDMql8MFH9vtVpYiMJG858=
X-Received: by 2002:a17:902:ecd2:b0:24c:c445:87c2 with SMTP id
 d9443c01a7336-269ba4479fcmr71628365ad.4.1758446004458; Sun, 21 Sep 2025
 02:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920161958.2079105-1-joelagnelf@nvidia.com>
 <DCXWEV3YO443.2EUZL32P96Z0D@kernel.org> <20250921004517.GA2101443@joelbox2>
In-Reply-To: <20250921004517.GA2101443@joelbox2>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 21 Sep 2025 11:13:11 +0200
X-Gm-Features: AS18NWDIPgmAIiZPso23f_sVGWVfZ4LD4KE-nCRi77OvdxwWwOWuJ-1OW5tHPyQ
Message-ID: <CANiq72kDkAtYQ6fBb4gPEJqsS10qmXRRZj34gDWqjAQEvmXVPw@mail.gmail.com>
Subject: Re: [PATCH] rust: print: Fix issue with rust_build_error
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, acourbot@nvidia.com, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 21, 2025 at 2:45=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> But even if the pointer is a C const pointer, LLVM seems to
> always want to reload it.

What do you mean by this? I think I mentioned in the other thread that
a C pointer to const still allows the callee to change the value.

Cheers,
Miguel
