Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242593;
	b=vOd0YanwXrfq0gK2biadvnA7Tmk/rVpnws5oayETvn6GPFScsdyjCQ1eMPfOnwce/wDC
	 K2067SUdzbK8ad7/qxIB09UColR4629BxkAzyRatrzAdgJW25FlYggHmrnnDKmvcG/fe9
	 CAdZCtH/MaBJ+L8O8DJAi/wdFVec8BEme9nzpv9Fy88RDm/kWGbZDS4tw2U0UDqlYajCa
	 hqGsMg8LKy7f5enh6KQfYINi+bin5vowIMN1/2pB3AjR3nNxdq9AiyFk1b8gU+vLonRC+
	 FwNIU7VYE83aJqSOHFv6yMd2lhvjHd8kel3AQ5JdFkZeU+7SpWF4s/BEJpD/YbMwRUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HLYen38mKGP677B1oAzbJm7ZesXCZSDjKVwDLOHWtRg=;
	b=qBLUIiHR6nvDCoNhm7qugEcAk57reCyo1uaZw+KBzCWqT/9Kgq1Gpbpo6MuIwOuT+dv4
	 Ga4UvpNMaH3Vy9ifnrpwxrqdwlNJ9Gjs09HxLFu5ILm0e9FdI7OMiWz22n06iBP95Lu2I
	 zSjooI+M73XwPJcez+VlUH7JXz4bzSwcOspA62riUEQuvUimhKTg3yVOaAI2wPT6Ce+4T
	 vNV8WuhSfmHue1oHAP8EZoGL7Azj2KrJpERAou1kHzsGU/x1ZzXYYlvO3SJPnwOzsKDym
	 vOvsTgwuxZ4cm024pu1790jp2NabORejmGRbv8aq9uPs6ewVIdLs00bwP/+Xcs3zMJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YGuhw1oZ;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA58606A331
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Nov 2026 16:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADA58606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YGuhw1oZ
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso758078f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 08:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794242591; x=1794847391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLYen38mKGP677B1oAzbJm7ZesXCZSDjKVwDLOHWtRg=;
        b=YGuhw1oZxUPL/bbx+i0ijosSnISYIbUul/qGq2zAELOacB08dvYDccSx/x9rU6g9gl
         QyPht0zwbkvD9ejc3WNj6TDVij9KZUrBEQ9Xt5i0q2PMick2I5G7BiPPIhuJ5QsC5cpF
         Hc9VdS41J2qakEC5kRjP6W1h9qpqNpRyQS76N9UiluO+WrKbrxUc+eHpH3MgwEVU/LBg
         EKYTjvlmvVcRDnUT5YdBxwyzf6msDAIK2mLzEprKTk57LkQxxSPMwQJzYJo0fRMdPBCc
         S1EcyuYCyB06Nre1/tH9qJ9dfWqNPjCBc4QnRUd5kWvI+126KhchYL1WWv8hq+Sx8TwT
         sacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242591; x=1794847391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLYen38mKGP677B1oAzbJm7ZesXCZSDjKVwDLOHWtRg=;
        b=hfiLvYOBIg9LkPwhJ1UhAdE23UPVGHV/nRt55FmoFUQOmUipHD1d87XGwh0Y3OkIpC
         2ZQFyqtUJTL5KlAtfAVYAw1aeArUOpCbvK4miaex7Rw3R0UYdnrXpLNlDqDafujwBfHC
         DPkGuLfyHWYj4UiDiZhi+/QqVG4TpbVlqGI5f+n35NA4LBqbPKYgplDVk705Hr97iHCX
         mi1oyXMYxiSoPQhaePg551STGn1+9L7ZPDiqGWRkPkpVUr0nuQWGQ+dtMqLuADHquJyn
         PqaERmnkNVtlzdp01kjUOL3QgO9myZmKKqFtMz3FR9a1723vbZPZWH5HDOqpsCs3zm8a
         kGng==
