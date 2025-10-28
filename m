Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC4E1FE45A
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761659249; cv=none; b=WYarNg3FuThS0NALtiWZOH01FGjbk4d4DC1utx0ywz5EQ1uLGMhZczh4KwIrywnLAgCnn0xziLRS3X1RcEuJPzwsq7WcOXaffBHl2VTSjvMlFi1e4qXtVHVfM/qqwx48zA3BQZcTOlZEVfwWCJ4e2yCmi7LQejOFvNKdkLb4748=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761659249; c=relaxed/simple;
	bh=zawK76MtmH8ufrxR4rfg/Ht+VnEdIN5K5P/OxQhqD1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KqL1n1rnBbLYFQC1wvxFfG5nJwDVcbWRac5NeFxWJ9Rc5vhZNEItO+aofyxPUePPwuB8/SXqfy0bPsXQLQwGigf5DV8Ed/aoIfaU6wIyplASPiXz/BNQ+UYJwX1pf+Z+yFDDSw8PfIkB5EC7h8oevybdN6MIpSLmsRi7sEjphto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmNNPfWz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmNNPfWz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-290af0e154fso7413855ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761659247; x=1762264047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lck/qUF3K17/QD681a6Qx1V7al1MyFus+/Obtk7sHTc=;
        b=KmNNPfWzC511RqEJz0m9q2LzoZkyd1bSlK0vzRAVWE9z4HA3FSf5E/aqgOsN+8IkDd
         txRYdkgDX+L1C/r1c7VW0CaFcXf/2C1qXGfuQQ0qFcb8+eMavq7iF8DocJcPoAFMPd2M
         deMW5RVAPvJXrIj60fvQQ+HFzeqCCWam9mhitxsxdnY73wlLNG9ft1I2vM0TdBFaCBQE
         jXjBgs01ddWuch6q7rUoOBUADpguZhfi+NUPUSLp35vLnrVd5Fr++nU2ek71C64TxwvX
         KDTyRUrgJB73Om3XpoBms5n5azVhAGTGFbTzMO1Ty4EW8NDO06Qp8sPDl5wuViBTdsjC
         qm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761659247; x=1762264047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lck/qUF3K17/QD681a6Qx1V7al1MyFus+/Obtk7sHTc=;
        b=Q8fwEih0s3V3gmvXuJ+46gFmzIHw6Cxq3KPG+gTZ41KwfYF2yaZ++OWzZyIvZeps1C
         iHVXY3UHow2l/AOlOK0YeprjfAf5VrK/oCqZWbQKeZUfuGY7b7E2UK9+NqVuNHAfdCQ+
         in1Sv1SzYL4m4egJzhpujqpmDjS0V1weA/1gq6Uif2NDw39FokE4H8vK5/puw52B04hp
         x85ZmDN2s4kv40xEFgMARraWLcNqtAjVqpfn5LqWvmbg4Tw23vCcyex/CNDXVVm5GJs2
         lTpHxonspOeiAIyOWHRy+z7sHsfruiM6s5LZ4mawkJzlUUcBjeVw6t4KE+6RzasPShkQ
         J7xw==
X-Forwarded-Encrypted: i=1; AJvYcCUxrBmCXuagO/0662ztnWmDL3IQYTUhN0qydkTy4Nunl/9KLcnH+MGVj2vyjDqbhLLi2yBCZi20FQRJKDKymw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuw8Ogc27MP/yeX/KAnyqb5MmqQ646lV5SnCLIZCwn8qKp8M0D
	qoqi0V/Xo5br/5/D9pxBAnVQL1SqtXA8V9pLERx5LfMJ/eQ41USBaJkS7ljtO8f/FPR46XvBeJj
	28/YlU1pc4CwXOLTewQfVlNSSV8UZ1m0=
X-Gm-Gg: ASbGncthsgTIro6kAqiLolUUgP5mnvfxtCLuuBWnlPbx/zxxe0kKPp6Ht+IlBVaMhuN
	CMdvc8GErFv1EAbnLl9gBRcHMLBxWpT+sXqXEU89KlmPixYBAoR/H4RSXx5ElX7DprdG0ob8ae4
	GBXmXJSwkDFBG41v9VP5RYQiyT33V4iCUIStuv33CysaA/FU6cpAtWtJcPk00HAWmmHYIpG67zs
	EbIrcZYyJsjym+ky2OcNZPWztJJ2Y2mkobZjz4dgkGAgDJh+8vkv6OfoI3oPrpKhQo9FvOt/SHN
	5qlrYxODG5oU+0gKMEt6G0AbeGKpUZavm9RvalcCPQMORcGGEfbDdQyMAZdm0qnYRWZseiEvvQV
	g2vw=
X-Google-Smtp-Source: AGHT+IESXoECX6lb+KHpmsbAfcJAT0GbZQiS04Og6y3R0qXxL+rFcZNSFEWU136JZUGwifFE09Yqi8TDGf+dQjOFZ4U=
X-Received: by 2002:a17:902:db11:b0:25c:9a33:95fb with SMTP id
 d9443c01a7336-294cb502797mr22038715ad.8.1761659247125; Tue, 28 Oct 2025
 06:47:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org>
In-Reply-To: <20251022143158.64475-1-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Oct 2025 14:47:13 +0100
X-Gm-Features: AWmQ_bludoF7dxQQKoaDhrz1B9YQeI7e37qaHz0Oa7sW-yAdS1QG2o8R7Wm1Nqs
Message-ID: <CANiq72kjuGDAkwhYOM0BTn_WRruYn88C_MmYqytpJW=UMELV_w@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Binary Large Objects for Rust DebugFS
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, mmaurer@google.com, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 4:32=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
>   rust: uaccess: add UserSliceReader::read_slice_partial()
>   rust: uaccess: add UserSliceReader::read_slice_file()
>   rust: uaccess: add UserSliceWriter::write_slice_partial()
>   rust: uaccess: add UserSliceWriter::write_slice_file()

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
