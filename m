Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872C829D291
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Apr 2026 17:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775756343; cv=pass; b=M2lu30bi2xtqEUWacYcGJn9ocuZOgRcrpr5uXgtQaAZIxxGtn/SsTbV6CezYLhZNyOCVohprSoNwylBtMUnClyzAxiHSIN24vyJAiuhlAIpo0qoE6Yp9wFovpJvgIbW3EXVTJySNv3trsT7yBzeMbrmLnjAeptc02kRRlZS8pRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775756343; c=relaxed/simple;
	bh=kXiuStpmFby0rJIkMa9TqERydeVdg/Q6N4kyZGXGsVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cn87X5QDKFRNZdigV1zaXUrNA/BVPgXJM63rabsx8yGaSUdR8GdRpQvFVC8U4MW2kMCWanVdy02Plo9sk+a9llbLbjmN/E8v7quCdUCNuDlWwMpM57WJYjY+LkdRxkSGzez2kKOQfQ6sq7feNlyy+4WLmVXcoZtp/WHAkxhYWzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A05BsJIm; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A05BsJIm"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-127337e3870so517662c88.2
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Apr 2026 10:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775756341; cv=none;
        d=google.com; s=arc-20240605;
        b=cjCVQ7aX2RTOt1up3YQbX92dAlHvrtzcZwnuo/Mgnmd3NeTn31U6S14vM8bmYAhC0p
         CZk+drH0WlUWtWvl5XR8ogua4Q6xegU7xRR/3yRnVODvmurYKdysG6rMvOEAI7IsY/jL
         xgHvg466OVfxllKaGjlusiLvlg/l0lK8MwiDuOy9Vs71SylkH7ond4/RFCbLxLFn/RNf
         5PHBiEUE6Ec5NQZBCBAXhzs7KGXixGR1RUp11IwpUtXI6jG7NQAOsAiWmSKYpYEF2uHQ
         QES9IMFYnL8EfYWUvNulVmokTww6e1r/ZDWYGxCh+404mkjdSUXks7ozfo9xTVslBmkY
         EwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kXiuStpmFby0rJIkMa9TqERydeVdg/Q6N4kyZGXGsVk=;
        fh=qPWAnoE7WC6RufeJeRYskjU9ryJeQQJTRPd0Z1b/QrE=;
        b=RKijmJHCoxmMWkftsG2ZdtyPjz9pCtxZ5yDN5PjrNB4bkvPEr64Izcqen52r9SjkHu
         E7KoNpAC2u+CA67mnQxpdmm9lHl1rdco5Ht3wXSm25AZHI5rq5hZTWGmmzDWYejh4L+1
         aM4aZsgM2XnynT9eAmd5IMBjIrzVlS6p2iL0E1hjmqU9IuAwSdw/WTVP3JN1js2ipc/U
         WbnktX3vO4KQWQONjz4GQyaWzm3MNmAYZjZBFsPbsjTdS29DCwl2XhPPpLHjurLjbjT1
         4gbuIcqO7G9znH8AsoTRUlMa5JWEgCx7DBEE/1XG1KpXviKmx1wlvfW05zQ5QNZ1ulJi
         wouA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775756341; x=1776361141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXiuStpmFby0rJIkMa9TqERydeVdg/Q6N4kyZGXGsVk=;
        b=A05BsJImQ3M7iykL+WFn4TvSGNrcx9M8EnGHfaAf3RLNp4wDcxdGZYHWzEBH5B2j41
         j2rBarqjzv1n9ip3sBYWHfvZhEOUTote0uQ9FJEiWW0GkYDbov7euoViBZX58t/uy5aX
         hWmhVR7wpG0cbrAD5R6Xnqi+KhrFk2XkcLA0NpM9bCtO0Z3Idf4LEKu9ibqAH+rnAwpX
         SFTgw5nQgY2AhoshC7CLtob0rwcloygN+D/kIUf4F8gUYM9Cer7eYaUp5rsyylOtD75K
         Ddbbcg/2LbNVOJ+Ndab9eS58TD72UvLF6gR8cfN+wBxfavD4y7ESa1AFCZzeznJfb3Ya
         A3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775756341; x=1776361141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXiuStpmFby0rJIkMa9TqERydeVdg/Q6N4kyZGXGsVk=;
        b=bGKDrkoI6nbwK/XQwi4NQOkxlR7tafIhQhByqvaoiofj/E0/kbon7fRGPqoVufrm4M
         Q+XNMfWWa7Y8Jgjr5UF9I1QlP1376izRHcgNK9nQE2iJ68MXReb4oii2iXEMk++2kR3b
         b27YsoY4V5o1G7vUjFWQ6HNeV6NrprEa/c5s80mF2Uonme1Jk+VkVcVvcxeogUKfClUZ
         gmBVABH1mjhtWrLVjw3rlD3bpPmecSN2hKCJD6Sg2yG0snC0hacJIawiASakm3TkYolL
         GaPSC2+hhQ69ozYjID/0thV89AYacY2FwQ61Hd15GEmOwZUnMcqk8cHc+HLTq7xzr7Ku
         S+zw==
