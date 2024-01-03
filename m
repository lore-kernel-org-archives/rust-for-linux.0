Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F871BDE1
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jan 2024 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="NsG4qZt/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40b5155e154so136906955e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jan 2024 06:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1704293835; x=1704898635; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=26lBYaET/iovrDgfz5YLoogPsBj8H+kNuh6NM10QAGs=;
        b=NsG4qZt/4yOdlbvusC/niK7SKEvzWZliVmzVyb0jd3vx4UuQqLoh5c+Uv1qalWhLwf
         gS3CQsaBgDrO0L17verCcHUImt2quG8R4XklfLHlUdRsJPXeksj5f9gCP5esV4IgbXw7
         +wXP+n6oA4Wz7IwFAw8bREL0ClLzyme4gQVJPHJv1LCEIgfMkR57vBNGmzyczEP8QoOK
         qfwNEm6g+DRnYmBzIWnxsHRbsK5Hv83TYfI206kcykAGfl2AdmHU2+qe2yGTFsNTVP6S
         +mxNn1gMWYOq0CSmjDpmB8Sb9kPLD72kRAB9nxngZ+ZK2dEzpKCGVZiugIh3Pt9f3H/7
         qCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293835; x=1704898635;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26lBYaET/iovrDgfz5YLoogPsBj8H+kNuh6NM10QAGs=;
        b=jrNh9n2eiGTb3muFIBAIiZ+E0cZ1XArTLO3WTtlr41bOf+c2oxj2HGRjC9ldzitJq9
         g5A3VkR+Wd08WS+wyB1wQbYFbXYR8zFnLjDq4lo/V3M06grXl88A3q/fnnhv693+5ShH
         SrrlCN5dLLEZeuvubT1I6X2tieiX26VrKf9K7XfV8L5j/J8oUFB6GdF3u6LiO/Rn/3tR
         ypp6OyWnbjAV/Ss+Jvt/pCb8rdUUg13wCmzdnECvJGkse2K+6ZOo54+pAGGg3dGHRhgj
         0MjXKLtNgWe1s6YKgEHUywUMPXwSJpCM5IhzPsV7wbJcDNwqAZX7CqGx+LuIgRInGC4a
         Lx9Q==
X-Gm-Message-State: AOJu0Yz+/QGA6RrtyZhdAwjx9nfvRkwfqoMtX04R+ZtUb7HvXBiRhrlW
	A97oxG7BzVJdQIxuwMK+vWBPdz7QpaDfkQ==
X-Google-Smtp-Source: AGHT+IF5XvWQFrhLzBY8gWki2UzwvkZ39dl/9BCBmTftZkehY8DjAJrW6v8naOFtGtfDOZT9fliIpQ==
X-Received: by 2002:a05:600c:211a:b0:40d:7fde:148b with SMTP id u26-20020a05600c211a00b0040d7fde148bmr3556391wml.217.1704293835609;
        Wed, 03 Jan 2024 06:57:15 -0800 (PST)
Received: from localhost ([165.225.194.221])
        by smtp.gmail.com with ESMTPSA id o16-20020a05600c4fd000b0040d2e37c06dsm2537188wmq.20.2024.01.03.06.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:57:15 -0800 (PST)
References: <20231018122518.128049-1-wedsonaf@gmail.com>
 <20231018122518.128049-17-wedsonaf@gmail.com>
User-agent: mu4e 1.10.8; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Matthew Wilcox <willy@infradead.org>, Kent
 Overstreet <kent.overstreet@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Wedson Almeida Filho
 <walmeida@microsoft.com>
Subject: Re: [RFC PATCH 16/19] rust: fs: allow file systems backed by a
 block device
Date: Wed, 03 Jan 2024 15:38:25 +0100
In-reply-to: <20231018122518.128049-17-wedsonaf@gmail.com>
Message-ID: <8734ve5uu5.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Wedson Almeida Filho <wedsonaf@gmail.com> writes:

[...]

> @@ -479,6 +500,65 @@ pub fn get_or_create_inode(&self, ino: Ino) -> Result<Either<ARef<INode<T>>, New
>              })))
>          }
>      }
> +
> +    /// Reads a block from the block device.
> +    #[cfg(CONFIG_BUFFER_HEAD)]
> +    pub fn bread(&self, block: u64) -> Result<ARef<buffer::Head>> {
> +        // Fail requests for non-blockdev file systems. This is a compile-time check.
> +        match T::SUPER_TYPE {
> +            Super::BlockDev => {}
> +            _ => return Err(EIO),
> +        }
> +
> +        // SAFETY: This function is only valid after the `NeedsInit` typestate, so the block size
> +        // is known and the superblock can be used to read blocks.
> +        let ptr =
> +            ptr::NonNull::new(unsafe { bindings::sb_bread(self.0.get(), block) }).ok_or(EIO)?;
> +        // SAFETY: `sb_bread` returns a referenced buffer head. Ownership of the increment is
> +        // passed to the `ARef` instance.
> +        Ok(unsafe { ARef::from_raw(ptr.cast()) })

I would prefer the target of the cast to be explicit.

BR Andreas
