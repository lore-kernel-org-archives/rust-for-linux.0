Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B451494AB
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jan 2025 05:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737349541; cv=none; b=Qw5ec0bvHb1qN8D4MnQ53gxuENHWa0QI5qG2DKwsNp7TyBwBprk47mwI1Dzdjyjv7S8egRXvpcj6xKVqXFJoylBd51s8n+ENS60yA8SPoFYWxDnS8l+CMSTPHzs+eHSPbtuHvuo9uogycoWS5bj9X3yvQVeHp1VzJyaW0Egsr3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737349541; c=relaxed/simple;
	bh=hvJOZSgXKCHW4rPSZXNIMZTM12gyT78paA4umVTVfDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGSJqElxuMEWZKuJ5MvBo9VvO3DiitrDujrOtT1OjnNPiWP3t1+fhTNzlTiuZPhlez8lpzdVcDyp3WSXfjWHRjv+EXmVircfhHbJfuMcRknonwg/XvNjMCofkG9K15UJ2N0lm3ezT1EQc3CHopdckQA91t5BR227CT2m/GmukPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ItBYDJDe; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ItBYDJDe"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2164b662090so73324365ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Jan 2025 21:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737349539; x=1737954339; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O4dTEqvMD7/IOT+dz1g46SsuOvFVWMgG1k/nh9LtW+4=;
        b=ItBYDJDe0AHV3cYoW3s3E97zqm0hPtULRulP+0yu/9zakGLiu83Y75QjKVxAaKUkI3
         wrPtDawr8F0ixqitBdgWTCh3OeRhWdVvfWA87gi32vMybfEGIVQNiaegUs+eL53pqU8a
         sWSQhwKUZ7Wqh4ErCgZQ43q8ZM0mB+zr3oGjUBloISazmNMwX1XYD8Vgf4ti9XUy2B7D
         3GQvyss1UB4OlNYTKMQMCXW2pdsFBRCFiVjngQTqy7N5Fak5m7excbr5i0gBqq2D+VfV
         d5qDObpswXnIv/1hxgYSQD0vj1xeqxYFuRLXCxsdZWQVyuy3xufvLTDfiCp3D0WXHQ6j
         Yl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737349539; x=1737954339;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O4dTEqvMD7/IOT+dz1g46SsuOvFVWMgG1k/nh9LtW+4=;
        b=ZItvR6KWR4jv6VhFCtIFtc5mibamjVMZMdQi8c8z5tz+Ar0hamZHapWwBVX37cYlZM
         bOlDkk3M/BD0nX0DuCR7wr6EY+TmQ5smOpLM7Tk8r346EqXIWvXE+dgFM4KQO0NtoxXw
         sEgO/dorIMj0gGLIhuxSG5eO8QmYZ8AHzzCVhGYHG2QP61Eq5T6L3Ck1EYYMNLFjbsw4
         pSFJH0VPizFKws3wvEapts3P3qo46UGbTieXKQi8KN9KKv8z5ES7j8ejiT/yGry63sDk
         D/XbLE9U4rcbae+9rzsdP1H5tCgHBOBwu/Y2XWeKb2sg4mYhTbUeBFsQ1xOvwM/jQ8TJ
         UelQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBaMAkGgsUJfMQs/nPBNpb/miUGKXBummQr3nvTm5MlRfbskRmZscSOUvg8YNwL4J/uaOFTBz1ReukjPM18A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjOia1hV+dsIgGOACRMtgPIPHwoqBezK+bhz7aatxQ3ivFPrfI
	cmEc56MZqj8Cc5eEP/0gjMFJCjv0QkClwXu4O5jTvyoyXMs0GbnpKXVPtOEK7k8=
X-Gm-Gg: ASbGncu1eIVBVhelrMZf0/ZIP44i+9brsjEXMgNxQtH96u/HtuUFKMisM+KHl2h6/MX
	3J2UVY75RbNJbEcjPV8jFwFjY8jaXsiNS+wlofnwPJG7Zl4suJIJb7tsxrHXc4ybw+/7Ej7eac/
	Y0IRBaKd4G0QtYzGyXGoCvfy89a1DcycrC8QonpaBs57fL3ceIUSlC2vTEaFpAnfvRAsEnQih72
	oFSxxvJa3PAyCBkkLZxmqJPLQPsbJj9RwZR0KgYZClXokOtMT1nO+D9htC/Sr2CHdEl0Vg1mWUw
	i0okaS8=
X-Google-Smtp-Source: AGHT+IHhYcSxNmfcm2qLLGHzgQsr3FstaQxDzWUHEPTk6xtZpqCZevRNtP+Y/8aQ4VLUd1yqs42zpQ==
X-Received: by 2002:a05:6a21:32a3:b0:1e1:ac71:2b6a with SMTP id adf61e73a8af0-1eb21568540mr15939984637.28.1737349538896;
        Sun, 19 Jan 2025 21:05:38 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bbd0274besm6015829a12.0.2025.01.19.21.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 21:05:38 -0800 (PST)
Date: Mon, 20 Jan 2025 10:35:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Rob Herring <robh@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: device: Replace CString with CStr in
 property_present()
Message-ID: <20250120050536.sr4dgqz6b6qeov5k@vireshk-i7>
References: <e97dcbe0418cc1053fb4bcfac65cc02a0afcdf78.1737005078.git.viresh.kumar@linaro.org>
 <CAH5fLgjsuf+smPg5734mGZnZRFS9yDrFQnREhWwSVqoxP1AuBg@mail.gmail.com>
 <20250118004443.51cc6302.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250118004443.51cc6302.gary@garyguo.net>

On 18-01-25, 00:44, Gary Guo wrote:
> On Thu, 16 Jan 2025 09:25:17 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Thu, Jan 16, 2025 at 6:26 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > The property_present() method expects a &CString currently and will work
> > > only with heap allocated C strings.
> > >
> > > In order to make it work with compile-time string constants too, change
> > > the argument type to &CStr.
> > >
> > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>  
> > 
> > One nit below, but either way:
> > 
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > 
> > > -    pub fn property_present(&self, name: &CString) -> bool {
> > > -        // SAFETY: By the invariant of `CString`, `name` is null-terminated.
> > > +    pub fn property_present(&self, name: &CStr) -> bool {
> > > +        // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
> > >          unsafe { bindings::device_property_present(self.as_raw().cast_const(), name.as_ptr() as *const _) }  
> > 
> > If you use `name.as_char_ptr()` then you don't need the cast.
> 
> Isn't the cast not needed anyway with `as_ptr()`?

Yes that works too..

-- 
viresh
