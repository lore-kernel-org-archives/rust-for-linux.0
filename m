Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B251A702
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jan 2024 14:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="vAW5zvyI"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-336979a566aso8801925f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jan 2024 06:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1704293829; x=1704898629; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Gr5HbBl5N6cy6sjezjCV1TgQWW1jCwwc89aGHLxyq6c=;
        b=vAW5zvyIYvkaAS5ajss0kIukb9KLxT0BW+dIZt59iRWBJBgFn6kYzwVsZ8qBO+oEI/
         KhFrm70DpbFE3OTOgpDEiXs8CEMz1lrMXA4HDp+3ujU6rwCaOD8WHaDN3Y4Z4VOiITcQ
         d1Iwbjjm/6jbFc9R4JWju5i3fZbovyX94MaWESuxbMy5BRBQDFnnI8Hz9hYE6A96jV8V
         xxozOvQj6XBxTZbInk+QEumOKueyuyM0mTqZ+CBKD2/XhjVET4EQvI3rvY7pFwDTWz3P
         ++T1KhaXnRijZI9uv0htrKM87fJXy9hWqupWJcMfX45clCS/hRXLG/bGW4FqMoUi0wb9
         l0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293829; x=1704898629;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr5HbBl5N6cy6sjezjCV1TgQWW1jCwwc89aGHLxyq6c=;
        b=UuNOtWM/5BancMhVcugkS/i9CQoLOA92+/5YZaFiduMHTCmzLH3Ol1jPg0HglS2HYN
         HkIzQ9tGcODnujXmvnqovKe6hCfw4BtmvDFphlJYZivx8mTNzwW5NB8hoB3pi4vrxNwV
         mtcKp43PpgTVoMlPVvxp0O/y505js76oAp9kg1en/v/Bj7wg+V7WZVlWwEiYO/C9t9Bq
         0aI4TmPgWllOlnedZ9ZU8Kyd6gURCBqK/JRn+MP21GYbjB877+g0JTYBEe6c0dwKbDlX
         aIcZ0S4MlDgXFeb9FDrC21tDLbqgMKMaUYmDoD59YqFszaBIJ6T/8MaPC1YjQ7xvHsAJ
         XBEw==
X-Gm-Message-State: AOJu0YwF9bovHvNTOd3zhdMNLSY6RsS/y/Nu7u0TBV/zaiVvK6gQvmhp
	I2oLJbenpVZ3F9MvHtAr04CywdBM7r8wYg==
X-Google-Smtp-Source: AGHT+IG6NkBEBRre4rmvJ5aFuSttrI4POj1UgW3FBTw0+m89hLL4U0g5ob2JT9piT4ekwuslRk4Cig==
X-Received: by 2002:a7b:cb86:0:b0:40d:71a3:66bb with SMTP id m6-20020a7bcb86000000b0040d71a366bbmr4982697wmi.117.1704293829162;
        Wed, 03 Jan 2024 06:57:09 -0800 (PST)
Received: from localhost ([165.225.194.221])
        by smtp.gmail.com with ESMTPSA id bg40-20020a05600c3ca800b0040d87b5a87csm2507258wmb.48.2024.01.03.06.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:57:08 -0800 (PST)
References: <20231018122518.128049-1-wedsonaf@gmail.com>
 <20231018122518.128049-6-wedsonaf@gmail.com>
User-agent: mu4e 1.10.8; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Matthew Wilcox <willy@infradead.org>, Kent
 Overstreet <kent.overstreet@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Wedson Almeida Filho
 <walmeida@microsoft.com>
Subject: Re: [RFC PATCH 05/19] rust: fs: introduce `INode<T>`
Date: Wed, 03 Jan 2024 13:54:34 +0100
In-reply-to: <20231018122518.128049-6-wedsonaf@gmail.com>
Message-ID: <87sf3e5v55.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Wedson Almeida Filho <wedsonaf@gmail.com> writes:

> +/// The number of an inode.
> +pub type Ino = u64;

Would it be possible to use a descriptive name such as `INodeNumber`?

> +    /// Returns the super-block that owns the inode.
> +    pub fn super_block(&self) -> &SuperBlock<T> {
> +        // SAFETY: `i_sb` is immutable, and `self` is guaranteed to be valid by the existence of a
> +        // shared reference (&self) to it.
> +        unsafe { &*(*self.0.get()).i_sb.cast() }
> +    }

I think the safety comment should talk about the pointee rather than the
pointer? "The pointee of `i_sb` is immutable, and ..."

BR Andreas

