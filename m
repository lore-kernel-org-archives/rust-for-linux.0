Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA2719D065
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767005064; cv=none; b=k7X6+mvKklK2JWTOrFWx+mTamrpHxUWo5d0EdTw8FJogh3iPRpKWDG6YooH4fbkUZ9g4+4hGNEEee6Mbv2wsYHrQhSWV8WEVIAXuGS9Dgr05jBo9ZvRBAh+4D7MyyLFaUUiPG8RjY3lrCO6ucHAVQ5zYGNUd7fii7RUHPqTbwZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767005064; c=relaxed/simple;
	bh=4D+PsUxFWkTcvyC9E7Dtj6OeWr8p9OjIPkWqRwAkrZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SPXsU4z393m7peWAaXQ29dWSF8yThoANOakoljzZTfVelPloUMTsU+j63R4gt1ke4ehx1s0/B7fRRuOrelcQLfX3KWX/37nd1o4zLHa2dqIE/AkyBrEI54bRYJ9b8KC46LWO4PpJsRjeb/5TQ1IQGLvKnlzVUW3EEUbRdw+rNvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deytima1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deytima1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso55928315e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 02:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767005060; x=1767609860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PbOTz9it/3RSSwuH/1hgRMq5x8qHT+XuJCLdNHHheyk=;
        b=deytima16+8I0wAM9p8gCFxkg2RoiMV3Bc1tMnocMY5zsDglpToykAZEzeFAGebgKY
         LA7Zpqgn46UiHH6MPSp3OZeSn5gZ0Mtixw8iDnPpcsO7dT9YlDQIIEGaNZVxIsHRKvRH
         ZFLcJC/wayO+MLau+d0+7lpRAHZWRa02NPAYdK0bq6UMKYo/iYWBYsae+tCDtkKmA6bd
         UdP2wN038iyxLAPNZ8L7nAPzoF4Br9ydem89EDryt+BSkOjSJY9JXCi7IZSwUN/v1WAl
         cRlYWn6OZyA85WAMyIGe8Lj8IkuPZ/T6BEfw9cFa2pJV5tV2DdBuG/CXtva5KzF97M7k
         OpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767005060; x=1767609860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbOTz9it/3RSSwuH/1hgRMq5x8qHT+XuJCLdNHHheyk=;
        b=hkiQl91+CWv46GNOqZ1afPf1Uu4UuTRScKbO3LiKHXSLvAo4lAT6KsDF1aC4ZVxDPh
         uxsbhDUqVjxxgtSRDcDfqWATGISKbyVuaOqobUIBlIkBF7HU7NaUbQJ4i+9bS7flKMh3
         Phjdql1UOvgyAH528gt0ALb4etM5Pxd4QvypJj+h+Qgzmly84vixGxAiQv3JFgrhMLbr
         VmeK96rSEWqKZKLmg1LnCiRFQr28Y4S17Z1JNP2jcFjbnaHrBjFB8NesuddFEvO3QHPy
         AQHvxQtYiKIyHQ2H+bkBlFuhgmok7foTc0kAVQCfC68HT6FRi0BV//gOiV4zaCHzTdXN
         RGBA==
X-Forwarded-Encrypted: i=1; AJvYcCV1wGuL2m6mFNZraQzdgfKav0yEbvOh/XIiI0BQvGN2WnfA5GGBJRAPVt9BwipWYM3GBy3zziJzkL9amyuxiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/5VlmTVACH6UiVF3hT4drjpVU71tHKhNdDoqr+002VKrMk40
	esi8U++d5VJ49P+wT74uL5ffJHAQ6LObvbzjCgB32C9eaou+7PQ0nuE5
X-Gm-Gg: AY/fxX54FbF4gtZaD5FfAdine4t7FuSUMj8mB+sr3NTTgCNrjWtGwh/lSBwQVMuK76a
	mDlQiQ3DSN1peVGTFj+s5brHDcZ4tOYQTqF+cWE2V2TQ2ZEbjaKgYYh7gtaKR5aGRlhQYhle8j+
	R0YTKbIYcFhzAgCc764kUIAjbl0T9M5sIFA4WZfhfIv2qhUcv57d0E5vMNjguNde7tqh6OlB9Jb
	xcWySbBP2v7N+skgkxcrsPfQqON//tWGQQQk7xZfZewwG8IIqZHx3/hwEqCC+l7q0Xxl7rsuj5b
	eVDlLAG6XwIIaUp2ltgyjYkrsJMztjI4Z7BmuSj6RFl+y4/mJ60VsiG5v10GShPIcjSRGTsuBUi
	oTAJCASaNWJrrL/y7c1Q4IDMIDszqOceduofZyfwNBj5OFg8zDe5JQhqXBsD++yGAheMvFM7/5D
	8R4FVHzoUGEmZHJwZPz5883wDncLSvB5HUquUPePl7LC/nyoQUqjXy+S3Y7cAqZDXURP+9kONQ5
	kwUllx4X9/ZvFDHtm3Mr/QeFwwxvsRRyrn/670gfEpLNw==
X-Google-Smtp-Source: AGHT+IH7HH3B/GsPmjphgHFpcA4rkTmQU7ZGYMnFvsOgt8zPH7LWmW5UxprLMs0Sceu5RtVU4OOzfg==
X-Received: by 2002:a05:600c:c1c8:10b0:47d:403c:e5a0 with SMTP id 5b1f17b1804b1-47d403ce6e0mr137915155e9.12.1767005060287;
        Mon, 29 Dec 2025 02:44:20 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:65c7:1f11:be99:4653? (p200300dfbf2de30065c71f11be994653.dip0.t-ipconnect.de. [2003:df:bf2d:e300:65c7:1f11:be99:4653])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193522cdsm511479345e9.4.2025.12.29.02.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 02:44:19 -0800 (PST)
