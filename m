Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233123;
	b=PeniZl1wMfWVh13Ja9kad07VvDBWg2ZBulOD4lILlx8sdhQnnYRJhyQuQE31QEuPm3OS
	 HPgpeyyR/nPxzpMZdehDjNECkadAVUFLJQIixFRt/RQoVaKxTudXJLZQ6hN6YOrn5ZDeJ
	 OZ+oOsrUS8OKDn0ekywYADpuffOXovXF5/ZLX8i3Vs3/kqlFZ2eGPYhqo72YeiMBMYzEB
	 s/z4XPcaPUc5aDi744ipO3saBebJqaoq3xYD/xeI/Cwtek3CemvJE366UyvVQQMfJA/Or
	 jZWz9ix1M+RDkaefiOy88cP7o0PzHG/vCMXOnshwx22XZ4j/qn2e6d94uYN9N90ZQJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jo7KQrestHbM3KQGgB2ZehvfnJkiM0RdX1i9KTgsql0=;
	b=BYmEQNV5MPLbSJBFcj58e3NVy6flkrqc1Lq0SJbORuu8rf4Nsy1KjqDWEzYNvQbivxcC
	 mTqboPneGcb3jD4xilBxsQoJOFYzuDHqN03Gl2XhPJfUhANA2hsG3C+fr3C5MAwICSlc1
	 UiMbNh4C0aZ3LyQSADbkI655Exg1+ujyvUw8e/RHrOunNR6d7HWDM9j8Fxull5pNa6Huu
	 tlSSg5SNZXNqTBE6hPZCy17KqqQiXmAOuMjCTGiWX4X/engVKYo1rc/H5yHw8C65ApoOZ
	 ZRnANfWbno5Pz1TIiQlzcfj2XQdpChesWQvVRTzyO4nPDYLm34ifgiQKCukqE93p80w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DUyuGSmU;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE19606A31C
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Nov 2026 14:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE19606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DUyuGSmU
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso6531365e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 06:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794233121; x=1794837921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jo7KQrestHbM3KQGgB2ZehvfnJkiM0RdX1i9KTgsql0=;
        b=DUyuGSmUH5eDAXYPE494OxeHh+ehy1VF9d4zwanBWXOJRBHq0Ow7LBVP27VmCh3mSk
         TcSNoZCRGZqD1R5/q04bOSMyUVY+QmxyBoKRfnCVgeyV+Mds7bVkQlWic/V4J8MXFAgA
         bfUDaw5oAKCnEZxzmpaRDoYgBy0fABh9koMRwBo4JcooByf/NMHXhBK3Y6iNDcNGh5lE
         u7UV05xyMGeFVrcybw1AfJMtoyF0b1OA7YxIeCHVbxZNpKLi2QpmVNr0qG7Qkje2Oth0
         NgPXM27eqDCZbuOyIfUWruQL3PvktXLyMiRfPv0QvfsPvk1swAJA6wAn1Qdu+TvXC09/
         cifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233121; x=1794837921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jo7KQrestHbM3KQGgB2ZehvfnJkiM0RdX1i9KTgsql0=;
        b=XXkbYzmNASivzG5KdBFSE1HgI6WttQvPQCaC4W7pEM/D+5+3n5ELQ2VNkUka7ZRp18
         bz0mAPKYqzVyJ1uzSvcnPVDYPuiDeP3VQNtqnz3VsXlduqQI95KEr0wjF6mEK2g7phtf
         wZY4g+rJOCl0Gf0EUWW4o8Wg9bfqFB02SiV+O34WU9vGXRfV200jUZ2WpaS5D/WeDZKu
         dwDqad3+UHVqeXz5uCAF0PEcoPu0eXa6Q5nXJcKG5ak1+nJEiUdfpRY/9WiTKYg7GfT2
         RGLg0HfD7Au0C1Iga1plOsNpiRsW0nuegheTQZweQ/KZwX46Mx1+bSB+kfLMSxIfWpsk
         3/Qg==
