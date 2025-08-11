Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1D220013A
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 14:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754923860; cv=none; b=UKqk6PQLrW2k1wRVA43tVHh+sJX50M4phEWW61f00uNGhsd3FH3U/SId8n5JhM+qZMUdUQYwjZmFvHgAl52YQGU0KHUu0IJ78nJFguO6vBh34KF3UtDPs9SuQSy+q+YlpiQgoRHC+r6R8xBou0uWbV4Fe2oLoZN7nBf4d0K9MhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754923860; c=relaxed/simple;
	bh=UrfR5n7IhPYKBi/Lqcz5yk1uTlktmzqQ02/Ydq81H3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMukB2wOe5r1RKcA31LznmxDCFnLVk/KKWzk7NGrQwAMbLKCKweGg12JMKX1a/rpmhVXldwAd67rXBFiETIxtFr7IfG/jIjpUwECQMH8pXXHHQNBwg8Qaw/+sQgUcVH5FjXEOm8YwtTMcSlXQFR1YXuZ3LEDvd8lDWEKdFXjh58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=JpuPeoch; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="JpuPeoch"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b46ec4d5d0aso589599a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 07:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1754923859; x=1755528659; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TqaIrXcHxWrL1H6SRe7KL4MjQpJTbyEPe6hM6UsacwI=;
        b=JpuPeoch2+TxE9As6aoaCEwEBYYUHJdoTLnnX/AkXfYUhYiQaq/SqT9vrjSswyxVpv
         alenS49pEfo88xGu6oOkC5yfkRkw5xYDiZnUUGm0SLu6RdNnAESA6m/W1Ig1AnE959e1
         8yUPyYyiMfvrmKfg/8rzf4/iXvGtdbCIn71Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754923859; x=1755528659;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqaIrXcHxWrL1H6SRe7KL4MjQpJTbyEPe6hM6UsacwI=;
        b=rpHwaTxLg+VkAZnm3PAnBkGLmGkB7EXlngu/EPjmn0IPmWA0NaPmgZ0N7pRnAL5s+R
         9yYhl6AIm6jn4K9jsfBVfo4ZAQAkN4x0FV8rEXjok1V9mxzlU76VN8Hg6a+ruFW/ELsw
         yxn143bgLyfTRQBes3GrTC1w3j93HQbGjClvbMsL6PtJsuEdnRXkpqjEafED+/Yp6Au6
         zFrndsuGKsBrJGYFNfu2CI2c5pFd9ZsDwOpBk4ZZhNB9T5s1q/vYZuQd4dZ0DpzF9eSy
         NRyjLsPiCnhFSje4Xn1yGB+5j9GnLcYqpeTII2eAMO9Ob7HJlxiAoJ7fZz/5BXNgTPJT
         QOpA==
X-Forwarded-Encrypted: i=1; AJvYcCUusZmLuzrCyACQDwU7X9wbttoX5xS137lMj/tU0LO7FPTdT/H3t2ZwWzA7uME+XsZKU/fYSWL0ipXZCXK6Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeXGOIKQ1B9Vyn/rUxYSK6IpUrJXcNfcPW/sXiudCsU9tOQ5y9
	ON9mQS2AsjMnOWzSUQnxIYcZdx/F9oAvcKcYJl2O4e2IzcvQpwYv0HSTSesHccukxbk=
X-Gm-Gg: ASbGncvWv2Vpc8oct53C9BrmJRr5MhflzzBNnaw9rpqN8cs5abXyRxNQqhEmxJzxg+v
	ryztWw+RWxLFQfyE73h69c9XDCs4dNX8E2j0OpjYzYQUL+yO6hmSrYKnn21Iuy9IG0zSD3W4KXK
	dn992zoc2IbO/ST2zyTOuXRb9WzgFk5r4KFOD7A4yTQ2zveglYiWSE/eZ4Z1wNAWbLAEdilEiJY
	GAo+qNpOAIfXYUWPJFLwaQZkKkN1VtzLUGpbWHogSLx3RnYfmqK0loa0UlOHXsbt00710Drczpu
	14izMNe5PTwvoM47LkqoKhqlAoOtHkoLm484ouzGwdwJOCokzEKAtAKSdfwMx6s4YFF+8N7Wwm5
	zXLOMCOvJBgV20DRFFZVAILtN3VR8PwQFwEBY9AV5XVA0DZuZ8guemiOe
X-Google-Smtp-Source: AGHT+IF2BTqUckXG0twZ2kDSE6NTLwtbVM7gMBnyWr2B9RIG1HbA4Y0IKJsLCxz1V0fmyaceJslw7w==
X-Received: by 2002:a17:902:f70f:b0:240:48f4:40d5 with SMTP id d9443c01a7336-242c22c8876mr213888415ad.39.1754923858843;
        Mon, 11 Aug 2025 07:50:58 -0700 (PDT)
Received: from sidongui-MacBookPro.local ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976cb1sm276618225ad.89.2025.08.11.07.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:50:58 -0700 (PDT)
Date: Mon, 11 Aug 2025 23:50:52 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Benno Lossin <lossin@kernel.org>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/4] rust: io_uring: introduce rust abstraction
 for io-uring cmd
Message-ID: <aJoDTDwkoj50eKBX@sidongui-MacBookPro.local>
References: <aJXG3wPf9W3usEj2@sidongui-MacBookPro.local>
 <DBXTJQ27RY6K.1R6KUNEXF008N@kernel.org>
 <aJdEbFI2FqSCBt9L@sidongui-MacBookPro.local>
 <DBY6DMQYZ2CL.2P0LZO2HF13MJ@kernel.org>
 <aJijj4kiMV9yxOrM@sidongui-MacBookPro.local>
 <81C84BD8-D99C-4103-A280-CFC71DF58E3B@collabora.com>
 <aJiwrcq9nz0mUqKh@sidongui-MacBookPro.local>
 <DBZ0O49ME4BF.2JFHBZQVPJ4TK@kernel.org>
 <aJnjYPAqA6vtn9YH@sidongui-MacBookPro.local>
 <8416C381-A654-41D4-A731-323CEDE58BB1@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8416C381-A654-41D4-A731-323CEDE58BB1@collabora.com>

On Mon, Aug 11, 2025 at 09:44:22AM -0300, Daniel Almeida wrote:
> 
> > 
> > There is `uring_cmd` callback in `file_operation` at c side. `Pin<&mut IoUringCmd>`
> > would be create in the callback function. But the callback function could be
> > called repeatedly with same `io_uring_cmd` instance as far as I know.
> > 
> > But in c side, there is initialization step `io_uring_cmd_prep()`.
> > How about fill zero pdu in `io_uring_cmd_prep()`? And we could assign a byte
> > as flag in pdu for checking initialized also we should provide 31 bytes except
> > a byte for the flag.
> > 
> 
> That was a follow-up question of mine. Can´t we enforce zero-initialization
> in C to get rid of this MaybeUninit? Uninitialized data is just bad in general.
> 
> Hopefully this can be done as you've described above, but I don't want to over
> extend my opinion on something I know nothing about.

I need to add a commit that initialize pdu in prep step in next version. 
I'd like to get a comment from io_uring maintainer Jens. Thanks.

If we could initialize (filling zero) in prep step, How about casting issue?
Driver still needs to cast array to its private struct in unsafe?

Thanks,
Sidong

> 
> - Daniel
