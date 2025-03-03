Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125741F0E3C
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740995364; cv=none; b=KHwrrQ/rXj1F/t7Y1Vwi0U9k0cVpYNRIiVhnGL0LWqfelVZowGta1BoY3zsvoXO0mD6nCa0M2nhFkVzbXJ6ZV3A1L3TndOOX4eIkDA0GdeqF2urBF1sJnyS5zuo4oGutHlFWe8qzdzSXFuijQ1c72BeXOAL2Q4x1uq+Kec9GU/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740995364; c=relaxed/simple;
	bh=tzlgVVNvAlNlgaa2JvUJRo2pG9JqwRvR3QWZKyunCfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zr87bhVJVBe0Q5OnMRf4HsfCLHMAfjAyOUYgVI1A8CXv0eD2hTmm3FD1LVx/hDz7Sayt8vqY7FkTfRebZcAm5tFnIgvRYkDCF0dEU34ScilLO3BSVn8xghC5I4Nra6vFc1BR3Cd8XJOx5vKwAI5ZNdoPeS8Gv7+QjPIHb5kFPKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kNF0VxKG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kNF0VxKG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39104c1cbbdso457517f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 01:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740995361; x=1741600161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnL9Hz24S3kNKDp8b2cNl9jZ/3k9Ss4gpw9SmsSpB2g=;
        b=kNF0VxKGrJ/XBpY9WttfMcaPrNvGMptak+UZED7TtrbnPhxIpHBH8VNp4lAifF0oUr
         hQSBlI8y4OXaMoqOKhRx0IHOmnOX3TBmCFquYX3U8HHEKwXOBoqd7jFaalxrp8siQQ7D
         DTnctTKSFwsZwlg41ssQ7ZHbVWlMknkmlDdfDFlsk9FGr45xOngR3ESyQGlzrEvBlq8+
         sLHH+cI/PPSpwx03J0EMnnL6lY1yz6dkGAs5SANzBc3sm1BzmhU/VVRwkL45aoLGatxD
         yK/ynBdzb/1gNzlDQwIWURY8KCqfg2Hs6ZACAx2ulj1NO8wu0rSM53XAPe5ZneQfudaH
         CQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740995361; x=1741600161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnL9Hz24S3kNKDp8b2cNl9jZ/3k9Ss4gpw9SmsSpB2g=;
        b=ULaTfpdlVv6t8IuktmhffA1qnC8otRgvP9oUrCBI+rt2JNp+MHHEgNLf01fFUCAUbe
         K6NPOYpRfbrcc2iim+T2fwa2VLI3693nEvhSaLGJrNF4cWI2hY4pykOIKAXtU8KDoAnv
         RQiIr5Qz4+uunND21h3T1PCFHRCjrFYRhtiJE+Pm1W0ikiFj+ZQzNuzHvScsPLgnXHjH
         8dsFjpxYbvizYDhi1+bOlA5osshTy+lqnuJzBD0slKJOxoV5ZU3e8/+uB7Rz15mWbjMi
         OyuyAuKIRyvp045z1GRj4C3KFoL8BD3b3g7UeQ0mUcjb8Cp5LIw80FtxLU2sik73mPtL
         iF7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFSFc6l8A+krpq+zzWmkEbTVQjKS0tsvKWb8z/V6qtU0M0aNty+1nx+bv3aiEhTVNvf2IcNH+QklEFnfm0cA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKXo+S9gjzKipQS3UMJJPASwOhQTPKpibzuKoGgQPxjsNgGHUU
	iPqYMy/bQrM0iaOzfRR0TCRnWnnMyBGD5Bql2pyWIctlOoEDgVhqTYeaEVB6QlsmFzsL1eDT5PL
	cRk6S3NVpOvxg1rQXvhQxm0ecPL7zhpgbhbQO
X-Gm-Gg: ASbGncvpe4S0HRAw6qHdKZFGF8f7B+LR38T1YoXkmGUfXjCgs22mqlQQNt7F+gvAx7y
	eiz2FoKCmx5Cj4pfb+ct49DFE6ILqrNZwbWQyI7ec0RPW+/JHQfJZaTlB5TyOJxmIQNi/a4VrqO
	FUb+IObzHgQj418dQSZyqTa2x58xEoxoSJ2tHNITsnQzEWdf6Rs8vtAxRJ
X-Google-Smtp-Source: AGHT+IGTVr2JIj2NM1dARmHjx2Q20a0Sj+PRO/QysiCo1gjTEuQGm9OoWgT0wK6Y1r6W2Tsdd+R6BGWXSNz0RLNl2NM=
X-Received: by 2002:a05:6000:270f:b0:390:ea34:7d83 with SMTP id
 ffacd0b85a97d-390ec9c166cmr8927299f8f.31.1740995361321; Mon, 03 Mar 2025
 01:49:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
 <20250303-export-macro-v3-4-41fbad85a27f@google.com> <Z8V6XafrTyrB4z8D@smile.fi.intel.com>
In-Reply-To: <Z8V6XafrTyrB4z8D@smile.fi.intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 10:49:09 +0100
X-Gm-Features: AQ5f1JoxwuAGeit50aUfVN8jQmqWDDJZmGrbhn2c83aPm7MkhBxBt-nYtmFZSyw
Message-ID: <CAH5fLgimM6gL2v4z_x717iYU8LYTfypEi=wkj3mXS4uu8Raq0A@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] print: use new #[export] macro for rust_fmt_argument
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tamir Duberstein <tamird@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 10:46=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Mar 03, 2025 at 08:45:15AM +0000, Alice Ryhl wrote:
> > This moves the rust_fmt_argument function over to use the new #[export]
> > macro, which will verify at compile-time that the function signature
> > matches what is in the header file.
>
> ...
>
> >  extern bool no_hash_pointers;
> >  int no_hash_pointers_enable(char *str);
> >
> > +/* Used for Rust formatting ('%pA'). */
>
> In case you need a new version, please drop a period at the end as this i=
s the
> style used in the sprintf.h already.

Sure, I will remove the period if I send a new version.

Alice
