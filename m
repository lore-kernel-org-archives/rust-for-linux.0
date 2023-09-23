Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9C91CF97
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 14:11:18 +0000 (UTC)
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6203A19F
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 07:11:17 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4962c3588a3so1301476e0c.1
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 07:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695478276; x=1696083076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpWIj06OHy+rOcF8H0SHbdUYQECR4YDN/XNL+G5tLbw=;
        b=jv/S/yfHavaRUp/HAxrkLgUuz5rndItgHUGiD/sM1alOFcTzUVzrkxmdPq7Uz14sNS
         ihs6Fp1QcE87/NwvZcWK2X3dmOP9ifyz2fNgKQYhZE0q/lH5pm3+Hxx4tXNsd3yQ+wE6
         8qAT2hGKHca5iD/v6EEFo7eBcfncKhyWWgq3PRwH5bZWY+Q10YCOThbrKJPurUggr7Fa
         jG8aY/M8FMw2ZiP997p9sO8HjLLGFwZX4hdUnX9QwLOgG9F029gey73FXTo1cB3Deylh
         0HhsMUSHR/HvZxJP2o4FXAaGkWRbKxR33rm+KUzJHZmzDW1ofVKccbw8Q3FrSjLAYdCm
         4DrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695478276; x=1696083076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpWIj06OHy+rOcF8H0SHbdUYQECR4YDN/XNL+G5tLbw=;
        b=mN8UOAWBV6Wez3EOps/gm/MzK/kVhFRzsnvMJzVCT23M2LVimqjYmVfqldQwWBGby4
         5XAsvykaZoGbcKDyBBqaRy5BK0OkKQEY4YJa8iAcisSRVvkb464PHNOdbpKW6x1Rukkw
         UgSYE18cIvWFHq/aBMi4lOlrlU/1kpfdWNl4mMhaKbK4fF91XwsJHrDVLc3O+qZTZeTD
         RiQcx9gvXnDPYdyMPS+1j57jp1G1beR0j0PK81j/CEEmp0kQTvffoAHmfVwvGPJJm4Qy
         sPma4rJaM8+8ivI8qavMm2c0jJJ3NY+/PYdbiS26gayj8l0a2t+2gkeEphI+9IDbD0bD
         fAUg==
X-Gm-Message-State: AOJu0YwHy/B4Gjh7cI+OvGAoenltDogy1YVfkR2S7ixb+6P3otvOh1sp
	UCttfT3W/L/ir4H1B4Az7AzXh3lKBMBW8xCw0U5QCw==
X-Google-Smtp-Source: AGHT+IFYuJ34LCtmmTNhxO2yfGMqz5cQFVlQau7VX4NObs+J09ZySBpsuxzp2XsvghVlmjZXHV3ozAIgh8Z9TEhhMek=
X-Received: by 2002:a1f:e484:0:b0:48c:2b9f:ee1d with SMTP id
 b126-20020a1fe484000000b0048c2b9fee1dmr857396vkh.16.1695478276304; Sat, 23
 Sep 2023 07:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230923024707.47610-1-gary@garyguo.net>
In-Reply-To: <20230923024707.47610-1-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 23 Sep 2023 16:11:05 +0200
Message-ID: <CAH5fLggiad7F2QJnZ5dSe4sGkXC7iA-9V0+v=+Q+6b7-+D9DxQ@mail.gmail.com>
Subject: Re: [PATCH] rust: remove ignores for `clippy::new_ret_no_self`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Ben Gooding <ben.gooding.dev@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Sep 23, 2023 at 4:47=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> The clippy false positive triggering `new_ret_no_self` lint when using
> `pin_init!` macro is fixed in 1.67, so remove all `#[allow]`s ignoring
> the lint.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
