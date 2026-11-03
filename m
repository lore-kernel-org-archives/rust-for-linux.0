Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721424;
	b=CHLIwiKNk/rvEWkCoA3gSwiMmijBDiwIb6QDUguZ0DvAHE0m1wrl7qSXQlU4LbcP8JDX
	 LhPZuPXuM32ozk9lIDr3EzlzZz2AnlTyXnPkQdAJpD9gu2kqHAD5+p2s53LYD8KxgKKMY
	 j/H49t3YDtOOWdP0r2US/qBR3oF1SIYraafm15bGOXLnIxi+HhfkuvYGEN0XmY1DwwOKP
	 2b3+0PDuDffOkVKM3d3h6mkbHR15CKwXcsTR+s+2lsMCMRH3Umzb7w9j3kDS0hBuRRCSh
	 W09nnyLJ86SrcSzWnzxZ+tluuLnOhNPbYW3+n16sPKiLiVRjYXwQUtFdFjQ/UdS8Ybw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ds1cm/r+J5ogP0Oi85siueuJoBsjSaeimvYRj3GfO3Y=;
	b=f6b4icvQU4VE01vcE9pUABI18RyilzVZDZsVmc4HKpbWRg44aKKSFnsmb7DxgxhT1Uog
	 dkAXsIdUkp8pAnhsEdnxWL4xOCxSKLhPbwCYkSMcNL9gLMwAbRBK34KrWQF5il65hyXVI
	 VRDWe9M/FDFNKFBrBvVGSDekHYhwYVg2kR8hWpR5Lh4I86td4zWawt4asZwHKVbF5XUWd
	 l6TZ2tVUhal4+AKjurRGH3UF8FVoeVNFw8OKb+mMWT9PnAqj0FHc1m9s6DxEAgI1T2XOA
	 4Oe1e/ZvCfkIJSe/5O4Pg/ILashzffRnF+pzy2f9j77ycI0q9Zm59+ss6LYXBHR1jQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="OQyd9tD/";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE37606D837
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 15:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE37606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OQyd9tD/
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so43117785e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 07:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793721422; x=1794326222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ds1cm/r+J5ogP0Oi85siueuJoBsjSaeimvYRj3GfO3Y=;
        b=OQyd9tD/8TQOt52lQsWFnhzNzYJd8rgIeATGn0HbW5YbJ0qOm+aUzz0gKTIlMS6Ux4
         8uXXHnbExRiP5Huc8SqpAIpjf/AXk42hAjhNh9I2I6b8OqBuxh/3LSRu1Jn3j43FBHqJ
         S+XkV8xg48nTjJ88cEsHAmkY7hhB8I+9GD72G3LFAmt7QH04WMg0Vvjswb3glBMJDVq7
         3JwXc+h9z0GFb05Uu8k/fl/T8MH8whVD05s5kNu/lcbwdaa6H5eQ9hjAak1unQMOgBNd
         +QWzAdibssaKAE3bpR3DOmkPcVDpdmMp4YtT6qELztOUIfqWNP8wqKYlhRielrP122BQ
         9k5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721422; x=1794326222;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ds1cm/r+J5ogP0Oi85siueuJoBsjSaeimvYRj3GfO3Y=;
        b=LAWvD+Ss6ZZt6XGrf49zzqYEmM1utacQshYT0+tvt2OC0xPKKVOjk9Ujy4AGrSAedO
         XW2QV5Yi5enXLc0o5FFVHZq4YPA8JwxhnxIbaUZf9JgxmhPjsUuveeASOkZGG97jq9Qq
         sgI+6Rvfoce9k5n+yn3egAHjGCX8HVcycN5U9/00w1xiJAQ50znIXIPqABUp4wFs4tyC
         BFrBWjA7C09aN+bBQ6fuEtZzk139HcRNBqU0Z5eSArXGPkc+3dG+F8NwCgNbY2AkJVu9
         qvsOkFFfxLhkUyB1xX8ublXdplWKRL8i50qkWdgBn48L2cykgyHwABLG6cC+a1nnkf0j
         FqNA==
X-Forwarded-Encrypted: i=1; AKwUvBzYptGkPhbN+Af3olSJOEXDjU2cc+4Cjm99h0h5XvERMAIBGMfahgqBHAjcMoJMZyilSdwL6dVy2IQvk/XMnw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/vSRsnPRZpf1M6D8WbBVgoeZHXpjkZ3CHChxKFAw2KgVvOv5rr
	Bjz+Cb0gQythSWPuH43w0LQhQf91nuMBL56S8kCc6nkgcA1nwpz8ImfjnwIEKt362wo=
