Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0E418A6DF
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 12:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001179; cv=none; b=jbPpkVdndjMx7i+k7dBTXxV5CGXeW8/BrUZJJ/Yi3hlg+bgPX1SVZOnShKwa3pE5Q7R2ev6Q081+rhdk1oVp5+921UKzTnJu7EdNWHlImS5jxr8Lu+uaiUoK2ViCj49U7wleQiP68bXuVr8WLPqHleeudzbOWY01O46PtrKLOU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001179; c=relaxed/simple;
	bh=DO2hOpqceDHGa1aberEVvfFqSZmCuI5QPRwo4mV4UKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVkGUnFVQwBbP/gZnzJ9RB+HOCMk3f/1EUvNn3W5tvJWCSy8nZJSWrFlpP9NiOlAQeMSSO/Vztq85bkKiGH3Zhqvv4Hb117bqNB780TARwDQyRQCcm0uU3PJ2oLMXlm+Up4JtHcq1gnuGuCeQVxnoWNO1YO2cHJUvoXwx24i5U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=LEUrQJQu; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="LEUrQJQu"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-321c3eeea7bso402032a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 05:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1755001177; x=1755605977; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0WtrPdFclzyky29znvflcoUgELQSFsAMKkPJYvWhod4=;
        b=LEUrQJQuHSL7OJHtUJq7cUS5FdyvOoaZS2JFVGpF7gOU/GzRLwpFY9smHa2m3JeXoy
         dSxRcYYlHFzTjni5ZYjRyYkJQW/3/Xvu1aaAaK+YdOQh+hsJFP91OB+ptSgU+P2eG6p6
         ijVxeblf42aX6SM8gFZbO2IzcKWHWo3lslN5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755001177; x=1755605977;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0WtrPdFclzyky29znvflcoUgELQSFsAMKkPJYvWhod4=;
        b=E2yWXCtwji/k81ieb7mwr6s4wgSwEXfhcLAqIcElgL85dUpCus0d1hpZ0wvTVQ2FnN
         nmYMEL3UodcJs2QkYneok9FUJ0L/pLCrQJUgFYyWvXS+4sa4pOYAZsUvmQl8c2/LHy3+
         iJpCpHE0bO4sFadkTpxkqDAa4nFSSb4mAjQqMS0231ApGk3bacgCwVxV5xW6i39ur8DZ
         CQueciKPOQckdxPV+i6al/0Zf1qwZ9G19ZWdwFIuwpvPD5cNdq1VovssgDM6pfTn5wEj
         Ag5usbuth53zO2eytfy+717IyUYjYCvPiEQ+FEGuA/FhuKaMeLgloYU4Z9KpwExF7FW9
         coUg==
X-Forwarded-Encrypted: i=1; AJvYcCUgOPS5sRDJXuyzWLhF1y+t9S404112uDK4zovbxbwG8HtlJZNXtHNjD53lSobtO/SdbIVhowndhREKWsbZsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Y7KFDBsq3YgvTb+KhIO/pcstpejcvU7YoYNHA3QddyAKtxXC
	x1njedD+lmYFgLDjuy0p4gXQWum2OKFW9JoRYN9bpwxzNBh095qy1LZlieUHWJWFqdE=
X-Gm-Gg: ASbGncvCfGzwx4R8KKTcisFXw7XYb02BEljnI95z4s68JGpTBs1S+VMW43KYjeZH6CS
	k5qn9R3AkhSpDHEUh9M34KqEEPqlePGWNfBMUv5IL5ropO667eMtEDqmmIomTolSGZjalj46ld5
	jv9j8I0wVwABlapxW/ofdIjrmzf5MEBlBJkVUVMmHiZklXBqhyaenPUgp8YWA9Whfe6cCs64xLK
	+pG2sI0LmYaBVrKklo1jvfDGExgfhToOxNuFK1FWWXSEtoqJDec0KWRXW2ptsaOrKuPkHi0WO7+
	JWQ4QMa0LBDajF51AWJZzNFhS6xHJ8+TSupjJPQ0ggcBKzBVlw/DuzIMdKRcumcHkp9Xmwe01YZ
	nYweAFUXsMITsjEjZAWMkbDyl+dIx8MejBgj75Nm5CSzKBwNJDfbVIzX7
X-Google-Smtp-Source: AGHT+IGIpo0Z7v2fqEAJrnogogtfT2bJ1aJfSHElMkCVD8SyNbyvOMbAMybK7ab5ReG2rDBpbQNOJg==
X-Received: by 2002:a17:90b:584f:b0:312:ffdc:42b2 with SMTP id 98e67ed59e1d1-32183c43e3cmr20797155a91.23.1755001177078;
        Tue, 12 Aug 2025 05:19:37 -0700 (PDT)
