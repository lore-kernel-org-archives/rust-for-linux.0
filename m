Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDD33DCD99
	for <rust-for-linux@vger.kernel.org>; Fri,  8 May 2026 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245554; cv=none; b=KCdEqMXGOoVwmf02aA22LoOvv1O4jlilQvoWlXVzG9r+wjnf7Pa+GU0Kbuz86t3ZCRVmF3nfV3pVaB25dZX45o9+qOhlPMOLYd+MXqDX62+JHRWz6m3CJnRiRXBmONGe0P6YqhFbS7nAyYAQJIOAvAkGBSwmU6M8O9zlprM6k1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245554; c=relaxed/simple;
	bh=nc+ZgyCqpLesD9QZC97dgi60/x/F9JrKdvCSc8AJJCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pbcsg9UbFQWTEST++yB68lTFmA+1Eem6bevdtE56PEmpzKFtqO7DPedQNogmie1qSn3UcgmD/Da7X1n71oyqQYdtuCKBtYwpiHgyVpPDBoaDWLVWW8enDDACsI44URTHCukFHVBgyLdC5ZB4NEKJ9J90pP6bGQ7xfRKoeCy6iXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDZ49Qtm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDZ49Qtm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75AACC2BCB8
	for <rust-for-linux@vger.kernel.org>; Fri,  8 May 2026 13:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778245554;
	bh=nc+ZgyCqpLesD9QZC97dgi60/x/F9JrKdvCSc8AJJCE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lDZ49QtmF9pnmYmCAYgt4P+1VB/eGYNspFf9F/y+hDbMswJw+LYFRtCdLeOBgZ5u+
	 Wssq8ZSUZmyZNxEzpjEj3CqlgX3jh9ZY03GYTYuQbohtC5lrUew/wDTQsIIc1yjA9L
	 kAaj0aTctRYMN+4G6mOu9KU+beU7JLhdi4MXtwaoeMyO6GZ4pEVAJ0Gg1xA6OH5wrp
	 CSsQErFfUWorrJu+0E0p9s6mJRcY+pCHGGyEZMEYoYBwa1J1FpLvg71NA2UH33Td/G
	 cgcAlFXpDarCZSiH/MCpmRkDY2EKwWBDOgQKTswYj3Eycg+rq+cT9l+CeR8wUY2IBl
	 uU4YqUYsTsypg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39393c1b5aaso17223711fa.3
        for <rust-for-linux@vger.kernel.org>; Fri, 08 May 2026 06:05:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9s/OU/xEK+KE161bjXEY1Y60/6iXdp+vqiqGSMgazQJohpl70XAq6rHvVRig2zEuF052eIpBLee2uAXBL0Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFAgEXecWD8Kh+wmNZFnnzWL8huERm5obbE7Ce7DyMvDwk9l5e
	kf7MT3YJydv79jfHKAHSowvozzSfiwuQKzHumD+sHch69oqOK6PO5khlbJLTfHr8hqCTIo7zoOE
	BzUb0OQvanbQMvc5eAoCdPNFXy1OXl2Y=
X-Received: by 2002:a2e:a812:0:b0:393:bc85:8d80 with SMTP id
 38308e7fff4ca-393f4e2f79cmr10090541fa.12.1778245553222; Fri, 08 May 2026
 06:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-rust-analyzer-macro-v1-1-9122b940d003@gmail.com>
In-Reply-To: <20260508-rust-analyzer-macro-v1-1-9122b940d003@gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 8 May 2026 09:05:17 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9=Cr1Mn1EXsWqG+KE-Y2Ed0a21PMfERjNr+M1wdgNaqjw@mail.gmail.com>
X-Gm-Features: AVHnY4JheaFZbKxbBhIdCjn9956k1aRswknLwi39SOskd4Gsg9YwudFMvQrpI-8
Message-ID: <CAJ-ks9=Cr1Mn1EXsWqG+KE-Y2Ed0a21PMfERjNr+M1wdgNaqjw@mail.gmail.com>
Subject: Re: [PATCH] rust-analyzer: update generate_rust_analyzer to pass cfg
 to macros crate
To: Malte Wechter <maltewechter@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 3:04=E2=80=AFAM Malte Wechter <maltewechter@gmail.co=
m> wrote:
>
> pass kernel configurations to the macros crate to prevent rust-analyzer
> from marking conditionally included macros as 'never included'.
> Add the generated configurations to the macros cfg list
> so rust-analyzer correctly hints inclusion and exclusion.
>
> Signed-off-by: Malte Wechter <maltewechter@gmail.com>

Hi Malte, thanks for your patch. I haven't seen this issue. Could you
please help me reproduce what you're seeing?

Directionally I think this patch is incorrect because the macros crate
is a host-side crate and generated_cfg is for target-side cfgs.

Tamir
