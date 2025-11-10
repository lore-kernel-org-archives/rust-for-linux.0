Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3563081D6
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 10:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770388; cv=none; b=oIUlwtfyBLLm0yAr89mlT9GVxvkxEzyHMxZpXgce/Om3g6wuCgDE9HU24Ml7OaMLS1Zl5HLbI0hUfzQ2KF1s98XKDzxmaaEFGn1Q5LsJ9EpnIFzr7y6DlIi1rnYrnzsf9v3/UnaHgDEmQ3kYWuxEOZnPDxlMzETwJclhCr8CiGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770388; c=relaxed/simple;
	bh=by8TIrFWHwZKFzoVR4uqzhkqjIaA/Zdl/PpOV94g580=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4ivc55EMxSX4glqAmHjFapQsayyUncv/7R8tft2Zz6FbWTB775OWhAYYNGl0leOR2YKhXlyPilFUmE2zivI1/mttLeuq4ZDqIRq1y7ENJbigQv6sTAmjio87a9AMqIdDTP78pVS5rEyalBvoUC1OL4EF+HAomCjonqNcL6JykU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gc4DnVVO; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gc4DnVVO"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b997ae045b7so229401a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 02:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770386; x=1763375186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=by8TIrFWHwZKFzoVR4uqzhkqjIaA/Zdl/PpOV94g580=;
        b=gc4DnVVOk/dfuZn1UleCdaHXfRnTBzfLJQEG3n950vZW87rU9m7oAxZ9a2ka494it/
         non9nHrPdU9AuYzGS2fHnhhGXn1Vwc4WRIliZg1oRuNu5pw3Of2hnD8ssKj+AdxMhJqR
         FV6eFQmJ+GkGBa/ggp7yDAZJ6w1SLUAMJeuzwRUowqSs8weoa/4TAfZlsoGw+IBhlbgE
         xrAS0K7hX08X8+TM7OMg9SNn0GYB1WZBkvUh21OvIbmziYfKu0kWhyxNlu73JHDx6TzV
         k1APV1L1MBD36ThfwZVsiZU44NcJiGr3umtzinzo5o4DsTrZivfST34CBOIXLxsPB+um
         F2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770386; x=1763375186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=by8TIrFWHwZKFzoVR4uqzhkqjIaA/Zdl/PpOV94g580=;
        b=WrwV5leVErRe+rWH1dtTVcawHmYgJk24tqT/7iQ991KuJxkzQGPw3VzQbrobIxQ1lS
         EBocO61LvfLPvJlYRQY6Rxmt994OUvoUbQE+46Q/LoM8jpSDDlOCO8e5OQL42m5y3x6O
         rzP0WzEHSNAW+Tf/AvZdbwir3i9398U8SgsKc9ip7pgQf/U+E/c6LkVvvb1KRaLqlBBJ
         oS++1K3VGDASiCeATe/7iezTBpwFUwcP5LUKZVh9RWRU/O71C/EzsMIezYJod6e1gm8N
         Lyn1ZmLbRQXnPukipgcE8GoHyi7gTbfNPtL5OGFCZBHLdmuBeuHTYgpVnl9TKRKPBCaW
         yDIA==
X-Forwarded-Encrypted: i=1; AJvYcCVWjuyVVa16gilev6y3usKL0oLIEYltZYfNFXwWulUPp9UKS+0WpmUW2uM8MdUR63FTHrciQo0aWe0EaRPXGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxJ6c0ciM43ll5k9l6iA9zMOzW44++/uqvtSiC7tPi+jw7B+Fu
	6xHvC6+/KRhakajQQDLasI+qrhSsFRY/t0bfcSmWOQrEaABWcmhyML4ARCtz6Ra4Rr2nq9d44AR
	DhUQar9ohjX9LFXNoiS/LU2XxWipMuhY=
X-Gm-Gg: ASbGncuDMgasVt6H03mVnn0oMY2TnGn2KsQLL2Zfv6zn4euWzCST42PxltG3bjGNVOj
	CSrKgF5FVmam4j8lIndUvpXsuu1XnZ2llKdrMGN1UmRm3PU3Cv39Vza26TFmwnyJkWNXqBFf0in
	J5FWbm0GZj+3Eal9L/w/f6PodliPXgjq4QQ9AP8HXYvzWPFivLY1WsbfJlkoxtiUyptl0gOTVJM
	SPKJOXvyhcJ7Dp9iFMpONvRgFP4WOn/drFaKsmifv9qWSdzx3uNrRnu+aZUrVw9maqyQKJN7UD7
	L0i90gbrEOmuKr1feXlUahU4ME4EUPWfum8oOqMmP/KY7KCmEltlyUJ+CNzsmlg/6FvJS6nRZ49
	SrdA=
X-Google-Smtp-Source: AGHT+IHj/Ik6F63wXenE2lPX1U/3plGIyl6aQSJtE99W3m5oMNrVCs+apSxU4qv0V2MoDNiFGSAPl7exsm++cKNsBSE=
X-Received: by 2002:a17:902:d4cd:b0:295:a1a5:baf6 with SMTP id
 d9443c01a7336-297e56d674fmr53416745ad.6.1762770385914; Mon, 10 Nov 2025
 02:26:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-15-ojeda@kernel.org>
In-Reply-To: <20251110095025.1475896-15-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 11:26:13 +0100
X-Gm-Features: AWmQ_bmNF1aFkVdyK0tmwwbxBOtgx8yYVE_IklxhPzUh7f2u3k4oJdZwWsz3eYg
Message-ID: <CANiq72m=dacZijsyb82HYRWc_PgzBOQA9YCSJQPOkUT1O-y2gA@mail.gmail.com>
Subject: Re: [PATCH 14/18] rust: syn: import crate
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 10:52=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> This is a subset of the Rust `syn` crate, version 2.0.106 (released
> 2025-08-16), licensed under "Apache-2.0 OR MIT", from:

In case someone is wondering: I didn't use the very latest since it
was quite new (even if the diff was fairly small).

Same for `quote`.

Cheers,
Miguel
