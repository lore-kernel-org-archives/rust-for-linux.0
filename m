Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57ED23957D
	for <rust-for-linux@vger.kernel.org>; Sun, 14 Sep 2025 23:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757891981; cv=none; b=YWRT5kH8JAvbWRCCUQLBobRzJ+5pKhezrRgSZTGUQqFE+eFAy/WjFtUbwLLHW/KUZtuL1+Gtzt8Jf2yhHK/jKptK+3ji/QoRD5PN6XscmcfOic3I763CLvpkpJYBm/8uyapAK99MFNnqUMEOo7Vg/kjLyBQt7CEH02xYzV2p0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757891981; c=relaxed/simple;
	bh=pHXoHH5RRUugrHmOu9g05vKyxCyEE7WNLmye7njoGms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gD3GSvR+adR27G3j8DdHf5Oh6ZdoHWxnABoiO9ecQ5VqSPNZCsWS+Qa7zJnXde2qy60pI81mj0TjVY69Xiub8DdnoN3PseS7lrvHTFAXcnOWgF+WR0cSIPOzEHo4HB+UDTTZURPFhCHJbHd9KoawXC0dLz9FMgK5wECxTQbUFgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwrEDDwU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwrEDDwU"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2630354dd1aso3421885ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Sep 2025 16:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757891979; x=1758496779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wr1SRhKN9RJNHAY9fHUf/uZeZSb2ann41OGAwqEckBk=;
        b=PwrEDDwU3WQ5ezDeqxpBM7emjnq2AHFKoJwVFfGX+e0XbuyoT/9bFS7ot/137z1u6L
         BT6hN1QPIQmBQQyUe4fzYpOcrdAR0FW4IjSApibK7d9AdBghstvPnysw5lam4B3Jg51w
         oFJsCQJumHejz23F0RTq0GrE8x8J/HIs2R2R8WvDofYOUafED4tWdyjSO/WerTz+bgdK
         scoDXdqZhVN5bzXYW/srl7I4Q6mdVg1TIdgpCmUmhkNdEM6YaAA3pVQgNEdu2cSg6J8/
         9wOkWYvvXm9apTyf70oEWhjKba3Aa/cHRm+SCLODsIhLUOSMQ7Z80ahCq66AiM6cJdfP
         XPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757891979; x=1758496779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wr1SRhKN9RJNHAY9fHUf/uZeZSb2ann41OGAwqEckBk=;
        b=q/DtGqbVbLfj/OyJ05g/Z64avfyrW/TjXuyNBsGYGR/Dj8G625ycEwTBVw8yQ8aJya
         WPC72tDuEVjIkrtGeQ1Bsx+tCGQ5ZR+qPP5t/Y09IiwL5enqu4QVrSBLusMfIE2cXI2E
         e97FVP98c0ctEWePK7njDEs5s4QS7Bh7xSBy+DNTalpAbdmZ42gbr/Ukca6ch8QzGW86
         xodFlbo550AOwDJJsb50cb9NJ2QnvX7Es7r0F4BsdQ0UbTtQc/y8pzazTjcl9wIOwY+K
         cLzV33BruVZbBgdjKeDhI4bHJKAV+nk8N0LGUOfarGBpj+3EU07OmAE2uZRd+XHCOXdC
         onAA==
X-Gm-Message-State: AOJu0Yxr9/wlWauXTQ9gjEIJ1hqoP4fD4BkbeJ1Q+3G6Uw9YI4UpSmLn
	V7Z0IEaYXXRzqqlWaBwilIhNqi9g2wdRUo8EkXIKzdEkci1pszit8oUF5CHeIIIlhzLIhRUV/4r
	M5+DoCMT8C5ub63tnBRpiEykOQWuTumg=
X-Gm-Gg: ASbGncunhfnCJPdmmcI766/fhEDN+FO1C5B7GLgwUYrhXqjWxm/enJ19zIzQPA5LmZr
	c8Uc48XKUw2cjEhnGoeCrRelYV2fVd2QckEFAk/YGJkrW1oU9ao1FBDnEzCbGzmm3Cw5enxBoFD
	nolnNssr2EpAaZJ6lHLKCDzJnjDBZSZ1qpA8u62kIOIrKpdXZILJw7bk5A1tg1zsVPENQqHRuAT
	OV1v0nTExCiXq3kO2aNC4XnfMbaCcCFDo6W2QyBoWEprD8rLXeA3dHTuntUEbWcdiEIxQFg3Ciq
	zgEh9QEzQiICygPITkKeDjTv3Q==
X-Google-Smtp-Source: AGHT+IGhpkmNSnE/555/rmLedmEw7I+1SCyv5XhUvG9ewb3MUhstOJJKEYHDfT7SRZL2g28uuiuKafYeYRMNCxOJ2uw=
X-Received: by 2002:a17:902:ce83:b0:265:98c5:3efc with SMTP id
 d9443c01a7336-26598c54355mr15027375ad.9.1757891979049; Sun, 14 Sep 2025
 16:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724172005.11641-1-boqun.feng@gmail.com>
In-Reply-To: <20250724172005.11641-1-boqun.feng@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 15 Sep 2025 01:19:25 +0200
X-Gm-Features: AS18NWBLpcVZaz0uXp5qhEnAAfVLnpu8P6jVe1KdZV4E_JnrY3DZ1aw-Ou0NaW8
Message-ID: <CANiq72=5gPRSFEDZCL5kSiinZVJCFd6UX+vzkx+oM+AvotCXsw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: list: Add an example for `ListLinksSelfPtr` usage
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, I Hsin Cheng <richard120310@gmail.com>, 
	Albin Babu Varghese <albinbabuvarghese20@gmail.com>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 7:20=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> It appears that the support for `ListLinksSelfPtr` is dead code at the
> moment [1]. Altough some tests were added at [2] for impl `ListItem`
> using `ListLinksSelfPtr` field, still we could use more examples
> demonstrating and testing the usage of `ListLinksSelfPtr`. Hence add an
> example similar to `ListLinks` usage.
>
> The example is mostly based on Alice's usage in binder driver [3].
>
> Link: https://lore.kernel.org/rust-for-linux/20250719183649.596051-1-ojed=
a@kernel.org/ [1]
> Link: https://lore.kernel.org/rust-for-linux/20250709-list-no-offset-v4-5=
-a429e75840a9@gmail.com/ [2]
> Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-4-08=
ba9197f637@google.com/ [3]
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Fixed typo. - Miguel ]

Cheers,
Miguel
