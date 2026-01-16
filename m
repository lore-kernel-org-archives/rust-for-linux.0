Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A1C36A039
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768593046; cv=pass; b=WOydAwmKMwLlXKXPp5f3/cgCcpCeTbcKA9evaZ5fyBHwEVCdSwECj7D3CMR9zlcFGOjQoKIIVUHhFrnRp76APuOhEsCHde3b1AdW8LIA/UFsHpeSpB5jbRc4tJGEC/OZhnvNuAUn4ZxsL/3F7WhmquUlau0Tf3Uv/W7BzLi63O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768593046; c=relaxed/simple;
	bh=EJkuUmu+ZmJGg/Z25Zby2D0lnxlypQv9/kqtCvp65Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFS8rYcs7oelDsM+WMVpv0QIA6qkhnhYGiayuUkW61eHiKTMcMW58STIZJ/00Li1UnX8Zr5yhz9/l1CD3+Phs1ZCkO8W95C2Z+9gZlvJajttrixYVek8zY3O6XtHtXE3hZ2dsaSYdcMgGpGOX2xc8SyGVKhrqtxPTcYPe/y92os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jk0mdZnk; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jk0mdZnk"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b6c1ec0dd6so96548eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 11:50:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768593044; cv=none;
        d=google.com; s=arc-20240605;
        b=hPooTYoPFSQtytXaP9U5meX1Jazo3Du3dFffxjUgX8er9Q1CW7LAmRRcw7gU5IHf04
         ToN0LLNjd/dWnrgMAq+u19n/kD1nRCkfBqdW+0NlpvOsN73uyVFnY98FKQIk65YPZl9T
         jW/V42fiao0t4sLHvNUkTcfVk0G/FwBAHH+MS0a6/5oU7B5K1TfyMUMY2t2fZTr3aF7Y
         LV6rNVla3ENQORh4DDertVdNm5ZdrTL5b9AysaaRsUrmEZamsucjfXAdbLi2+BQhn83C
         Ac2JgDC1x3OSePJIRBsQNtHBG1gSDSSEo5eNk5xihVkCFNM8Z4aIQ6OlyTGkSCsqUNYn
         dcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EJkuUmu+ZmJGg/Z25Zby2D0lnxlypQv9/kqtCvp65Ro=;
        fh=0sgN8BPzJhwBSpBCjTyPGorQUFadLfV20zXH95sKQbs=;
        b=iZgbPBjsyw7ksp+zmSbjoqkCmBHNIf4IZl4hV/E8VHvyq2cqPxPll237OpeoHoXjXg
         Xdc0dRvmAyLVr7KB+hWSfQJIpNu5T20jr2/yMjwzIK0u7mpqvWUKJINW/r0+94H6pdwI
         4+vY8gpcs3DMl2m/UP87zjWaYhMFUueXk1EGSpUUsxGk+pPlJ80uLeyCDxFaWXyLyMTc
         IA2pJIM8JHegFPIlFIGiTHefi0TP/oKzuCh/NMxIzLEFWLGG42db6KEYAO4TBkYy9cbM
         QRaBt6VIvxKWsh4GzH3HlUYsRU8xePZZP/eM5NXaUxriPRiHAr6H92752GF7Lpgb/1P0
         WcOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768593044; x=1769197844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJkuUmu+ZmJGg/Z25Zby2D0lnxlypQv9/kqtCvp65Ro=;
        b=Jk0mdZnkIOB9EDusVvm62WjgL5wF6Uv8orbWcU3WtBJYwq8RXeRms65UItfE6U2VJk
         tyaotbIAq5DmfWaLzTGxTQCNhgYFDlDHmoIBpawvWD82uk6myZeYdNREOlrSiTj8hl7I
         QDhj1BSwZ379pfs7qkYsDtbgumZnvvwN7W44UrDUQ7owqn4imUpaWU2PpygclNrLEtKA
         b3Jxrvki6uzcIp7e1VPL0KcTjpnCBk/1U6rveRBHQu6mi5s1XmjC2an5MXQipILdcXi2
         +6HzBLN91SKuZ21FqKERPGzNDZYUFLD/jL2nRBdL4eqYvML78inrUtqBVdS/Po7AF/EV
         rnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768593044; x=1769197844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EJkuUmu+ZmJGg/Z25Zby2D0lnxlypQv9/kqtCvp65Ro=;
        b=h4q2Z/e3eg8ShjTDcKL3VgEFmnD8nMbal5sprEiqJ1CBWp8kfz+LqAKgcJJ3D2M74g
         wIvkHQ/dnrdnisM6ToKb8PfOKgIYcUySy+I9IbUOY4+G6bft5CCq5vZqHy4mSqmBnS+j
         y16xzpP0eTi4ixda9AbPMJf7ntKRBHhSfCufBpr2KS6Yps91PoJeB/VJNicCxqkaMPSI
         jn225wmX/uGzXr5sWfSMN4pY0zPKh230qNWTZyRKOpFZARmtZrH3hcZohqaxAmnimb8J
         j1G3H6Lh1QBPCZOXGkijBZ8CpOD3497s5ojstKtxer8kA0ymA0jBJdfImcx5X0BG+1Ij
         4cpA==
