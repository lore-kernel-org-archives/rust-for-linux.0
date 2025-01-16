Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455BF1B0F34
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737016514; cv=none; b=S/AqnxvNc9Ou/+mlWdSceXiMcohxGZlewkjWPP3q4IQIZbjUHriW7a1jW+h5IQaR9n2cRreAzuKn+GZrzscS9SxskgGcY7cdX0TQ4JxNK/Jlwjns3FmB6D8Jq99qydByxaYqEtO4bFMGWWgBfZNIJlyouIAyl5CG6MjehuFrpCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737016514; c=relaxed/simple;
	bh=BEHt/qoUgP0gLAyY6ZSkVNTHhqhvMjNMtcc17PaS9LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7JnylOOejgu1zlmcb9w+CsgtU3WPn7scGVihxaRuQ10oEOWH7cZKzADVgnmEDNC0QFGggHjFEMz1qOd1J5jGTS4n9sAWQ14oT8GT/+9Eh+mJwhaHYfStIdgl/ZL8jh10mQaVJ2ol5zaVuzzsKA3s2lQ6DJoDgl3xKPfCI5Fd2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tk00FsKb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tk00FsKb"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2161eb95317so10292765ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 00:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737016512; x=1737621312; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=araQZmUzewXIImRJerovoi5L7rZCNzU8AMMo46KkPjQ=;
        b=Tk00FsKbHOKMKyPR5LoRqMRH0KaKX4RtoBwFqXaeFBM+0o25dP7t6cL4R9GZ912m9E
         ZOT4mSJjT5R04+VtgJSdYSZcIxX/8QRhusMyurJ08C9OPTVTY6VR11y/136HKg4ieHAx
         nbOlSX9RSIQOC3AnsQpq38hwJkzSBMPO2Aghr3BQKaoLf9Da8q57aM0amWRxEbwgLH9e
         fOs3vFdMhnuUgVYIV6ngAXz59n7CCC38qwqrFKVAYPP1jruTRNxlRRuGebxegP65JPt6
         UZRajGzh6lZms7sPC4xQmK2yZHLPXqN6sRZyT4piF20bQM10UzYekMYjlN+4HMkooU2D
         +a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737016512; x=1737621312;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=araQZmUzewXIImRJerovoi5L7rZCNzU8AMMo46KkPjQ=;
        b=C5O2sCNWLG8BkDLG4IeZ15Ol443uwZC4M39wQqL5Tbx/w+JLKJ8og5jA8QAUjvgZR7
         +bZYPXDAfQM52ikU1Y6xcgnYSsmQmr9S4smx8Gotnxu9dLoBUggCleSttFV/ybZ48qnn
         OiWMPjfQclJE4jWRinwfAMRTbPOyXAh4yazJgPjdM9EWHctM0jnKtEE9W2B6heqZo5PF
         PubnA8aPN853YcLgQRrAy4+CeJMH2T0XDab/zbpsIi7hJ+SplOh/dEtGnpncW/WCsFLU
         MCACfKC1tVFFTH77U8xcblT5+n2ee+veIEiNDYNrEF+8ENwVJqvISCymYuPT1OGm3ovV
         MkRw==
X-Forwarded-Encrypted: i=1; AJvYcCVIuIeMzuA90t08K/J+Z8OsVcz8fZ7Nz08XKQFWYgpG7GmiOrojm7nadfsDkpAhva4chydq4TDul1g0/hW9QA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx7ZusYu0SIJ9DSGlQdbxo+bFvVIjHlsA76fUKJO2Szu6T/HX6
	9MQj+/eCMpGq58euDYikZNZas3Uql8FMYmTFq2hjzDKAFIM/cZfKHhJR639AMD8=
X-Gm-Gg: ASbGncuv59DywHFVoDLxLTKbXAXKiSf2U4QbKaXEnQ5q+NwsaNEviJ8fiql6NfPDqzr
	4proC1TNA3pHiycw6yA/gBv2KDzhFb78OImK8sVSHgwdBnW6ffA6yWS2L37AYPQ/TWRIanK2szR
	xrXLnDkBZ8pJnZff6FuOv7hQkTkgnpWRBLTwz9426b8Nj8Ple8NK9h16MPKFgWOOAiqopTXTsmX
	byxTaPITfLIplpos6XHjHmZEXz7eFU0aECPXPrC6KfRBYTMecFq3Ou0pKM=
X-Google-Smtp-Source: AGHT+IEaAjxdq5z7W1H5iDF8noymQoKYufiEpkj+FA6tf+rVivRbDkfFNBI/QvaisD4TjiagYZReww==
X-Received: by 2002:a05:6a00:39a3:b0:727:3ccc:25b0 with SMTP id d2e1a72fcca58-72d21fde276mr44326094b3a.16.1737016512441;
        Thu, 16 Jan 2025 00:35:12 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549413sm10713687b3a.12.2025.01.16.00.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 00:35:11 -0800 (PST)
Date: Thu, 16 Jan 2025 14:05:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Rob Herring <robh@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: device: Replace CString with CStr in
 property_present()
Message-ID: <20250116083509.4crngvyijolszqcb@vireshk-i7>
References: <e97dcbe0418cc1053fb4bcfac65cc02a0afcdf78.1737005078.git.viresh.kumar@linaro.org>
 <CAH5fLgjsuf+smPg5734mGZnZRFS9yDrFQnREhWwSVqoxP1AuBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgjsuf+smPg5734mGZnZRFS9yDrFQnREhWwSVqoxP1AuBg@mail.gmail.com>

On 16-01-25, 09:25, Alice Ryhl wrote:
> On Thu, Jan 16, 2025 at 6:26 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > The property_present() method expects a &CString currently and will work
> > only with heap allocated C strings.
> >
> > In order to make it work with compile-time string constants too, change
> > the argument type to &CStr.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> One nit below, but either way:
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> > -    pub fn property_present(&self, name: &CString) -> bool {
> > -        // SAFETY: By the invariant of `CString`, `name` is null-terminated.
> > +    pub fn property_present(&self, name: &CStr) -> bool {
> > +        // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
> >          unsafe { bindings::device_property_present(self.as_raw().cast_const(), name.as_ptr() as *const _) }
> 
> If you use `name.as_char_ptr()` then you don't need the cast.

Fixed as a separate commit. Thanks.

-- 
viresh
