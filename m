Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB7345D5C9
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786706169; cv=none; b=Q9p/Pi2f+r1rDSGDFgu08lfWe5joQA/4nOIuZC6lNR+QhSo2twJ0KPAY/6B4vrJAzP2paohUCXqkYtfgl9otbuU+lchCRK1CQWKxebLK6AiCDziVTGUIlF0LP+t66wTepI1i9tMem27p4j3F1WSYEH4rB4lzeo/SWaEkqFxk6Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786706169; c=relaxed/simple;
	bh=WC68mzM9vVdX5O4PVh43sBf4C00Yw06tw0d+DOenXm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=caNuOg63lWOKSxXZsplkHiMu2nS26036roEgoynDKHbGEI+0UH58/I76lNymfECdFjJBdZ0FUVb2GgOU7so5etLXDUiha/98ZaO+s2haDyq3am4/TPTJYxd9V0WGzG6psiZI/BYcIjlVr7LfiXpVI6Byq7s7fCiMxoz0yaDaaHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N1OOPHyS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N1OOPHyS"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de0093c42so772237f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 04:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786706163; x=1787310963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufDJ56SqV15sMOIVLhDYx7ZQ9UDhnRuzgS+xzCE8e40=;
        b=N1OOPHyS45MXH3sccBAv2rnBqRxeeTdLcQ1simpHJDu8KuFsM/QMtbqrycyltEcYqb
         9OwivpkDmJ0RtQF79WxIyobrV/6hJmlRd9HMf0+a0LrXXBhEMabsy4YcUBs/ZHZSJVZv
         eaGy3tVg0ISGERycch4cng6STN052ctq+JUSkUpQtddL+0zDtIkbSeXwwcWI+3w3tkWv
         GI3W6PBycL0xJRfXyRRrBj2T6tLjocDF0tMflPyOXoNffLZb4YovGP4FI3YMBB8Hb4En
         m+oHCeS9MamwwlKftGAJFH7eghAj6T0ZhpkY+3JYXETrQJ/RGVoOfC7d9auSTD9WPpKt
         ihUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786706163; x=1787310963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufDJ56SqV15sMOIVLhDYx7ZQ9UDhnRuzgS+xzCE8e40=;
        b=qAxNj4sqe/xGpTQTwze9FYMSFfJQ7qFk2LmZ7qBBKvZ2ETFNAlA9Y6+qJCq37/SSbt
         R+4fxqtFX/CDO4+Km3wUPORnN+RVm9RKm4MeH9OgmCNQhrPgqfS44Qm7RJXpTEBEUx8c
         z0KGfNq9/IlB/WnRTps+nSannoRuMVjk6R7eEL+bB+CG3LOgTBOdTte48t87R8jSblZj
         q+CPpdh0hbyX1s6EGrHcD9staV3pUgrmPJ1IyvBneycsnPIaZKvJJEHG1SNF9cTGOO4j
         cGC8feT7DZwtbzSkQ3pNY36xFQuWAazbxLB3DgEMnuNGNGelCBfRATSr9S9d/meDpw5a
         63zw==
X-Forwarded-Encrypted: i=1; AHgh+RqquY7ByPpnEKZ6Gm6Hyzywv1j5cV8R6TnkK2o4QLA0g+ONJ5+hwKdFjM13WIT7sGBVu8k9rYTfTIBWER2S/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO+HrmPN4uBeqxrplRiXRzSm+JlPXkwLYosCOHDR0ReSAhdqLR
	G5RzP68ExCJ1I4b8ElIovVYcK20L5RzmV9fd8C/vEvi/F0HS4ZbHxbzCIw+m728hrIw=
X-Gm-Gg: AR+sD12SggSRBZgg5IJ96TnejIkB2kyFMoWpVh2QMRrp7WLNyhv0TGCFiY3uGlsS4f3
	fxJdl5mRNaZQzJb69KNNG/d+cEV3RsQ7Q+ODsDB7vt9laBYfT0jTGnwe/iu7GGgZanch+L+L3VB
	48xDqxa0ZR0H7wy6peOi2WBZ1DvqnaOYEcaAZSRTlXm++x8AJBl8HPMkjTMT/KlpYFwfKmW+hNF
	ZXNJYs1T8jGT2WkdzQ4sZuvWbQjBGjpfFddhJZzY6CkoFS9ZkG4wpBcsbFbBkEhixYOPoPzRKOL
	uYRjudXx8dH9CpmVArYqj//thDGYObiXpZFC3hPWgj/9hJ0e8LaGe7BL0LulCPtgYtoBh515OB2
	a8caWTF8016eea0p/Uh/E+QjXpX/6Xi5+iO/MpHrqeeY0Mvw70twcniABShBbMuMfKa5Ls2nfMX
	sfn9CG2f57ZZj+xe2XyKJeJRHr2GzHvnlrv9ulcIOaRYkyv8hIqJMworFUCgFPUAo17amO16Oji
	/0+Wbfib0w+P9XflarnJuNuJw==
