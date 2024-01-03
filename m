Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C261B278
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jan 2024 14:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="rtHrxffC"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40d2376db79so94634355e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jan 2024 06:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1704293831; x=1704898631; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=1RiYnyjMGkRlvVbGTVdJMyNHcYXgiPC2GcBTk9WI0UU=;
        b=rtHrxffC07e1zZN5wG4lfkF+f1WHI+aKaJGAjb2gbHNLRbE4K1RAzVgoEprQ5nsjx8
         11vZipCbP75qIZss1Cl2WkzZciHTurdozLl19bq25AWH5MjfpUQHD9xXzU5ioa0GWo4T
         WBwquD/kYLCQaRTpvtNyux7KZ/3CrXlJI4m6cQ8TqEed7n3LnubFaih+xbRC33sgI84I
         btgjb3b9DjucXHNDti2uur0cxclE3BLbuuQzEV580wDze8x/etmUDSudsNgd6KHC+iGQ
         DQWjGCV8z6OrqM8ihSTtvhEmYEQFo15M4DhID3vKhYV85wwRo8SAfQrft7er5IRLYBbS
         mX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293831; x=1704898631;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RiYnyjMGkRlvVbGTVdJMyNHcYXgiPC2GcBTk9WI0UU=;
        b=ekWTrph0YmGvqvU/hsWure0wKJbBHIix+5F7L9r/K1zSHNBhs+ENHtmwclb/nk0uwv
         SYfcjfkBw04rUec/qdHlkYUVTPQKEOLw92QVaNwwWXyyhSDpaXoO8bAS4fRlwjaYSKS8
         reFoC+CXk+UZxmyv+qu1RTlZFywst7GopP14/lq9U2SCIoAk50OSdac7fE3TfKZh61LT
         27H+4Wk1bALkOfrHi7+mr/ykw6zxbcaacZxtpHeBkzhTuCRXYRfoDF8uKpIpOzHbAa+L
         AtfPoRo/fOLvGqY98XTLWqbz3pJSaRmGP7yBSjwHFcM084jUqYouyXXIq2enfNdIOb0U
         VEKg==
X-Gm-Message-State: AOJu0Yy4HpiYUfotqQplK7GrGpk19O/lXIwwBH7ZC5shkDdcJcw6hKoT
	IGDXdRaqDtoSHp7gxoDwixK80csCpE1g4w==
X-Google-Smtp-Source: AGHT+IGBfVdl+OwCu7PAJa/VHUoKpnrnnpkIozZ6LK45NUTflG4VVR8fnjI2eJ3uzsdHU/SU1QWBcQ==
X-Received: by 2002:a05:600c:5190:b0:40d:889c:f213 with SMTP id fa16-20020a05600c519000b0040d889cf213mr2876912wmb.98.1704293831168;
        Wed, 03 Jan 2024 06:57:11 -0800 (PST)
Received: from localhost ([165.225.194.221])
        by smtp.gmail.com with ESMTPSA id p20-20020a05600c469400b0040d85a304desm2540477wmo.35.2024.01.03.06.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:57:10 -0800 (PST)
References: <20231018122518.128049-1-wedsonaf@gmail.com>
 <20231018122518.128049-8-wedsonaf@gmail.com>
User-agent: mu4e 1.10.8; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Matthew Wilcox <willy@infradead.org>, Kent
 Overstreet <kent.overstreet@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Wedson Almeida Filho
 <walmeida@microsoft.com>
Subject: Re: [RFC PATCH 07/19] rust: fs: introduce `FileSystem::read_dir`
Date: Wed, 03 Jan 2024 15:09:07 +0100
In-reply-to: <20231018122518.128049-8-wedsonaf@gmail.com>
Message-ID: <87jzoq5uvh.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Wedson Almeida Filho <wedsonaf@gmail.com> writes:

[...]

> +    unsafe extern "C" fn read_dir_callback(
> +        file: *mut bindings::file,
> +        ctx_ptr: *mut bindings::dir_context,
> +    ) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `file` is valid for read. And since `f_inode` is
> +            // immutable, we can read it directly.

Should this be "the pointee of `f_inode` is immutable" instead?

[...]

> +    pub fn emit(&mut self, pos_inc: i64, name: &[u8], ino: Ino, etype: DirEntryType) -> bool {
> +        let Ok(name_len) = i32::try_from(name.len()) else {
> +            return false;
> +        };
> +
> +        let Some(actor) = self.0.actor else {
> +            return false;
> +        };
> +
> +        let Some(new_pos) = self.0.pos.checked_add(pos_inc) else {
> +            return false;
> +        };
> +
> +        // SAFETY: `name` is valid at least for the duration of the `actor` call.
> +        let ret = unsafe {
> +            actor(
> +                &mut self.0,
> +                name.as_ptr().cast(),
> +                name_len,
> +                self.0.pos,
> +                ino,
> +                etype as _,

I would prefer an explicit target type here.

BR Andreas
