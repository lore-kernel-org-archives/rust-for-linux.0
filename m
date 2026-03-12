Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9EE2550AF
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 06:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773296214; cv=pass; b=kaP8v7L/LpT0ucqQKPSCto74fojCkyCLGgZDvpksrDBuFoWKb+VfgRLj3h0Wz+j1pfFNanUS53cbqDCnuCl/KgYSk5BpXIIyHNviB3jREaKZHQVOSNfUOOaqxBgd2PzOdWCMd+NeAx0l6GytXM4GCkdYFmWRJCPrm15bNDPFuZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773296214; c=relaxed/simple;
	bh=bD069GMsci0gBTjbglrpkzEBe6IXAx1amoe1Y/XjpIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwC6AQwKtwBD2Pu1zV5VyqQWvpGfDH8eU2e8QdKUr1BRIymhl5Hj3XmVV9aVbuaHZOWWYQJhzsUC/VE12Q5m2GEK29ncfvD/KiFGZn0PC44scO9SRELI3SWwHbYBwYWL3F0Y7eW12QOeGhV0+AI8TKfI+APg1rlKbSfHOTlKLbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJygPyrA; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJygPyrA"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2be7026150dso11969eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 23:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773296212; cv=none;
        d=google.com; s=arc-20240605;
        b=HX257sK8qoc1ubPceYGV8pOW2Fjrwpw6aOrG2nTaqa2rUfvVzPIWBHbUA8q+v7+cqi
         1KcdxaYfqhysrkg+jB6Zf6LemPl76IgXCz2eceZ2C4zNrcYQ8S30bUnJXaEeXvdCVlyv
         VKMmOUFcLXCZ6tX/FTReoi+fSK7f6Y142uQ8kbgoBNI9IiUNv6GQTEN85+BJHx0/4r5j
         MNDecthzKb+3x+9xjcQ7/UNiA+LvCZl+vdTuKQMT1j/j+AqLRCHtMyNPb1sFAo5E6VKt
         9TDDgp1rixV5tbEyE6r3DN+DUpcuVC90phhzzuvaScgxuUDZFWF9MR0QOwCiEo2XERic
         9mBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T5Xq5n38ejb+wqwLSLLwsmeg0x7SGxuPsJ0QJE2VqBs=;
        fh=/BtV4avlRkaSVFsdeJfPUpFFoRhxbaqZWZ+J3MYv3Hw=;
        b=j9QdwgoOyxwKuItPUh3SNJW6Fv35zl1lPJJuHfmrFQnsniKGYi1KJauL248Is1jUiH
         q+tS6J7UNCLXK84ygrURMB3YxA1G3fno0yrgzT/IhHhOJaBN1Jmlr9/72xywykvfjoFs
         XcO/XDjQCMrKApNIZV006nniEgQxNr61LBwW5bJS4kZ3Wwd5tprt6qA8aGzvChuF6HN7
         96uQquX6jRS2JQiHegnwHCnrLn0Nzqb+DJGiFqPF08R8eLX6g9ifkdE1uHTKskRbQ7MH
         5FMIztbP5MMBB0wzQ0LvkPgYjDEKN40K6UfuF1AT5iSQ9Fu+DaBkcNHpITZDGtlyTo21
         ukkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773296212; x=1773901012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5Xq5n38ejb+wqwLSLLwsmeg0x7SGxuPsJ0QJE2VqBs=;
        b=XJygPyrAFkBzwAMJ4kB5ATzdyHs626B9Jp1WQETa2c39gsYkjzVYo9ekbY1GDIEEIR
         u/DurLtcoB0cddDwJOYHK0YQwtxglF3zvaYvIHYx/FSfFZASHD1HH2kcoVDm4CjawhX/
         f9x/i9+lpkyoTCxNefDbeJuBwanI/0EWRW5HVahySfy4OifeFhinUEoPkzfiOr5Q9DmH
         LzgpWx5Io/4W1iKNqeoRvlXgrAe6Uu7T9a59YW+rrsUk/mWFr0PRPcFLDAjZBRsL3xQY
         L2o6m/DhDc8krjgBArCyZ6Jt/m7Ogsye47HAuM1MxYEupFMlMpf5aWp+F6OuP5u0zjJt
         5KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773296212; x=1773901012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T5Xq5n38ejb+wqwLSLLwsmeg0x7SGxuPsJ0QJE2VqBs=;
        b=BfBzH4DqFLsQjhNi0gJ5j3zLfsNks+ef+32K/ItWYPhhG8nAl61lat5qZD5Lt/5Q8y
         EVvtoLP+WUF5cylwL4sRil/yHUeVzRn94G2YIkTepXcalQuLJNo64cj98AYDrga1NaCq
         27NvCM7kXeDjTw56FtbO8mTETJ+owxs2Zit7I7yUFhH25gnuk2t20RTuyiK6dA12SPVD
         WW9npV7XtLkEH+P4I3VPoZg4Rb37OV4YTueJ+crmOvwlzwe/z4JDPd4GiV4poi5MTzwT
         fGZC1CNm4nj3eWFrcML8Fiiqjnxdt1RLXlrdTRr3n+FFFcSM4DXxvQ+tlHlVe4Ed77QZ
         5vGw==
