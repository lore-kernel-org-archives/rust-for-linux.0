Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EF11F95E
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 04:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727583670; cv=none; b=mAWvcdcWfq/A6Ff0jaEiy5NS3JxRB+1/U3VAOSAM9ZTL7/Iy2KTv6PxiwJM9MROUi/VGUhvgTWYBv5NQHnHNlnqEIIWozwYUR8d3R0Lq0MtgMnfaYIXYdI/tiUB1UGAtDTD1x0Xrrl22pFeD884DIPRlpsLyq1nStmkNYLPVEyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727583670; c=relaxed/simple;
	bh=pHVoxB91LNUpLKS+bFIZR71Nc4XMjyS1YH9Of4Peg3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tunVKJY81p1xoSd3HQAKQyEpSxzJnUDnCrs4ogirhalFj3GtKBhj+/IxavzMUCCg+kWIkQB5iofVaiBdGGQ8fCajnL2NF8wKKNYTWkhfvsYMQvNTwr4+8QCPjPC33mCFEBzdJtVp7R5OibfURZGzpvaPlQCxrjD7tVRIxyibrFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=jeqXBgO4; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="jeqXBgO4"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e25f3748e0so4521427b3.0
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Sep 2024 21:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727583668; x=1728188468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHVoxB91LNUpLKS+bFIZR71Nc4XMjyS1YH9Of4Peg3o=;
        b=jeqXBgO49Acd1azmP/9084qlmm94m8LoYp2aXtRe5zAHND89xro8zU8+1x84nsYEjs
         yPspw177xw7U9bDhARmLFFf6jn06447cYtifSc7ClC0sEBm7oIQ2V0Lo5qKgTYCMO9qO
         qIli2yMxNBQUgsfu8fWjFSrCeuTPWf75CmGGMtVRv6eJFzpN37NGD6ITAhRJLYZHNodi
         I07CahPhahUC5ii9K98Anlei2mZCEuyQ63yVbWHfvzezMiQwT4/Lj4m4D7vVXysJHKdA
         k9sJs3JNfy43FJF5hHbEW/3uoTxVwMg7ml3JKSgGrqN4Wjx627+NWOEZKxdyWUSurwg5
         8WKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727583668; x=1728188468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHVoxB91LNUpLKS+bFIZR71Nc4XMjyS1YH9Of4Peg3o=;
        b=IkFdBtDCjVXY3/MWbJT+tIcZpIBvIreZ8NT1M+pUTW6UIOgd0i+afEwzGaRBvHsjyC
         Zc7njSpY56w7ddRgO96ZrSdjVbmEELmWjY4wCdblwqhMakOatfNzs327MKXUyEqXRTsw
         1J2H1WMy0m5iMXbMuOw4tKkNjVrV7jMat4vqQHQkZRxpLI7gw3Sw9FBJYa5TQB9xLOXw
         XUtr8IlT60MClSVdiPqKZESxH2owB5/05zK90tF5Vzhk2vnzAi+DXn01e7I0Vm/vgKrI
         8mVYi8H6sp58Edjb84LbkvcKl67YiXvRlOCHVWas2MzHm6sn7LLYewAE6v/trdcgZuBv
         s0nw==
X-Forwarded-Encrypted: i=1; AJvYcCWENBaUQ6qIoVlBjUB/VShkSJatqSvwVzRV8wgAGzZjI9yymBnPICoFL6B+heuqfNWPO5zp0R3OXdUA6mDMrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5HWGNA4INlvs2bFopT4YKk4wKYS+6i/5rqFAr+ZeVD/jTSMMD
	Vc1Q5SWFLrt8oKSNJppN3mYIiSnAWtXDgr9Bstpaf/vV1cmuH69nnS8z66nRs+qH066ERVjMMek
	S8fWkVTy0wgOdv8LYUGguo85/dVyKN/mJhPXp8Q==
X-Google-Smtp-Source: AGHT+IFcGTqHY7ozyyABT+lA6IrUxrrq8O1OudXtxS0Ccg/+2lxmPPRsG2ROBTXVmUmB9im75BbjPDh1s/kAip3anI0=
X-Received: by 2002:a05:690c:dc6:b0:6b7:a7b3:8d94 with SMTP id
 00721157ae682-6e2474f4703mr63064527b3.6.1727583667787; Sat, 28 Sep 2024
 21:21:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-4-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-4-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 00:20:57 -0400
Message-ID: <CALNs47sFE+mgkVL6_mXwuW_LRCT+UMO85ZDWdSYRkgqVk-QfPw@mail.gmail.com>
Subject: Re: [PATCH 03/19] rust: types: avoid repetition in `{As,From}Bytes` impls
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:44=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> In order to provide `// SAFETY` comments for every `unsafe impl`, we woul=
d
> need to repeat them, which is not very useful and would be harder to read=
.
>
> We could perhaps allow the lint (ideally within a small module), but we
> can take the chance to avoid the repetition of the `impl`s themselves
> too by using a small local macro, like in other places where we have
> had to do this sort of thing.
>
> Thus add the straightforward `impl_{from,as}bytes!` macros and use them
> to implement `FromBytes`.
>
> This, in turn, will allow us in the next patch to place a `// SAFETY`
> comment that defers to the actual invocation of the macro.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
