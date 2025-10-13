Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ED22C0283
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 17:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760375064; cv=none; b=c7vT5xizsq8GjxuKpZxGrTZRQWTFsD2DT6D2H+8sAicKY1H6/gU31+OUG/HUzJs4cVWdQHbXT+cuiWmU7z7Zlf+egYYpD7UhjoQK+k8VmfMrQTA5JV8wjR9VBQ5ibHv01wvRVvS8ZA8COcoUxPMT5TM0lXZy+OzzEtMD6U+s+cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760375064; c=relaxed/simple;
	bh=P+QO+F6gSER8aboabNBOzW8gkwLtVxAf+Z52RNFKZgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8caCKFAfOwyyDj5KIqiD5hgphY9Ml7UeFDCO9cOQIUOXjjYRGYNAnvjxIoHE//wosIqRHbIvKVJWXi1130QjVpOJnRtOodB25pc8sKrTp1dLRM/3sV6U0ZRQN3lfWKR3pCnPpF3ofOy9sEIf2WhsZJ4oZVElogX7iURNDV2WAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ky14A5CD; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ky14A5CD"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-789b93e9971so401836b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 10:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760375062; x=1760979862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fJcX2OUoXOGZsGeV/FmQ9wOPH6foIrQk9i+R6pKW2o=;
        b=ky14A5CDWiLJHFTvbk9s6H1RiDbLy7H5LqK2SZCIMGMQtwgH7+Ccg22Z53LuUd7mR2
         t7Nalgjj7u01WUiGtt1ZS8WtrejyDbddP/dIaEDO890tEXFA0BbRj2yhlQY23w9SjtMH
         Qbz45FDrJyGRfkzlccXoa6NoYfxUHoa7lU6naWP9bHQPTo9qGG9TdYrIsJpt7RIibh8i
         /F+a1BZm2WoE4Ex84AvjQucTLjelbpaZklf0hqY7I392Ka5E0ldbSsbOEQ5BtiACS7Wy
         WQO48O4canb8CQgertgLc865rTgFSLECX7UHBYenxA6+wqIvdiuKN7d4x5l9x/X/mVgJ
         8Gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760375062; x=1760979862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fJcX2OUoXOGZsGeV/FmQ9wOPH6foIrQk9i+R6pKW2o=;
        b=r9NZisRlo77jAg2DGWDQwBGhRc34iccljP6o0ARbJAxYbsL7KnURDPZS9j8lCXGb4z
         3Vv2u9qpsTkbT3Gm/0vGXocjoQJlfFg1Jja89elTZYRT+22zZvnDiL8Zx20685c91H9V
         wZaoNJLnBJfrOqWzC6jOUjlQDVSWxjXiJYz215LP8TfLCnYOM7QEfxnHhi4zZbDOrkiX
         frBh95YFESXHXwfYWJr5qm15zkccSBYHsINpWb0dXZiZpH6a8IUdJj2ZI5upCr1fQfqd
         8B/e385lb/H/6TRmCquLKuUjwY1upEI5mcDLN68IGEwCFVmJieARk3EAKx5VIVwK1+/X
         rYHQ==
X-Gm-Message-State: AOJu0YwZ520tLrEcxnSIdmWYuh2y8Uz04yicvjxDeGrWG1S7QjxF20pw
	Fa6gjgfwMjPXnqgt9+9yFWFA2FDNiKbgjkOvRvVsKQyHLnhA+gZub8tuGIZsyhH/9lvZfUeVjRN
	DAYdZfVjCbsDHHscgVAOCOeilesIT+GQ=
X-Gm-Gg: ASbGncsiGEkZNHsTxDUzGi1aKzcE/Pg6eKDqfuCSd+Kg8krx7ppkIDBdNJ+/Hnzvgdu
	A0Yc4M/NerFHa8mvrcpxqaH4HWu6gcpiqoP7WtQC4nZEjeqMpFhSw/sUBUwZXF3hgySmGqHhI0z
	Jn5UZLclBS1bgLR9IbgLAtYF2EYD+g0/e83uEdijpxBXBZiD8Sq3uj24KaaEGxspBYvcx4Baq8X
	t4vm1rtBi09Gt+UxDaGWcKcsIa49Txl/V+W7MPvmtqXzntKGVbuRXgaAD/aIrQhjnwZU4jN00Rg
	WSSumG0EXGIIATrviHuwhshF5TisrAkQujpuNMFHkiKhPTPVLKZwhlDk5twKk0ZUPQ==
X-Google-Smtp-Source: AGHT+IFd8AtzhzxKXNVFCDx2dJi59F046sIYPsG2Iz0R4PgwCPQCMefiWNFNMhH+QP94xBl7TiDN1AkB26w3KuqmS2Q=
X-Received: by 2002:a17:902:ea08:b0:28d:1904:6e77 with SMTP id
 d9443c01a7336-2902726698dmr157257585ad.3.1760375062253; Mon, 13 Oct 2025
 10:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013124139.18809-1-work@onurozkan.dev> <20251013124139.18809-3-work@onurozkan.dev>
In-Reply-To: <20251013124139.18809-3-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 13 Oct 2025 19:04:09 +0200
X-Gm-Features: AS18NWCY3sNfP2BHo396B5-dfXepLNGPyFJstD4wIsXER4rWpGCCFZT_UGhLh4Y
Message-ID: <CANiq72kvNWT1fXYkXUwmyC5jHfYufdx+koD6Y2xsWzE9YhLLEg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: drop `error::to_result` and utilize `ToResult`
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, tamird@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 2:43=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
>  29 files changed, 253 insertions(+), 210 deletions(-)

Something like this will be hard to merge if we wait for all
Acked-bys. It is best to do the migration over time and split it per
subsystem.

Also, you should Cc all the relevant maintainers/reviewers -- you are
touching quite a few subsystems. :)

> I haven't included all the improvements made possible by the new design
> since that could conflict with other ongoing patches [2]. Once this patch
> is approved and applied, I am planning to follow up with creating a
> "good first issue" on [3] for those additional changes.

I would suggest including a few examples of the improvements in an RFC
patch on top. In other words, we need to show the improvements (or at
least some key examples) to justify a change, rather than doing it
later.

For instance, with the changes in this patch, I see a lot of `Ok(())`
added because now one needs to discard the value, which isn't great...
It indicates that the common case may not be keeping the value, and
thus we may want two APIs for this.

Thus, similarly, we may be able to spot a similar pattern in those examples=
 too.

Thanks!

Cheers,
Miguel
