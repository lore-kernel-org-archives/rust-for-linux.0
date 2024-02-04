Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A26711711
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Feb 2024 08:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707034837; cv=none; b=j6CGV3oA9PtpozR6DsLDfXn+Lcnu9QGztpOvErge/wfpvwEGTfKFG04Gi9DEDlYSB8gMhEMvcGhR2sExf8E1Trb3TasH5tJhY0M3511G7YvnuAC9zhdspth3tU1Gi1yBRBp+FhoKEGA/bdBkOlIiizRncEs2i2MVwJuW30+posA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707034837; c=relaxed/simple;
	bh=ThPOHj+AwO/kiUTGKMX17VHUee77oNxD4G0DCGubFDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkcVe4MuHWpr87SjEUzx+1yQVdinVaOypDYg/2rj2K/3MXH0CEQXORUc/oXh3/98p/uiV6Aaa/0FT0pblEK7h2kMVa+2jG1xXRXqApCBkq0hLBeXG8FBQuIed1qr1Ll/hWiTYdTom/JUqLIv5nAMgQtOw++s0PYJdKCWQgZPOMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBPxNIvm; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBPxNIvm"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-68009cb4669so17705186d6.1
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Feb 2024 00:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707034834; x=1707639634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xdg920vJFxMoukkbbgJ9UqRjRgh8bY5h3VYzWJgkFEY=;
        b=LBPxNIvmn8GFo3xrmowtNTPiK3F6ivZHhnBJywqDphwTM9kYw+2+9PWVw8VAUW5jME
         Y/8xkcdD0F4qyvN+b1S15n36Clu26dbktx9acM4CgMWOwaBqtWI8JuZvkwIl1aIOvLb+
         FKc9YncXq+nNOeieD2TF+Hup4r4w1wftSU1rwRXYrDm5xKtYX+Tu6HC3YSz94y4JT92L
         S1cxpG/O8FTuyyOWr+HM3/zA2ha1gMXfcfYCw17t/6fRp3OxJ7a9ycIiRC/89cpnyhYW
         d2qCneZvLP80lMA+xAcq6kO0K6OCsAzc9J0LHq/Xu/OTPEjKwCWrd8GzUXYe6RSJHDYL
         psow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707034834; x=1707639634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xdg920vJFxMoukkbbgJ9UqRjRgh8bY5h3VYzWJgkFEY=;
        b=tIDy7XxjiWh6zrqiLeXNZSldtm13z5CXPhWEa5ioWvd6d4CsrJHt1SENuvB4s7pBqr
         hsa8qoqXB/WucjrNKlbfxUMdhiZua8ijbdr+Yok8iPvXUg82tT/DT80bjrU4T4h0oQvd
         iGzjUQvhuRzoLETUnjeba9Ino26Gy56vgIeQyg/tkSD8DX2npz45eRz+Eq6AN+alI5ZI
         uvAPORozKq2SQAlboOKCAiETTLTQTwaJjLJlEk825D30I4QnBI0Ltk+hWNx0k7ygH6Q5
         O71JjNh049kIRsnwFjbKl1W+bjlQCT3kLgflfK1gYl2phebfg45Vt8ovK8Y2WquyR/E5
         E4jA==
X-Gm-Message-State: AOJu0YySaRjZlau4lLECW3VYdG0Qynz6ReIM452nBai1hHWrTFOiWeu3
	u/H7uHMPFQU9PR1noTuQBRpbMQPTrYqJ69KT4j5i5Q6pT4DpDN4O
X-Google-Smtp-Source: AGHT+IHou/bE7gSGHwpyp4oxvf8NkJqMcHzAX+uzmn18YRGWl+pggEVCnI99JEGeC1wTVgTTm5h+pg==
X-Received: by 2002:a0c:f04e:0:b0:68c:92b4:bbf1 with SMTP id b14-20020a0cf04e000000b0068c92b4bbf1mr3005187qvl.43.1707034834352;
        Sun, 04 Feb 2024 00:20:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUbm4jc/36vOJd2U3w6iAL74Hu6Kz3cmajb7VfYeEINj8jFJ36YHsbX6Sk/LU5q0/OZyVz2noJreDqSno1/MQLhniXaFtb/4CSZCrDSnHTwoSVJaLzYmD84fRoQtOwYwiC/Uc/eWttYnWB5Vr+t1oNUML+JR3PreF9njL4EEto9ruhr7VjaA1Q9Shwzci9+Ay4ZbxR2JA7X+drAjzmjbS4Y7skfUeNp6E7ytQ+1IPP1NAEUoCKDqD8J6DVHoZQIO+qS0XeV3ETxm7LuiLSk0OZpkVYmMpSOfIP052wQpXZMXzjngphD+IdV7FRKJAzccDkXRSPBigWIZSMQNN19K6tYnGcf+2O/FF6mlA==
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id f18-20020a0cf7d2000000b006852ff71ac2sm2549587qvo.30.2024.02.04.00.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 00:20:33 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 48DA11200043;
	Sun,  4 Feb 2024 03:20:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 04 Feb 2024 03:20:33 -0500
