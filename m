Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FD539E18E
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Mar 2026 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714862; cv=none; b=umRn9v9V4r4lK1B24Ep39rjSKz1L0OugYpeH9wzj+z0lKq6D5pEa627PXPyh9q5EGJX6pNpjJNIQ2SyIVeBurvol/MuP6qn3BDJazsz/ezhzIZlkch6tcApteozgRH8UVCiUhnLQ5mp4cmcpTwJ3nGzqp1+6zwjGnE5G7ihkyTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714862; c=relaxed/simple;
	bh=XyTZlz49dcBZy4m8+TW86YPTVZBYLxNCnLO0RL+KgGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTxt5d0uxPVOnmV5/CJhmCPDQfhifVYKKv9eIhboPN7Tb3bSAtm/El7X4jzdS18TvB62WRYpVCFC1d/otMLWor4btJx6BuNFOD0kTNWpteYGkUVtuoaYAE8e6XHTsNlpyXcl/MNHpWluZwS6FvzjGQ1n7VGr3BIdx4EEI3z4YUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EHILE0qi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EHILE0qi"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso73303265e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Mar 2026 04:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772714860; x=1773319660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqNYIX4NXmfME4/eKoM3tAKNkR8+A/R/5/pglWf9PuE=;
        b=EHILE0qi21QsNQ8xMW6chZvySVvxwiEOCF35nskmYe+URb4SsSo2RUfVGJAYuTS+gS
         pVnfygoWKOVxQ5OAtMwkMFyXo9E2nKRin9usk0fbuwiCvr1Pp27JWkB4/K5Cn47ZwHlD
         baZ/T/RfmOzVv1ohvD5103oaXlhcUZzEJ3LrK8aLQaFPTPF18+QuIxzuZIGgI53oQHYT
         bqA3hMgD0ovqgtWeWHy4KsoPM+qVWei9bgZc6h5rIklJl48j96L/qRxA0y4a/fc2zHNI
         FaCIjuhO8UVnNZEUtueZgkUuWDwb1llfC9x1HrGlQcvuxQ0EMwIpJTZso/k93m2SxpxP
         GHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772714860; x=1773319660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqNYIX4NXmfME4/eKoM3tAKNkR8+A/R/5/pglWf9PuE=;
        b=N8TuqT5cZmFdhCKbmhYXlQy5hfOcIGlcUDAj0AZtiQrn0oDAZnEbqTTPNBUgNZ95j/
         KIWdRkWyAR+/6OqjLEbeyIUsJBKjJ4SJx0dgma5wKZByXl0jHLlqqYKWiBTDTQGFSZ+n
         vNkWo7kfc7KJMCje/CvgatB4ls/bwGYTuEVWwxeA1AzzsPinpSlWdBiNZO0aYiO1kX91
         6TvX4b0E3JElo+RhkkXbu0Ex5WpTBRXEjm1vhFAkMN5xiH9S4kBPhrM6fccnyR2vEhhI
         gGaypVEQ/KU+dWMwA1Zr7bH9VIg15mLOJbEOsJZPk6NntIinx81BjZlUKgb6HfXUKrvL
         6RJw==
X-Forwarded-Encrypted: i=1; AJvYcCUBLVVO3P28fjeHblXYv3UGcT/+nyjI1vamweHbpx46sYSqprMVaylr6QhB/I1Fw1HDLt8Kn4hz7C1awjwP7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9cLsp75YllPzGkxulVUR4Qi2KoYHIHSHrZSu0MdljBKJOWs35
	8FVANe5jU48KPEzZ/JBF9SCZbHxOCKnDnibQjBttDrRYIF8x8Dqr/Peh4t4ORJYUlsk=
X-Gm-Gg: ATEYQzziymt0Y3otCjgHbJU6EO6OI6LpJmzeId0ScnYU6A2L86vsqMPFLeBZfOxjNRC
	KXJh3AzeU6HS2308hynSBRyW1sqoUhcYpzKlkARJyIBTcJX9hg0R7VGOZ30fq/1G0l46vJ4Cshu
	lMxZ5TUVPnq3s/yeJXyPhr1+oX14bKCx55R9Kn64oZeifynV8P/xGUy09szRYMnFQ0i6Ser9sgq
	2Eo+Eh5jQTTW1BHdIqUCFvr94E4jdN7SlJSvUG/jX6oUAa+IL4IvpOlB7eqCZ7ks5TF4VNkfO84
	EiQNqoLr2uoNofYyGi3G61TuTLrwnSRvjF0sFQaWzKq6fn3MVWbIUiRUxsG8O9LNAxTRpAYUH4B
	GEZrQjL9BKXl22Sea72NYGNDv5Z8oo1Kj6wm33uC5bCspOA7jPjM0m4LUF1IAwUKupgcXw7mkIx
	X3ITn11YSOzctwsGbKxWVFBydJH6GZ+Q52WVAJtu4dbEzG
X-Received: by 2002:a05:600c:c84:b0:480:4be7:4f53 with SMTP id 5b1f17b1804b1-485198c70a6mr97452685e9.31.1772714859895;
        Thu, 05 Mar 2026 04:47:39 -0800 (PST)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a8a9542sm72254915e9.1.2026.03.05.04.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 04:47:39 -0800 (PST)
Message-ID: <4f09a589-c9f7-4d4e-a9e4-c3c9787a38ae@suse.com>
Date: Thu, 5 Mar 2026 13:47:38 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] rust: module_param: add StringParam type for C string
 parameters
To: Matthew Wood <thepacketgeek@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>, David Gow <davidgow@google.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260226234736.428341-1-thepacketgeek@gmail.com>
 <20260226234736.428341-2-thepacketgeek@gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260226234736.428341-2-thepacketgeek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/27/26 12:47 AM, Matthew Wood wrote:
> Introduce StringParam, a Copy wrapper around *const c_char that
> represents a string module parameter whose memory is managed by the
> kernel parameter subsystem.
> 
> StringParam provides:
>   - from_ptr(): construct from a raw C string pointer
>   - from_c_str(): construct from a static CStr (for compile-time
>     default values)
>   - null(): construct an unset/empty parameter
>   - as_cstr() / as_bytes(): safe accessors that return None when the
>     pointer is null
> 
> The type is marked Send + Sync because the underlying pointer is
> effectively 'static for the module's lifetime — the kernel guarantees
> the string memory remains valid while the module is loaded.

It is correct that module::args is currently valid for the module's
lifetime. However, I wonder if this is still needed and we're not
unnecessarily wasting memory. Since commit e180a6b7759a ("param: fix
charp parameters set via sysfs"), even charp parameters are kmalloc'ed,
unless they end up pointing into static_command_line when the specific
parameters are built into vmlinux and set during boot.

Similarly, if Rust modules eventually need to support parameters set via
sysfs, it will also be necessary to make copies.

-- 
Cheers,
Petr
