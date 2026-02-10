Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A5133343E
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 23:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770767735; cv=pass; b=dWSWPoClqmWiIQqF0MXzRd6vFvH05yf4nZUk9ZoMMGQqVEZqr6sA8as7ukQjXZALl/FMZbLxyRq/avou8VAhh4bPoMHWhnLMi6Nv2RQJ6gxwknxKcQOLO3hnFKVFQT6Oz6C37J5S6TMgu5oJy0oV6+oKoTXFJZ9AJGRqRtk1HG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770767735; c=relaxed/simple;
	bh=4uWbQ7qEGVK7s6dzdSol4VsuFBEkwTb07g2z1PgY5kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVKn1xK6WenezIWzgGOeLQ9vJcTBwsjcFj2ijinT6ZB2ySGLSLOcQnkL38C8p22bYyzEm/jeQ1NNnH9bn3t3qCot+GYDYam5AUcn6zVxwTAaaM7fRxV4grJnk+nkM7GIZKc0uGwMCgJSptbhuBv0n3zh1X9LODuS4GRENvXXJf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+rIjo+y; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+rIjo+y"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ba6737fafbso144065eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 15:55:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770767732; cv=none;
        d=google.com; s=arc-20240605;
        b=duFkSkQ4YSF9LieYdiVwChsUMrPPkLDJnrN2z3CEFSwL9Etpi4vRLQDQHPsJuXo6jZ
         5TZOJ6KgPv9foA71PcavjgzYYKqGSd+UaTm0Ly1sBLPV+x2IU3+zzPmVt8enNComj6Ih
         aUY18uzWJ5lZCWVy7e0FSwis/m9qFL8K9N848eeANmM/rx/1nJnKrhPOb+ro6z90ZMIx
         uF0bupA3Xow0BTQijbxJXJDcVfGV/xy+nEubfR5pb1MqRYowgIt7MuNhyUT/RvHrOrof
         uEjlLkZ0UI7bVWX3LNhr1HxMYaGOwZWrFNHheNF4Boml5Rs15dOizDhULUDhtWee1Zjs
         bd5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4uWbQ7qEGVK7s6dzdSol4VsuFBEkwTb07g2z1PgY5kw=;
        fh=z4zTkDQ1L9IJdph06707rJ3xj38DuNhvgIjIT84lF6w=;
        b=bmQxxr6QbdYf2Cd0oa+8xMDgAHdVOt0/Jia3cRtcmfreyHpX6fFUdQvdG32l+hh6+p
         vzY45DnNw/TCCXTLxQWse3UwjmmAmlijwFwOhAExT1zREo3AK9F96AUKTMIKyii23pIe
         tjuTtg6csJF9HLEgeg27os+jmKgGb3L+BRtTVUJ+0+6XBrSOm7W0oGhLFQtVhRbXgshx
         MqYR5uhkyhDjRX7+bcWiyMLICtXOP3SW8vbMI7hvyus/t8B44lfqIVn1ItspPW6SU+Zp
         SWpCq5DHUZgai2iVFVj/TZDoXNbU0zP45Ae9dCJbGvNYrfWPP7lhUSkFZpvrIEBI2fHp
         YpxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770767732; x=1771372532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uWbQ7qEGVK7s6dzdSol4VsuFBEkwTb07g2z1PgY5kw=;
        b=R+rIjo+yeTl32D2LKK/1hPvSm0rb94oMG5avlKUGPXvh/lsjOp8hCDyvgiG9KHB+xy
         AVPE6L0A0pSlpR6hq+oG4YBbx3veMZ+XFGUh+FDVZwc2JOPSGewp/WzLOR4RwfhC/HdY
         UeAEz2R5vrB+cbYnXZvKuIUiLYKjZbFkvf6K12PA2kyu0eh7JFrgXQ7DZJrNYN9SRsT2
         0YUgbk/b741JbwYLdChRyAkfYKjiudF7yemagDr29oi9RA7qrF2GOxKTHosRp42vz+p3
         STn0WsxMupLfdp+jYEz6CDqhxiaJFaQYs7Qy2/7oZQ9Cq2usVhNYYUa5mmTKDV+bpHHx
         4P6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770767732; x=1771372532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4uWbQ7qEGVK7s6dzdSol4VsuFBEkwTb07g2z1PgY5kw=;
        b=K87Mo9ORtGNWO78Xb2Wx6qcUTIn+KNPYeq6RzoixbT2NmfqzOioBg6rqxNOOCpx78l
         g4m/6fjslszutjZuxinPo+GtFLFfqSPTI01F0YjkZyc97TDzgyWXk44osk5/3gLT/kNH
         eFpKuRudN2Ilw420KAuq+onmxYeZxe+DTj5ECFP+GUwbTf/P3frN5cmHleHPV9Dbb0/d
         72XqigkH6pnIJzWK9RTzRiKN6RNnsUcHHPz+6kBgxXU7WEMXoRmwb3AxrKAdxg5Vvz/S
         XMrFaKRUDcsqcXcXiA+/rn8bzqWAiO6Ywz114MYkc6pGQW2a42THd5Ys4qj8kpNAUJ8X
         Nocg==
