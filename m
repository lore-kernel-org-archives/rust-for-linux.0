Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893C14F88D
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jan 2024 13:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706189006; cv=none; b=hif9E/bbSEUtTv9MdLl7EXD8T5NHDG9tIjv0SvoudEhtkkk/sEQNiC3v5qISP35U0o+fGKKGKHDWL3n8Owv7+4uKgGvQPtn6QraKgHCxRt6o5FM6RKXboHc+UTy26TkLoxUck3ZHHoLVQbyvDoSVKYiveubQkflTOwRbU8g4NiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706189006; c=relaxed/simple;
	bh=THUQN5ox52wMM50G0OacBTnixWD2SdVkKWnMbHGbGSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+yyTH+ho/uwt8d9PbogqlrvzE3rlfvMY51manVNCG40AEt0x9/FVMIjhtyJJzt8P3RxwpuLxLYPyGNJ0358x4R+vCKrrGiXth8e5Cq3gfJCGdi52OA1t0UndkFR4ZyUTbRRgjuw0ekyKjqLMWfvF1DqSSdfoFGfWlpxIcLtsMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKEtWnhb; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKEtWnhb"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6db0fdd2b8fso3564846b3a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jan 2024 05:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706189004; x=1706793804; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XoxsXQkKNzLk/Oimvx8Ga0AuL6hzhZvVU6SQBiDln8A=;
        b=LKEtWnhbIYxR3dJf5sGi3E4hB/cNXUk4SoD5HQsZBTZCIr+13g5IXUTspS5FAqv7I8
         YCLs+rF5gX2NeLE6t7KJeBKo6WXvUf+85BA/QuvTd3r6V8RV8QllVdqq2GufqWdKbgK9
         TeykPdS3oCj0rlWB8sfPLVU80G3Ky4KcRTZF0//4udzecd4Ycs+4YKkePjZ2DBm9Ul+h
         G3uQp8J11qy1KdOUj5VaG5fGbYey7SiJHNhdp0LrxA5cia56krQd5MYpycBXtg6h/DG+
         +S7+ubb4zBbeURDLcDui7+6BDrlcG+QaMBk/wWm/5tr9HYCvHMfVwhViPj4rI875G4nF
         4tIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706189004; x=1706793804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XoxsXQkKNzLk/Oimvx8Ga0AuL6hzhZvVU6SQBiDln8A=;
        b=mNzXMWTg+g5mv+sQTceJuPS5RIvJu7Uk2NpYjiUhn2eGYD4F363o7r0MdXBy0Lxe/E
         Q2mCAbJd39FH4bXkOtMKgv1env90E/0vDeuV37OKrDhFEwaj925X8wQCKIEho4T3ojgG
         QyGoJlbYzrCycksmvXnXijayvZbZFb19DpcAsLOh5NaIwXZjtegbycM47m7Zc8jXbWvZ
         RZr5/cLInTtTvogVTULjheg9YAaIquvFOmE8NplytvAES1XCvDOcf5fQimBQHcYympDX
         BMkJrSZkFB4eDeUgqPwmkEHiWbZdZOPuCUbglHqQLSQ91VNtfBdWOwWnfku3iZYw7Tdi
         3fKA==
X-Gm-Message-State: AOJu0Yz931ecnyZw39O7CI/GeNYQ3CLj1DHpeHBE3mtbyV2furAZBhZj
	aGB8YRkpA7DG/Crpe/fOcVAwWTuz8ASxu9RbtkfdhEEVeSll3M81
X-Google-Smtp-Source: AGHT+IHNcr4wMMkpKpFTMwdINXI2Y/VFk8hPKFurchkojkFLbMF48hNLEGbz+xw0vz/7uc4ArxhFMA==
X-Received: by 2002:a17:903:455:b0:1d4:79b7:b8ce with SMTP id iw21-20020a170903045500b001d479b7b8cemr786712plb.44.1706189003728;
        Thu, 25 Jan 2024 05:23:23 -0800 (PST)
Received: from ohnotp ([2001:f70:860:4100:d497:9118:219b:703d])
        by smtp.gmail.com with ESMTPSA id jw21-20020a056a00929500b006dd887e37f0sm3815106pfb.210.2024.01.25.05.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 05:23:23 -0800 (PST)
Date: Thu, 25 Jan 2024 22:25:31 +0900
From: Yutaro Ohno <yutaro.ono.418@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
	Virgile Andreani <armavica@ulminfo.fr>
