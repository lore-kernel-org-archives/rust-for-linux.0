Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B111718
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Apr 2024 00:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713833077; cv=none; b=KRV5IHBdOuYALazj6hEGGla9wmh4V35LjcOGsPz8s9ezvl7k8rOQDd/agYLwPwgvwD0rptaDjHQ7SMtiJ3hVrSJohZCTmXaGf0YF3ppSLEX46fK3DCi+k+jQ35PnbIGy7zCuOKzUsy2qurHJ2sBh0GrBSfj0f//LuoR6RzNgoAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713833077; c=relaxed/simple;
	bh=bzqLxdC3UZ+kV5R6nrHIbxNqeAj+T76PxS4/FDd0vTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OLH1yXRVuuHF2bT3j0SLkbTtF26NdCdjImUf7j+kwWUBE2LmiC1Qlwq1Qt5DoXqj18ZzOJtb65wKaRPWHMhMbXqaG4G/A74pFXVuZ17lGmzhrtk5KY4qbtyta0LTsi0yQV0+Z2NeyJa1expD3N9jA8uj9MRLQ/bri5s0Kb+k+o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tb/Li3X4; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tb/Li3X4"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2a87bd53dc3so4126421a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Apr 2024 17:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713833075; x=1714437875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzqLxdC3UZ+kV5R6nrHIbxNqeAj+T76PxS4/FDd0vTA=;
        b=Tb/Li3X4zLx8iqlhfQWuVrsAWxcNR+xeJYdQ9c9Gt5EkT5k783FBpPE+BXIv389Tmg
         cmmLiDVhzc1Rc+emF8L3+hyiAJTOgkquNmVKAm7+Lj1xr5s39t7z8DGtAPG4BQF0oSh8
         USWvGidAMghJxbgh9X4/mTAnTTtdRvEe0TbgBcicmUm74bzSGHwAoIr/7ejqMm3J94WT
         7TW6NLgHqhxqvLPQafglVKk+P3Bw8tpPAeuqRsOgtl0QNJtt/PK1/vVo7SmLIbA+bJU4
         V4kg19pdT+WfJ8ZyBk6vh5tGDndrTO08HpVMxFJsf/wuL6JVDWJZi5iwEL0msCAbiC+i
         ic8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713833075; x=1714437875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzqLxdC3UZ+kV5R6nrHIbxNqeAj+T76PxS4/FDd0vTA=;
        b=AtgZSu/UgJCnEcjE7lixXjTBqbZcSnbJuPpL+zv4FE65WJRWYua+8pnPOjy2EGyCOL
         dkXAsJqSL2hYJqDZx1plh5Rgq28t8XB2EU8i++xULbwDWatA/+ZTBozWgxApDcBa6sZ0
         YFwExVbnyXVcqXndQh+LEkMz8WAqkPOn8+rUZW0fewtOMYDzt0Ync34yyukkivQw3rLd
         CZ+Ob0vCsylUFwHoZUfJTnyjdZSbvBHJYdwD8+1TopeGiyTFtZgZe3OARRmT20fazUY+
         GM6A9k4rYPt2kfQm6QQY+vuHbahjb6ZrWsOQiS3bUmi17godVtduz2xsIwSzYBwzcRGY
         ve9g==
X-Forwarded-Encrypted: i=1; AJvYcCVIPucCAT+fpSX47GzINMjuWQNOsSp3hRqpPGB4b/Vd674FocEJODobHIMDStEnOvggHHndZGMh2wTNagZmoMvpbhUBJnQkVYJv4IK6++Q=
X-Gm-Message-State: AOJu0YwjtYaoHi9Gej0azhv272S8MgCJvVt03KNRAiRuls4LviwUxKdw
	3iT5ruiRmyhNx2JwA9nocfELaPDoFm01nW0MlgDv1OCVtRAj/KbiTmZi1RLYAHLuwcu2tUDX2nq
	mI5YGHbj89QUE4H59OIWqzDI8mFQ=
X-Google-Smtp-Source: AGHT+IGJ6c8hwI3bA1tuZigobj+7YZoDkssEzW9CuijuJEHrDl8fjcg6cVpRqTu3zajV0D6w4s7ZstNyCg3O3AgEgfQ=
X-Received: by 2002:a17:90a:ea07:b0:2ac:6355:c6dc with SMTP id
 w7-20020a17090aea0700b002ac6355c6dcmr8348262pjy.19.1713833075432; Mon, 22 Apr
 2024 17:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419215015.157258-1-aswinunni01@gmail.com>
In-Reply-To: <20240419215015.157258-1-aswinunni01@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Apr 2024 02:43:30 +0200
Message-ID: <CANiq72ktd3UJQFEBO=5sOmxv6HE6LW0gFvJ=Y4L39UUqa61nrg@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: remove `params` from `module` macro docs
To: Aswin Unnikrishnan <aswinunni01@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 11:50=E2=80=AFPM Aswin Unnikrishnan
<aswinunni01@gmail.com> wrote:
>
> Remove nonexistent argument `params` from `module` macro example,
> because the macro does not support parameter list right now.
>
> Signed-off-by: Aswin Unnikrishnan <aswinunni01@gmail.com>

Applied this one (1/3) to `rust-fixes` (tagged for stable too) --
thanks everyone!

[ Reworded slightly. ]

Cheers,
Miguel
