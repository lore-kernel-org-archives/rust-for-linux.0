Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DD0142915
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Jun 2024 20:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718052425; cv=none; b=pspELTpB2k6j2L3YovXC1qaCociD+QCfBrz1b3+UMbu1y0OQ/p4/NVYddPXSTFHR5RePKENdpYU8m8JfOcELTHW1SBD2zffMF2NoOh/f3LqqUhGDDr9+FouTTwbCfwqH8S/XZTj5n4lRgU1wBazwppClNJkOIJhKyABvUGGn/DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718052425; c=relaxed/simple;
	bh=hmr/nmEFUE7SPqQJeyyfPQSSwzYNqDpKNtuMcCl1Yo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eB6IUzDQ3OqxzSyqUSKHpAVMEkUIJ/2kUXBtVTEwnz61xSIHO9W2qWGL/MfTG/5tl2aMFTKlvlPNY8E2j6KCUkp4g8czXFlawK7Y4K1ugfQ5XF6omPKHODJGFVIGiIIW5D/hTq0fPY5aGdFYKp91FD4+p1My8LmwBoMegnQNB8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fil56E3P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fil56E3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718052423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxiNEvx2Od2nkRp3Ia5+BRC8R4WpmCSdFEiRdP/JyGs=;
	b=fil56E3P3ugYF4HzsaQcfhPFjc8Dbv1qdplEfPXig9Wz0yrgtytZ6UZD5NylBqyoH1KyNI
	46ivMKa6vr6+Pj0/H7YNRb6KcHqIPIW8d1PhJkg2LykNlha7MON3RXlcw/ETKjaYQDUg8u
	ewkKZyHuTGUsHI846aRwAK0A2TtkfTg=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-9Ow-u1iaOmOlug1LCFEy1A-1; Mon, 10 Jun 2024 16:46:59 -0400
X-MC-Unique: 9Ow-u1iaOmOlug1LCFEy1A-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2ebe82e96e4so2779781fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Jun 2024 13:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718052418; x=1718657218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LxiNEvx2Od2nkRp3Ia5+BRC8R4WpmCSdFEiRdP/JyGs=;
        b=DJhRPtgwyqk+qqdN3fpg+lGNkrf/P1II5XQ9k+V9+4eMEv8oY+nxB4bBUk93zw1d49
         Gwe9/HzfWDEUS8wIJ2V1Ezwb0VnQvNpal1BdxekKR56IRciKru1Tp8RSfvX+CuT7hztq
         w8OfIyxyV8J0rnDy47+7yrpljchwgf76+GiIz5QQvX2ce92tqz0VwoGf+tGWraywwGdz
         2441nXUtVUEtb0OOxKTZohwj6ZPl/585AntPyjmuFgFfhj0HSNLnfwbfAMTxP6CCP3Cs
         UkZD98jdCOhIa0I7h3Llu2L8S0TRDCuGMSKCVn57AKzNiHnMURzhfRVQDdyw+whmivn7
         FmUA==
X-Forwarded-Encrypted: i=1; AJvYcCUWoOOUA7UILjqEFbwToL6z8GT0Rt7PTLROSk2d3/apjuv8ZSDZ48Lb1hAiiwE3z60uSb8MthITXrdGnNDT1/dUNbKd/2J7kM5WxMjQrfQ=
X-Gm-Message-State: AOJu0YzyXBlm4CvJL3CiJVTC3EoiLlQNwA7nFRrN7joY0bTh8mWIZfEo
	FOJ4+1nszpjJnP95ciLnsMyRslj5ZrO7y2YyngQpGEhBPfRl3ZM1JVi7eIrT2jpRz8zoO1eOMMl
	5lJOexVzBu6KkndN6EXVzrLEzWch9t/n0BeB8u5KzP60xyQxpEGZrwFYChvtKUh7R
X-Received: by 2002:a2e:a7c8:0:b0:2eb:e505:ebd5 with SMTP id 38308e7fff4ca-2ebe505ee5emr34276461fa.3.1718052418280;
        Mon, 10 Jun 2024 13:46:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLAjsaXc5BdwEtJmjiyy6QV5OH60ABPwmHSupwxu8PY7u/HPHzdfQDvJCtikV8xZ3ymgDwNw==
X-Received: by 2002:a2e:a7c8:0:b0:2eb:e505:ebd5 with SMTP id 38308e7fff4ca-2ebe505ee5emr34276171fa.3.1718052417814;
        Mon, 10 Jun 2024 13:46:57 -0700 (PDT)
Received: from [192.168.1.146] (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ebdcbff7fasm10900121fa.78.2024.06.10.13.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 13:46:57 -0700 (PDT)
Message-ID: <882a4ba5-b0ef-4c21-8167-e2949424912c@redhat.com>
Date: Mon, 10 Jun 2024 23:46:55 +0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] rust: add abstraction for `struct page`
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas
 <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Trevor Gross <tmgross@umich.edu>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Danilo Krummrich <dakr@redhat.com>
References: <20240528-alice-mm-v7-0-78222c31b8f4@google.com>
 <20240528-alice-mm-v7-4-78222c31b8f4@google.com>
From: Abdiel Janulgue <abdiel@redhat.com>
In-Reply-To: <20240528-alice-mm-v7-4-78222c31b8f4@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/05/2024 17:58, Alice Ryhl wrote:
> Adds a new struct called `Page` that wraps a pointer to `struct page`.
> This struct is assumed to hold ownership over the page, so that Rust
> code can allocate and manage pages directly.
> 
> +
> +impl Drop for Page {
> +    fn drop(&mut self) {
> +        // SAFETY: By the type invariants, we have ownership of the page and can free it.
> +        unsafe { bindings::__free_pages(self.page.as_ptr(), 0) };
> +    }
> +}
> 

What about cases where the struct page pointer is not owned or allocated 
by this wrapper? For example, pages returned vmalloc_to_page()?
Any thoughts about exposing a provision to avoid freeing those pages 
during Drop?

We've been experimenting in adapting this Page wrapper in advance for 
page management within the Nova DRM driver.

/Abdiel