X-Gm-Gg: AYBFou2RqoRInfognrQyDVtRXgu66BCoyM+xi1WyzPtIjut556Gv4GhRbXizsnhkFx9
	sAqxlW3h/W6f9ki/1nnew3CaqPJQn1abSChx4c/cRpI4w3CgHY7k1tD8v+x+WI6kUwm0eF3fyyC
	XApZVdaZh1Qs0QMglZ6JKEw4tYpVVjeNJLxys1ukdI8HTOxiyCnEvz6m9Tfuh5QmqQH69uyVLkU
	Yxqyf6+Hn1NbBvaaPHby4O1HQAYkulHnMmSKL3/bZwtoinGUatLRKHymF2bTKkVZMg6iJ3TR8nr
	oXPKwlNzVRsOUjKmwBuQP3rGprGdVzw+DiTt8mXqFzO7UpoEnhpP5HQtKKz0S09kI7ZS3DbWi9M
	/m6gAPxX5b4ijegh2OW1Pu5caUADqI+BeCzo4zmEc5jRMZKxdiWXjoCHk3ouOnAyhfk8SLMn0G+
	qJPwmY3HtiZBrEtcDRrbzzaL7oIrY7JwPmlfEXf3M5VRxL6gQa8g12zITKg9G4xJVmhOPoCuY/j
	ejit50bbSUuKj+ZxOP1EJELQXAXVzjnkCpNgRW71kBJYSLQGU55UC/TI0oIv8zPQi9NP2jm4nIu
	2q8MSRXDKIEDXvTOaPG51nd1wmagM6V//Ccg5UtmwKxy5Y0TBnayuEPj/T3eLfZmEA==
X-Received: by 2002:a05:600c:e555:10b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b261e5b38bmr58131845e9.11.1793721422629;
        Tue, 03 Nov 2026 07:57:02 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm25946508f8f.23.2026.11.03.07.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 07:57:02 -0800 (PST)
Message-ID: <0ddac462-b4b3-4844-8a00-fbe5f043885c@suse.com>
Date: Tue, 3 Nov 2026 16:57:01 +0100
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
Subject: Re: [PATCH v3 1/2] rust: move EXPORT_SYMBOL_RUST_GPL to
 include/linux/export.h
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
References: <20261022134617.228229-1-gprocida@google.com>
 <20261103125814.258105-2-gprocida@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261103125814.258105-2-gprocida@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 1:58 PM, Giuliano Procida wrote:
> diff --git a/scripts/misc-check b/scripts/misc-check
> index 40e5a4b01ff4..b39d731cb413 100755
> --- a/scripts/misc-check
> +++ b/scripts/misc-check
> @@ -45,7 +45,7 @@ check_tracked_ignored_files () {
>  # does not automatically fix it.
>  check_missing_include_linux_export_h () {
>  
> -	git -C "${srctree:-.}" grep --files-with-matches -E 'EXPORT_SYMBOL((_NS)?(_GPL)?|_FOR_MODULES)\(.*\)' \
> +	git -C "${srctree:-.}" grep --files-with-matches -E 'EXPORT_SYMBOL((_RUST)?(_NS)?(_GPL)?|_FOR_MODULES)\(.*\)' \
>  	    -- '*.[ch]' :^tools/ :^include/linux/export.h |
>  	xargs -r git -C "${srctree:-.}" grep --files-without-match '#include[[:space:]]*<linux/export\.h>' |
>  	xargs -r printf "%s: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing\n" >&2
> @@ -58,7 +58,7 @@ check_unnecessary_include_linux_export_h () {
>  
>  	git -C "${srctree:-.}" grep --files-with-matches '#include[[:space:]]*<linux/export\.h>' \
>  	    -- '*.[c]' :^tools/ |
> -	xargs -r git -C "${srctree:-.}" grep --files-without-match -E 'EXPORT_SYMBOL((_NS)?(_GPL)?|_FOR_MODULES)\(.*\)' |
> +	xargs -r git -C "${srctree:-.}" grep --files-without-match -E 'EXPORT_SYMBOL((_RUST)?(_NS)?(_GPL)?|_FOR_MODULES)\(.*\)' |
>  	xargs -r printf "%s: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present\n" >&2
>  }
>  

This is minor, but the updated pattern matches non-existent
EXPORT_SYMBOL() variants. To preserve the current strict matching, it
should instead be changed to:

EXPORT_SYMBOL((_NS)?(_GPL)?|_FOR_MODULES|_RUST_GPL)\(.*\)

Alternatively, I think the pattern could be made more permissive in
general, something like:

EXPORT_SYMBOL(_[A-Z_]+)?\(.*\)

This has the advantage of not requiring changes when a variant of
EXPORT_SYMBOL() is added/removed and shouldn't sacrifice any of the
desired functionality.

-- Petr