X-Forwarded-Encrypted: i=1; AL+hErGv62L9NkJSbwvVbdnfMrdNh93rqA/uoz02L4kLIggqHAfSdLGF51Zlf0XsPQBmLiGR3mPs5W5GydtiRiDjEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8TD2TXP39dJHpvviflzoOsuvWgkx/Gfk1w8zT4pJhN2xa6IQXr
	rw/J5k+VZNjjZ0leeCahFLm/hPxz5eKPyf/Wko9R/dVcr3WqCgYFgD5fl/vvkUrscAo=
X-Gm-Gg: AYBFou04FYGV2iM6Q1EJswFZOvlOtgKd4N0vRkE1bhjf3E/XRQIYF3YJqoGH/BhW9Q6
	5YxMhwbGPPvgDQ0d83rLZgIO4etYAwV20oAfAZwK2QI7+nVuPZD+mD61SUBWCrU/ChTlAkkR7YZ
	KFIoKQF6DSHEZpnYRGFRvi6am6LsrvdqmXgPBJtRAyMmbEF5TZnpzXTbcir6fqKhGGPvem3xplt
	uFLP8KKdgfEfIz9/x3dCgAEN1Sn+gxb+xmkj3uGxZGIiB5fN0CEdwxGsnak6LLnLooxRAEKsDfl
	hJKSeNNquz0begzbtSMhqelYMsxH4qXYfIAgu2+vydCbsv9M9YaCBjbdfpX6gJ0VVPQkJGcZzEo
	HEXgwjfhk+KeM7kXZOLGeLfMa/ZF3wEzmME0hyzEVo0mv0pAMT3SWnc5C8LP75hpSmGeEXZdgOq
	4gpRXHpWDMJyJEWAy06uid1PUJn9GoHylF6N2TKZ7HSvGsWNLbioD+13wqslmHgGSW9FWbM8OXA
	ePEzypcZ2dMFby7SraNKSIC1u2ruQIxCfri6+WcKRBtgySjgyYwBKN+yldg2/x9ZKKAvmyRDtIF
	vZFKuPYRBWwkVTjzV2MCwR4km6z8HO4CYXR9MmoipCffd04J5N1oDZIOR7edsD34
X-Received: by 2002:a05:600c:3508:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ba015b8c6amr1961265e9.0.1794242591012;
        Mon, 09 Nov 2026 08:43:11 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d8ae9fsm806785e9.3.2026.11.09.08.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:43:10 -0800 (PST)
Message-ID: <1dddcf29-36a9-4ffd-999f-54b730c9ea27@suse.com>
Date: Mon, 9 Nov 2026 17:43:09 +0100
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
Subject: Re: [PATCH v5 03/11] modpost: cache section relocation mismatch state
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
 <20261104-build-speedup-v5-3-0f6018be8dae@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261104-build-speedup-v5-3-0f6018be8dae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 7:20 PM, Lorenzo Stoakes (ARM) wrote:
> For every relocation modpost invokes check_section_mismatch() to determine
> whether there is any kind of mismatch between the source and destination,
> and if so which classification applies.
> 
> Each time it does this it invokes section_mismatch() which iterates
> through the sectioncheck[] array every time it's called.
> 
> When walked a relocation section the source is fixed and there aren't many
> targets, so the same names are looked up over and over again.
> 
> Therefore cache not only mismatch categorisation but also whether a
> mismatch even exists for a given section and look up the sections in the
> cache.
> 
> Special indices (undefined, absolute, common) take the uncached path as
> before.
> 
> This results in very significant speed ups for allmodconfig incremental
> builds.
> 
> modpost is on the serial tail of every build that links vmlinux.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 defconfig, touch mm/vma.c, gcc        8.5s     8.3s    -0.14s (-2%)
>   x86 defconfig, touch mm/vma.c, clang      7.7s     7.6s    -0.13s (-2%)
>   x86 allmodconfig, touch mm/vma.c, gcc    33.9s    29.4s     -4.5s (-13%)
>   x86 allmodconfig, touch mm/vma.c, clang  31.9s    27.9s     -4.0s (-13%)
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Looks reasonable to me.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
