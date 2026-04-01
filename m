Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B172E5B2A
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050312; cv=pass; b=Jmai9AzCqcGtTTV2j9uFF1NMxFJVNdRZUpkSVnp5wPcJTFZUkiXNpIACQ+JbGYLzFjpKp4DY9/L64RRrASATQA5q4I/WeWR0uXf8lnJ2cQ9LpCBJhbBsadLsbKO4VB8sSbX79CNLYb41lsKGtORCAjwJ6VrQwDkET7RghbTI/DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050312; c=relaxed/simple;
	bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJyLW62d1N539xjN6P9Sv1F9W65ceWEY6ub+kTUmbWfcvJeebwa7/6iINDDR4Tm44MjMKKCjoNn9VzoyLjJzCoSWWRhk7GLixtpvoLTb2qE94FAeuBUS5E9SfsrTvSg4Yj5/8FkJlTOFnF+SZXfK2uwhPzJe51QnagFRtBstfNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iheeSOM/; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iheeSOM/"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c5cf871adcso173650eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 06:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050310; cv=none;
        d=google.com; s=arc-20240605;
        b=hZqWSpkji04mdPc6pCp1cbdPKl7XC2uCtA2JkE3yikGlUsp4G3I0XD3S0Ce6/CxuNk
         RpG6TIEJT+KuZI8imlzJfqrCxrVhhgFDfwxmwzJaHZ986XaNGVbl0aLxO8LH6TvUSSPG
         bLVP2LGQk6Oavko2aVha5YQvDu7fKu5D9bkE/2AWBIa8sFtVCmiZSEZsvJeZKwEdAwCQ
         iuTZGs52RTmjlQ1Pp6oyfoI8itRcx9skmXcMFI5xp8ptljEFKBxSh8n/b9zUV5wrUdPZ
         rWoEzq/r0rdK+qzT6PpEAnuB2frOyUbyhcm11+MihVU2o8yt/rJVDj1GBqOzgeiRmlzp
         W/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        fh=EqPrGxnOQwkO0cX1dCzq9s4UZg7V3ci+w6BidiGfcx0=;
        b=H0dNXKnciQG2Gwqwlm35OW+adQIGUXVuTDTCiJ6DzCGvU4sPx7hfuk0onE9bvlwSZp
         Jmrcm7qET5N1gzoDweAiD6evAh01FczVyF8yXz5yC3tiGjZN+n9HTs6jvtVlkPK3Z16d
         Dld5DrGjbT6sM2RVsjoPp+KciuWcwdJE/mrlTZ5CCqX/mkNcZjBSmHxuD7xP5V0sa0nc
         n3OU8gbdYj5d0KwAXbbDBU+F7jNdvA2g4VjAVD4+0oMAOueifEFA3+zOcyigk4k+Mdg2
         aLodk/p8dnuATEXDkQ3hJmu/FQm0yyYXXwxS8nsc/eadm+Ir0StgfThpcl9aUCeHFXly
         C7yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775050310; x=1775655110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=iheeSOM/qlwTqLbVsiJefeHkwYJF69vrE0fo5V1kfgUbcsb7yyWjVh+FtzsiFxYiB2
         Yn3EwIwdZP+mACB9dZIA7vmKuA1Tcg9dv/f3cjoFxkJYVO9azMYPXgpyaMmaM4e4tBvO
         RDxhhh7h6nJ0A/BWEimRwqTrxCGYPHq4vNd97ByVCZWz8s+jXyAPuLqczLW+IQLFINvG
         ztceSgS4vwjmS7nMFkpjeeEWlaF6zj6d0u1J9WU4s2F8p9gGYdA55JoJpDLa39r4g15R
         k7k2jhHIWMp1fXuk2bWDz1caK4xkHT/kWjRb2JGQmGLRXECgWUmFL+30Iry6wfepfAIq
         tI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050310; x=1775655110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=jdfzzcoo4plhZSAMIpTlOTeZ0ou7sqLAVJhrMohpR1HOVGGe5pfKans+r6WvZ2Aaqo
         Pau8f3uE0GHBt3QDuurlOwq/iaUkQ9zGawv6oYGrBprcbBY/xF5x5FvzFMnmpu7lauHa
         PXUdEeTMEtOt/YnMZEVxv1IvTKLQYtszNUR5DjLXJkq+RC00Uqz6N9XHidhSxI6B8vfn
         ywTvKI15AZcxYRZmJ914Ijwhjcp6SBDPNbNM+wqCYrjQCST5hWDtEEBLXt0GyPAccLkj
         Q5h8gTdBo6cdCGZ37Oyps1RVEyJhM5jhlgeRLBRJteuMQ4wXhYuHfBGDM5PUViceVgzU
         Vp9w==
X-Forwarded-Encrypted: i=1; AJvYcCVAe26MW0I5AyvFxZGgtBZ7VfXf5r0NWLoFAuCW5nB1TZB/Mb6XIem4n7W+CjZGJgCzvCv2gFPxKcg4l7nbLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZnLnA3jLgQaFi+f5pe8m/jfr8eq/ZJkxedyahtgKuglkVKosJ
	feqKFydpz6fEhIpHsXI5fCZET7w9dG54CRhlo9UMpNN5JcCzbKL4u5e7gooQG5VFoGDepBnFDic
	x/Rl5lu+l3sB778GYjFIIAvZzl1JOZPU=
X-Gm-Gg: ATEYQzwfvQtBjrjgrsgPCJzHoTEyimk4J/jmfUkfobi0hgmjkSl1yK7AVEbz9Csxudw
	B044vrgvLI5AHQykRmQ7uQJV+pvJW5F1I71hLt9WEzjCA29/7EPHCFfN3I3MN8bCazOri8sym3c
	PAacO6tUsKiUbztzd4/nhr71JVCWduEMJVlkSx3up6JykbUTYZnvpZWGJg3LNXJsrRcAfkYZMoL
	Ru72KEd8EwPG9UUplnhWGKNT6BkpzY4YhIsBhC2ojlzqaP+qYVJ0lZJPEd7fDdCWgGDRWImRVsy
	HD0lbCWJ/7wpaDuby2lH/BMoqSImlHrVKZxiKClNaCeZhTyOEmiW/F6FUB/+KybB+BHPC/5V/67
	52hLNeCEqnMheKPLEt8ssQDEiniAY9RuyrA==
X-Received: by 2002:a05:7300:fd16:b0:2c4:6ec:141e with SMTP id
 5a478bee46e88-2c932bab66bmr849425eec.7.1775050310241; Wed, 01 Apr 2026
 06:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
 <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
In-Reply-To: <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 15:31:36 +0200
X-Gm-Features: AQROBzD4KmXruNHpjUyy0X5nLhLhXQUuTTY9eP3fb4LBTyRyQ4wVkUjvlUGGI0w
Message-ID: <CANiq72=FBbJ--jrzYyKe3T56YqT5eU+0DXzPG3Ho7a+D9rfu=Q@mail.gmail.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 3:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This diff fails to apply on linux-next, due to conflict with ece7e57afd51
> ("docs: changes.rst and ver_linux: sort the lists").

Yeah, sorry, I should have added `--base-commit` -- it is `rust-next`,
i.e. 3a2486cc1da5 ("kbuild: rust: provide an option to inline C
helpers into Rust").

There will be other conflicts too, e.g. in the list of features in
`scripts/Makefile.build`.

Cheers,
Miguel
