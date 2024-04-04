Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CA442072
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Apr 2024 12:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712234831; cv=none; b=tEKlFsQEXUIMC2PSn5oW0yLyz8+7zlSrhS+YZVrydBbfqM+nsLLBTZXtcAsxcglu5jY6p3O0sDrNA5LRYTltUfOTxlVN3C3faj6dangExr9AKEl729KbVmNjiHDG4hxafSvedq+m+s2h0odPO65RaHCnVrp0rapbn919fBWL7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712234831; c=relaxed/simple;
	bh=LKX7vVNyqnnyjHXxmLAOtau0jOrACCVSiJJ7CZT6tc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0SqfG34b2SOTMqY4EvanscaTyKjvSuzvlB0FGWzhvyZ5+YMft4N4S4o983y8mFZ9tUaLgVTRG+HKTHreOd5gfA1UeoQwNeHVQvOQL4/GeZ4XjZnrILUDEk3C+dKi35BlT07WbzpWuUKSwNYgk5WzSyLWzeaVLqvPC2SEAJYhU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UL7h4T/O; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UL7h4T/O"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4da99a22b18so371777e0c.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Apr 2024 05:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712234828; x=1712839628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKX7vVNyqnnyjHXxmLAOtau0jOrACCVSiJJ7CZT6tc8=;
        b=UL7h4T/O0Lx41kWnx+2mfQhaonmBn+SgqIf7nMnevAvzKClKcdef4gze0prGteprf3
         OTlDWUk/Zwk3fyCHViWQYSCFShtvxFZQaCBvKvmCY8hftc8mg/TPvEj9wgyC+B7lzDNv
         rYx0BNBZR4CeOsVQ8lr3xhYoJLbgyBJhTYSkl7MfUBkD4qZlr5TesKsGky/TLQSYr3m1
         zOaxNcOBuEONg3sGreCHftyWQCQeQ1KotHgff1P+wLd4rFaqvVlHUDVoYMctY7Pqz86G
         tyzVhPHMlWLSA2fDKrb/w0ZDJPxyRB10NdCWMj9qb9g1t5bJySV9JRWvOVkNW8gKZbSJ
         pD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712234828; x=1712839628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKX7vVNyqnnyjHXxmLAOtau0jOrACCVSiJJ7CZT6tc8=;
        b=XW2jTj4PODsgQTGmxxvKF2+MJ9KO99MVvuxNZ4PQsVzitl2Z45R9xLuyQrZYS3AQvr
         Yz6CRgGlnoYBWQ3NbaiyN4s3WXpZKV4XpHCn/78NJEpmT7lOVWPGpKWUz+OjfkN3nL9k
         uthMjYuXU1Ds0UKApVixAxGDiGt2vRGpJ7eF43TEHTggFyvif1o721DfQlOcsXtspoQ8
         UTgZd49DHvV/hmY6YpyND41Sf6UDohXnrGO/82T0U/2XtDEZSIhKSZp3OxMFS6rlrnS5
         XAtsiJQFLshrjuN9njcrf7NRX2uQpEoLaOMLIPKGb3qVLpZ0tPnIR09MEIqpf/fJM6E6
         YZpQ==
X-Gm-Message-State: AOJu0YxFBO+z061G6IykfMoxD8nmJDaLSRQp1D+J8m5zyXPO0MxR/A3+
	8pzsb1a9uaw9KQOCVsIpuj2421ZMA+cKFzmLeuYxJhM554nWL8VsW8j//9E6MJc/UVj9zu5/vYI
	Lj4Nj2TSIw0hUrI7nqmWjij+IifE4meBxbAlT
X-Google-Smtp-Source: AGHT+IFKwJu/g7BbPnYrYJB2WSSLAQgmbJ4c/CB4oOIccB6vlZA5jW33C9kcqZQFCvLNmqUBHzsgj92sT6oOOlwD0UM=
X-Received: by 2002:a1f:7c8f:0:b0:4da:9900:a547 with SMTP id
 x137-20020a1f7c8f000000b004da9900a547mr2081279vkc.1.1712234828230; Thu, 04
 Apr 2024 05:47:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328195457.225001-1-wedsonaf@gmail.com> <20240328195457.225001-2-wedsonaf@gmail.com>
In-Reply-To: <20240328195457.225001-2-wedsonaf@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Apr 2024 14:46:57 +0200
Message-ID: <CAH5fLgi7R0JX8sc-cCQ8eUgzXFx+6hBGZm_gMZ_RvHPKZeB2ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] rust: phy: implement `Send` for `Registration`
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Trevor Gross <tmgross@umich.edu>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 8:55=E2=80=AFPM Wedson Almeida Filho <wedsonaf@gmai=
l.com> wrote:
>
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> In preparation for requiring `Send` for `Module` implementations in the
> next patch.
>
> Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Cc: Trevor Gross <tmgross@umich.edu>
> Cc: netdev@vger.kernel.org
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
