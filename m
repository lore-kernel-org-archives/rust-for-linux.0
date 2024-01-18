Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583EA1371
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 00:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705538906; cv=none; b=tEok1MdlzkD+VFDTOsHnPGjOLybpR8qPmVgjC7Piz4Df9IQgnqnjnYlqx0k/PGVjhNgsOhsWJ2Bq2OqrHlbYV1jGl4BTBhzGulQ7E+5hJ0NymtHsh3hecyKOcoNmZAzjEU+ViyytSsTQw4xqoAzNWO01Pp0eVzkG5nf9IvijvRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705538906; c=relaxed/simple;
	bh=HgQZtLiPZ8yieYv69i+veXHyaQ1J23tRMff66BkFe0I=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=UMAzDclNc1l6rnWHHj2/vr/s2/5PSfs3ZOwcLb3sgpN7FZW5xboCZSiJ3ysqp2fWA6OXBjJRjj/n2fSVA18ecBeQ/9Hl4hZxmoOg1hVWvM4dImNO1V6z1OPGu/7jqNfZ/g/nqFQqIa/i0OstebEQ3NU2alJHt1eeZwtU30jYWwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=H++MzVIP; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="H++MzVIP"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc2501ed348so205899276.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jan 2024 16:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705538903; x=1706143703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnQZVIdAe+SPFcHTrlVU0cLodcCnQ2+sbTo4x3UpZMA=;
        b=H++MzVIPiqt0SKwia0D8kCyPrgp3dxOuFP+Itz+PsXVzI7log0196dIfPkO2L9FI08
         jr8zm6n2zZM+m6U40e77Wf00+FUcldi4IMbhg8wYy7qfIDxQCDoOLo7eCeunq3IMsiRL
         6XqeO0D0KxGyzHqMZc9nn/qzkEzhNUI8qRAxJTpht0agyYHZVDkzP5GZnho/vLTucDpo
         1wieBvgqbC0UfEW3CA13U+KtiYCwm+6Dh2nK1TpHiL6WsmptFi/1QQe+bH8ct7w5cy5q
         eKzGcs5DMj0TNI1RYkze6WWp6OF7H9KW5+HbBwCfa98T5jhZAHNzCkd5tbUgD9I/8Khr
         zOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705538903; x=1706143703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnQZVIdAe+SPFcHTrlVU0cLodcCnQ2+sbTo4x3UpZMA=;
        b=o8RXVbM/bVVhWC2eBMirFsWs+T8QRfo+F9vlEKBVSpJoiB24yhVs3xVYze62nprypo
         v3GiCdkFcAWxKYGJYrln2LljaRyTzpMKoHsI9NemlYkhmxpIcXD3C34br21Wc5OUiPqO
         cvEdWk69lkAbTWVg/1G4XC/81eNM3gLi81MCBSG5B2YDLepW5gYAtJM0rncZSaoI+Daw
         kPJCAXQPopiL0WKn3qNiyB/T5/st+gdnrqGT6p5Lp43JVd6p7YhjY3yCO2mT5suQdFcc
         Y9YqjAYzjsxesNDS07c+wFga2goefZEmiw9WAK24gXfU8rwuhNhJdE5Thx/QO0hZCG3e
         hmOw==
X-Gm-Message-State: AOJu0Yy/MC5a00orNX7VC84lmOYGkiq0KU16Kfc1XG1pGH5/e8GMsXf2
	Ez7wIujDvwHNp7PBhBpPBeJTRAThKYHXB5gnKaHRp3pZSBQWwhfVR0jk3/QnxuxhbIn8Uy5u8/1
	N2Yk/KnTfuK+D3JDNiy6yrtu8x0yjCGitlDn22w==
X-Google-Smtp-Source: AGHT+IFaH/HdKGGfwYN91eIoUq8ud2h3bJiadflP+e5X3ly/7ZaddV/vxJG3xX94IwXuoCFM0qeVeQzb7g/lq9Gwi+4=
X-Received: by 2002:a25:2046:0:b0:dbd:726a:21f0 with SMTP id
 g67-20020a252046000000b00dbd726a21f0mr97044ybg.16.1705538903270; Wed, 17 Jan
 2024 16:48:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116160141.165951-1-kernel@valentinobst.de> <20240116220615.168083-1-kernel@valentinobst.de>
In-Reply-To: <20240116220615.168083-1-kernel@valentinobst.de>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 17 Jan 2024 19:48:12 -0500
Message-ID: <CALNs47v4=VatsUVfnNsT9jgtbYxvqhR5mgGMu0zrr18ORQVVNg@mail.gmail.com>
Subject: Re: [PATCH 06/13] rust: str: move SAFETY comment in front of unsafe block
To: Valentin Obst <kernel@valentinobst.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 5:36=E2=80=AFPM Valentin Obst <kernel@valentinobst.=
de> wrote:
>
> SAFETY comments should immediately precede the unsafe block they
> justify. Move assignment to `bar` past comment as it is safe.
>
> Signed-off-by: Valentin Obst <kernel@valentinobst.de>
> ---
>  rust/kernel/str.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 843ffeec9b3e..fec5c4314758 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -191,9 +191,9 @@ pub fn to_str(&self) -> Result<&str, core::str::Utf8E=
rror> {
>      /// ```
>      /// # use kernel::c_str;
>      /// # use kernel::str::CStr;
> +    /// let bar =3D c_str!("=E3=83=84");
>      /// // SAFETY: String literals are guaranteed to be valid UTF-8
>      /// // by the Rust compiler.
> -    /// let bar =3D c_str!("=E3=83=84");
>      /// assert_eq!(unsafe { bar.as_str_unchecked() }, "=E3=83=84");
>      /// ```
>      #[inline]
> --
> 2.43.0
>
>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
