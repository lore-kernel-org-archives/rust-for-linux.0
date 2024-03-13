Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183315F54C
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Mar 2024 19:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710357013; cv=none; b=oSkmUwhas5sMgN+DXZ20SFkceyVy3J0IWsztHkjkH+XtWkMIzENlCrawOFsxdBXBEu7V69elkBpKBtFEQBkkaKy8dXbYQ1JHT+HQL6FlIq//Soh3SKdMyt/5JqT8CM4l58JZkOv+t3DqlNGpn3dgys8PQExfjATWHLHgqqeEnYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710357013; c=relaxed/simple;
	bh=/e3ATDPA/qgTUOtidYV6rPYvJSOmSFfRGP3WmLW3+Dw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rxm/l+qmesuLCNXMrlez+H7AUyO1rG1YfjjLH2IengI0jTVUWA7u6DbQZ7t/zicPRZEvTZjNS3ueMAaYgOcjUapVX8zkighs9PBLFs1UsRK0FRY5DinTnGYXb7cT06IhSiEgMcY6TRegolDl5Zk+1Rw7ekxI75DpTn8tuZLIyoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=LYsMbAFD; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="LYsMbAFD"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso89067276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Mar 2024 12:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1710357009; x=1710961809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/e3ATDPA/qgTUOtidYV6rPYvJSOmSFfRGP3WmLW3+Dw=;
        b=LYsMbAFDYCXD3MckZOTcH77u6prmiAFYWj5M/UWnnbUCJPyu1HFKN2EBw/wgo70z5X
         lfoUvGTOq0rkqXm0RG0cx8tNzNYpZE0UqX06UN0NyYJ5u3BUxMtFvaAhhBJW59gyaVIn
         cq7U8n2L3f87gYKch4sl0Qoe5sm6j3A/z+PxVaZ2OC2MLgUwRWCRkI3GS9uOcG+6aRdS
         f9MLXL7Wr1ukbPIICewbagdxRHz7ZlFE8tAB5/5c7gAdkk2eVSAMz+LahFzvYLB3WSBX
         cTwfAO+C5Im7qxOL0COA7QnDFGN7cbEOZ0ct65qn+h+GHuBz4aH05STW1cvgCChB/ZeU
         spfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710357009; x=1710961809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/e3ATDPA/qgTUOtidYV6rPYvJSOmSFfRGP3WmLW3+Dw=;
        b=q4+DH9qmJelb+OWvVCv5G4F+b34gKLYFZMhTYzkNIXf07p0qAwJp4twGREkvb46IRN
         XlqLMOu1tzgwjtInVhQ0jTg+qnP583wj6R3SulNnRKNqzkSh6NiJKSn1Zza8UK1d04md
         lmNbHIMqFee3vM/6C4NNLMEWPo5O5zpRUBhZwgJtLqhGjqq9DqIsyMixa0X9ZGnQg7XL
         TNLWdBm6QjiPU25gFzBzFVRZotCo1yXmm+m5GcXYbV3hDMTCf4evFUKSkGyFbY9A4Qnf
         z0KRvjDdc/MfnXdlYKpMUyt05Zjpezzzkh84Q4xsMfYMCsnHQvMuDGPwDZU4EJgJ6KSQ
         ibrg==
X-Forwarded-Encrypted: i=1; AJvYcCWRv8ZIia9FY6pbmSvE0DFMVFGx1QieATtwA/wZJhFWnAcw/Bbi+rcapp326tH3KcoFhcUOwyKr5oKLm6iME2GTYyyLzQyQowQ7C79Macg=
X-Gm-Message-State: AOJu0YyRmUcbrfqtjTsWa2PLgj+J3p3uwk/pheICHmhnOA6oFfLcS0aZ
	aBf6Fuwm3g+1CLlIWewk28JM/T1yTZjC5rEoHAYsab2sL+ENNeG6g5M5/3L0qo63vI7lVcq/EvF
	peToBIXguNUmKV9aFirLzB4ibeYbC6GeWXSR1aA==
X-Google-Smtp-Source: AGHT+IHvOz3vvevhU2+NsarhVCjZjHX3GiH9Xw/oej3y1FW1AAmW1J//l0DcmlTRyaKEnQOT8zoUg7tohMa0pFI5kpg=
X-Received: by 2002:a5b:88d:0:b0:dcc:56b6:6606 with SMTP id
 e13-20020a5b088d000000b00dcc56b66606mr3166914ybq.40.1710357009091; Wed, 13
 Mar 2024 12:10:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226-module-as-ptr-v1-1-83bc89213113@google.com>
In-Reply-To: <20240226-module-as-ptr-v1-1-83bc89213113@google.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 13 Mar 2024 15:09:57 -0400
Message-ID: <CALNs47tj0=k7UeoKp6Myfh8tiLnJwxm3cHa4Qj2cY7sihOo9sQ@mail.gmail.com>
Subject: Re: [PATCH] rust: add `Module::as_ptr`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 5:13=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This allows you to get a raw pointer to THIS_MODULE for use in unsafe
> code. The Rust Binder RFC uses it when defining fops for the binderfs
> component [1].
>
> This doesn't really need to go in now - it could go in together with
> Rust Binder like how it is sent in the Rust Binder RFC. However, the
> upcoming 1.77.0 release of the Rust compiler introduces a new warning,
> and applying this patch now will silence that warning. That allows us to
> avoid adding the #[allow(dead_code)] annotation seen in [2].
>
> Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-2-08=
ba9197f637@google.com/ [1]
> Link: https://lore.kernel.org/all/20240217002717.57507-1-ojeda@kernel.org=
/ [2]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Reviewed-by: Trevor Gross <tmgross@umich.edu>

This exposes a `bindings` type to the user which we don't really do in
many other places, but it makes sense here of course.
