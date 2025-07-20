Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162D0A930
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 16:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753030375; cv=none; b=Cy0vDWFoaYQi/yH91XVDTcuQTO+BtM6YBp9ZePtu28WwhTUZuBqU9eeIjgqzyLIag/y6yiQOtwDT8lLTkYBIwhbWDOAAKUYntloIRdt/SdBnJxfsgM4C63dEtrkt/mn3p1SEo8PF6f4VLGieB0jKZNKeOd5Q/voNzxZW5x4u45Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753030375; c=relaxed/simple;
	bh=4PwpNKH8Q2DpW937AT1LxyRZt2KyM12kPBSFFyk4+9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUv8DGsTu0VNb+BFBhkP5Gyw5pM28vXlFyVyhe9PrG8J1EMUb5vfXLA0OAATYUzQocVv4Xu6/CwDp7NlTxleKSvLg2/e1ckvUJKV4tTojCszzH6NI2pnMGsUSqOXvBQa2jqCiaoGYGtZ9npIGbZUxCq41hA3pdGBPPpqBSNNrEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=TaLaf4Z1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="TaLaf4Z1"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235f9ea8d08so29182765ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 09:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1753030373; x=1753635173; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5g9J6n730EaRvQ/cS6fHvI1K6/7KH11pjfrToDZxHXI=;
        b=TaLaf4Z1Yyy3Nz179AmU/WHhYuMVea/Xayf2GVu/tV9O500k0s3ZYa3WtFO+T8yVDO
         9R7FU5U2G6exsKfjazjdeM6tT6FITlrjO1XgPtTRo2aCH65rOhPIZvXd+mdkEwbKKVJk
         vOktQekDvi6ohROhn5lP/e33j7ZxG8WYCLUx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753030373; x=1753635173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5g9J6n730EaRvQ/cS6fHvI1K6/7KH11pjfrToDZxHXI=;
        b=iuqYUI1vPKAKzI4xB6z4uwQXMVmXclXQDqjtItu/IXFco2mBOLzjM91D2OfxQB3tiN
         8cqmoPjm+fewnz0oDtg6YiNVh4TRKrLSJP6Ht/BDCSwUH7EIeFdSzAuoyMtVMzXGLtL+
         de1cAnqZwtUQKgRtLr3Pd/qvJ/U/FwOGiJZOb+YHw9+W+RP3G6bvwSNHDISledqDQ5Of
         TJFZPylO72nhmokO8TOd5mbcIALNuej5UemJ5n/odasQ2c+XhO1cKWSimmBPAmSAxWe2
         Q1jrlBxnKXXPRcYM3YM47d06efi5avMgZPzP0QW6ROrkPiWH7zCaU0NWLSS/3Lpdcyli
         Vqzg==
X-Forwarded-Encrypted: i=1; AJvYcCX8tdy6HxX8p6izgnrFRiiryuIosswtrgc17fxNTAvo4VuiLrE1Rn6GwzOKfuuE14aPQwxemKSvw0/oVYPKAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbsrpH3rMaTTuqsyw8hjPULiG3I8bTAZoTocGdiVc7xrA+WE1z
	+PPA/m4V9rkE0gAZ3rMcmFIKiALyYxCBC0NaDp7XhE0dTmzt38v6Lvdgeh5bvfQF/WU=
X-Gm-Gg: ASbGncvy3TntAe8ZdPJw8vKDsc8DB6g4CZ/QeWydZ1uv9hx7CaFMiFSjqZ7yUqdD5JJ
	IqOjf5benB8vqnHQsypqd+9pm7O6yYiMMcqY1q0jSSVYKszCQ0oDhtO7Msw7Z3Q9Nw6zj99PojY
	3vOtX5HldwXuTsCQXPa3oVHhN/I79oojc1ybhWLDoDMQU6Mp120P4G1Wi4Z2SjyL4PKpsKWFQI2
	+OFi8IU+KF5tdqyPDBAsRCN7EsLY/A+WO9uO+fFYz/qIhvqKbKYwG9r/cxkD9SzVtjpYfr1KDak
	eHzhfJswftMnwLE3Mye50g4kB8kwmeeRqRtnygNLqqJNCoV84SQFyUAmHrVItodWbCyqL0EV++L
	s8LZGGvO7OquOdFv/w86Z+w7YoOoYo4uMKF7CTW/TK2yr2p8mkjEi
X-Google-Smtp-Source: AGHT+IGu4j0mRiBMJYNMw/BPoiEqpd7qeKKASroav1OqR863hNB3giu6x7o/eqfqqXM0dWh+qfPxbA==
X-Received: by 2002:a17:902:f745:b0:22e:421b:49b1 with SMTP id d9443c01a7336-23e24f9477dmr272435395ad.48.1753030373376;
        Sun, 20 Jul 2025 09:52:53 -0700 (PDT)
Received: from sidongui-MacBookPro.local ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d1ce0sm43778065ad.149.2025.07.20.09.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 09:52:52 -0700 (PDT)
Date: Mon, 21 Jul 2025 01:52:46 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 0/4] rust: miscdevice: abstraction for uring-cmd
Message-ID: <aH0e3oyKvvOEkFCt@sidongui-MacBookPro.local>
References: <20250719143358.22363-1-sidong.yang@furiosa.ai>
 <CANiq72nWFW-5DFJA31ugMY7v0nRNk6Uyb1KuyJfp0RtxJh3ynQ@mail.gmail.com>
 <aH0UOiu4M3RjrPaO@sidongui-MacBookPro.local>
 <CANiq72kRQ5OF9oUvfbnj+cbXk+tPTmYpVxYofTuCY1a2bcJr3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kRQ5OF9oUvfbnj+cbXk+tPTmYpVxYofTuCY1a2bcJr3w@mail.gmail.com>

On Sun, Jul 20, 2025 at 06:41:06PM +0200, Miguel Ojeda wrote:
> On Sun, Jul 20, 2025 at 6:07 PM Sidong Yang <sidong.yang@furiosa.ai> wrote:
> >
> > Although some existing kernel modules already use uring_cmd, they aren’t
> > implemented in Rust. Currently, no Rust code leverages this abstraction,
> > but it will enable anyone who wants to write kernel drivers in Rust using
> > uring_cmd.
> 
> Do you have a concrete user in mind?

Sadly, there isn’t a concrete user yet. I understand that an abstraction by itself
won’t be merged without a real in-tree user.
I’ll identify a suitable kernel module to port to Rust and follow up once I have one.

Thanks,
Sidong

> 
> i.e. I am asking because the kernel, in general, requires a user (in
> mainline) for code to be merged. So maintainers normally don't merge
> code unless it is clear who will use a feature upstream -- please see
> the last bullet of:
> 
>     https://rust-for-linux.com/contributing#submitting-new-abstractions-and-modules
> 
> Thanks!
> 
> Cheers,
> Miguel
