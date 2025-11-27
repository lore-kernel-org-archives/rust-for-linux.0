Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CA233859B
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259877; cv=none; b=D2MM6aCQA+9tdNiMoMXQgXGIwaAijaeQQVOs6SeQfZW/vwluUBecci4pQNhsKRp6EHk6M+9gAthCpxDg/2jMSBSbKF42/nJ+NegnZP7eyrZYrLN9Dd53xxFqhjyfi27Wq7m7wel9G2aolN03ijvCXZ/PXMCMnfHID6ag5iO3CMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259877; c=relaxed/simple;
	bh=soAvbg+KTnZzbZBCJFV3GQ48tWsgmVN8v2pzSo0Nea4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5xPehSUSGZbljk901Qvajy6SkTVk/F8Er0/Nv2UPgqB6zVvKJzdWNC9ke3U0beYAGhks3EWB4Jk2SCJenERK4yN7YUZL2RkSbkttYRys2ni7foS7bDFB2LyO3Kv1ENQ2wAIRpnt9eqK9AcBL1er6oFvGJBHVLyxTNSGhS8d82E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pu5HHLrz; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pu5HHLrz"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bda175a2013so81991a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 08:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764259875; x=1764864675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soAvbg+KTnZzbZBCJFV3GQ48tWsgmVN8v2pzSo0Nea4=;
        b=Pu5HHLrzVWaFRk7o2KG7h2RQdgcsUE6u0NduOfqYD99ZsgU3wrTajiRUolYVliRCg5
         seIuUuECEnaXS6LxtZu6XeSIn9H5cpvtyyAemHKYDcbd0IpiNx3WSjC9t7PG2tthHHxB
         BWnZ2+Aj3cVEbEcS5kGcdRlu1/OaXuZrYEwFHzaoxuxWtpASbx0n95l8C5m2jg/HRXyV
         DPxMePHAYEaa3DtxsLL/WvfpyOYrzb9sTH+bhKFh5biZONlBHF9jvIlurfGR1bJTo0LV
         t0enQiKQ4A2jvTEc4aLZLdnU4KcYl8G8euIFOMJhdZSh1n/COkTAweANbBRQI46ULYTZ
         7/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259875; x=1764864675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=soAvbg+KTnZzbZBCJFV3GQ48tWsgmVN8v2pzSo0Nea4=;
        b=qsvj/+OLY536A2tiqMq7z7kRZp4q51WnaCFDeW+IbqA975JAy+B5aSTvdUYETrzZ28
         DR97ipnVBIhLd7ZK9lNU44jgzoek2O51HrF0mTPc+9vIxwTIiXEk2uyCBuq+i5KjvDaa
         P6xxrqdTdIKSykqDkzT9klUi8nkIRCaJRL9xhzGlx/jbaV/dugAsKKei4oXmRcH+Cj89
         Ntq3p25rBe8XvnVzqUbcy9ULWQe0Z0Nj/ohlyE+nk67JDrsY279Zv90I/Bix/xjT7rUZ
         mfHO1/jFlkVFnOCOBr4TQwFlGW8nXKuY/ZrkFppqldCJ4VD4IlxO28ujJ15wt3jWmQBi
         Dz1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFXbCj61cOkj9jjwdIBWESCQ98IyjsTXQjkoX+uRfgljtf3xcLH6e1+mZFxseDXZgetyMJKU5dzCcKvcWU/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH6UdSiqsL+w+zZ0u7PRndoC8Rspd9i3q2qhA/jbuuBDROqD8S
	YnvZLTNJOiXO+rU8HAZ51oppyU1Leob89nWjaZ2rFGp1IuivpTbuf4DFWDtrOyiB5N6+wxGYBqi
	2tU2OY0rd/3JkFvk1Jze5KCUsG9j81m0=
X-Gm-Gg: ASbGncvCEmfudeFlaDR/o1DxondpaXSyp6o+nYK0+U8InQ8JLBAVWXt7HyC8lne9318
	3TXDiZKRDEmhVYWJ4+R4OjymeWeArEzgsnWElKNzT4Ix2A2TNYcqPfKtsNwCy+0IkHRTLTo730v
	vdVl+nPa1/uS0VsrjlVZBuqxqQWTNesHIrOv+14taLVA6h0oVWAlAg6M3dP1E7fhhfh7LkfmGYA
	Q0JsYwU8o2qDpYIWuAq6ktUMK/vbHUCJVQoMbVxhcDp1nCV9y2MaVlPR305wXGKcGz2UEOaIV91
	QbujQpLDfKnbalzsZOsoJ81vebZXBPWEjz3gMV3NiVk9qKq9ePQqFssrLXVXntMAovMYBR+FvFa
	A9PI/G0oH7vPyBw==
X-Google-Smtp-Source: AGHT+IG8M+uIL0dPN76xnE2eW0lgsEynXAnduvrjXKwGpDax3qlhMqDwql5KQb8OaC7BZ6yf/4DBRO5Ns7wQ/1kScbE=
X-Received: by 2002:a05:693c:2a0c:b0:2a4:3593:5fc8 with SMTP id
 5a478bee46e88-2a719277278mr10615549eec.2.1764259874683; Thu, 27 Nov 2025
 08:11:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127-io-build-assert-v1-1-04237f2e5850@nvidia.com> <A1A280D4-836E-4D75-863E-30B1C276C80C@collabora.com>
In-Reply-To: <A1A280D4-836E-4D75-863E-30B1C276C80C@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 27 Nov 2025 17:11:02 +0100
X-Gm-Features: AWmQ_bndiBGSAQLZkqWaU0pmCUvWs_apCs5DYHNEvj6DeHKRg6VtRTJCeaDwLbc
Message-ID: <CANiq72kC3Ff_zkzvi8oBqSvpkH1k5U9vtF+MkOiWeo=E0ttt=A@mail.gmail.com>
Subject: Re: [PATCH] rust: io: always inline methods leading to build_assert
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 3:54=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> I also faced this with genmask, by the way, i.e.: using genmask with an
> in-bounds constant would trigger a build error. Very confusingly, this wo=
uld be
> randomly solved by moving the genmask invocation around in the code.
>
> I wonder if the same fix is needed for it as well?

If you still have the ability to reproduce it, then please do check!

Cheers,
Miguel
