Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAEB3CF7D
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Jan 2024 04:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706676961; cv=none; b=W7d4d9on08WQ/dyYTRn4+6ZuDLYsW6jtDFkzpW+/mhaHcjrBEq3tPl3hvVdstpR5QlKzAk+tNC8MKY+6xlSBaHjjbAcg+4BrwjeiOYHeFra+alKozWIFrR08zRr46eiCdEoQySzQk2FJ3VgkvJxw6O0xirf5n90Ll4JLoIo/ksg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706676961; c=relaxed/simple;
	bh=ksU1F/WEq1G8p5hclgWol+AUzBJgkgTExmEDoK9Ezr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYWUjgLMfhulH23FyP1m0/Igh7LBQ2nZ3lYN6kVyolIIQO4LPIATiZpJEVAC5gwManQUnggxkejirNyRB709TT0S3o3DbwYZo6Mnw9DGt/AwcvPbE8S7rvjYClByy+wuz1vTwG4k7YgUHS88U8ECMUV8jtX2j3x6B6kFXXxdjuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eygn5QZr; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eygn5QZr"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d74045c463so27311935ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jan 2024 20:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706676959; x=1707281759; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M7tVn6xeTjCcmCHXBmQuF+zeU1WztQnAtY8sVEkbwwI=;
        b=eygn5QZr7eVczKuvg534vHUFpvMGMynuhTkpoPZARflTZIy/wHE71CJGkBo5cMItCy
         qlSBKQvGixkk0wyggA4J4swdVThjVw0azr2k6dN71q4HStFSOXiPO97u7DL7mx3iEy4O
         NFQdiOXdmBcCJ3ey7Qpu4nDOGGVaFSY/ZpKZ3IJv35AF/Fh8mvXxGBqkMD0yUVZ+kxeR
         R5H9XuWGPknl7hG796SEbmeTgs7A9y+j0YvXwx9MzKJp66Y1Xqw2s9db2aDNg3v3K+bo
         7nHb2NwiIzn2mTm6X3Tzq7HBj5UkrGntTikvoFZHymUdUl5+WdYfKoHPsTHD7dUW8Y1e
         ROBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706676959; x=1707281759;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7tVn6xeTjCcmCHXBmQuF+zeU1WztQnAtY8sVEkbwwI=;
        b=RHl3tLTFmn5yhSL7956KbUhqVXStx1iQvYe2zAHLy/MmgbIn7WqfyXr/7ZG0DKl/uX
         oOXk6yYObjgf+PE9hFKiF9djlF9/M+1Jn8v1NAIuo6t9Cu5A3nqiLHq/059zKiX+H5jq
         y1Vtq35dJxRf9jxu/I2oyXmxrK6uoNT7CHHVSgMkzc30DXNbWO+QlUjr6TvsFKnRkH49
         6hM6AuyZMi6caV8MxLuGohkXoam+ATqhFlGXraQnWNhsX/T2wqu6aygcdyM+kEM63Cql
         yxxWOE6x/xi7fAsQXo+RHhh1YvuA1XD6BZKl2lSRASoA1hXbZrNxLiZ1tWIxBtRuGjz3
         bPpw==
X-Gm-Message-State: AOJu0YzOmJTD2zg7JnasrqOqTH2DJ6qZsoU0iL8SilQA+dNLsH3wxhKf
	RyFSzBWu/t8l9L0ucTvHYv6kgJEqLxhpTv6KLOJKZAWwZEDaXoJd
X-Google-Smtp-Source: AGHT+IEdXXK0du0+GXgludIqQ65+ic4mNYkQ3Bm+ujiaF6gFCeHacI5Zbz7VAgs5SZI/0pLuIMf0KA==
X-Received: by 2002:a17:902:a50c:b0:1d8:f016:f697 with SMTP id s12-20020a170902a50c00b001d8f016f697mr592888plq.59.1706676959277;
        Tue, 30 Jan 2024 20:55:59 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXPtWp6sz2tXr7Kj9CgDJdXVR/X/6/DJ6cJxmjv5xx8RziwDgfoHZzCCYVJmHWD15d9d9Jap8V+HbcV6m87A/gr0S2SmH5iKYD9g42rm6d2cjnU5upaeL63XmbkQiqiyLYU8gueAunR8EW8M/NjjsQldZDmEESwUD0oQRXCtsoh0QnH7zr5nY7MOSM59XDiWGpm34/FRX4K7blGze98KZ3L9WK+p7ixGomnhbiZWITvXYygg2DIhfZa7cEQ15obLVeViyNfjT1N0byCPKCOTGKGyCIJp76IQwDatzc/a6YPgnyyIX5KnSJOskMALdPGgoP3+xnV3ryojkQptJ6m6UzJBnYBLXOWFEsGqJx2D24r6UiAOSp/X1ibTPAv
Received: from ohnotp ([2001:f70:860:4100:d497:9118:219b:703d])
        by smtp.gmail.com with ESMTPSA id mo14-20020a1709030a8e00b001d8f4c531a4sm3745204plb.70.2024.01.30.20.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 20:55:58 -0800 (PST)
Date: Wed, 31 Jan 2024 13:58:14 +0900
From: Yutaro Ohno <yutaro.ono.418@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, armavica@ulminfo.fr,
	benno.lossin@proton.me, bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Subject: Re: [PATCH V2] rust: str: implement `Display` and `Debug` for `BStr`
Message-ID: <ZbnTZjb9O4O6Y65_@ohnotp>
References: <ZbSDkm65LML4OWKX@ohnotp>
 <20240129121859.1099000-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129121859.1099000-1-aliceryhl@google.com>

Thank you both for the comments!

On 01/29, Miguel Ojeda wrote:
> On Mon, Jan 29, 2024 at 1:19 PM Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > What about newlines and tabs? Those are printable.
> >
> > If you are intentionally excluding them, please add a comment saying that.
> 
> +1 and, either way, it would also nice a test for those too.

> > This escapes quotes, but what about backslashes?
> 
> Ditto.

Newlines and tabs are omitted here because this patch doesn't intend to
change the current behavior of CStr's Display/Debug in this patch,
aligning with the feedback provided in V1.

So, how about removing the changes to CStr's Display/Debug from my
patch, and adding '\t' and '\n' as printable characters to BStr's
Display/Debug? (Backslashes for Debug as well.)

I'm considering whether it would be preferable for BStr's Display and
Debug to have distinct behavior from CStr's.

On Mon, Jan 29, 2024 at 1:19 PM Alice Ryhl <aliceryhl@google.com> wrote:
> Also, perhaps `write_char('"')` makes more sense than `write_str("\"")`?

I agree. Will change in V3.

On 01/29, Alice Ryhl wrote:
> >  macro_rules! b_str {
> >      ($str:literal) => {{
> >          const S: &'static str = $str;
> > -        const C: &'static $crate::str::BStr = S.as_bytes();
> > +        const C: &'static $crate::str::BStr = BStr::from_bytes(S.as_bytes());
> >          C
> >      }};
> >  }
> 
> This should use the full path both times:
> 
> const C: &'static $crate::str::BStr = $crate::str::BStr::from_bytes(S.as_bytes());

Thanks. I'll also change this.


Best regards,
Yutaro Ohno