Subject: Re: [PATCH] rust: str: implement `Display` and `Debug` for `BStr`
Message-ID: <ZbJhS-nDB-6O77G3@ohnotp>
References: <ZbFBnXy7YWV0MFC0@ohnotp>
 <20240124201832.30a76eb8.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240124201832.30a76eb8.gary@garyguo.net>

On Wed, Jan 24, 2024 at 08:18:32PM +0000, Gary Guo wrote:
> On Thu, 25 Jan 2024 01:58:05 +0900
> Yutaro Ohno <yutaro.ono.418@gmail.com> wrote:
> 
> > Currently, `BStr` is just a type alias of `[u8]`, limiting its
> > representation to a byte list rather than a character list, which is not
> > ideal for printing and debugging.
> > 
> > Implement `Display` and `Debug` traits for `BStr` to facilitate easier
> > printing and debugging.
> > 
> > Also, for this purpose, change `BStr` from a type alias of `[u8]` to a
> > struct wrapper of `[u8]`.
> > 
> > Co-developed-by: Virgile Andreani <armavica@ulminfo.fr>
> > Signed-off-by: Virgile Andreani <armavica@ulminfo.fr>
> > Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>
> > ---
> >  rust/kernel/str.rs | 211 +++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 186 insertions(+), 25 deletions(-)
> > 
> > diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> > index 7d848b83add4..0f0261e063d2 100644
> > --- a/rust/kernel/str.rs
> > +++ b/rust/kernel/str.rs
> > @@ -14,8 +14,104 @@
> >  
> >  /// Byte string without UTF-8 validity guarantee.
> >  ///
> > -/// `BStr` is simply an alias to `[u8]`, but has a more evident semantical meaning.
> > -pub type BStr = [u8];
> > +/// `BStr` is simply a wrapper over `[u8]`, but has a more evident semantical
> > +/// meaning.
> 
> I think this line can go?
> 

Indeed. Will remove in v2.