X-Forwarded-Encrypted: i=1; AL+hErEECOrq80l103v74S+460fYTITrwHSybhl/csy5kstn/llsE+TC8r4z2/azvo43SIv1IH1P7G9oULY3a1pdsw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9b/p7wme0MVBwg4PBuF5qCuojCE89oZUADuOziTm30J/U3rsie
	YU8auzBOBFW+xO+M3rVh49dWzOq2HAZw3Y09VRlcaAq67XsXRqgSVxx3nJuJ6fTfnYU=
X-Gm-Gg: AYBFou3AkgmvylLvN0IEKh0hwQq9qV1w1l27rOF3/bfwUNZvw61DDLjXsAdZcOY2asd
	yZDnYYUGn4Mip+3duqsV5LK0A8XkqdF4fUoWEC7O7U7l9wCT0sWNqKdeDyUNnuKvKNeYmekP0kJ
	fpKPuA9tB1NkCj3ftMY6tirCWn7ZOL9VqfqYNnm99/lFUpxzGLGOOAVl9motd05ucl36adr/rE9
	VS+t7wnFQ9iAOmuY7JVR3oLWtvczw+5D84jJ1zhxsgP5tG3Kj+n9PHt9PvJz69ysuecqPob986D
	eth8jJf5GbWhbQuzDJNbZp3MJ72mcxMv1285YesilQjN0Gqdaew2nc89oSi8p55ERpxVHWsGrfa
	a91KlMw1bRXNZxMPHX+a04WDdLzxMk0YwpnwNoYY2gfnyqKMSFi4sltXtTt0dJvBuLhk0yIE9pa
	vGOLFjCmeeiVzq/puk8ESi6MkK8+tIU6GGC5/CYn8+OvmZsqefQCr9/bHjjrnzd5RcyeYZv1p0J
	JArk/KfZXEflaB2L0yI+j9cMsp5MlGo4zgiww8q1fe7LcW3kxDsMhZGQAkXaGwd0vQLgpIRAIP3
	vS3LsMF1STWoZxSp9GygK+T7uT0dxF/Cl4pAUKj2//5Mc2uRA6gX7798LhfHrKXz
X-Received: by 2002:a05:600c:19c9:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4b963c855cfmr76926345e9.22.1794233120810;
        Mon, 09 Nov 2026 06:05:20 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f11172esm140959535e9.12.2026.11.09.06.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:05:19 -0800 (PST)
Message-ID: <b8134de7-be7f-4bb5-96a7-c36b5d744852@suse.com>
Date: Mon, 9 Nov 2026 15:05:16 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] clean up EXPORT_SYMBOL_RUST_GPL
To: Giuliano Procida <gprocida@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>
References: <CAGvU0Hm04LXTywU0eL6KN4=SoOAC+LU3BKqENnLR-WV-sHsuNA@mail.gmail.com>
 <20261103165833.418845-1-gprocida@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261103165833.418845-1-gprocida@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 5:58 PM, Giuliano Procida wrote:
> Move EXPORT_SYMBOL_RUST_GPL definitions into linux/export.h and
> prevent the emission of bogus type information for Rust symbols.
> 
> Addressing review comments, the first commit now ensures the moves do
> not trigger warnings from scripts/misc-check about missing symbol
> exports by extending regexes to match EXPORT_SYMBOL_RUST_GPL as well.
> 
> Giuliano Procida (2):
>   rust: move EXPORT_SYMBOL_RUST_GPL to include/linux/export.h
>   rust: exports: emit ___EXPORT_SYMBOL without C declarations
> 
>  drivers/gpu/Makefile                      |  4 ++--
>  drivers/gpu/nova-core/nova_core_exports.c |  5 ++---
>  include/linux/export.h                    | 14 ++++++++++++++
>  rust/exports.c                            | 12 +-----------
>  scripts/misc-check                        |  4 ++--
>  5 files changed, 21 insertions(+), 18 deletions(-)
Looks ok to me.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
