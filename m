Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616082EFD86
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 09:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757323319; cv=none; b=kdFojFH6DayhhsLxRl7WoDh36eIC2hpC86aQDzafLWFPOo/nJ49AIsfekJAPD7PHMbUg0dTHgv87BVfU70QgkWgQeIV9mgxR8pbGhMRHFdPfRNeFb4NmthlrGRDEBOG5L1lThFeLkjyaGttzW9PbWfQsUqUl5BiVDLi7Kqh7KjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757323319; c=relaxed/simple;
	bh=0z9cVa3ZGgTnVbrzNiNgVXxUbYuBbQzrkmglVvtJ/tQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCUl++oX7iljygFwxLog3SWQuB+VZ87ZAmNA8XFIR9CfsyUXUz2eS5DxEWqjhWgVatBEcDHyuKSiJKYFzhcMtXXyhqrh+Hxuo+WC3+2MbZ1BzoHlr2BP4PccPlK7YkCyVMquTG05wjuZ/XQCk/4LavNQYubYbDHmLA2u72Yz1+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkNbTAYU; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkNbTAYU"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32baaf13944so350047a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 02:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757323318; x=1757928118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mM62qRsSc5srCBf88+qBlrN86qJjbrYRmx8A4Z656g=;
        b=jkNbTAYUa7f34v+VjKDlaWlDjQsZYdhWjz6Nfekrei2YGdaT9sl3COEsmoT5YrCzIb
         vg4/w4bzYkBW8IhwAbwtRGhbjjDuRh8tJ6qNtRXFfpb11i6Q4yQg255Fv7ycei4nJeG7
         LmPsehkCj32aAZt1sNRH336U4WYNBmZtSQjx8SVgB2YRqbMGb4izZ3BhFH4UWWY0lr1k
         Ua4HT4WUaWtlE1wLRo41cJwQoXbSZm4V7ZsrsO11sWgOAaPSIztWGEXtPnUYihZLvGxG
         uqOrlHM38NLaFvhIaNQk9v5J0FCOoino0JynUQ3Df3Y8YqeZqNd3C2qCQLxCrSYN9CcQ
         rjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757323318; x=1757928118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mM62qRsSc5srCBf88+qBlrN86qJjbrYRmx8A4Z656g=;
        b=Nglu6MxEr1ych1U9c9WkdZITgAOPNMMj1Ar4vwn0evrUF3n3ByPQLtvEbU8DsXeJzr
         F6WmKzt0p3nRUeGDP/UJS4poTcdF7omhVdI7P0SGIB7kHK1kUKgEFoj6eF92TFB9rCu2
         5bBpIBD8jmVpC/V/dekZUG4Rxd/d/nVH+bbWiT0RVPVmhR5YPaJUJjMQab/V27UOt654
         YhYLlljzWNtht+7mMRGyWC/ZVqL4pXQKbrIgCLIIEWuaCqjoTbO33IVi3jTYMH+iKa96
         261ET7H0gN143WjcWNxoLrrpZKEz1UWKRJ0lt2vPwhC4ANbudf8jheN1WoOYsb4vFzyh
         0dyA==
X-Forwarded-Encrypted: i=1; AJvYcCUnG14wVtqbl46pRQxFOCtnyqGPU3txUnbtakY7DcbD5cC2kAN3bSZ9eF6KfCpWqZNfxa3/Zp3UcNCKwNc1fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiiKTXsPINNG8++CHT/jLKjzMANtZJGHMPzoDXDy3g1bbNq2sb
	5NIUr/AIjP1kxLF8/CkBzBnTEuUn4GlpC1jIgvfsR7TDlNmBdulICbFkqBnsJ5uGUWcoogbzrxg
	P7lSqA2Q18pLQMRATofJBfbgza8x2UK4=
X-Gm-Gg: ASbGncuZ+a17ru+XaMlmEMvcCsMb9IQTkYxnq+VYLsv+LzNz9q4Raf8dBuzCocRIi6e
	q3UGJwmzaETcYvJ18tnzr65Zyp1ogxHowjsvCR/bQenS6FJwJchK6X6YcDHhba8PcEag9+gcQ6U
	C5KGC2YKBE+/C3kBnTl2T6LYK9ElySa/2T7Mgd+TlsX+e0P6EbUmirSoqci+SSjqsij/yDCd23y
	3R9KUG17fZHSO11+emrq3cYZUSXh1sUff7M4ej3jxz1t3nnSS1Gxj7DRB6hJD08zXNz9lLnY/Jo
	w/vq9cra1EHKyQ0oXhMMrexlKw==
X-Google-Smtp-Source: AGHT+IGXMK7+cZAAVpFpxTkK8NFJ5GpIlWb3XdV/jm/+BDHICZ9Yyh9LpQ6Wkf3wWPTEU0K3zgMbkSUzOVNF9o1lOeA=
X-Received: by 2002:a17:90b:38d0:b0:32b:6d04:e78d with SMTP id
 98e67ed59e1d1-32d43fc8366mr5580461a91.6.1757323317561; Mon, 08 Sep 2025
 02:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906140256.3059395-1-vitaly.wool@konsulko.se>
 <aL6YHkF96ICqqbBZ@google.com> <94252007-f389-41d0-b5a0-ed948225543a@kernel.org>
In-Reply-To: <94252007-f389-41d0-b5a0-ed948225543a@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 11:21:44 +0200
X-Gm-Features: AS18NWC-N0hKvyAGOqDrWbVgpUjoIL90qVqsO4etfYvbVKtZnYoC9DEfXs_94Dc
Message-ID: <CANiq72k6OXcvjzKimfzKAAw8QPzDoVxUx_smFA8KU6gEwJ3yeQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: rbtree: add immutable cursor
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Vitaly Wool <vitaly.wool@konsulko.se>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 11:06=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Why not use &raw? Consistency with the rest of the file?

I guess -- it is a good thing, but since we are actively trying to
move to the operator, it would minimize work to avoid adding new ones:

    https://github.com/Rust-for-Linux/linux/issues/1148

Cheers,
Miguel