X-Forwarded-Encrypted: i=1; AJvYcCVjcz8JkJUut+g4DLhR6gYm6qsGkQ4cT8wgHLkzMcX9DVKbNjX0rPyU3sbCvLCn+yW5cwQ7py3M3b+8MCHP1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHAnh18fAN7SDv+frxxt86qx0VWnht7D9B453y8pH+slfvgdRl
	Q3AMzxIwyNEjgiXMFspipsxFT87nCpl27e6oES8VJJJneClWeG9EA9ZOLf0U16Zz5xpzQs4p5RM
	PyMZEPhkL1kzG+QDnjg4oKvNZhXpq0W0=
X-Gm-Gg: AY/fxX6txLI081zJML3iq7K5Z5Q4CQve7oQreBjius0KY3OVLWDqyw0mIuIUR0iQ7iT
	zMlVDRADi1XVlQXGPz9rBiTMQEOwjZp/ZGCAFmBEMhnIas458tTKn3MV4RxWdggVO4jPEdfQXr6
	ifoBQY11LsLfSptZhlPTBLAx5d82ychSB/oY284K53/LVuLTuieSgs0TWVeWcOF3wvLL1SvY6O1
	fDqx2WaZCTuXLCBA5Q7rwvaJCUrjzNW6PKC74m0NOxtRI6MJIfDakZtFfJ7ehYl6/dDQgQcVJXV
	mljjCMoSwKik0rdyGMoPilebFtQi7hVdyGpqknjQlI6b+Xv1l1aNsLyyQaRryS5uMZ8GJkLKy+8
	AmSrkSkYnaZSJJPKpna1WNc4=
X-Received: by 2002:a05:7300:8b9e:b0:2b1:79b7:5850 with SMTP id
 5a478bee46e88-2b6b4104734mr1617703eec.8.1768593042915; Fri, 16 Jan 2026
 11:50:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-rust-analyzer-sysroot-v1-1-4de831df234a@gmail.com>
 <CANiq72kd9bHdKaAm=8xCUhSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com>
 <DFPQG929N5CE.34Y24PGBZN2ED@gmail.com> <DFPZRKQC7ZHT.BVYWCE0GGW96@garyguo.net>
 <CAJ-ks9k_VLyJyxL_pXrq2dW2r+0birOWUmW72Zq9QLXPNjabrg@mail.gmail.com>
 <CANiq72kMNBm8AJwDAQz3D9yq_Gy9iAKoQ2bpoJ69yTpW86HCsA@mail.gmail.com> <CAJ-ks9nfMiizMAAnybtY2k5bUf5dsc4bzA__gpa_hq5NP7kxGw@mail.gmail.com>
In-Reply-To: <CAJ-ks9nfMiizMAAnybtY2k5bUf5dsc4bzA__gpa_hq5NP7kxGw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 16 Jan 2026 20:50:30 +0100
X-Gm-Features: AZwV_Qj2HX7z3M7ex6wU5BpVkUjHXjgjdtJRCUB8XnXXVx9-ImBLPMjpxQ1qtsw
Message-ID: <CANiq72mrZCD1=1KOuhN=vroW5fQ4372JtzS+p2yUw9rHp_eKnw@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: compile sysroot with
 correct edition
To: Tamir Duberstein <tamird@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 4:39=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> This makes sense to me. I can send v2 if there's consensus on this approa=
ch.

Sounds good, thanks!

I guess I could also do it on apply since, unless I missed something,
it just requires dropping all the `rust/Makefile` changes, but a v2 is
always good for clarity.

> I didn't notice anything specifically broken, but I did confirm that
> things break generally if RA is configured with the wrong edition.
> This prevents it from indexing sysroot crates (I tested locally with
> edition 2015 and observed broken navigation in macros).
>
> In other words it isn't known to be broken today, but a new Rust
> release could break it tomorrow.

Yeah, agreed.

Cheers,
Miguel
