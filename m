Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8457117C3
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Oct 2023 08:21:52 +0000 (UTC)
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D722AC6
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Oct 2023 01:21:49 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-49a885c5961so2687647e0c.3
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Oct 2023 01:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696234909; x=1696839709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtZPfMPTl+Ym7DWbaJlQ6UaM7njsrFPEooyegrWd6zo=;
        b=debLAJ1cUIYHiB0yhRTCV7SGKClLFI05hRLuEwUJ+nrEtG1QIax2ytXE3Q91UzUg45
         cP5JgUYStIaLBYJHo8a0RZNSnY6Uu2lfMJL5CVjCjHIZZqeQm+fL0PPkf1TmrVv09tW3
         Rncva0Elip3txc9xvHrZVSg9D0aDN/Q97KD21IMMixmyXHyDI8D6AZZ4G48JLCInahdq
         Dcy7HsVxKrEmrxbw+PMnh5mmoNCNGW3yFagbI4vao2Ed08rrVAW/Nso65A6lgJZt7eWZ
         cEkUN1CzkHJYQxCph+prZJGFBRXxqn7GsEBtqiAhaIdyP1Of1eQrIueOGkttM1Xmtw8t
         apBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696234909; x=1696839709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtZPfMPTl+Ym7DWbaJlQ6UaM7njsrFPEooyegrWd6zo=;
        b=bZVKzbRjZhev6OA5JRocsK5MVTtib3HIjwvSQF/NbHiMdt6nJY9HsUT2m0SJXuRJZW
         wZGIzPN8xQMtWetAYVE+IOBtfSyo8ml+aCoQwj1HIJDx1eQY7CvfDqaovIYDwNDXZgVw
         3FN5ALYk9Khag0hKIXVOVQ9vm5J+084ZYSDDqSIqVusw6yWLFVR+A4g2D+4Y8dnuikDS
         5vSdF8QwyQVEAVtJ1mWDen3Ni3/C3RjmwNwEkFW3Uvi5B2Gx9+ipr0MZUvUlFxHiFXMT
         7yd/GMmSNuubr4c2AgfqtAyp38OE1ZuusdBSIoTa3kf8TrY7CVYSUrKWIeEkjGZjKhvy
         Ri8A==
X-Gm-Message-State: AOJu0YwguV2cq14ND3kWdkClOg0Taai+yIQpM1LyyMjn79aurNV5m6RY
	XCXcjkBUywg9Oa28GO1avXa8WoO1pgFRhPrwpETxEQ==
X-Google-Smtp-Source: AGHT+IGZaySyVkdp0LlmnnPa66lTbn8IhoN+E6TJoqlqiOQdO8XjxPy4t0rOgUERdE3MrYyvmDu6wDLW/xV6+uP8+4U=
X-Received: by 2002:a05:6122:1185:b0:49c:79f3:27a5 with SMTP id
 x5-20020a056122118500b0049c79f327a5mr7950821vkn.7.1696234908881; Mon, 02 Oct
 2023 01:21:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928205045.2375899-1-mmaurer@google.com>
In-Reply-To: <20230928205045.2375899-1-mmaurer@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 2 Oct 2023 10:21:38 +0200
Message-ID: <CAH5fLghT4EL8ZEk58jUzAqLmRPMO-5pmC5j=f5Lna5ebBE8PTQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Use awk instead of recent xargs
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Sep 28, 2023 at 10:50=E2=80=AFPM Matthew Maurer <mmaurer@google.com=
> wrote:
>
> `awk` is already required by the kernel build, and the `xargs` feature
> used in current Rust detection is not present in all `xargs` (notably,
> toybox based xargs, used in the Android kernel build).
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Tested both in an Android and non-Android build.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Alice Ryhl <aliceryhl@google.com>
