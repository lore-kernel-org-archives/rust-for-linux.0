Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4F51B283
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jan 2024 14:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="iUiwPmTT"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-336746c7b6dso9469777f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jan 2024 06:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1704293832; x=1704898632; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=xNnLe8eCfNONJjjsfqPVQ6sPt/jljKMtvm2sVnHboe4=;
        b=iUiwPmTTau4LqJtkwskVNchaagMPQtffqEkIj9j9UAz/ttUad3ni2V5YzC2mjlYXAw
         ekXANMQKKRxZ9SeBVOme3vCrKnbSQ9199DFeBj0D6830V1UW5fftTb1qCegIvs6/d7tq
         qZysJkn18Pglty5TMEzDPE03z9EbQgE6/6tFwLDRGjFTL+pv8XUEvjl5eQjdisDbplQe
         687OlmHlz8vyIItpDxBOaLrsFbtK9rSjntSRxjVzTfNoYG1DIHVslIgmHolQdO7Vmlla
         dbb/SUvQ/vthJ2XANTtP1g5B3Fw8G3Q5JwFU2RGGve+3SvbdNStBwFNCocNwVhIzMtTO
         trHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293832; x=1704898632;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNnLe8eCfNONJjjsfqPVQ6sPt/jljKMtvm2sVnHboe4=;
        b=QMbUkLYVKhlh6lj6+qWRXIHCxeK5s/XXL9uQK6KN60p4JNDct6HRdBEUsunyIcK+1g
         dM38BeGuunnji6IQKdY8iEh/juNIOCgac6Vh14QGgY64RcX9OpNeUdplb5o5g48IHjK7
         whHaHHvG/ZUALnASVfxO1zGiOhxoYaN4PKNsfbmuT00pn38k40mqOhfLJrjYp6ycsZQv
         o90/e5hwrZ1arfvUZw4F8gvSW3Or0l6zRobLIICsRIxUWuZthF7UASCyIwRkGqppyZin
         8FJhGz/I2fzeofTuKWSbiqAWIXJYifa6qeaQZny54P0gsV2p+bwMfAcBD/sGq08XlNLr
         BrqA==
X-Gm-Message-State: AOJu0YxRJEmktx30ghyROIy/0rmDCOMpj7pTKNbxPPjJh3axl/M9UgMw
	R/DrMrLserd01eAvYUZNNZ/5Adk1EY3kaQ==
X-Google-Smtp-Source: AGHT+IH4sf2+ssviuTdeEuIGZW/2oKnZ5pOWev31vaXfqEnwHVDi6hIZlpm9eUjYSVujHhpxzm3zKQ==
X-Received: by 2002:a05:6000:1a45:b0:337:39db:2fd7 with SMTP id t5-20020a0560001a4500b0033739db2fd7mr2940403wry.96.1704293832251;
        Wed, 03 Jan 2024 06:57:12 -0800 (PST)
Received: from localhost ([165.225.194.221])
        by smtp.gmail.com with ESMTPSA id s10-20020adfdb0a000000b003367d48520dsm31011203wri.46.2024.01.03.06.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:57:11 -0800 (PST)
References: <20231018122518.128049-1-wedsonaf@gmail.com>
 <20231018122518.128049-13-wedsonaf@gmail.com>
User-agent: mu4e 1.10.8; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Matthew Wilcox <willy@infradead.org>, Kent
 Overstreet <kent.overstreet@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Wedson Almeida Filho
 <walmeida@microsoft.com>
Subject: Re: [RFC PATCH 12/19] rust: fs: introduce `FileSystem::statfs`
Date: Wed, 03 Jan 2024 15:13:48 +0100
In-reply-to: <20231018122518.128049-13-wedsonaf@gmail.com>
Message-ID: <87frze5uv2.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Wedson Almeida Filho <wedsonaf@gmail.com> writes:

[...]

> +    unsafe extern "C" fn statfs_callback(
> +        dentry: *mut bindings::dentry,
> +        buf: *mut bindings::kstatfs,
> +    ) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `dentry` is valid for read. `d_sb` is
> +            // immutable, so it's safe to read it. The superblock is guaranteed to be valid dor

"valid dor" -> "valid for"

BR Andreas
