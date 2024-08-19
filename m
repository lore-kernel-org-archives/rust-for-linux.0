Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A421D6187
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 19:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724096337; cv=none; b=PV9NGKZBsMf/mH6zcogVByTMpMtDUBTH923LMpTsEi0/kDaMhS1vteKyRQ8cXvRtWreWOxu7SQmVxeDDm08ednQWS2NG6YGb4tSq1isD67pzTfS1l9HVl6irySQm4rfNuvJBJ/eM/t71n3xFJuDezThJxKHEpOj7izt3qeCq0Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724096337; c=relaxed/simple;
	bh=F7wkcHJPXIPuDfH/klr4thKavbEnJmwxdbEiZYRhu1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKJqq1MmwYfwIn7L9Q7w28yXKfEtpjxWE3CLNCeEA8wRYJGZ+iDBYSpiWHwJpqIOy/n4LNv+LhztCh9wY6meyON3doZj+iLxNJEQy9s6XSms5ZDdqz3Q2mlwZFpZ/h7lfO0DoqUJzA9P12sb8BZvZoRcQNKTUUpB6IR2nE30Heo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jqy44aHK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jqy44aHK"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-201fba05363so29186965ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 12:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724096335; x=1724701135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YeS++fCKemkXhDJMjat3ElWefP5AW5Wy1oKzA28CFNw=;
        b=Jqy44aHKfCucjW6dSdgDbzaqx2bnXrzPEbfetshLmrEaw/8xyi0TxC5h7b8LHg8N/t
         kouRMUJCIINWGrPLvd4Sca5u2B86Qpu1OApbkfFi9jPE4QPO7YgUqf48/pp/avbE7M1F
         lXJKrVlyu8na4SVtkpsonw//DihGztrsDcWO8orF6NQltKwhUgETN4S6mzahBatvl4yK
         UMKc7DJodi8BjCyDHN1sSBeQM4hD1rgsoVbAMCZPZst7QDHwCBS9MNExih6UbG4Uzp3E
         K7W7VpffRMkE0tER85oamhTkLH2AFLpW0FSWfqnMxWZ7uyCW3dVhQkwozOJ+vYV/wb0k
         fn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724096335; x=1724701135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeS++fCKemkXhDJMjat3ElWefP5AW5Wy1oKzA28CFNw=;
        b=pegbhfPs+eUSjVmmEl5eye5x2e16QQKTQzZae96VBoMzThJyKa6elLx73kEd6QWJYV
         6u6cF9lm/ME3QD1mfHQbt/JPbRRTsff/p2CnCwj++Z5chWXmuBzxmW+SX0fmHdkhMLxl
         LRz9HJVtwDPxN5LoD7D6FA5uaMLzJxp67HKUpz9epsQRrL+LfYr3ywtKKGnfQjEpDrlJ
         q+9mVeOaK6XpiQ2Oyftamyu5CsPs5nrj1ASRS0nU1d+GkvNzi3SFUrn768IR18WFWaO1
         oO0N+RbjIQpVLQZKrjsTYXqL32pLtyPgzv18mWpQGfpi3NF979f9k5WOYSMhwVzFiySo
         69/g==
X-Forwarded-Encrypted: i=1; AJvYcCW6LsWyzRw4nYdVr3enbCrJu+bWVxOtNf6by8ouMjAb1H5yt/FtDAioR5LuiFFo0MPIJyon8hGYaOb/TOD9YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXXhj8BU4VSZSM8KublqcMbqhXjW08wOUaCv0D6wG4Ro6tefEN
	UptlbkxvicneC2LiUTUdhP5woIEx4ngQ/ICZZEjEBE85ul2pjRri/DKm+IJc/Q==
X-Google-Smtp-Source: AGHT+IG8oRBHqBpvRvU+j9ijDv76wPfUzxrx1g+I09GD1WWcWllKaTLicpQtA41S0/MWaq3kkTtGZA==
X-Received: by 2002:a17:903:188:b0:202:4d05:a24a with SMTP id d9443c01a7336-2024d05a587mr34136775ad.16.1724096334977;
        Mon, 19 Aug 2024 12:38:54 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03197b6sm65427305ad.69.2024.08.19.12.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:38:54 -0700 (PDT)
Date: Mon, 19 Aug 2024 19:38:51 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
Message-ID: <20240819193851.GA4809@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com>
 <2024081600-grub-deskwork-4bae@gregkh>
 <CABCJKuedc3aCO2Or+_YBSzK_zp9zB8nFwjr-tK95EBM3La1AmA@mail.gmail.com>
 <2024081705-overarch-deceptive-6689@gregkh>
 <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me>

Hi Benno,

On Sat, Aug 17, 2024 at 01:19:55PM +0000, Benno Lossin wrote:
> 
> For this use-case (the one in the patch), I don't really know if we want
> to copy the approach from C. Do we even support exporting kABI from
> Rust? If yes, then we I would recommend we tag it in the source code
> instead of using a union. Here the example from the patch adapted:
> 
>     #[repr(C)] // needed for layout stability
>     pub struct Struct1 {
>         a: u64,
>         #[kabi_reserved(u64)] // this marker is new
>         _reserved: u64,
>     }
> 
> And then to use the reserved field, you would do this:
>     
>     #[repr(C)]
>     pub struct Struct1 {
>         a: u64,
>         #[kabi_reserved(u64)]
>         b: Struct2,
>     }
> 
>     #[repr(C)]
>     pub struct Struct2 {
>         b: i32,
>         v: i32,
>     }
> 
> The attribute would check that the size of the two types match and
> gendwarfksyms would use the type given in "()" instead of the actual
> type.

This definitely looks cleaner than unions in Rust, but how would this
scheme be visible in DWARF? You might also need to expand the annotation
to allow replacing one reserved field with multiple smaller ones without
using structs.

Sami
