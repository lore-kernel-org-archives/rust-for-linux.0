Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C24F3009CA
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 08:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763454023; cv=none; b=CXuoeBiW/0ER1xIybWFufkKeG8D2X8T524krGFfWPUFOD4Wb094AWpn9pFUD05pYHZhCKwR70RGHkPkG0B1JxsvwCyAvakNA3vt2JJIjj+boYtx732/J6tTM92dKo6koqX5j1b2KiuNhZLACzZSAycqR+RLUJUQ9a16n6jdM0PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763454023; c=relaxed/simple;
	bh=tsv/EMDpwgvAMp1Wh9tt2j5947xk6cwt1WCvp2dNq/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PlwfNYUnqhEoS7Uwx7OcicJD6wl2ul2M9CnRUTOkB36FvycLcYIviosOFMLy0eZW5jyqaz/xUe/NzpWALW8xeFN6CDYVgFlb1Szh02oHRrpOXZSLU0dswQphn1UnO8ReXJ/gmTRRyczWmaxC/UM8noE/f3rMA+QmtGlwrFIdraY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gd+H+cmc; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gd+H+cmc"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b8ba3c8ca1so591332b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 00:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763454020; x=1764058820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tOwn5GK2Fu+zzZaNyEoXzKOFnYSWxRdIcRrprXu2dg=;
        b=Gd+H+cmcP7UoK79zWeZgcZE/8djU8+/+w2uHcQ7o4R6tcI8AJ7EhR/EBSbmOUHQEiA
         Klu8QTgcyGBZL8gN7z/zaxokLY+wGpuYod3bZPELAV7kwdYnDqxM1C47gr3vQczfyCdx
         uwamJ1YrBLAEvvn4EeFmI8IyuU+R6kg6FG6wSrtK8vnnZzDoe93sAfLhhNRScAJ8VCWw
         EmCVjU8M2mCIXqJGufj7KBjn3mTkD2b2pjY30A7ow97aa7vQQ1TeuI+HfRmhqXPh6gtV
         sD/EB9VnBnNhtDoceQghi5xVEC95JsUvLvRCsVXH0/Yt67F62OkhTA6Pm+QoJEaBFNBv
         pycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763454020; x=1764058820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6tOwn5GK2Fu+zzZaNyEoXzKOFnYSWxRdIcRrprXu2dg=;
        b=EjZppbmXDM/7WrXt7Nmrj+5xVWdyc/r1Bc5cOTGQ6izioDgVw1uKOFyhELNnC+bkeu
         grZOFFA0W4bUywF9n6BMQ2W3uMcmWc+39r48AI5AEaRnYT3jBclNA9slFhjrj2h2gwYg
         ObjM81rZR/LuRLS3lvvKhPIRRgZKrOMwBimm36+UHBEpuwuodCNgTH1KSo5jA9TgeU10
         JZ6P86AslnZzkrSE70fzMMUZM43NDo44InkErQWXF+YwiLDzpzHhIzEbGlPhEC62Wy3Z
         RugYfe4Kph1fvBn5BsaqNZOzyP0YZcQFGvZZnGUgE/VNCuarrdAGcgLiofcnmYdO8PRZ
         lulA==
X-Forwarded-Encrypted: i=1; AJvYcCUg0/XhNlBTDtTmSkc/xfSIxZdDKo1fT3jj3fA81n1RAyxp64xreqL72lwIOeQQYgkczf7gqsES2YISZ8hZog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC1wjulPUDpsAeRjHecRI682ZuQor9SEjde9f4KmhxCZpCCWQ4
	WDyGMPSGO6p8raOYkCRiiktgw3aapftUazuFDB27DmRWWesqelxsNhPkz9lDAQyYtXN6rfOA0tH
	Y3sSD6kLK/b2rPPCFXGZHQ9E8qzJ7Wtw=
X-Gm-Gg: ASbGnctLgfA4Ux39M7RWIy1tot8p1IxDHFKcaJOaSSNPDHuJ9jad2FeoaGfPWDChtws
	c1kBNctny7gh34TVjC8H2pulAbHYHoMggtnixyeFfTUMoCUvWdRn5ChCFeaW+C4masizbAZIZ5K
	AgSoawG1Lzx+r2GTqXLJp4bbDxy7agk0OCdza3yOO6dYWGmG0wW/mRqpQPqaMCt9WZNqi5Eym9a
	3m5Oj6/usCJYz9ySochbNxad2b3KSNy4JJtt9NAhPA63ePKsWl79fXOJAK9DsjMmi7+/K6AqD6p
	NQA2tXazghg0sqvG+jsrgOwzrf3GbqFQ1piXBITU8xyu7crqPouMe5F4DebLdMSDqdmO0+eqZpf
	cLnM=
X-Google-Smtp-Source: AGHT+IGFev7EmzbnBp3oCU5tzJS72YlPe0fQcsXeEhETHRdh5xiHxqgJbvANso1btJz7XhrfDTY/gAumPDbcpOU2Bw0=
X-Received: by 2002:a05:7022:f8c:b0:11b:1c6d:98ed with SMTP id
 a92af1059eb24-11c7911fb1fmr726027c88.2.1763454020327; Tue, 18 Nov 2025
 00:20:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118072833.196876-3-phasta@kernel.org>
In-Reply-To: <20251118072833.196876-3-phasta@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Nov 2025 09:20:08 +0100
X-Gm-Features: AWmQ_bnx5UkMI3RaBr2xr8orUONtN2aER4njXO5kUBVtOQLvb4hCXcfSlbSPWpo
Message-ID: <CANiq72md+0Lerj+kqr6QiU6ySR3XjRzmuBiLjkpWWieM72wyeQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: list: Add unsafe for container_of
To: Philipp Stanner <phasta@kernel.org>
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

On Tue, Nov 18, 2025 at 8:29=E2=80=AFAM Philipp Stanner <phasta@kernel.org>=
 wrote:
>
> For unknown reasons, that problem was so far not visible and only gets
> visible once one utilizes the list implementation from within the core
> crate:

What do you mean by "unknown reasons"? The reason is known -- please
refer to my message in the other thread. It should be mentioned in the
log, including the link to the compiler issue.

Also, I assume you meant `kernel` crate, not `core`.

> Cc: stable@vger.kernel.org # v6.17+

No need to mention the kernel version if the Fixes tags implies it. In
fact, it is more confusing, since it looks like there is a version
where it should not be applied to.

> -                let container =3D $crate::container_of!(
> +                let container =3D unsafe { $crate::container_of!(
>                      links_field, $crate::list::ListLinksSelfPtr<Self, $n=
um>, inner
> -                );
> +                ) };

Unsafe blocks require `// SAFETY: ...` comments.

Also, please double-check if this is the formatting that `rustfmt` would us=
e.

Thanks!

Cheers,
Miguel
