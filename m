Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00A023772
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Oct 2023 22:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilmP4HZB"
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891FAA6;
	Mon, 23 Oct 2023 15:16:05 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d9ac9573274so3538001276.0;
        Mon, 23 Oct 2023 15:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698099364; x=1698704164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3068ADSkqthpsqS93q+/p6HJQnWPBgqqNzVxtTtH1Vs=;
        b=ilmP4HZB4yr6jo/Lk08udrMSiqj6Sznsn0QQ1YGW96IZRPZ4jWO2f1A2J8ktKr0Ka7
         Zq8PoCACTAzzufqhwB8wqTqDta086GP04GPWKHSE0ID2KEA5oMHDzDSH+BdFXBtZL8Sy
         b7m9Dt23au/n9hWo4CV8BvMfuxy1MN9eIf8bLERBTixnU5AtShH24OM0Xvv5MLBc+KEJ
         9LytpK8CuxpwjgWKe4r+Hoixp4wT6WpEDi+recqxcKDj6Fu2FBH5F86AQIlTRKs0BNVE
         NIh9fXyxGhG/P8l6UfSSFmUOTjkql40Fyka2W/2ASQTyJL4YNdUZmw44Q+31VwvN2uJy
         fyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698099364; x=1698704164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3068ADSkqthpsqS93q+/p6HJQnWPBgqqNzVxtTtH1Vs=;
        b=K/fw1qUei8VU6s7DHaK2n5M7E8FGwGsyTwDUp8Uq0hhFFBI/TnUlRJgotuMyS4cTBg
         ZXrm1zEw/e9R0awX+IL4ZYQmQ1RqABX7XD9J+lY+cKs1zipVGx9EiaqKLN7ozuQcFfnX
         tDBoq2v8E2Whs6IqXXUjEnXCvG17ho3RXbu5GPKXXVmJyBor6aq8AR9MEIiKrTwh8iAM
         EjmUsWCy3rjFHaLrzf6crP4WNaU0cZV3BmboCCQfF0bIgEDougZcGvocEeotMqqRw5J/
         EVfM/Ug5rijXFE9qDJPpHHmcBU8EQ0/qkUIlMVxV8YYfeiCkTNEZ0AhR6MIuoj2pgeg2
         POVQ==
X-Gm-Message-State: AOJu0YykHQD2VEGHTLZCewQkc68AYDCRSTdl6AA9b7BkVyb0p+7dWy6U
	dAn70CENf639AfMAPvsg+yG6ROPHIoAci/J9SfpR7HI7UB4=
X-Google-Smtp-Source: AGHT+IF8p1LuTV4Z7cYDNFOYhYTinKbuj7AVx4nc7X9tNQZkyEJtkxXHEbQAp3XO7hfv3Pmf67iQbUWSKzOhvTiWuIw=
X-Received: by 2002:a25:aaa9:0:b0:d9a:c61e:4466 with SMTP id
 t38-20020a25aaa9000000b00d9ac61e4466mr10600798ybi.61.1698099364644; Mon, 23
 Oct 2023 15:16:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231023174449.251550-1-ojeda@kernel.org> <20231023174449.251550-3-ojeda@kernel.org>
 <f53536ca-ec5b-4cdc-a340-e9c739ee30c4@gmail.com>
In-Reply-To: <f53536ca-ec5b-4cdc-a340-e9c739ee30c4@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Oct 2023 00:15:53 +0200
Message-ID: <CANiq72nTE_qua9w+EeqiPCukst4876Gi7gHeusFLofYZRoJCDw@mail.gmail.com>
Subject: Re: [PATCH 3/4] x86/rust: depend on !RETHUNK
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, x86@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 8:43=E2=80=AFPM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> I'll mention that I've tested boots, both in bare metal and QEMU, with
> `RUST=3Dy` and `RETHUNK=3Dy` and they were alright regardless of `objtool=
`
> warnings. Although, if you had an issue in the past then I'd like to know
> about it.

These are mitigations -- things do functionally work if they are not
applied, but you would be vulnerable.

In other words, it is not like e.g. IBT where you could have noticed
it breaking by running it normally if you happened to have a supported
platform.

Cheers,
Miguel
