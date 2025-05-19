Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A537FD
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 16:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747673355; cv=none; b=UvKeuxnefOJlYSdRIFq4O+d8W3x3shQ6K/re8kr+qKxyVR3R8qodgyHz2Zh0z38Tf4Ho+QvhUKmfQBy23wjOcm7yNJLAGpXRSLehSqu5krv4TiQ5cBKieS29WlF5K8a27wbNbcNCDXHg/IbN1tAD2tnQjKGOdh7bWSZJN4Xh6qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747673355; c=relaxed/simple;
	bh=Le+twhHSl3Ug79d+ec7FFvAV88ZY5+7Uzstu+LL0Yko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kp+JJCEZZD7kQwR2l320t0AlWry+4nvPUSN99TwF7a3cwiYiSXMXlHuHEsvizShNMHO+OQEGJqcb9RZOoyYhlzpGLlYPB6OyHg1HYI9S9SNDO38X7GBJlTZXnJp4qfdSYtSS31KmFYKilEO6VVpAepBv52oeUsDdYKwexybnHv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSw8EUve; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSw8EUve"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23179999d4aso4834115ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 09:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747673353; x=1748278153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Le+twhHSl3Ug79d+ec7FFvAV88ZY5+7Uzstu+LL0Yko=;
        b=DSw8EUve5ZOiY0mZom2OJbhDbNU0/6HvkuGfynSy3ZB9j91HvMHrc+skxs6wrLmNJg
         +/M0ViJLrTdKpUo4FZGYuRfRrXbDfjZquVu4AbrGd78fJvao9qsZnGQYO96kk9gNWYGz
         p9CU6cK7C+Frp0nZkGzq/cP+XtbXPw+7x/fBKIX73BstCwvOqFHybH6xytB5nXScERK/
         L9DVfm3nGGynIt8He5bOCWeWoD5ec/CdP3ZOySYxY6UufzYhy4Z19OSaCLuZOddoIvxz
         6HGue42F7N+5G42vb0OXdp7vXwdDJbQYDBVptf0b4CejXSFkIB836iA2IlNtME+vM82M
         EDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747673353; x=1748278153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Le+twhHSl3Ug79d+ec7FFvAV88ZY5+7Uzstu+LL0Yko=;
        b=fHm+MT67rQ1or46cI+Y9QHqwHEXrf8QHlcApiNe936bZJg2bgHeWO/1JI7AhM3iePg
         cmu8BCQdU3l4SWGkCUe7Eg6MyyBGcRnp/HLnT3cFlnOJpQw5lzgdr9UwI66JObu4vEtp
         5d3cKgY0BDoPXqSurjw6euyD6UM3lkmGkYDLe5g6+s1B37saZM3e3RUIlWt74Zxi7Wsj
         KFcgw+NdwjhQ7a6/RHiWg/QEmnW20sCS8xNlhxrAcyqO1dgdaC2xYnhKSEqdTrNo5sw0
         eUyjZO51sVpHdnabgHMPJJuMeR6Be1ggq4xQfBPGwhhWKRpPHJ945/9z3ug0CitvXu7v
         a6jA==
X-Forwarded-Encrypted: i=1; AJvYcCXl2IApGE5LDI9nyOPtYgV2sTvS54lnzZaZG9Yad7sdWWDbBuc3kmq3BADJzUOopRZ0wUDtXgUwreRMfjHp+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0knBBjNattS58sapNWt5WPAdU8tLeTRMj3F+/hl9vubMKP5eC
	kGEUiJntYAE3m+mhVTxdBhUp6Q5k3h5JydWTJDyUxA0xMKeIshsSHNAyHTIO2m/xbbah2EhcAzz
	Y8V911EU/egiDxw2Yj+9YDlOO+GcfKoY=
X-Gm-Gg: ASbGncsrwkKJu0UXWbLssETrKv7TlYUHSxs+nRSbgKbnjmsnwoKjoakAijAFXrNjEfH
	6ef8Mmv4QAI1H1XZEcYjb4ENlC/SXOdGet2P53S8m3yeQi/KRAiIA7Hq6xlWJ8vEKz6rT1rj4cj
	Bsg1WCZVO1/bptLFseNqS2RIOTlLM/sBNz
X-Google-Smtp-Source: AGHT+IGZWoM/D74+Hm9uVCrZVkiDfq5Z8Rz2/KfTP5lJCEZifMNJBnxO/MbLe3Q8C4/dQjDxvfpP6GBydJoihP59IRE=
X-Received: by 2002:a17:903:1b6d:b0:224:1ed8:40e9 with SMTP id
 d9443c01a7336-231d453569dmr75140045ad.13.1747673353116; Mon, 19 May 2025
 09:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516122349.1944895-1-igor.korotin.ref@yahoo.com>
 <20250516122349.1944895-1-igor.korotin@yahoo.com> <CANiq72=ErVyyszgnH0W56Bjvakvdcprh-Z0pXt+Pc25q4z_Afg@mail.gmail.com>
 <54a0b100-a860-4c73-84aa-e5377bbd692c@yahoo.com>
In-Reply-To: <54a0b100-a860-4c73-84aa-e5377bbd692c@yahoo.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 May 2025 18:49:00 +0200
X-Gm-Features: AX0GCFsVbto8ueVH0myea0eO8B1u1cGvhDc3PMNrZtA3NcyBbqmNXQeocoEbxg8
Message-ID: <CANiq72kU7hw5GumRkixwQ7CirpmO+KFmmTD6CLczmX902=_XSA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: macros: Fix macro referencing core and kernel crates
To: Igor Korotin <igor.korotin@yahoo.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Benno Lossin <benno.lossin@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 6:09=E2=80=AFPM Igor Korotin <igor.korotin@yahoo.co=
m> wrote:
>
> This is a mistake. I'll drop this change in v5. Thanks for the review.

You're welcome! If you want, I can remove that change when I apply it inste=
ad.

By the way, I would probably avoid the "fix" verb in the subject,
since this seems more like an improvement, and instead use something
like "clean" -- if we consider something a fix, then it should have a
Fixes: tag pointing to the code it actually fixes etc., which in turn
typically requires splitting the commit into several, adding Cc:
stable, etc.

Thanks!

Cheers,
Miguel
