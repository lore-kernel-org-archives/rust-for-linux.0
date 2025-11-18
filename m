Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8BA1F5437
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763456437; cv=none; b=Aa8sIH2XiFTGpYyYbMVsHZfGG3X0EnfVecfFrvB6LXSJVVUfEhcQJHHxKZBMBiHqZjt2cuFMmOVpw23N0s+ySDnZeU8uFYis8gOaLTd9RrBPVu21plk1x96aR0zBfRhoS6kHgUjogPioXOPZB32dnzt1FI3FB6GGRdalVfalEs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763456437; c=relaxed/simple;
	bh=bfBS4B1cFVXph0/HoluC7HZmxTuxmaD6b1yYGsefgw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPiKHF0jYxGPJ1Z6bk11aYE23D8DA8CMz3IzSnEwyxhx7b6yRDBdh8DahEafg9rUOGl+d7iJnmZO/lug9JHELt8Utzl/Rxx96hBaj9/G8lFv1DO21Clxz1G1vEqM7HPQql6zpPqtwOPp1oJ7dYn1bSkmaXY0KUg3Ms//KUhRR/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaWfxnPb; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaWfxnPb"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b9da0ae5763so411473a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 01:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763456435; x=1764061235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfBS4B1cFVXph0/HoluC7HZmxTuxmaD6b1yYGsefgw4=;
        b=eaWfxnPbSzvWiei2c17AEcj9CylNSm+VccpByLZmiIapDiIPHNTtu37nwRt8UzIdsE
         xnyggUNc+zqEHAe4pzBJiPW6rmZ8f9+tetREyVmQC8eNmxx0lTbhLLv9O7NGlYQ9BALH
         mVBZXJrOuVTuFJvm9NltuPuutynESbKfnIM0605jV4XKVzkX0UMXw+vzAL0Y5UIlzr8F
         b5wXucGsTwcOHzamODBiSPJie4NthLMWFAFBBcFL0ZfIZ71N2RSRlcbaW1HAZYyyEYIC
         1MXBqxWnuvn5oe7BdN59SSLX3M+vCVdmheNe3FIHspF5BHpjdDPo2C6iCYEyqSrryPTl
         uykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763456435; x=1764061235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bfBS4B1cFVXph0/HoluC7HZmxTuxmaD6b1yYGsefgw4=;
        b=iUWxmyAxDVEjuwCh6LD0i/U6IOuqjnzPyy88qkbJyEKrZMR3PXGNTI9T873bwY2wCu
         fuq/vBQfKiKZ77ClcBg0+cJ9WwjHFviM3mlw22W7AicNbG1N+XEXlhbvsq5BcQ0vfh4i
         XhqNJMhObMDKpm5SQEXYe+LvEYBRmfCUpCDz5dqXDw9X6HDK47/kxzO8KeYTN+XEr9Aq
         LGFHudRaaY+7FVyniMyOgSy5+fpryuJx0QKEjlEnyAxPofahl937i5nJ9QFkfzX5M8vO
         ORmAn4ZClH3jacjvgBjt2o5OtDafqTLmZiJWgDUR9jXqsQgCt1LxnqLrJJlgO48ue2cO
         +dSA==
X-Forwarded-Encrypted: i=1; AJvYcCXj2TdJHaAt9r4kvmLXB8k1Zxb4e37zh6amHQp3h9cOizihI/PQNkYBpmDCm96Z90J45Sll7nFstM1h+Gx0KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmXK+oqPvEuOQY2AH+2eQVJYPOg7W5wEzGHKZ/SEloMJBF6jbq
	OUeyLPpSFIGzdNN7p9GOzJW+EOjRSfcIRSdGyFgKsJcY02sr8RAB0VzbTUG+JdBCWG+InrZSFDU
	+G1qy6P5iPZ+vrj5ZM4OfUsS1hMJfxhQ=
X-Gm-Gg: ASbGnctYmXG49IEzGa9NPt6EPGfq4JF+tHYNBFSoOvEo9+hUImIzflNn+N8DqTAQ9EN
	EWDlKCCbZchzu5b4oQuCUuCvLKdA64h1pD5QUYrw9IgdNjmCV5bnSE7ROS2v2DDjm62mQzMBJp/
	U3BY3bNO+T8GvI1fC/TNlhnPgQ+rYBfEIrFkPU6OJMgDDyjifjXHSeQf6z4kNemDTKCLqs0OprS
	AyL5Xpj03zcm6Xviplivoe7qpINerkJC80YCL79s01RwOGvIo9b0F72xdbJlm7VWPrAfRdCIsNf
	p1aNj+w9exe1AlI7E9tiJVzraWyUnj+6vAAVUTB6FDGClfHUCfbEyd/XG1ZgKrzOmYeu9oRKffo
	YXcvTaMJQPqvwjg==
X-Google-Smtp-Source: AGHT+IF+XxSaqQN0TKooaKualkKFdHU+4N4g+aXk9v5r4izolXbnH7pTq1RHmcFFhIlh2QE4yrmkB4O7KyrtosqcBxw=
X-Received: by 2002:a05:7022:6885:b0:11a:344f:7a74 with SMTP id
 a92af1059eb24-11b4120a7cemr5943075c88.3.1763456435186; Tue, 18 Nov 2025
 01:00:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118072833.196876-3-phasta@kernel.org> <CANiq72md+0Lerj+kqr6QiU6ySR3XjRzmuBiLjkpWWieM72wyeQ@mail.gmail.com>
 <4db9dae5f659512146bd441cf2edf5a4aca16b93.camel@mailbox.org>
In-Reply-To: <4db9dae5f659512146bd441cf2edf5a4aca16b93.camel@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Nov 2025 10:00:23 +0100
X-Gm-Features: AWmQ_bmoKYvqTof5S0Dhcc0_0ej1sv2c2-FmRF0gCVNccMMPRwgcbsgBfjDeqrs
Message-ID: <CANiq72k_ez+M_xEJaDCKS9uSbzHd35osnuXjGqZf1jq=sM_uxA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: list: Add unsafe for container_of
To: phasta@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 9:30=E2=80=AFAM Philipp Stanner <phasta@mailbox.org=
> wrote:
>
> It's absolutely common to provide it. If you feel better without it, I
> can omit it, I guess.

No, it is not "absolutely common" to provide it in a case like this,
and it is not about "feeling better" either.

As I already explained, it is confusing and takes more time to review.
For instance, it made me double-check why you wanted to skip some
versions or why the constraint was there. Please understand that
maintainers will need to check what you wrote there and whether it is
correct.

It is also riskier for yourself, since one can also easily get it wrong.

Those constraints, as the stable kernel rules explain, are about
sending additional instructions. It also explicitly says such tagging
is unnecessary when the Fixes tag is enough.

So, no, please do not add redundant constraints when they are not needed.

> I ran rustfmt.

Yes, but this is a macro -- `rustfmt` is likely not formatting that
code. In formatted code, there are no multiline `unsafe` blocks that
contain code after the opening brace, so it looks off.

Cheers,
Miguel
