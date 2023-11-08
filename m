Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6766122
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Nov 2023 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z2WCiFgH"
Received: from mail-lj1-x24a.google.com (mail-lj1-x24a.google.com [IPv6:2a00:1450:4864:20::24a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B821BCC
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Nov 2023 02:38:22 -0800 (PST)
Received: by mail-lj1-x24a.google.com with SMTP id 38308e7fff4ca-2c6eec16401so71192641fa.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Nov 2023 02:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699439901; x=1700044701; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nzWn2/btn0V+XmHJfWHIYgyjhRSrjzPvVjzzAso4GDI=;
        b=z2WCiFgHukBzawXx2xUK2NWAyZulLFP4P1j8U8/ZQ57O4subCXdIusdAreeKFsPDGK
         Po5XVZPA2I3+WctZX7Fyq3avwyWg9J1b6n+OZkme+bcy4JWkEVhc+FQrNpv1EPVrtXN9
         YfSIXWbAw9wwPKptkUz/33y/9l8mX7xZypbagG1oDAg+kYLPuZkqxk7CqPc/Cl3pLQR7
         QqQdkzLyFANIi5ofmG4UwUSYHQZpoAXvpX/IVIE59CJ72eOWK1IhQrbk/5xc+vjO+Bab
         F18uQz0V1qSfr1bvrKM8GhxaUoEfdvT//G1lH8gxwBpFwS6tOo1o/qnExfIZklkVKFHz
         dorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699439901; x=1700044701;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nzWn2/btn0V+XmHJfWHIYgyjhRSrjzPvVjzzAso4GDI=;
        b=VQ+7BvciSyxfcyIX5I3fc3czFMFJow+R8X/Xwto96iYWOwN1zPtyphJflJS7Mbe9+B
         Tp54VWCe+3D5eJJVTFK8yQZVie9CxFOBRJoH9QISF9mvnnmlkStEXNn4sob7yZyZFYoK
         4BC7yQYXmXb0TWrVCYUtVQpQr7X1Is8r2GEf4vNaXctd92HzYJb1YrrPOGIsYPpmG86A
         SO44u7w4/+gVF+VgaBX0eGGyl8thhgbt9HEcOuRsnl4lo72xYhWDSrz+MZU4+xBC2zC5
         48TQU+JRpmpxsmdSTB5c2+POUKb3yjLmC032LGChMz+0b+YhBRPToxwygLvO7W/KyNNV
         AR7g==
X-Gm-Message-State: AOJu0Yxh/IkAf8U/35O8HRKOqfbk8LuP6QcPi1byXkghlVK+FmFvN12B
	ddG8+kclQKQsrljQSzyaM8JQMe5qZQNqSPs=
X-Google-Smtp-Source: AGHT+IFRGK+yoXfemUJ85D+8dYbiPL3DuZ1GLp8NQbNXRZTIl9CINVYMEwP48WSyXF4Kc0W7fg4SkgRxA8XxH2E=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:a4bb:0:b0:2c6:ed6a:7ca6 with SMTP id
 g27-20020a2ea4bb000000b002c6ed6a7ca6mr14971ljm.10.1699439901160; Wed, 08 Nov
 2023 02:38:21 -0800 (PST)
Date: Wed,  8 Nov 2023 10:38:18 +0000
In-Reply-To: <2023110108-overarch-dumpster-5452@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <2023110108-overarch-dumpster-5452@gregkh>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231108103818.526526-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC 01/20] rust_binder: define a Rust binder driver
From: Alice Ryhl <aliceryhl@google.com>
To: gregkh@linuxfoundation.org
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, brauner@kernel.org, cmllamas@google.com, 
	gary@garyguo.net, jeffv@google.com, joel@joelfernandes.org, 
	linux-kernel@vger.kernel.org, maco@android.com, mattgilbride@google.com, 
	mmaurer@google.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	surenb@google.com, tkjos@android.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> On Wed, Nov 01, 2023 at 06:01:31PM +0000, Alice Ryhl wrote:
>> +config ANDROID_BINDER_IPC_RUST
>> +	bool "Android Binder IPC Driver in Rust"
>> +	depends on MMU && RUST
> 
> Can RUST even build on non-mmu systems?

I don't know, but if it could, then the dependencies of this RFC
probably broke that. I guess this depends on is in the wrong place.

Alice