Received: from sidongui-MacBookPro.local ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b435a19a01asm7699444a12.17.2025.08.12.05.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:19:36 -0700 (PDT)
Date: Tue, 12 Aug 2025 21:19:30 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Benno Lossin <lossin@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/4] rust: io_uring: introduce rust abstraction
 for io-uring cmd
Message-ID: <aJsxUpWXu6phEMLR@sidongui-MacBookPro.local>
References: <aJdEbFI2FqSCBt9L@sidongui-MacBookPro.local>
 <DBY6DMQYZ2CL.2P0LZO2HF13MJ@kernel.org>
 <aJijj4kiMV9yxOrM@sidongui-MacBookPro.local>
 <81C84BD8-D99C-4103-A280-CFC71DF58E3B@collabora.com>
 <aJiwrcq9nz0mUqKh@sidongui-MacBookPro.local>
 <DBZ0O49ME4BF.2JFHBZQVPJ4TK@kernel.org>
 <aJnjYPAqA6vtn9YH@sidongui-MacBookPro.local>
 <8416C381-A654-41D4-A731-323CEDE58BB1@collabora.com>
 <aJoDTDwkoj50eKBX@sidongui-MacBookPro.local>
 <DC0B7TRVRFMY.29LDRJOU3WJY2@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DC0B7TRVRFMY.29LDRJOU3WJY2@kernel.org>

On Tue, Aug 12, 2025 at 10:34:56AM +0200, Benno Lossin wrote:
> On Mon Aug 11, 2025 at 4:50 PM CEST, Sidong Yang wrote:
> > On Mon, Aug 11, 2025 at 09:44:22AM -0300, Daniel Almeida wrote:
> >> > There is `uring_cmd` callback in `file_operation` at c side. `Pin<&mut IoUringCmd>`
> >> > would be create in the callback function. But the callback function could be
> >> > called repeatedly with same `io_uring_cmd` instance as far as I know.
> >> > 
> >> > But in c side, there is initialization step `io_uring_cmd_prep()`.
> >> > How about fill zero pdu in `io_uring_cmd_prep()`? And we could assign a byte
> >> > as flag in pdu for checking initialized also we should provide 31 bytes except
> >> > a byte for the flag.
> >> > 
> >> 
> >> That was a follow-up question of mine. Can´t we enforce zero-initialization
> >> in C to get rid of this MaybeUninit? Uninitialized data is just bad in general.
> >> 
> >> Hopefully this can be done as you've described above, but I don't want to over
> >> extend my opinion on something I know nothing about.
> >
> > I need to add a commit that initialize pdu in prep step in next version. 
> > I'd like to get a comment from io_uring maintainer Jens. Thanks.
> >
> > If we could initialize (filling zero) in prep step, How about casting issue?
> > Driver still needs to cast array to its private struct in unsafe?
> 
> We still would have the casting issue.
> 
> Can't we do the following:
> 
> * Add a new associated type to `MiscDevice` called `IoUringPdu` that
>   has to implement `Default` and have a size of at most 32 bytes.
> * make `IoUringCmd` generic
> * make `MiscDevice::uring_cmd` take `Pin<&mut IoUringCmd<Self::IoUringPdu>>`
> * initialize the private data to be `IoUringPdu::default()` when we
>   create the `IoUringCmd` object.

`uring_cmd` could be called multiple times. So we can't initialize
in that time. I don't understand that how can we cast [u8; 32] to
`IoUringPdu` safely. It seems that casting can't help to use unsafe.
I think best way is that just return zerod `&mut [u8; 32]` and
each driver implements safe serde logic for its private data. 

> * provide a `fn pdu(&mut self) -> &mut Pdu` on `IoUringPdu<Pdu>`.
> 
> Any thoughts? If we don't want to add a new associated type to
> `MiscDevice` (because not everyone has to declare the `IoUringCmd`
> data), I have a small trait dance that we can do to avoid that:
> 
>     pub trait IoUringMiscDevice: MiscDevice {
>         type IoUringPdu: Default; // missing the 32 byte constraint
>     }
> 
> and then in MiscDevice we still add this function:
> 
>         fn uring_cmd(
>             _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
>             _io_uring_cmd: Pin<&mut IoUringCmd<Self::IoUringPdu>>,
>             _issue_flags: u32,
>         ) -> Result<i32>
>         where
>             Self: IoUringMiscDevice,
>         {
>             build_error!(VTABLE_DEFAULT_ERROR)
>         }
> 
> It can only be called when the user also implements `IoUringMiscDevice`.
> 
> ---
> Cheers,
> Benno
