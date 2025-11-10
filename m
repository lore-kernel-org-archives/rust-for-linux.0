Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE730216A
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762769973; cv=none; b=FH8OjUMyC+IPlEhdm5fW5myEyT7ENmoFSjrVq2hBKWeKztwM1Y3lAWG+T5k/a/jJF3j+CwN3NH1UYEk6R2l1pblVcDg5a7VsHYfLpc2jtgSA5sIlMSNjJwX6BcjdcVeAUNNNNApdlfcP9Frcd6MHFwr0+HDdEtdSF8EsYWZJ7OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762769973; c=relaxed/simple;
	bh=2GGpzP3+SpGhGrCwsh+gDg6Isv8qPzoSRYTGoMRT1HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbV9elgBzXVCSfG5AowPBkQqW3G9+j8Dl4nnhg8BRFzAsYDFSgwczdgAIL7ypgyryTLngxEdrHIU3eGxL+Ree6exHXlCdn9e8jpSnI3QQaXBEM1IZA/BFjEWJ+H7eBL+5nkr0ieB6TfzlGmVKdE13/OiFq+NgzM4fYAdhGv5kpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtgdWewe; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtgdWewe"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297ea4c2933so588565ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 02:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762769971; x=1763374771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GGpzP3+SpGhGrCwsh+gDg6Isv8qPzoSRYTGoMRT1HM=;
        b=UtgdWeweR9/lv6NVw6Wfskc4r1yK5dmSL88Ilk8tToguCJvbTy3KaX31nBMjnWqBhH
         zP8dPw1PXr4unrBCVUnPtluVN85l5Rk2NmbFukFlGzx7PeX+/ApRK6nfSamoVeayCDfR
         tGanf1ibqQz8KINUU1zYsxsAVSJur1z4NKAxl0QbeOtTAo1c0Wn1iyuUWV0DlwtV1hOo
         Nbbz/2UD2WXXi4x29arHg1iEo3crsCNa0NoTEIsP6JqFljg+tKMEgosDHoaXeqQ9eg+8
         BF/cqDk3dPqtmkCKiheRXKbuZOnmy4yZDQWhSPnlKqeQPRYbKyz477rinG9exoPEskPP
         w2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762769971; x=1763374771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2GGpzP3+SpGhGrCwsh+gDg6Isv8qPzoSRYTGoMRT1HM=;
        b=WGvBP/IbqaunnvY+2GF0c/1oFc4S2mQYgPEzCQLTT37PtuyeXBpPBuO4FIr6kItDCE
         MJh+5QjoKrJypybB29rpg7hILhJlue14p5kYjUVtXsYJETidEYZaeWatjp/0EF8nty8q
         33cxG0NkiAsy3QaiNNhLj5oxFFW7/mc5izA7f0daY/h14NP3H63gGCVQQSFyXk4CIhfc
         8t8ezEMQNpSJqqAMyuXHLRvWoG3n6AlitPs9icIOqVAS/HtoxG8xgt0Db7Ixl2IHHMfs
         tevQ98ri/sVSjrUbmnE1IjpABsc0ZU9FL/PDevv7p9nH81qbZwUUCJja5L+BRqOIVt56
         JDqw==
X-Forwarded-Encrypted: i=1; AJvYcCUITSfi3C12DsWSJRMtYLYgOkxoIRY4CtNK7fnhTU2ReW1opKDztr4+jcn6LAaFkaYK0890wVVBD2ESOF1BHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNERZpoXjHzt5w9BwaxPt6/SfacYHm/C/E+bcnx9WJEkSCqBhp
	v9KdcRDu5VLIo1bwr0KkpPC3tXVo2/0dF9//uzsKOXUq7Br+J3LbxBfk1D4K0x+mOPkHDQHkbW/
	ktUigz3f/Za0VZHoP2xI55ze9tdQ6Ftc=
X-Gm-Gg: ASbGncsCI7YZzh+ia6ir2/yXt3N2zKogIk79wRfT5HwslTBxRhCNzs48U3u57WI3nbs
	wZKL+WjxdYADBhKmmlQVVvNySy34M8w6oM12GoNJLEtkGEmm6KNXjHdW98bg9aULPhwx2ts8U8i
	KHDAWmBMmLbx9RoXEv/clrplekjEUQhKfIe2fNxNmXEQkxRSrpjfyFHvxT5TtzJEAvSeaqkUsLP
	SsK7OqcbMcqAsAYoXV9X4Pxnx76P5SSfpEGmwTacffVjvA/Xrn9S/x6FJrjuJtN5DWmA/inyJYW
	tAIKsZmW25fkXN4LofMNrJvLqYJY5Dl6VTnsMyznbC8QW0Cgyo20r5GVdKVeVsp0b5VE7COwdkp
	iJJCF1xM/813tPw==
X-Google-Smtp-Source: AGHT+IFdFdVhwPLfh+yTbdERl64DQLjGM0Rh3dpM34UNEX4KxB1YYZB8zJPvvmK5YGpWecjSiRSDrXRu3SuqxEmyZWo=
X-Received: by 2002:a17:902:f683:b0:297:d825:bf22 with SMTP id
 d9443c01a7336-297e56831acmr54002375ad.5.1762769971269; Mon, 10 Nov 2025
 02:19:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-3-ojeda@kernel.org>
In-Reply-To: <20251110095025.1475896-3-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 11:19:19 +0100
X-Gm-Features: AWmQ_bkb3t3uALt-6fRzPMlQAGQiJXQm8chK-T8Qof8lqrSz2aUgJvRPu8rtcUQ
Message-ID: <CANiq72n2TDN9oa7Yu2otk=HfpJQ7NA_X=up4uGO=JszGvaGspg@mail.gmail.com>
Subject: Re: [PATCH 02/18] rust: kbuild: introduce `core-flags` and `core-skip_flags`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 10:51=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Thus do so here for `core`, which simplifies a bit the `Makefile`
> (including the next commit) and makes it more consistent.

We may want to eventually use `--cap-lints=3Dallow` here too, but the
skip flags here were already feeling a bit more than needed for the
series.

Cheers,
Miguel
