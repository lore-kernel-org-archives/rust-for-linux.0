Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2998214A62
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Feb 2025 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673436; cv=none; b=HLNJpJf+od+eRNzTh0PE/FRyq164cj530Ah+IHuARvZDQk9+Yw4SQSLGsKYngExNBQJPGON1bG787YctBKRxG+Kbxd3R8j/+4ZgZZ4O6J17tlvP7JtCdKOQ7DNp8VjYiCcErH1j043uSx84l4nG9JEqunMX6kUm++AlnExHwA8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673436; c=relaxed/simple;
	bh=5Wravk8n8L5gSrJ4Tsjze24NR0gc3nfzt/R8JDHkrzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RGbiYtUL4JDaKWjlaqmXqCIOWy6SkTvJqtEZC9T3VOvrQp7V0piQPUSUKZu6ob9f9O/7rRoKphhj/J6NHAfcY3u8YRf3z+iWzGI08q+OjfEkfNOfiVyi/KIqMD1c7bfeoIk2Jypd+PAntN1Cx2QpqOmd1vFqjRy9nPhg34LfUb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GsZwQGop; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GsZwQGop"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43618283d48so41051275e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Feb 2025 04:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738673432; x=1739278232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cw+RvYlLVEgZc4+jlXK0g8BHWRUPBup4VgYqbE87bNk=;
        b=GsZwQGopARiYq/juFef6TujcRVKV5rLU265YRViern6tWgtMCjOVoV/pjUg5Az4dvb
         oymS1jP/Sr7Pug7SxjhetBcVBfZhXRlaZX0uUdd5NeNW3Cd2Mxft39XTIbSloRUxy7dg
         uoBqzrJspW7lKloxT8442KLrvp+OLqVVrxlqmu5UDVz924KDsCOB4wCDKKkx1MpFfijV
         SdhbL3DxE/fROtdO1DpIoyluIOXk6MGXHpOLFzsApjf7PxHQBRgLhbSLypLpq9ewSSSR
         tITO7dddHq+GCvIVQawhsNW4GY8j/UaUZfj9nG4sER1tp+ak9iRXD5nnZygn2ASSmU8a
         Fi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673432; x=1739278232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cw+RvYlLVEgZc4+jlXK0g8BHWRUPBup4VgYqbE87bNk=;
        b=WPaep+P8g3R8BZ2BhoMPjWV7VmQ+V2YVe6YQT1esyCZPIqOaI+j4VwZQxvUMK04xe8
         tYL+OPUr0z8a4GmZ29m01ye+n0L/M3Uuj5PWPX0e8vqJmms9/GQq+esbK2GFYmeJuyFK
         W1Bp4w5x9WA/gWT2jcH+RMmS4FcmmbmIYoXGKtUWwHdisJvgjzVkom5/KIRWbS2U9wzO
         FiRhObfRmXYtSn6qVI40EAEIeIvCW5BMpTz9AxYi+kn64rTw/O5OrnTVq1zDoSkExIN8
         9pKUboUNZIntNLaw1/w7KqsYooxhKJFW9uHj0hfELPdAshtvbvnQz9sRwzQaiFbFBjKu
         id8w==
X-Forwarded-Encrypted: i=1; AJvYcCVUR+ugFHopJ0+XaQQ4BJ+GrtqD8SB1A79ZA7IRgV74gDgi5S948mf2svPbcsLcuuKcyoea0L6g0G8OSCk6fg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx7++7z5SL5B7pJxJmRsw2Dms8AXI2B03kC3fkxSbN0S+ZsidL
	E/8l+5lLunMDRt5nc43gTGiB2xe81BjV5F2dT54MXuAe7i3FYJBlTse9qPgQ9lfYf+/33xE0Kyz
	hhLBZlV4sWk1Fvwn733/3gd3w+hIYclXm1LcT
X-Gm-Gg: ASbGncvJ1Tm2mJxsvxO5REzSLeXO9Y0PeVkD91JXk++MhFVGStIyrgkh/alIqCKoN/R
	B+onSbcO0g5tBCnXhCYMILSDdfXg5yKdJUBC6K3qw9LZ8Uaj0PDqZAsYJTBQUy5GmsHTjep8k47
	aV8FImFxl2QxoB3ORRoTBuipG0/g==
X-Google-Smtp-Source: AGHT+IGnnk4K4dvnw1pigNvIyl484rO5AHHh0Oi9KTNVimfTokNMh/75NQSAs357TKv97JHN4whdk6OEEaDnknc6Rwc=
X-Received: by 2002:a05:600c:3511:b0:434:f3a1:b214 with SMTP id
 5b1f17b1804b1-438dc41ef52mr196029345e9.28.1738673431786; Tue, 04 Feb 2025
 04:50:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org> <20250204-module-params-v3-v5-3-bf5ec2041625@kernel.org>
In-Reply-To: <20250204-module-params-v3-v5-3-bf5ec2041625@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 4 Feb 2025 13:50:20 +0100
X-Gm-Features: AWEUYZkSscLm9QITCQ4BE11ZvV1ZiuaYYeibDFpJkeSienDQcuqiQO-NoGxF-C4
Message-ID: <CAH5fLgi-x6xT=xBV-Uv9do0tCaAOMOARZ5cigjsUBSyh2EJBOg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] rust: str: implement `strip_prefix` for `BStr`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 1:05=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Implement `strip_prefix` for `BStr` by deferring to `slice::strip_prefix`
> on the underlying `&[u8]`.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>
> It is also possible to get this method by implementing
> `core::slice::SlicePattern` for `BStr`. `SlicePattern` is unstable, so th=
is
> seems more reasonable.
> ---
>  rust/kernel/str.rs | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 1eb945bed77d6592216cf30678fcca70d4c0b3b3..80601206961e5b2d682af5f70=
28434bba1604272 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -31,6 +31,22 @@ pub const fn from_bytes(bytes: &[u8]) -> &Self {
>          // SAFETY: `BStr` is transparent to `[u8]`.
>          unsafe { &*(bytes as *const [u8] as *const BStr) }
>      }
> +
> +    /// Strip a prefix from `self`. Delegates to [`slice::strip_prefix`]=
.
> +    ///
> +    /// # Example
> +    /// ```
> +    /// use kernel::b_str;
> +    /// assert_eq!(Some(b_str!("bar")), b_str!("foobar").strip_prefix(b_=
str!("foo")));
> +    /// assert_eq!(None, b_str!("foobar").strip_prefix(b_str!("bar")));
> +    /// assert_eq!(Some(b_str!("foobar")), b_str!("foobar").strip_prefix=
(b_str!("")));
> +    /// assert_eq!(Some(b_str!("")), b_str!("foobar").strip_prefix(b_str=
!("foobar")));
> +    /// ```
> +    pub fn strip_prefix(&self, pattern: &Self) -> Option<&BStr> {

Perhaps the pattern should just be &[u8]?

The code itself is fine, so
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
