Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505772C685
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Feb 2024 02:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706754249; cv=none; b=sEVvdtfogJ2T4CcOkOcBfk/1enXTj73o3e34FzEITbYHZo8+XMcQrZdCagL0+xf/m6GJsKtuWjePzxjbhS4fsVaHqUKC1zPdS6zVyhmdvft5P3al1dp4Qg6ksiix1yAdz6oYiQ8W9Ou8VY6Tk4jhPBPjRiVmeHwplcVl7DqROPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706754249; c=relaxed/simple;
	bh=fkXFos6L/rV1zWpZDWOfhA322McaQHE9Bg/adiPhBFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTnWUFPPwIkLLYr4RgDzKu3Y8zsKxcNTgJ5Cx+Ui/dD71DD19xKpmYr0HMtbKgyIwoF2DdeFpqDN2+4fN+gekdJ6XpzIdU1j4GjFhp4tJY+1L0oJ0L6QRESmgbYJRtXoCBc/VBP3IbJbGfyoK6NWgfEItxfsrzi8qGGUWDDwQpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=EEPzukSa; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="EEPzukSa"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so410271276.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Jan 2024 18:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1706754245; x=1707359045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qv9t+IRz0wmSb4+k+n2HrMuYyzYj5ilzOfW+hmCAer0=;
        b=EEPzukSaLKvrksbqis9HHjVin2117HV2j1or5bagH2+o0t7FatYOKbhF1BaEnBlDtI
         w7B3Qz+RRUAkD5RVoPtOs5UDYj/fqstt/SkU6mvfX98jT2M8GquLJClOv9WBCwo7TMq2
         Dccj4I3K3pVwmWwQUPcZBq4AhAbZ12rrHpupWmAiroO4VWbRlA22Oetcds+UCkgfP3Sj
         z1plVxhFhElNTLMhnquyF/krzK/w3FXmdzqbGLrOel1qnhTWtvJ4N6fEPu3evD+tLIg5
         I3Sxe2A3OYfZU/gT4Fz5x7Z4UodxEjMtzRAfLfGjeEgK965kdTR+C2EdsKcp444dVfpo
         PGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706754245; x=1707359045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qv9t+IRz0wmSb4+k+n2HrMuYyzYj5ilzOfW+hmCAer0=;
        b=jNa7W1yCKYVcUwhq/ZkPr3G3LH8aeRf/QoWpnQvX7uSTa7lsdXVmOgBnVXn3rO5y6n
         GyjRRodRpqRmO2522fUOjR/yX0O//iGjpanz2IEZoSZ1okTg3GsKg/PVc7RUJjyjVnj0
         GFFIuoNbcvXsV9JKRp5rfMns6uVgesl4149kJQdwda5MyU1tdebJYPOj/IwZQgt1iwDU
         2kSEvCXaPukS9FY4bOcl5hiQM/qQb3VHU3Hu33tsaHWrtsHfGe/GbnfgK+oB5l0PpLnp
         Gb4Xxl6J2ZhVSte+ePQqS6Vaqfuiw66udums7bZh63lTmYLfPTwCkOb0KMeJGeu/rI0A
         Dxnw==
X-Gm-Message-State: AOJu0Yzvep8G4oliAElNpbaCowGKJ5Vigd9Tem7gEWOx3Un0YgpVROm0
	fQq3mL+3CyetENrfYZH76uejXgXgq3QTo569oKxXLsOW9rvLbZFYP/5A30mE5vcnAXKy/P3tK2b
	upTVsIKkUiDQa1dxVCczV/8WFNVkeVj8dJt2I7A==
X-Google-Smtp-Source: AGHT+IGFdlt1xxouZCrqMQsuo4SbJafYi7z8vsV1/H2fVQtIyjxA5hGHOKunnfjVMjM5v9SAOouIHOknc/Hzrdxjy8U=
X-Received: by 2002:a25:1e83:0:b0:dc6:1869:9919 with SMTP id
 e125-20020a251e83000000b00dc618699919mr3203708ybe.41.1706754245121; Wed, 31
 Jan 2024 18:24:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131-doc-fixes-v3-v3-0-0c8af94ed7de@valentinobst.de> <20240131-doc-fixes-v3-v3-2-0c8af94ed7de@valentinobst.de>
In-Reply-To: <20240131-doc-fixes-v3-v3-2-0c8af94ed7de@valentinobst.de>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 31 Jan 2024 21:23:48 -0500
Message-ID: <CALNs47t1OME29WyYqv_O8PQ0ZesrXEHtg4xntwQWgL0O6f3L=A@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] rust: error: improve unsafe code in example
To: kernel@valentinobst.de
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 3:24=E2=80=AFPM Valentin Obst via B4 Relay
<devnull+kernel.valentinobst.de@kernel.org> wrote:
>
> From: Valentin Obst <kernel@valentinobst.de>
>
> The `from_err_ptr` function is safe. There is no need for the call to it
> to be inside the unsafe block.
>
> Reword the SAFETY comment to provide a better justification of why the
> FFI call is safe.
>
> Signed-off-by: Valentin Obst <kernel@valentinobst.de>
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Trevor Gross <tmgross@umich.edu>

> ---
>  rust/kernel/error.rs | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 4f0c1edd63b7..4786d3ee1e92 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -264,13 +264,9 @@ pub fn to_result(err: core::ffi::c_int) -> Result {
>  ///     pdev: &mut PlatformDevice,
>  ///     index: u32,
>  /// ) -> Result<*mut core::ffi::c_void> {
> -///     // SAFETY: FFI call.
> -///     unsafe {
> -///         from_err_ptr(bindings::devm_platform_ioremap_resource(
> -///             pdev.to_ptr(),
> -///             index,
> -///         ))
> -///     }
> +///     // SAFETY: `pdev` points to a valid platform device. There are n=
o safety requirements
> +///     // on `index`.
> +///     from_err_ptr(unsafe { bindings::devm_platform_ioremap_resource(p=
dev.to_ptr(), index) })
>  /// }
>  /// ```
>  // TODO: Remove `dead_code` marker once an in-kernel client is available=
.
>
> --
> 2.43.0
>
>