X-Forwarded-Encrypted: i=1; AJvYcCVGQI6FNgU4LWnT97b2KzyM4aBipl3/MgZP8NZI74iNBBLJRHV8jNn3YNh2QA5SoXtUGBjrpfb7yHtAiL0VJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhweg5SrtsR52M4Un7H64IMGXql9ACGTGaV1C71LB+LbO+CQQN
	Kv7Td3jjMKiOGmfV0MNlHio9pjiwrQrENvagSzpo0PIFMRQR3gZzyjUHRUj93NByG7Hb7iwbL2L
	mGnlNYDii0w6wlrH5ZhJ7ghInhNFrxso=
X-Gm-Gg: AZuq6aLGlsFnSOGXupH4WTYFenHV/04gABrSg9Mz9PcTWJLRBcr0jr+J1tfmn4WhjXI
	vQyVNXzxXLI9C1GHNv0bT0fV8PZcO9BEl9UUcuwLKFjq3rBYjZWuNTyOcg8pZQztX/NFmhAb0RF
	UvN2Ya+ZeDr5k26Z6/ZETMHQxU9NlRAOKN4TCt0HAhrG6Vb74vyFSdaldbjtTwIfVfeDSjs4WsN
	oHIxDOjOrY+fQUZGGPDM74K2xL4uUwjRjCU72hIeR2Jq4i6XQXetE3xgYzpyiGqgqqTWyFMeT6U
	goQYAy39K/mHJPruOro88DhwMFXGxyDZvXmlcnHq80gO+9EBeOkwkkafc2tA1edLMrq9YpPNK7B
	v0Me4XOFgydbrhgfqBwOKh1fG
X-Received: by 2002:a05:693c:3b03:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2ba8cdb3d32mr825524eec.6.1770767732055; Tue, 10 Feb 2026
 15:55:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210232949.3770644-1-cmllamas@google.com>
In-Reply-To: <20260210232949.3770644-1-cmllamas@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Feb 2026 00:55:19 +0100
X-Gm-Features: AZwV_QhspIVFMH3tEzHxhp3tdie1pO5H-yKNMpIPHp3A2MnDfnLnbLxBqljb69E
Message-ID: <CANiq72nU1rUrxfAZUMeOF70gwvTPqo6Wcv6VUqYZ6mCPpyY=JQ@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: fix oneway spam detection
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Matt Gilbride <mattgilbride@google.com>, Paul Moore <paul@paul-moore.com>, 
	Vitaly Wool <vitaly.wool@konsulko.se>, Miguel Ojeda <ojeda@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Tiffany Yang <ynaffit@google.com>, stable@vger.kernel.org, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 12:30=E2=80=AFAM Carlos Llamas <cmllamas@google.com=
> wrote:
>
> The spam detection logic in TreeRange was executed before the current
> request was inserted into the tree. So the new request was not being
> factored in the spam calculation. Fix this by moving the logic after
> the new range has been inserted.
>
> Also, the detection logic for ArrayRange was missing altogether which
> meant large spamming transactions could get away without being detected.
> Fix this by implementing an equivalent low_oneway_space() in ArrayRange.
>
> Note that I looked into centralizing this logic in RangeAllocator but
> iterating through 'state' and 'size' got a bit too complicated (for me)
> and I abandoned this effort.
>
> Cc: stable@vger.kernel.org
> Cc: Alice Ryhl <aliceryhl@google.com>
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Cc'ing rust-for-linux (we still do our best to send all Rust-related
patches there too, to have an index).

Cheers,
Miguel
