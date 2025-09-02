Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A43F8634C
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Sep 2025 00:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756773283; cv=none; b=ubcBeQrjz0gNOnHb5PuQXBXYY/aIhvsiSL0pzIkINXkTLJTKXsurwFuUhoZY0bIfV0yCs9sEePgfd3XDYjIauyx/Xo3YnVsNoU4o7PfygUGmr3zwo9Vb+4CYfIGeOuGJlwBOHkP+fO3j5Od+Zu8TDoqSdcNVevSSkf9dI7bac2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756773283; c=relaxed/simple;
	bh=i2TwLbUOZ7KKhjJaNlnfn/MAVPp+frhXjXk751S9q+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wsnka0pZVWa/AOioVF3iLlPjsjZ+3CBokeQPiU52c8MwCLY/u46FYFz/yvBw0KSbprNTkgCDaBkYp9dizHYziEvCslpgESW2pnjcNyX3crcogh53Wludvubj+lmzf9e/G19tBzwPwkVketS7DTghJXrT/02hCwLu3Bdx5nw/sjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=OoRY8wIy; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="OoRY8wIy"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2489d5251f0so9259765ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Sep 2025 17:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1756773280; x=1757378080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8mvun8yKhCfQpa9qewR7P5clmDieHyCmdu979s3y2I=;
        b=OoRY8wIyzG4PkAAhXncLYAYhNaOa4Mi8mTnlNSe3ZLRJMAhFQ5ZUfq0zTZKFmjUPqH
         +xABm8OPUqmJMw6JuRZcWB1BlzUg2u5H8BCdSQO2OW9l9uzPZhBfbfAgnB/JcSW+XpGp
         1Z8BJgV671k7Pz2jl8NJfxwkHI7y9k2PhI9SP1J7YO/T4Pl0iAooBRYsF4aCoPZn0lHR
         ekk4UrMGTWudtt7IyUmwy2hX6jM5C4F0ISx/0nERiLZY38COHvJK8jeWIS4XD2jDMTKW
         a887IILx7bNDem22poJH2ON7pszNhFWKi9lipJkFl0/35++GVgd5lSooSwRjK+Wo5UUQ
         qppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756773280; x=1757378080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8mvun8yKhCfQpa9qewR7P5clmDieHyCmdu979s3y2I=;
        b=Wg2Szh6fZkZrhmMcElW6xB6k/jDV0Y+YDssLjzlFe+8IdwdmvzAQ7Kk8KVlxnWOLKW
         AgjwXk8GFTKIVipbZGZy9tAwIGNiKQgCSbZPNqV8+ycaAdoSFMKZDWhIaRUsEi2t4A+t
         yC0dLH0MotYC98C8QeKLIA7g34wU5/AYuAdinAKFA2qpUyu1JLaPRv+1hIgkEZEHaGbk
         9fREfUaCpt+k8OueA751yfpLOAaUrdTdrHUZADbFO+Q/ts28Ut39tyD6Q+F6myZZogKZ
         mPQTMrFooKZ05Su8ZOfJr4rJomKDKuy2AliY6yLhM6Yu+X6duzThlwfiQxOTIXoVCrOm
         daNg==
X-Forwarded-Encrypted: i=1; AJvYcCXzFQ/OZsvj4cMKNk00so4ApDXLMf1mCJ+JJilp/Pf+K9HLJEhQvaGozA1XsSpujghUlZtbKbMtzjvYGFdh+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm5XedtNJ8zcF/CTJiJysI2C2P+qzMEuD9gmqt3tOWLdIlm5w2
	w9/zVIPA00nc928qckbHJyqszksrmjMhSivxhNFAJY2Ax5ughg5PhjlI0kk+WwcSv6jdTY9WXz5
	TqCK9fjvePNULwbwzhVLWC8CsXAsixlNKYo9ZElKCGQ==
X-Gm-Gg: ASbGncsq6557B1ftYP/aCPFw97vmG4niKzikn9lYJ8GN7TWVNQcIYPvW0kz9yq7vrRp
	vDr9DBHjs/NZHbjS37qoGnaizxvFRjxai4mNG4dKQ47GnIasynBz9n1gX3fiY5/VwPmHT3mAEXp
	+KLE1Y6vL5IA/tcuClVrwq3AHpwe9LThcUpePfk5oIn5xrQ2EhLe5uxs78qjTT2Hn8GdsScUNT1
	eT6GkGC0Yik
X-Google-Smtp-Source: AGHT+IFJovkcgVU9yQU7XG1YPIJ6Tz9WQAzuQ418KGmVw1e0tLC/wyvbcQu5zlimXbiJZtr/sKrA+cnAXZX6n1RZSG8=
X-Received: by 2002:a17:903:22c6:b0:248:dec9:4d2e with SMTP id
 d9443c01a7336-2491f1386ccmr82044385ad.7.1756773280254; Mon, 01 Sep 2025
 17:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822125555.8620-1-sidong.yang@furiosa.ai> <20250822125555.8620-3-sidong.yang@furiosa.ai>
In-Reply-To: <20250822125555.8620-3-sidong.yang@furiosa.ai>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 1 Sep 2025 17:34:28 -0700
X-Gm-Features: Ac12FXw_gmrSGrZTI50hCN8j16GN0dek7Ml8OXCaKqeJQoUHhKt7q785ZmT7eGk
Message-ID: <CADUfDZpsePAbEON_90frzrPCPBt-a=1sW2Q=i8BGS=+tZhudFA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/5] io_uring/cmd: zero-init pdu in
 io_uring_cmd_prep() to avoid UB
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Jens Axboe <axboe@kernel.dk>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 5:56=E2=80=AFAM Sidong Yang <sidong.yang@furiosa.ai=
> wrote:
>
> The pdu field in io_uring_cmd may contain stale data when a request
> object is recycled from the slab cache. Accessing uninitialized or
> garbage memory can lead to undefined behavior in users of the pdu.
>
> Ensure the pdu buffer is cleared during io_uring_cmd_prep() so that
> each command starts from a well-defined state. This avoids exposing
> uninitialized memory and prevents potential misinterpretation of data
> from previous requests.
>
> No functional change is intended other than guaranteeing that pdu is
> always zero-initialized before use.
>
> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> ---
>  io_uring/uring_cmd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
> index 053bac89b6c0..2492525d4e43 100644
> --- a/io_uring/uring_cmd.c
> +++ b/io_uring/uring_cmd.c
> @@ -203,6 +203,7 @@ int io_uring_cmd_prep(struct io_kiocb *req, const str=
uct io_uring_sqe *sqe)
>         if (!ac)
>                 return -ENOMEM;
>         ioucmd->sqe =3D sqe;
> +       memset(&ioucmd->pdu, 0, sizeof(ioucmd->pdu));

Adding this overhead to every existing uring_cmd() implementation is
unfortunate. Could we instead track the initialized/uninitialized
state by using different types on the Rust side? The io_uring_cmd
could start as an IoUringCmd, where the PDU field is MaybeUninit,
write_pdu<T>() could return a new IoUringCmdPdu<T> that guarantees the
PDU has been initialized.

Best,
Caleb

>         return 0;
>  }
>
> --
> 2.43.0
>
