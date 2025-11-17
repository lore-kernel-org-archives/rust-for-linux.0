Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D17E30EF66
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763364371; cv=none; b=KXAmVe17etZku6wmtUdpD15tSgdrRsVY6EmTUGSh48Sj/7tYHuiiyxMrzrdLIRZXT0lX2NuiRppDxMUz9JEI+YxnqYALrWyqOXDtBdk68N5rUP7PYWNL9ZG4MlBauWXE8TpvfQ1UkREs8A4/t7fL2kQIlKAyqLpEu8ETYwK1jGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763364371; c=relaxed/simple;
	bh=+vhgx0R2+nwdQ0jhqDjY7+bnmgnFuoC37OlpyAX2iS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6gPDurRz2tR29VOi27BtIDF8M/WA4YOZKACGt6N70VNb7hBBvxhv4arncFJfQwG4/vBkbrrnqRqi7P2toRqqCaD9HPfpwb6rFDBwkI6opxvJyIDIj9rSolTbRWPBJ+sdgDmsnwi3rm8W6108KNycugruC5PuWcBrXpYJzlCn/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OR+v8Zu1; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OR+v8Zu1"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-299e43c1adbso462655ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 23:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763364370; x=1763969170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hi18ADCLMdmNrGkhvncpabdBE25t2pUlhbnTlAMD3k=;
        b=OR+v8Zu1KqtuZuCaHVvodxsUV+Lh2vC/g3p+gAvaRZiaGr494hK0l7f+xJH50Z+HRT
         QLH1Do1pd5q+tlBHcZ2ePzx48UCnu6WzpaJh6CWPzhk8NzhHtlK54Y3zOXsPLGsTyTaD
         k8GMfnUYkJof30V82UMqLZJQeBqwb8+3VUv0+O19Xtx/5KhlAOkT/5GYNOJsUNHpzvdK
         cYTBOSCUbAjzpZVZmTlu51D0oqmaLH+heMc6fXBHNcnW6G7UegT5yoQfi52NAPys+MjD
         XD+6HuSW3ES3N50ibzLHy6b02fIFaZ+F8RyqUYCuo2yhsefSdo0MUyjMg7d2J1bKZHNF
         gp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763364370; x=1763969170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5hi18ADCLMdmNrGkhvncpabdBE25t2pUlhbnTlAMD3k=;
        b=dPhLDMMIZXfyyxRNjr0AoVs1tSHgTHEpmnwPz6pWnnqdh5eQXNc3JTxr/EsP/BZNyk
         4/0i0lxcDp+FyaBqxAHlWaHxebIvTrPCPmtSt1QqLuFdPgWK8ZT58LLV+Rr+eIXyvQMW
         IqKpZXEVMeYLM/1LAXw8SrxvlOmDJOLAEnmTWmOH9zoTxSLtdHqLamdSWU2J6w3yOwAS
         oIuhcpiQTLuilMFkcdazRGQDEOTp42Vn60sBMA2PcsDKkKP3oz86HASSQI9vBeCLW5a7
         UuntAFEGkuFyQ7L1BSK5loPMX/aWm/QDY3rMceYmH9+4qfyf9UvSDPSQs7Gc1sCmM+o4
         F/OA==
X-Forwarded-Encrypted: i=1; AJvYcCUV1nGbGEGmpd3JCWCq6AAjTARMT4gZyiFoB2ncKZwaiqeSxcLfInOFAQfIkKgfcjF2ZAuuknwfvG2Mo4KEqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQUwPJe1oedR9bERRROJ3YyLFeSX8A2Rp2uBgbIl5cG1cr4hxK
	rwXHlyDut8QAwg88bPlqIoWCSDu5pUbuZ9Mq7HLSvgSYoT8PjlGlC21oqwghglVCns39bQ3Jfpc
	VXxbiqz9Czjo7MzumXxcNvtiotXwanH0=
X-Gm-Gg: ASbGnctoz0wH+P4mNF+OTcOo6qgQKCWhe7YPdkjXzCJTsmwYWfwnuuDbJnv/0f5zMe8
	8Br7pSP0UkX14loIx+oKFWklPJBZ3dgsiRk+z2SM2dMjNGf+qginD1Qn4Ym0fU/mpx/4c1rzvji
	SYpsanbzZa5Qhb27JIbO5ZhIDOGZmQ5DNG+7zJBRd37dogTFRf9J0/40PGFkbx2UFyU6Gf1wMiZ
	ejja0GG47jHhZw1bVNTNq7SOUO4gPX84EZG6y5sSwGu4wUOMr2Pc8eupoph0uXDsNCPv9SgbRLX
	B2YZVBNLyGZZzAaY/xx2czY5Vm6xZXbcDE+yu92AZ5LTB3i0TCDlNozcZzFBn33bUT+rPWT2yeG
	F8g0=
X-Google-Smtp-Source: AGHT+IF/PIYQj3gjc7VlpoF69ig9CzVeFN3TyJZEsBlNeiFlQfYqKERjgC4a6WV9Yx8KiSnMrhRF9MgfZc32gGYqcwY=
X-Received: by 2002:a05:7300:d0a7:b0:2a4:3593:5fc7 with SMTP id
 5a478bee46e88-2a4ab8a954cmr3839409eec.1.1763364369738; Sun, 16 Nov 2025
 23:26:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113-core-cstr-cstrings-v3-0-411b34002774@gmail.com>
In-Reply-To: <20251113-core-cstr-cstrings-v3-0-411b34002774@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 08:25:57 +0100
X-Gm-Features: AWmQ_blfzP7tgtY8Fku5O9Ya-p4__2p5hyhk5bTEZBAj4wCrgnbPLXyOe9G6FRM
Message-ID: <CANiq72=aqJYSqqDkkn3v0F1N26rv+z_1+1+WgmU0Yg8_S-+Oqg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] rust: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, 
	Tamir Duberstein <tamird@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 11:58=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
>       rust: firmware: replace `kernel::c_str!` with C-Strings
>       rust: str: replace `kernel::c_str!` with C-Strings
>       rust: macros: replace `kernel::c_str!` with C-Strings

Applied (these three only) to `rust-next` -- thanks everyone!

    [ Removed unused `c_str` import in doctest. - Miguel ]

Given how many transformations there were, perhaps the Reviewed-by's
should have been reset at some point, but given they are simple
patches and you carried them and nobody complained, I kept them.

Cheers,
Miguel
