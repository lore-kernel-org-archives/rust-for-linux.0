Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E697E1C54AA
	for <rust-for-linux@vger.kernel.org>; Mon, 12 May 2025 13:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057730; cv=none; b=BcI+MjeDbQZlrjL/SHESENmomb/VOSH5CpYuiDcYsJT6bX35LV1nTYTssdyF0FVpB6044BRRykTn8KwNBe7tvWkRMDsnqlWMOj6ovsdW9swGMih2dzF5aZxzbZj47HSEBKZRD3NGCIhmXznQoOmVaCCSxDHzYth5gfTuLOgx3c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057730; c=relaxed/simple;
	bh=Jfpp/i8MdGpEOCFFZ9jVFALMY6zi9STw3gtP3WyZ/Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VykfRG6vxSNr7aVjHzPwgfA3T+v/pZe3yquLcSsNzvsOH3ID7AzZtBJr71aghJYBEQYk89o730m7VcGY8GlzVIeZO5Px4d3cGunwSeE8bzN8wLJMDyoLnE0CBENJwUtOlVdggLjx2wkM9wQU7HhK8zZDcp2uyjwLkVMxb+Yxx2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcVH06/r; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcVH06/r"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e423394feso5375375ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 May 2025 06:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747057728; x=1747662528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jfpp/i8MdGpEOCFFZ9jVFALMY6zi9STw3gtP3WyZ/Qk=;
        b=lcVH06/rqgwMcgc68tJ23uRfXMqig2ku4gfkIv784A3zkKamhQEVQrSKOo6s1kTu4N
         wMxw+G528dPi2znhS37a2Dp1CFD7QPr9HMEjwMqssan3Cwuc9K9JfQoBBR00e7iPgRYM
         dljmb1J+dlnUsQuq4jhcs6skPj0LRsNtpz1GS7Gc9KfkVTw/u1ReOZFNYjri89RF21iT
         W6jJefsXCo55NpDpbpjjb1isi+mD60SuB+avPq0w5ssLK+yAQ+MT5ldUc4uNIVndgHa+
         PkHjHS9kN1RHTUyR5MYdMGxntSrVkmugAgFuT0xDbIPaOVO/2GU5BIvtK2f2HKH6KW7P
         P/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747057728; x=1747662528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jfpp/i8MdGpEOCFFZ9jVFALMY6zi9STw3gtP3WyZ/Qk=;
        b=enQyb/G4XcQlodU+ITDt86BdcpvaY0I1w50fkERev7DxqncqNcpRsojvtnKlfERBV+
         e1e6XokPoru8ls1EIBVz8S1XEbraUvkvO29rM9ZEfm3Pk0Zcc8/tvSRnRMxF/a/jBlFV
         KMGHdDtm5UEgMzWQzFEnzKu/wkMj6yOSHjaL/76pizm7DsxqVInrJY2JriNI9P4MwMCl
         RMoZ9nG6GeC4kW0EBB6td7/dIRIymsPk/qSbq3Ls3nZI1yf7sfgNO+ukOMhmODcLfQyJ
         OJUL5SMJcjTYUu+qX3lJy15QHISY2B8w1PDH7g4Sj8AGkw9+EHnKhLQvKzPjcthClXYw
         f3sA==
X-Forwarded-Encrypted: i=1; AJvYcCXz+nTfo1RgIYDZV/4h9O0UzXG4EhTggDxmHNI9RK1R9DQfkf8EWBNy8YRTRC+LjU/eMCpMnuHNSEX6J9BrNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynCcEmFoHThVE56BxNlhyPwEYtqYb0OL8Bi0pgKS7BRt6wUQc7
	yVo9kQ/cR2vpK90Tt97M0AOD2sugfdfnIeApbsHEV3f+E2OOz4NVfqW7oqt9UMOBMnUzy9MyjZe
	/zdzAOPsLr4KAF1VKh1Fs6KXo9+c=
X-Gm-Gg: ASbGncu6s86YkZRtNfmYeGY71xBwcXuAPLJcCL9WpXyqx64purDjjbTUOgxeKZXBris
	OHWlSO5xWodgFCHHjc5b1lUCDbjul2x3rDLUK0SuuD36n/rooyTnxrtsu8xFSiWkYr125SVq9aP
	RKOM279y5bSPMyulQzz63N8rgtTlkp0aGO
X-Google-Smtp-Source: AGHT+IG1kSmiHFJH+y1XhXNheAwSZdZzfZ48ndtZoGtFxq/gIid8/Ungkdkhg55GxgKD/t8oJtOdI8MTSBQDhqvaugg=
X-Received: by 2002:a17:902:ea0c:b0:223:49ce:67a2 with SMTP id
 d9443c01a7336-22fc8e962c9mr63737345ad.9.1747057728214; Mon, 12 May 2025
 06:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326202520.1176162-2-altan@ozlu.eu>
In-Reply-To: <20250326202520.1176162-2-altan@ozlu.eu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 May 2025 15:48:33 +0200
X-Gm-Features: AX0GCFtNz8M6KBjPDXGGKqdUG2xFAx5ue7KzgoxtRBZDCjaQzE3MNl3KH8M_7PY
Message-ID: <CANiq72m1uw-BEY5g2Ni_STjb9+0t2q1XCgtU-RFXuGS5ZB=PPA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: static_assert: add optional message
To: Altan Ozlu <altan@ozlu.eu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 9:25=E2=80=AFPM Altan Ozlu <altan@ozlu.eu> wrote:
>
> Add an optional panic message to the `static_assert!` macro.
>
> The panic message doesn't support argument formatting, because the
> `assert!` macro only supports formatting in non-const contexts.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1149
> Signed-off-by: Altan Ozlu <altan@ozlu.eu>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