Message-ID: <a8a08f6f-dd3b-4498-8fb2-f91934683288@gmail.com>
Date: Mon, 29 Dec 2025 11:44:17 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] lib/vsprintf: Export functions for Rust pointer
 formatting support
To: Ke Sun <sunke@kylinos.cn>, Boqun Feng <boqun.feng@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: John Ogness <john.ogness@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>,
 Ke Sun <sk.alvin.x@gmail.com>, rust-for-linux@vger.kernel.org
References: <20251229072157.3857053-1-sunke@kylinos.cn>
 <20251229072157.3857053-2-sunke@kylinos.cn>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251229072157.3857053-2-sunke@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.12.25 08:21, Ke Sun wrote:
> Export ptr_to_hashval() and extract kptr_restrict_value() to enable
> Rust code to use kernel pointer formatting functionality.
> 
> - Export ptr_to_hashval() with EXPORT_SYMBOL_GPL for pointer hashing.
>   This function is used to hash kernel pointers before printing them,
>   preventing information leaks about kernel memory layout.
> 
> - Extract kptr_restrict handling logic from restricted_pointer() into
>   a separate exported function kptr_restrict_value() that can be
>   reused by both restricted_pointer() (for %pK format specifier) and
>   Rust code.
> 
> The kptr_restrict_value() function:
> - Returns 0, 1, or 2 to indicate the kptr_restrict sysctl value
> - Returns -1 for error case (IRQ context with kptr_restrict==1)
> - Modifies the pointer value through @pptr parameter when needed
>   (sets to NULL when access should be restricted)
> 
> These functions are needed for the HashedPtr and RestrictedPtr wrapper
> types in rust/kernel/ptr.rs to provide safe pointer formatting that
> matches C kernel patterns.
> 
> This refactoring:
> - Allows restricted_pointer() to reuse the common logic while
>   maintaining the same behavior
> - Enables Rust code to use the same kptr_restrict handling logic
> - Reduces code duplication
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> ---
>  include/linux/printk.h | 10 ++++++++
>  lib/vsprintf.c         | 55 ++++++++++++++++++++++++++++++++----------
>  2 files changed, 52 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/printk.h b/include/linux/printk.h
> index 45c663124c9bd..91380b1eff1a1 100644
> --- a/include/linux/printk.h
> +++ b/include/linux/printk.h
> @@ -385,6 +385,16 @@ extern void __printk_cpu_sync_put(void);
>  
>  extern int kptr_restrict;
>  
> +/**
> + * kptr_restrict_value - Determine what pointer value should be used for %pK
> + * @pptr: Pointer to the pointer value (may be modified)
> + *
> + * Returns:
> + *   - 0, 1, or 2: The kptr_restrict value if pointer should be used
> + *   - -1: Error case (IRQ context with kptr_restrict==1), *pptr unchanged
> + */
> +int kptr_restrict_value(const void **pptr);
> +
>  /**
>   * pr_fmt - used by the pr_*() macros to generate the printk format string
>   * @fmt: format string passed from a pr_*() macro
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index a3790c43a0aba..29d2e681c6e73 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -811,6 +811,7 @@ int ptr_to_hashval(const void *ptr, unsigned long *hashval_out)
>  {
>  	return __ptr_to_hashval(ptr, hashval_out);
>  }
> +EXPORT_SYMBOL_GPL(ptr_to_hashval);
>  
>  static char *ptr_to_id(char *buf, char *end, const void *ptr,
>  		       struct printf_spec spec)
> @@ -857,14 +858,28 @@ static char *default_pointer(char *buf, char *end, const void *ptr,
>  
>  int kptr_restrict __read_mostly;
>  
> -static noinline_for_stack
> -char *restricted_pointer(char *buf, char *end, const void *ptr,
> -			 struct printf_spec spec)
> +/**
> + * kptr_restrict_value - Determine what pointer value should be used for %pK
> + * @pptr: Pointer to the pointer value (may be modified)
> + *
> + * This function determines what pointer value should be printed based on the
> + * kptr_restrict sysctl setting:
> + *
> + * - kptr_restrict == 0: Return 0 (use original pointer, will be hashed)
> + * - kptr_restrict == 1: Return 1 if current process has CAP_SYSLOG and same
> + *                       euid/egid, otherwise set *pptr to NULL and return 1
> + * - kptr_restrict >= 2: Set *pptr to NULL and return 2
> + *
> + * Returns:
> + *   - 0, 1, or 2: The kptr_restrict value if pointer should be used
> + *   - -1: Error case (IRQ context with kptr_restrict==1), *pptr unchanged
> + */
> +int kptr_restrict_value(const void **pptr)

Would it be an improvment to not modify the pptr itself? But instead
to work with some kind of in ptr (not modified) and out_ptr (returned
to the caller then)?

kptr_restrict_value(const void *ptr, const void **out_ptr)

And an enum for the result? With something like

enum kptr_restict_result {
  KPTR_RESTICT_ERROR = -1,
  KPTR_RESTICT_NONE = 0,
  KPTR_RESTICT_PARTIAL = 1,
  KPTR_RESTICT_FULL = 2,
}

What would result in something like

enum kptr_restict_result kptr_restrict_value(const void *ptr, const
void **out_ptr)

Opinions?

Dirk