X-ME-Sender: <xms:0Ei_ZeVbuWKTDxv8UFK0Fp9-ER9VFR89oCJGkvQMdpuiMLOIozZIeA>
    <xme:0Ei_Zan6jSZ2nEPN_FiRwg-NGHqSdAwLqng3TgJtdRCLMofp6cgXYPJNOWCjALUpv
    30A3bLwKhuCEKOe7A>
X-ME-Received: <xmr:0Ei_ZSbo05JGu6vCdheTAkeTO9dC3nhLVwjT5eCZhbsVEQUaVIhbQ8npEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedujedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepffdtiefhieegtddvueeuffeiteevtdegjeeuhffhgfdugfefgefgfedt
    ieeghedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquh
    hnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:0Ei_ZVVotyLwOnKWKez2RaotIC1FXWMfl7zUdcpmkxVhJNArM4otcw>
    <xmx:0Ei_ZYmOc7Ch5yyryU1LEFl25HD81J4lGlB_zzuKSw0cHd-b_JsCnw>
    <xmx:0Ei_Zadidah6saOgdXJcIu2_BvLYztoAXUg_rHeVahI9xB8nM1_xLw>
    <xmx:0Ui_ZSdt1ULdLDz7maIa8J2TOMQVES0MlpKdAxTODC-irLL3b462ncnRvbM>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 Feb 2024 03:20:32 -0500 (EST)
Date: Sun, 4 Feb 2024 00:20:30 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Obei Sideg <linux@obei.io>
Cc: "a.hindborg@samsung.com" <a.hindborg@samsung.com>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"benno.lossin@proton.me" <benno.lossin@proton.me>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
	"gary@garyguo.net" <gary@garyguo.net>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"wedsonaf@gmail.com" <wedsonaf@gmail.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v6] rust: types: Add `try_from_foreign()` method
Message-ID: <Zb9IzgZ_OsLlsMUg@Boquns-Mac-mini.home>
References: <0100018d53f737f8-80c1fe97-0019-40d7-ab69-b1b192785cd7-000000@email.amazonses.com>
 <20240204075827.10747-1-linux@obei.io>
 <0100018d73205a53-b7739657-2731-4164-b940-c633200a221c-000000@email.amazonses.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0100018d73205a53-b7739657-2731-4164-b940-c633200a221c-000000@email.amazonses.com>

Is this a version 6 or version 7?

As Trevor mentioned, if you accidentally made a mistake but it doesn't
affect reviews, you can reply an email mentioning that. Do NOT send a
new version simply because of that except that you're requested by
maintainers or reviewers, since that would confuse people.

Regards,
Boqun

On Sun, Feb 04, 2024 at 07:58:36AM +0000, Obei Sideg wrote:
> Currently `ForeignOwnable::from_foreign()` only works for non-null
> pointers for the existing impls (e.g. Box, Arc). It may create a few
> duplicate code like:
> 
> ```rust
> // `p` is a maybe null pointer
> if p.is_null() {
>   None
> } else {
>   unsafe { Some(Self::from_foreign(ptr)) }
> }
> ```
> 
> Add a `try_from_foreign()` method that will return `None` if `ptr`
> is null, otherwise return `Some(from_foreign(ptr))`.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1057
> Signed-off-by: Obei Sideg <linux@obei.io>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>
> ---
>   V5 -> V6: Remove duplicate `Signed-off-by` and Add changelog
>   V4 -> V5: Add the solution description to the commit message
>   V3 -> V4: Improve safety comment
>   V2 -> V3: Improve method comment
>   V1 -> V2: Add the trait default implementation for `try_from_foreign()`
> 
>  rust/kernel/types.rs | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index fdb778e65d79..04a356ec3534 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -46,6 +46,23 @@ pub trait ForeignOwnable: Sized {
>      /// Additionally, all instances (if any) of values returned by [`ForeignOwnable::borrow`] for
>      /// this object must have been dropped.
>      unsafe fn from_foreign(ptr: *const core::ffi::c_void) -> Self;
> +
> +    /// Tries to convert a foreign-owned object back to a Rust-owned one.
> +    ///
> +    /// A convenience wrapper over [`from_foreign`] that returns [`None`] if `ptr` is null.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must either be null or satisfy the safety requirements for [`from_foreign`].
> +    unsafe fn try_from_foreign(ptr: *const core::ffi::c_void) -> Option<Self> {
> +        if ptr.is_null() {
> +            None
> +        } else {
> +            // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
> +            // call to [`into_foreign`].
> +            unsafe { Some(Self::from_foreign(ptr)) }
> +        }
> +    }
>  }
>  
>  impl<T: 'static> ForeignOwnable for Box<T> {
> -- 
> 2.39.2
> 
> 