X-Forwarded-Encrypted: i=1; AJvYcCV5LJoX2RbRLKngBAG0kuIcqxit7ES8KNK1NWw4silAKZQY3jAvhptooz0bkdrxXXISkJAppAXrh5mjBXwgtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzednWXzLCxDwpJ1S6hXZ7XWmo/An+aXqXWmkl9HTnQqozZLmLk
	2Gx1c8A8xQ2dkpYmf8RuY5FqvEVb1hgMTudIlTPKJZiHoVknDVHPTJ8GcAuOiYVMMYpKtgZrteD
	i4m/qpHt1WRw1Eal8FLaJYWd6pcqVBG4=
X-Gm-Gg: ATEYQzyugLCldgfWdazmv/3XoBx2KgCu3o5GYW4XqdRPS3eGaJxMTXvi8bzO2wmtKAk
	jLHn0nAlgUwq/4lhPWsOLbCFyRAB/AYYcvXATzyjlvu58atTI+qsUTiUqmDRld1rwudNWjzfiRI
	JxONoH8yNw3Pwvzu3SBzHUKlgHKivyBNQd/1ZccN5I91LhxGg2fc4r7BwU0MyFXLWf2eTtl7F6E
	nj5V0c2N0Ojg7TtheaPY/8CJiS7yzjiR2bORLMA2SdsbNCcLJ0r+D1VHnZGTz1dGywo6BVMQWMe
	nmFmaXeGgGX2RywhsaB7h5IPFA/NoP9rcFFCdyOeBkNEMF7kQeLltXBE5s4KX02CFhc+8vET1j2
	UT8S+iCzcO/jwPcpKljoc9cw=
X-Received: by 2002:a05:7301:100a:b0:2be:6f30:f31f with SMTP id
 5a478bee46e88-2be8a586d2cmr1305288eec.7.1773296212470; Wed, 11 Mar 2026
 23:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312031507.216709-1-jhubbard@nvidia.com> <20260312031507.216709-3-jhubbard@nvidia.com>
In-Reply-To: <20260312031507.216709-3-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 07:16:39 +0100
X-Gm-Features: AaiRm52wFanq5Tq38SbGO2FXsqdC2gcTJEyj0f49SmL2TtLwyFFIxAsHVQkJK6Y
Message-ID: <CANiq72=KjVoPJii7_i-vfe5AL4e5-Lb-qd99j2JR5ZjK1a69Ew@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: ptr: add Alignment::from_u64() for
 DeviceSize constants
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 4:15=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> +    /// A build error is triggered if `align` is not a power of two, or =
if it
> +    /// exceeds [`usize::MAX`].

I think this wording comes from the `new` constructor, but there we
use a const assert, not a runtime one.

So as you mention in the commit message,  it is true that if you call
it in a const context you will get it at compile-time error, but the
wording here in the docs seems to imply otherwise.

Cheers,
Miguel