X-Received: by 2002:adf:ee84:0:b0:47f:eb37:fb7f with SMTP id ffacd0b85a97d-48160758e05mr5816291f8f.16.1786706163380;
        Fri, 14 Aug 2026 04:16:03 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f20059asm6805179f8f.5.2026.08.14.04.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 04:16:02 -0700 (PDT)
Message-ID: <9044355d-bff2-44fa-a8e2-ee3500aa1af0@suse.com>
Date: Fri, 14 Aug 2026 13:16:01 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] module: Extend module_blacklist parameter to
 built-in modules
To: Gary Guo <gary@garyguo.net>, Aaron Tomlin <atomlin@atomlin.com>
Cc: arnd@arndb.de, mcgrof@kernel.org, da.gomez@kernel.org,
 samitolvanen@google.com, peterz@infradead.org, ojeda@kernel.org,
 akpm@linux-foundation.org, mhiramat@kernel.org, boqun@kernel.org,
 neelx@suse.com, da.anzani@gmail.com, sean@ashe.io, chjohnst@mail.com,
 steve@abita.co, mproche@mail.com, nick.lane@mail.com,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260807012601.360452-1-atomlin@atomlin.com>
 <DKNWEO3BOUOL.9COZBXZIGS6A@garyguo.net>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <DKNWEO3BOUOL.9COZBXZIGS6A@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/13/26 4:50 PM, Gary Guo wrote:
> On Fri Aug 7, 2026 at 2:25 AM BST, Aaron Tomlin wrote:
>> Currently, the "module_blacklist=" command-line parameter only applies to
>> loadable modules. If a module is built-in, the parameter is silently
>> ignored. This patch series extends the blacklisting functionality to
>> built-in modules by intercepting their initialisation routines during early
>> boot.
>>
>> Following review feedback, the implementation has been split into two
>> separate changes to decouple the introduction of the new feature from the
>> terminology renaming:
>>
>>     1.  The first patch extends the "module_blacklist=" parameter to
>>         built-in modules using the original blacklist terminology. It
>>         introduces the ".initcall.modnames" section to map initcall
>>         function pointers to their associated KBUILD_MODNAME strings
>>         (restricted only to module_init() invocations to save memory and
>>         avoid matching core kernel subsystems). It also restricts the check
>>         to a boot-time __init wrapper to eliminate Use-After-Free (UAF) and
>>         Spectre v1 vulnerability risks when loading dynamic modules at
>>         runtime, and adds a fast-path check to eliminate lookup overhead
>>         when the parameter is not in use
>>
>>     2.  The second patch renames the variables and helper functions to
>>         adopt the preferred "module_denylist=" and module_is_denylisted()
>>         terminology in the codebase. To preserve the existing user-space
>>         ABI, "module_blacklist=" is kept as a legacy alias pointing to the
>>         same module_denylist variable
>>
>> Aaron Tomlin (2):
>>   module: Extend module_blacklist parameter to built-in modules
>>   module: Rename module_blacklist to module_denylist
> 
> I feel with
> https://lore.kernel.org/driver-core/20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com/
> and this we're really making loadable module and builtin modules less different.
> 
> I wonder if we should just somewhat unify these completly, so built-in modules
> just behave identically to loadable modules, just without runtime relocations
> and ability to unload.

I can imagine this being possible and potentially useful. For instance,
a minimal `struct module` could be used for each built-in and loadable
module. For the latter, it could be then extended to something like
`struct loadable_module` containing all the fields currently needed for
loadable modules.

It could also help improve some C APIs. Functions currently cannot
determine whether a NULL value passed as a module parameter indicates an
invalid pointer or a built-in module [1].

> 
> Of course, that's quite a big change... And mostly likely people won't care
> because almost everything is built as loadable modules in distros anyway.

I agree this looks non-trivial. It would require proper investigation to
see how it might actually turn out.

[1] https://lore.kernel.org/linux-modules/610fc63b-f3dc-4824-99fd-907fc96f3194@oracle.com/

-- 
Cheers,
Petr
