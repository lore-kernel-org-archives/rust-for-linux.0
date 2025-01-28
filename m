Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4DC192B85;
	Tue, 28 Jan 2025 18:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738090519; cv=none; b=Mctmzi+KCiABiJwZPZ4gE0tydVUhDgxnSx7q/ZvkOUVisSjwel0tYI6dqGDd5+J2L6j1SsENyKOA3fJdynKQitEjg/UR/QCEDawv/0ogv2fPHpbuIJ69kDyKnQORXVJwmcrIgmdlRwx79mFPiHEeDXMYRcz4l6BkjcoXbjQvt9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738090519; c=relaxed/simple;
	bh=W862Izmp/E53/SVf1i5xl1z63b56AS4JgFx3wVnZ0mQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZJIZqpsakwNPkQv0aQSuEWz7CICD+7DxwMvJidc66shYEWxLQu5j3hSH58Uj+om7SZJA5y7IcYC5hLqpW5RI4ZTHew2EmQCLXXpyo5w1Glepw5VgXRJ5fEsjhMXFQ56MXQzevtuZgdgxZkPW5YcIAgeLfSKbw2Y4Wibx4h0AFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMZaDcgZ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMZaDcgZ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ef6ee55225so1242832a91.0;
        Tue, 28 Jan 2025 10:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738090517; x=1738695317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W862Izmp/E53/SVf1i5xl1z63b56AS4JgFx3wVnZ0mQ=;
        b=TMZaDcgZe6PtwHVhGlmwugxcleQlIGv4EZtKC/N2Mm9MG9J3zL5pqMzbUNU6flbbTy
         LaHlElZUS0bNnqxeIm3YMsUy4KRUtxpWTVKPtindZBgLHsSt8Gzzfpu68tok/l0sWHry
         sloldRSQd81ZOvVpTfKBrhUfT7AxG9W9A/XUpffT0sObF8GvyPuGoMMjsFhj0s+p9vun
         bkZefx6iizi4NfcAQyqCUS2l2x2fBD9bF00QQVoF6msQWVBHFhOIffejBCKGII7Ux+ci
         fK8P20fyVbKkNbAt4iNab6ETEHI4vSzlrVtutn+auW7EFJToi6sZX1OzzGDLRIUX5ygZ
         tLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738090517; x=1738695317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W862Izmp/E53/SVf1i5xl1z63b56AS4JgFx3wVnZ0mQ=;
        b=SN/do+TPCLyfa9orOsKAQkKJrOyIWB4n7ONPVhFo9GivGNQN+qPr48RCxL1d/SEXny
         qKu/3lcYC1QaZQf0Ydg5i/d42zAhwAJ+wu5WlQbji6H+0s2INW7fcyaSMLln9PHO9NN9
         /3B1Rpo+y0QNKQdaSoVSgtNLM9HhAvikEXddmZ3p+Rv8kfWwj+L3ohH+85clusoeio5S
         X35jp2UDWxYX+a65YCEs4/e7qQODszN6FbCtj4C5FrCImQ/ixKD0jsiXwpH8WHo/irKS
         vdGoUY3dbTjPzW0qSWYE3PyeFlFDQv62t3Ctv+F2U2BbrYu3id2YjVTPS3ihSa3tFui6
         d6ng==
X-Forwarded-Encrypted: i=1; AJvYcCUtIbmQoI3BJ7audK/f/rgOa3v12AiNNFGBjUcxBp3jQSjq5QlUS5v9qyXHR6Wwt/nCtJATSnwmo3IsTic=@vger.kernel.org, AJvYcCXAEuI7YfT45/+L83mYPQRrnJcIY/y/CrmwdrO7pkqvHs9c1DAXnIev1isqlc6n55W1A4tzwMUBpr76lKkhToQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeFI3sBvVhKbvCtIg2aBVuIUklaYb4/+sr0ev0RAnH/sjO5OcN
	uTiqNckdD5eZwz6oXyLBvYaHHCQJ0nSuFP9QDt4hMXAzWCPZ6hgHTbbsJf9SDP8fl9J4x58e2qf
	RXt9xhgVrw+5xW7lM8SbZ3z4rP2tUNwD0Vx0=
X-Gm-Gg: ASbGncsWSBe9up5u5OP/hU+wbsLCacLzNzujqOryCfZZtiYx1ZUb+n7fshm0n3n0udX
	eqwMWyEpINJUHGuCNEx0KtkHk3Cr1u3p6h7ISOPXelq7KuvWxGvlmW5ic5kiXw4nrc2oGAYVwgg
	==
X-Google-Smtp-Source: AGHT+IF+06ZQ6cXV8cUOxcmQygQkc8T4jyMBhIUSeJdK98a/Au5GPTdkvmu+ntap9JZl08CeUb5jsSu/1fo8bcsQMik=
X-Received: by 2002:a17:90b:5688:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-2f83aa879b7mr78727a91.0.1738090517257; Tue, 28 Jan 2025
 10:55:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128-bitfield-option-hrtimer-v1-1-31033d8e727f@protonmail.com>
In-Reply-To: <20250128-bitfield-option-hrtimer-v1-1-31033d8e727f@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Jan 2025 19:55:04 +0100
X-Gm-Features: AWEUYZn5pg2oN48tB8bafu5AsSecVOOuMeVU7wGN6R1TwF46bpfm9OeguPwZ-PU
Message-ID: <CANiq72n96fJScyVr5eWrfTu8WE9dWXNoyTaLr-CuFj30E57RdQ@mail.gmail.com>
Subject: Re: [PATCH RFC] rust: HrTimerMode replacement with bitfield_options macro
To: gtimothy-dev@protonmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 6:13=E2=80=AFPM Timothy Garwood via B4 Relay
<devnull+gtimothy-dev.protonmail.com@kernel.org> wrote:
>
> This patch provides an example of usage of the bitfield_options macro
> proposed in [1] as a replacement for the HrTimerMode enum introduced in
> [2].
> [1] is a RFC.
> This patch depends on both [1] and [2]

This is great, that is exactly what I was thinking about, and
showcases the advantage indeed :)

One quick question: what happens with the generated docs of the enum
and each variant etc.? (since that is part of the savings in lines
here)

Nits/tips: when you send the next version, consider sending both as a
series, i.e. this patch being #2 in the series, and #1 the one the
"real patch" that introduces the macro. That way they stay linked and
people browsing their emails and/or Lore will see it together :)

Also, the notes on the commit that are not part of the commit should
go after the SoB and the `---` line, before the diffstat.

There is also some strange text wrapping going on in the message, e.g.
on the `Link:` lines.

Cheers,
Miguel
