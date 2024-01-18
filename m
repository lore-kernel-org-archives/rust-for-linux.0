Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3C420F2
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 01:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705540282; cv=none; b=S2HvBqnBEo94J6uwm1N3Ax7VtF0DMFBiOQ2IMsGP3fTgUD8rm8wlw9DJGm5TwxrBw1TUpbxKAgwssRZEYki7KFyckIbRHFWkc5SZ0/xtzznxPkNJJaLeVM1koiUw3IxSDJEX8qm5fmN3S7T2pWcSJJRwTSKovISbL/6iIDZshJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705540282; c=relaxed/simple;
	bh=Mbiemn9bNiqAzsD5hmKIXqM++sizsaeERmPkQsqYaMI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=anRlyjspOFeaQDKgB3wW4dIHYqk4WEh5Idio87HZW1fpfxmmySbrYOHRZhoqRrcg1oDNgmuMcDxy4pnAe+9gvhc3R61KA80sxgOaehTQkm4amWuF92Ue8pPsOgvg6oKegE/P0mC+FFlpKTgiIZj+eqlsa6YVBxVFG2GrstzmpfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=noiMZr5T; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="noiMZr5T"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5e89ba9810aso97323267b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jan 2024 17:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705540279; x=1706145079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mbiemn9bNiqAzsD5hmKIXqM++sizsaeERmPkQsqYaMI=;
        b=noiMZr5TDMMViTZQIlnAwRJxKmmSyrzM8OdXQeabufpNGn5GwKjN0CgwHRHiYgh60v
         p09XX0QWeCbbo7M/SuprVPY50wj1TKTJm5730P83AnYL4vewsfKE+twW3E9CAxtTyPkg
         zyeHseCCuLNrPT//+57gp/84SmuIaLb12UBBrve3le25sjKsGHErJ0SB6K4QR6b9VZbu
         lqsBomxS/6Er6lkfVRGTwmahkiuAGvN7LwK1pF1u2Bgc//O8AHmyIymCM8C/UKXIXkJw
         Ll75gE04W6ZNO7n19MnKZI4FT8bq0yUE6VR1NqfpH93Ts6GDASzvxEEa9xu8dVjbv+pb
         Yzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705540279; x=1706145079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mbiemn9bNiqAzsD5hmKIXqM++sizsaeERmPkQsqYaMI=;
        b=MBjnJfx1mtnsOfwwt1AA2CGBKZ4IeUeBLq7ABgtQ4GAqhXI9TvvqREf/jkaGkJJT5l
         zqfLwY3qgR6MeGLmhJqov5z5H3H17xpEtIO9WE6d+0N7+epDjqw1MHBeIgetIRGJL09x
         /y5ZOLMNLAfFWux9qWx5fq8RpoJFe4ffLABls9lKcx/xZfyeo/HcGYt5r8lEaMH4KOtM
         3+GRj4Omo+kRFb+DLiv6YhYUPGsj4Lr8m+p2h1ixSXHgmoVEx8VXzjq+tox3+ZqWrHrJ
         EUbChpXLT63Tsb/Z0Ef7g3j5KCC+45+Amjog+xlvNyREO3YCDo0021yd3tbkjlkpDPCK
         pRGQ==
X-Gm-Message-State: AOJu0Yy+ba6DxPtER50aitIvDy/c6oMY006NscVcO24XH+bV6v78/ppK
	LLhgSu0rGBIQuGnm7ES+P8JwYcuUJnYbgJo83vY/ni0krdq/aGQEKEcAes0sI2ZgN4X3OXGDgHQ
	+TSr3n/oPNnrDdOz9ogtmESkmX6/FJ2rgaRxW9Q==
X-Google-Smtp-Source: AGHT+IHBCsfQctPq2b/mqGf5kAt0lT17/b/zhvefM8308FcYubd+ZlwIaNu1OG6pW9VXpJvA7GY9mU7Yg73C+w0NsRY=
X-Received: by 2002:a81:df08:0:b0:5ff:7a74:412e with SMTP id
 c8-20020a81df08000000b005ff7a74412emr84621ywn.38.1705540278832; Wed, 17 Jan
 2024 17:11:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116160141.165951-1-kernel@valentinobst.de> <20240116231035.168838-1-kernel@valentinobst.de>
In-Reply-To: <20240116231035.168838-1-kernel@valentinobst.de>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 17 Jan 2024 20:11:07 -0500
Message-ID: <CALNs47u5ZhDm8Wu_nuPJnSkk0E2dzPcGTtN_D5cPBfcLKYgyug@mail.gmail.com>
Subject: Re: [PATCH 09/13] rust: kernel: add blank lines in front of code blocks
To: Valentin Obst <kernel@valentinobst.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 6:11=E2=80=AFPM Valentin Obst <kernel@valentinobst.=
de> wrote:
>
> Throughout the code base, blank lines are used before starting a code
> block. Adapt outliers to improve consistency within the kernel crate.
>
> Signed-off-by: Valentin Obst <kernel@valentinobst.de>
> ---

Reviewed-by: Trevor Gross <tmgross@umich.edu>
