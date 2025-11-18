Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DBB2DA756
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 21:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763502024; cv=none; b=myIPpMG/GySE7845edKTB6V/Sn8ShoK/F4SmPaviFVCgVjHfhYamFSzJCZo/94wc9giPta7BK9Tg5TjiUtNpPMOCwsap2zArl3jzU7dLdrZIJ0e5FiWSuiaQd9Pf9r/yNBFDBwHSFTJkFJjO4XiNqdBx1BmCKqnqAK/22xek4N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763502024; c=relaxed/simple;
	bh=m7gFvkGfmOZggDFwMgNxUjTpu97bLxBQ0YSHsx/qj0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZdEEVOiz4kRQ15FB2oiHJrHjK0qDKpubGPoIndjttCYMVvCRZdFVtFqFP1bznOuAmlIYNTXfYXOlTShqH3tS2joRyjd644ZM3wBqwVCCKjhUZDNrKjSNSsUeOaqkmq1BVx/tLnGbSzyiQDJnknjJOWyM8IclhaOEgNDBndiRpsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K40LTPRC; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K40LTPRC"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2960771ec71so10071855ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 13:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763502023; x=1764106823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7gFvkGfmOZggDFwMgNxUjTpu97bLxBQ0YSHsx/qj0o=;
        b=K40LTPRCOiqatdxWTjMQX/FGrvY1RARds65JOnhIgKapT4ES2m2kfBnCpe2SQQiGjF
         BuRs1UW2krdt2c8fqgGUdOBWmfhFc9Ieyde/PdXC6fK+MZRmaXyw8w37XRJL6Wym+YGx
         FmD7bJNXC7ZLZEKmuxkkB8rrpqNah3Gm83GVcUsCtlS5ai5V1guBAHVBTEB5N6SBJrbE
         L+XWi1IbvJpUeD/1a6DRhs2JHERtNt4KI4+C21FoEdJ7I+wPgeDuc73VzRy2Y3bWs1M1
         1rP6di5tMzZ7rktWP/oOsK/SFcNjWkuZSJWOkJqi5a/dOxIIXFbo1H8ds3H6LFIxXSHT
         28Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763502023; x=1764106823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m7gFvkGfmOZggDFwMgNxUjTpu97bLxBQ0YSHsx/qj0o=;
        b=Bz2MZoJlPcGY6HzledGGsxXEzDeemtj9kQzXdgqIddeGn45i5W2VJoa5LNegX9jk7Y
         teJEeVZvBmNtjNKd6K5XvLPrGxKf/edxBEDJAJdbyEg1oJKZJlSsIePDla8VV7Loe583
         43GE8F9itcnfZ+6Ph3pW6b5x+S+zPzmU4lPptvMfP13w5Lmz/R+7zxci2UJV572m3732
         IkROScp5Hl4AW+qxduMsg9e2n9jj1JluzyrPQw+n14elqk1PCsoKlQaQd3REyOjLtrBR
         HREeRFlpqipyBM6KrEzZxYdL1V7fudoz2yermufT//S0x3Sa9XywpIFoY5/17hFk9N/i
         xO8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwC/yAcZD59jAdE34Yf3nfnoTAk1ouVc/xelGyY+IpvmZMp5VVKtadWqxZEcgW73Te5SdqR4L63rEG+dp37A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAqU2olVAHhcUp9vMA3wKOL1UYTduAlNsm4Z/ftvmjUljAO86/
	Q9sK31lOpIrueq8UvrGdRFcsgu8Zji48u++vTH/U4aJfRgUZNgaxUhATsB5AbrvPeR7cRr1FExE
	kk0uabdKVbNAdD2YGexUQ0stE1Z5HilU=
X-Gm-Gg: ASbGncstVwFe7DbsQ2pr5sz6wF5uqHkYfCfNkSl+5Pll6qzxaNQnXX5Pnivt+EpMUVS
	2Xsn7jQ2JTRyG0uRhJ0wjgogptL+3F/AebvizHDBfZvllYFM4vl+MZE1FRBakIjhL5+jgpCEmd/
	+Jdm9nbVecp6BDrwkOh6m/QyxCnWKFn/4Y9qr/KE9xblNyFt9WHiGW0HIJQy9wP9UL7WYdQhu9E
	aHgwF53SPj6neFgj+xMvvhmhDp/HKsh/qIPHp8XFZPWWsjczlJTSHrR4pu7UPKP2KvvAzgNFt62
	Yvb8Ot9oSb5f7FnyykRlRRJFkQ77KlPpI/vLNOG/rI8fBHLGfJbiVXc0JBrEwC5XGv07ovnksK0
	0L27z+l1ReW+Ec5/4pfWmc0A8
X-Google-Smtp-Source: AGHT+IESdMsbDBfVYr5r2d9Q1hGcQbREvBUpqxz/8E2BmwSwQue6J22hjUpK/Jg3x7qPuJL/pyQtB2mgYzDH8c8DvXs=
X-Received: by 2002:a05:693c:408d:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a6c985b102mr1764622eec.0.1763502022617; Tue, 18 Nov 2025
 13:40:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
 <a9b172c926a4b30360530c34adc44f3789ec2b27.1763370163.git.mchehab+huawei@kernel.org>
 <CANiq72=bYzj6iU7PCm+VMBTeBbgUcL8nwrvUut9p4ph+3+itaQ@mail.gmail.com>
 <kjpquyekvw7fwrndoomtge7fnxtfefihqlikj6xcqtazrr6l77@424ufup7v45o>
 <87seeb47pk.fsf@trenco.lwn.net> <20251118201152.038e2749@foz.lan>
In-Reply-To: <20251118201152.038e2749@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Nov 2025 22:40:09 +0100
X-Gm-Features: AWmQ_bkcbMVHRNfLk8B5J9LKqf_dQCkbxN2gNZ8Y9MnrnK9xQ4gHVkEqkHAlbFc
Message-ID: <CANiq72nC9HH4tZT6dTgiEpkBUktY5i3tVtnNtKjZhKAvAVrdBQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] docs: makefile: move rustdoc check to the build wrapper
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Carlos Bilbao <carlos.bilbao@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 8:12=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Me too, but the bug is very annoying ;-)
>
> I'll try to seek for some time to better understand it, maybe
> next week.

I will try to find a moment to take a look too... This happens with
only the new wrapper, right? Or is it something that happened even
before? If the latter, I remember testing the logic that Carlos added
a long time ago, but maybe something changed in the meantime.

Cheers,
Miguel