X-Forwarded-Encrypted: i=1; AJvYcCUpcUcnf0QVFpTO/PC0fbljY9nFYXjIm+8GQM8qyICPE7pqwixfErp7TT0EHhiRhAMqr3NE21uMyad8j4eh7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlG5OyhUapF+anDybbFNd1p9L16FTLLfe5+JpWWqPPzd8xAgKB
	enp7IHBExSp1qPThDYjK+MLAUSIEFezZ/nYyogS/1OWoE7D2FVuWgjM1qjdLBcX/OjsVPf/uym/
	YBK8nNKOYOLVDDQ7eXva049n2grlPWrE=
X-Gm-Gg: AeBDieuFbpGtl5z+X1wZYv0Z6w4S/lyWGAhHvMwZp7FLoGPksX7LVjTtgh67NShkOpA
	xCuFsWT3f96IhYtUygTuOCeYMzEaav4bLCrl48PMjs/gb1rtkno5HJruRQMjy/CZ5VGwUd12Sx/
	ldMSuswTDqW602Tcg9VfHss7+5IUxAyRnGSKHFxuUGpIxPK/pMAhAXdCrE1yteC5o3gkZCzaeIP
	38qBiJZn6B8DyBXNsm4u8hFPK/4o7EEOcDCEC951750UO/Ni7n5u3fpaAPccyM9DY5+sr1lPFvC
	mNTd5uKwlPQcIofvScjO/nu6N0IhV65stNcSB8S5DiHnTo+xvJbREE61Ghj0hE3my4ctsLOPnBX
	wg6KmMeC5maY/+oGo0WwDWy5bbMeRCuX/1g==
X-Received: by 2002:a05:693c:3015:b0:2d3:4252:b13d with SMTP id
 5a478bee46e88-2d34252b4a1mr1713519eec.5.1775756340426; Thu, 09 Apr 2026
 10:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-autofdo-v2-1-eb5c5964820d@google.com>
 <CANiq72nLAqkMbiNcExVnYZxLN1g7tr4EZpUj_pwvWrjR+zaoLA@mail.gmail.com>
 <20260407164526.GA2309039@ax162> <adVLhdo-a6_aU87C@levanger> <CAF1bQ=TxmN4q1mw8YL_62wnEsNbz4tCy8uHwS2GOX39o=7=hsA@mail.gmail.com>
In-Reply-To: <CAF1bQ=TxmN4q1mw8YL_62wnEsNbz4tCy8uHwS2GOX39o=7=hsA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Apr 2026 19:38:46 +0200
X-Gm-Features: AQROBzB3jbVd2uNuk1LVxkbJj0FAiE_s0SvkCz96sTWkHQaNAGaks9EjL7LhyXY
Message-ID: <CANiq72n0PYg0sUa6fT2YWoO6RyrSkpb++B2QHHVhgaZxZiUTsg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: rust: add AutoFDO support
To: Rong Xu <xur@google.com>
Cc: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Han Shen <shenhan@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026 at 7:26=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> This patch LGTM. Thanks to everyone for improving AutoFDO support.
>
> Reviewed-by: Rong Xu <xur@google.com>

Thanks Rong (your review was already there :)

So I guess that means you prefer that we (e.g. Rust) picks it.

Cheers,
Miguel