> > +#[repr(transparent)]
> > +pub struct BStr([u8]);
> > +
> > +impl BStr {
> > +    /// Returns the length of this string.
> > +    #[inline]
> > +    pub const fn len(&self) -> usize {
> > +        self.0.len()
> > +    }
> > +
> > +    /// Returns `true` if the string is empty.
> > +    #[inline]
> > +    pub const fn is_empty(&self) -> bool {
> > +        self.len() == 0
> > +    }
> > +
> > +    /// Creates a [`BStr`] from a `[u8]`.
> > +    #[inline]
> > +    pub const fn from_bytes(bytes: &[u8]) -> &Self {
> > +        // SAFETY: BStr is transparent to [u8].
> > +        unsafe { &*(bytes as *const [u8] as *const BStr) }
> > +    }
> > +}
> > +
> > +impl fmt::Display for BStr {
> > +    /// Formats printable ASCII characters, escaping the rest.
> > +    ///
> > +    /// ```
> > +    /// # use kernel::{fmt, b_str, str::{BStr, CString}};
> > +    /// let ascii = b_str!("Hello, BStr!");
> > +    /// let s = CString::try_from_fmt(fmt!("{}", ascii)).unwrap();
> > +    /// assert_eq!(s.as_bytes(), "Hello, BStr!".as_bytes());
> > +    ///
> > +    /// let non_ascii = b_str!("🦀");
> > +    /// let s = CString::try_from_fmt(fmt!("{}", non_ascii)).unwrap();
> > +    /// assert_eq!(s.as_bytes(), "\\xf0\\x9f\\xa6\\x80".as_bytes());
> > +    /// ```
> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> > +        for &b in &self.0 {
> > +            match b {
> > +                // Common escape codes.
> > +                b'\t' => f.write_str("\\t")?,
> > +                b'\n' => f.write_str("\\n")?,
> > +                b'\r' => f.write_str("\\r")?,
> 
> The current CStr code will print these as is. Why escaping these for
> Display? Also, if you want to change the behaviour, please put it in a
> separate patch.
> 

That makes sense. I'll change.

> > +                // Printable characters.
> > +                0x20..=0x7e => f.write_char(b as char)?,
> > +                _ => write!(f, "\\x{:02x}", b)?,
> > +            }
> > +        }
> > +        Ok(())
> > +    }
> > +}
> > +
> > +impl fmt::Debug for BStr {
> > +    /// Formats printable ASCII characters with a double quote on either end,
> > +    /// escaping the rest.
> > +    ///
> > +    /// ```
> > +    /// # use kernel::{fmt, b_str, str::{BStr, CString}};
> > +    /// // Embedded double quotes are escaped.
> > +    /// let ascii = b_str!("Hello, \"BStr\"!");
> > +    /// let s = CString::try_from_fmt(fmt!("{:?}", ascii)).unwrap();
> > +    /// assert_eq!(s.as_bytes(), "\"Hello, \\\"BStr\\\"!\"".as_bytes());
> > +    ///
> > +    /// let non_ascii = b_str!("😺");
> > +    /// let s = CString::try_from_fmt(fmt!("{:?}", non_ascii)).unwrap();
> > +    /// assert_eq!(s.as_bytes(), "\"\\xf0\\x9f\\x98\\xba\"".as_bytes());
> > +    /// ```
> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> > +        f.write_str("\"")?;
> > +        for &b in &self.0 {
> > +            match b {
> > +                // Common escape codes.
> > +                b'\t' => f.write_str("\\t")?,
> > +                b'\n' => f.write_str("\\n")?,
> > +                b'\r' => f.write_str("\\r")?,
> > +                // String escape characters.
> > +                b'\\' => f.write_str("\\\\")?,
> > +                b'\"' => f.write_str("\\\"")?,
> > +                // Printable characters.
> > +                0x20..=0x7e => f.write_char(b as char)?,
> > +                _ => write!(f, "\\x{:02x}", b)?,
> > +            }
> > +        }
> > +        f.write_str("\"")
> > +    }
> > +}
> > +
> > +impl Deref for BStr {
> > +    type Target = [u8];
> > +
> > +    #[inline]
> > +    fn deref(&self) -> &Self::Target {
> > +        &self.0
> > +    }
> > +}
> >  
> >  /// Creates a new [`BStr`] from a string literal.
> >  ///
> > @@ -33,7 +129,7 @@
> >  macro_rules! b_str {
> >      ($str:literal) => {{
> >          const S: &'static str = $str;
> > -        const C: &'static $crate::str::BStr = S.as_bytes();
> > +        const C: &'static $crate::str::BStr = BStr::from_bytes(S.as_bytes());
> >          C
> >      }};
> >  }
> > @@ -225,15 +321,7 @@ impl fmt::Display for CStr {
> >      /// assert_eq!(s.as_bytes_with_nul(), "so \"cool\"\0".as_bytes());
> >      /// ```
> >      fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> > -        for &c in self.as_bytes() {
> > -            if (0x20..0x7f).contains(&c) {
> > -                // Printable character.
> > -                f.write_char(c as char)?;
> > -            } else {
> > -                write!(f, "\\x{:02x}", c)?;
> > -            }
> > -        }
> > -        Ok(())
> > +        fmt::Display::fmt(self.as_ref(), f)
> >      }
> >  }
> >  
> > @@ -255,23 +343,14 @@ impl fmt::Debug for CStr {
> >      /// assert_eq!(s.as_bytes_with_nul(), "\"so \\\"cool\\\"\"\0".as_bytes());
> >      /// ```
> >      fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> > -        f.write_str("\"")?;
> > -        for &c in self.as_bytes() {
> > -            match c {
> > -                // Printable characters.
> > -                b'\"' => f.write_str("\\\"")?,
> > -                0x20..=0x7e => f.write_char(c as char)?,
> > -                _ => write!(f, "\\x{:02x}", c)?,
> > -            }
> > -        }
> > -        f.write_str("\"")
> > +        fmt::Debug::fmt(self.as_ref(), f)
> >      }
> >  }
> >  
> >  impl AsRef<BStr> for CStr {
> >      #[inline]
> >      fn as_ref(&self) -> &BStr {
> > -        self.as_bytes()
> > +        BStr::from_bytes(self.as_bytes())
> >      }
> >  }
> >  
> > @@ -280,7 +359,7 @@ impl Deref for CStr {
> >  
> >      #[inline]
> >      fn deref(&self) -> &Self::Target {
> > -        self.as_bytes()
> > +        BStr::from_bytes(self.as_bytes())
> 
> Either use `as_ref` here or use `deref()` in the `as_ref`.
> 

I'll change in v2.

> >      }
> >  }
> >  
> > @@ -327,7 +406,7 @@ impl<Idx> Index<Idx> for CStr
> >  
> >      #[inline]
> >      fn index(&self, index: Idx) -> &Self::Output {
> > -        &self.as_bytes()[index]
> > +        &self.as_ref()[index]
> >      }
> >  }
> 
