Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8E03E7151
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 14:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175421; cv=none; b=Q8POt6uD/uTP5trwWy0KZS1zew59/+QIri2GEk37J3bAp5nAlokCs+vC7/pJ5g3+j3a/ChqzTZoM4QspgyZ8vfJQ9kxkTkUzUO5fjN5IWKxXGr4BSSf10McF+gAn3KJZVPOVK5ois+zwdulpk+K9eLux1tDRkUjg71Cce/oEpbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175421; c=relaxed/simple;
	bh=dn7cwF6qtgGFLiqp0cvEjfsbZaGhIy7LmJ2lctcWX4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9OcDgaseO/e9CiLa7NZFMWR6dD25zGdSJ23ML8An54z7SrkgAgMf7jaXFQ+fC4IDDKN9S+D8RGF3R526bgJFziUknndhHNDxrDPPG4bqbsLGWvrX8ZLKSdWGtx/I/zt0ff998G6vzQgkt6/XmC3W2Pvo4KM4RNmTuebqIh97yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCNzCa1G; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCNzCa1G"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9b1ffbb9f5so778922566b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 07:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776175418; x=1776780218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wAO2a8iejOd3UMUmzAscWYPPXFzcVg9pYpLVhKBtzBc=;
        b=FCNzCa1GvUqMYBjcL1/1RMrQ3YUDQrVQ3gYQW5lDIvS3p3WzIYjgmQG5c4bBSi8/5a
         YmuLNfT5/vvDjZpvhA2uLQq46Ry5zYKPnKtsXzXAEMwCC/u3xKay+W6OzQaIbvK7QwuG
         Ws8aT2stAs6UzfwZImKA79UC3rE8xZd/07pAO1fRJGCe0u5blzOFSlV/TF/mCy7170sJ
         ksvfZj8uQlZdcJ/CHyf6LYrbBAvv75Z37S18Zq1V8QZ+1WXPWCuiIq6G879QGp5YbIeJ
         AaDo9NIc5DErWi0TIs6EcQ2Ng/rv4zewrRLD8tllbNbZI1Yjw/iRAGOYQrldLVGMbb3O
         EHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175418; x=1776780218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAO2a8iejOd3UMUmzAscWYPPXFzcVg9pYpLVhKBtzBc=;
        b=iVMY8Nq26Az3Nm8m1I4b+ko/3jn/2+LNU24lcmljL3dBQoIDzIC4h3fHUtp027yQWj
         VJNtxncwaleVcAtYvv5pzvK5OMY+8yuZ5fyahtvzmIwelE/r7FCfTsraae+0Md3maIW/
         si7yUrKKOJpWwSoDXUuYK/VqMmv5vrpw7lh5wIMy4OrfkdgFluFlu0KkwxqiHBG2Jqmk
         mNE5b+Zt4YEL/wWae7KLAxoiS7Y27focR5fxEyQGk1CQ88TsipZDekhlV+7tboraNIFa
         OBHmEsuTyUbgEystUc+bHu889+aJkMnT/U2kKEAbyMTIypzW7CmfMhl7y6wJRJlAAqxH
         lyAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zXcDiPhA9iOyr67mCgybVGuh2+e0lG/OcN42DOrli7wxaPF2452h44zEZuZKQK5pVm8HYWDnM5ezhep3G7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSzQLr3KiZxGzJQjJMYbiK14QaCWbDDmuWmlbL/BZa51mSqp0S
	qYUhYr//9Q9j+X9QlsZsZ8Zki831VCDa2WTrxrGgYYqqjzYTOYfka93a
X-Gm-Gg: AeBDieuDkO/cexuLeghpeGn0LjdUn5uxmctHd9z0XK+vwyydhu39cc9B3Tjf9WhtcHK
	sDcWOHmAY+hd5nYTaSlRWWijMDe8Dv/f8Xzb2n07aklIKilJPphOrdBYi6z6pQum+x7eDA0VEs8
	aFb/5z3qYS/NgKoCpTrj58TMlPusFjlonox9hwYnXEDdO34SRWZakVOjTQr47Hl97h2xGsMtbuQ
	CEqX7LleD1oNUbaDtL7bqBWlY82K4JzsswUUlL7XkaMp/sriDQhL3jb8FY2ODehZfpaNtF68zqn
	08g82MJvj1eVaEaiotfyCjnazEDuuOSH926cXrBdm2GONi1QatxioRn6LK1mcKf46SOc5QEV7Jk
	Dfyi5jAzDhECAKNBprAP2teBqP4EO5+Yg8SQn8Ucbybbw7xCRU+a+sxUY3xR/1lYbfvPwk7+GlB
	w8uPFXNms67O+Rd0RtuMVPNda7+UzKoyTiAUL7HSSKZeq/uQsfRyXoG6/NKH9S3we+4qv99FdId
	iGAw1FPPXKvMqN0LOGfQ9kebdDorkME8MBFlWK0ajiNlLXs7Zn/TtKzvG8=
X-Received: by 2002:a17:907:1ca5:b0:b9c:b3b5:bbf0 with SMTP id a640c23a62f3a-b9d724995a8mr1009594866b.6.1776175417496;
        Tue, 14 Apr 2026 07:03:37 -0700 (PDT)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb (dslb-084-056-106-044.084.056.pools.vodafone-ip.de. [84.56.106.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dffcd7bsm384122866b.27.2026.04.14.07.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:03:36 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:03:32 +0200
From: Dmitry Dolgov <9erthalion6@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: WANG Rui <r@hev.cc>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, loongarch@lists.linux.dev, 
	Haiyong Sun <sunhaiyong@loongson.cn>
Subject: Re: [PATCH] perf build: Add clang and rust target flags for loongarch
Message-ID: <63jg2bzhv3udm6meehux5ssxcd5gfdksamuzhjw6cnxptztbph@wtwbe56az2vi>
References: <20260414080500.320095-1-r@hev.cc>
 <CANiq72=c2wniA2piByZNUVzSUA2YPhRPKBq7e_bBP-69Lo+wCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=c2wniA2piByZNUVzSUA2YPhRPKBq7e_bBP-69Lo+wCw@mail.gmail.com>

> On Tue, Apr 14, 2026 at 12:03:31PM +0200, Miguel Ojeda wrote:
> 
> FWIW, sounds good. I guess the commit that added the list should have
> had it to begin with? Cc Dmitrii.

Yep, it should have -- as far as I can tell perf supports loongarch in
all the other ways. Unfortunately I based my patch on
CLANG_TARGET_FLAGS, which turned out to be missing this arch as well.

Acked-by: Dmitrii Dolgov <9erthalion6@gmail.com>
