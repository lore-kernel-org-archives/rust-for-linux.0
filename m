Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9997D37267A
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700320; cv=none; b=CjDa7wfnoDPm9COSi4uKaqr2gQnpziy2xoGPqDP5SyrI4LWOkT1KLmw6moRJqY5smGdx2MRj5DldUqaEgO3s4jIxLuMIZTzvp5q4MkZli8owQgq4HnJ6IbB1h6aZtCfB5nOlZCV1bLqP2CnhktoS7WWi0abkQAHSur8TZGoO2G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700320; c=relaxed/simple;
	bh=OlTwPy03Gx4UpPaxRugHSV6UqN7Tq3cVbZf8L3YUaXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=it2wdNY9771KOK5rkwHYsXOFTTvj3U8zkoHKTnnCYwtDMVjGQJ5931RUrQWaW9+Be75+JjecGWq1BiZ/lXXvaulJ5tAWlhp4JFXN3GfdZ+5D85TNFoKxFWKGGBRWfd1AN3wk9B1LcToeWj8AAcvXZSsnKePJiL+X6+XLVFyKJt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Z8nPSJwd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Z8nPSJwd"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-476a130c138so735178f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 02:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786700317; x=1787305117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wTQq0RghOtwHcFvwdUXDudX8pYeprvQ+YyUf2oXaG0=;
        b=Z8nPSJwdqS2oDu6oibVah6CfOpdYA1DXfty6R4Qa8gnvul+Zf3JfY39/IeZCtmb3th
         L2xLgGUrbPi+lVPEu9IHZibHhCmXvznMRCp5BIbVV6GYBmcHtmtel3klJNRFtfRu0hht
         7g6Zw3Xypjk/tgPEWi+8JCgBudM40L1LMJv1B7KyeAXYaMP5qs9g9rVuAbMMSmnN8qjq
         03tKawjGBDH977CdtAfxdJcsMHfik+gH91XAk0FuJYvOYs7l4WnIMSf+Jk5E40w6z735
         F4RgbxxGURj5vsaI8GEHQOTu8PXDEjZaCYygEmg1re7QdeRY9PhADXbLPLkxxk1Aeh8K
         D9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786700317; x=1787305117;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wTQq0RghOtwHcFvwdUXDudX8pYeprvQ+YyUf2oXaG0=;
        b=L0cBqhIujypcNG/VRQfnwm1LvDTfPmBVikEQY+aoE/xJaGPeUkTbHtsjLPj9fgXGNs
         8YylTB0JnSOc5fCJbkTnMF4wIsB/U5M9nEISRq6aLpDZm4qR2UUcFbXDfPoEWzIl6FCu
         Ez4LbIwhP1U5U8k1KAWKN5dsTiX2Hn/jhks/c4wwQeA/tUyT1p3b2Obtec7QE2142PKm
         05tRCSxwEWuNlJQUOeZQDR50qJVWFoxOYpdRJTwYrh1pwIi0OFWbxCQgtpMx9qB4hNAa
         SrGKblS3LDVyH77p///3mXHrGPf+dylvZxRJo8pctrEXbwWqzg//NSiCQuX0Ffe5J59h
         pg7A==
X-Forwarded-Encrypted: i=1; AHgh+Rqr/2sB7YrAhznpuceYyAZiSPNtabcpVGFffZ1ug8h5izKyTpeN8qXi0omTepYrYrIL0KVopvKUx+A3oyQRBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMcYEaGYpaRJE6T544CiyXCdJl95p16Sti1Zl0Ek7Sqmi7hw52
	EzUN6cc4F5SJreIaZ/iQhs3FseXGf/stJ9ArtPlrzlUeDeDP5Ma5vKNdMbH4GTQWw9I=
X-Gm-Gg: AR+sD11WWhUqwyIF09wmmcD408Xi8lX+JsWr5b072oGN0N5jmiPmU/ohHkZO2BybbFp
	oWP0iiC1iDJLffX3lioUC1bmW15usIVeGI4065jZqgHgz0gjgT/iXewIxDZp+yD1BFhINYCsKzL
	6rRv3FYcfzNVh+18mMccVo7zAeyP/P1cyrU0Ae0B4azMDL9pkJQoEzDhTAx2IPIAv7D2/wACCFV
	CxZlMfSDM4Pul51mOwSGSCsBuO702yVhHos8m1Kxr07MHUwDwUeyr1FlAewGTvvre2YQ9Biebfi
	i5xO8YyTSYwTXXZum5oSTM+ErGYWbWb1UNynjGVoBhO934gkrZI+zYUWGVs++R22llbvfUU5t4P
	Ij+ududqqfvTo+bLEzZSkCbMVBrW2BldBGC5wK4OD+UB6YBGl0Ll0Z8DHoHsJF+lKu0UZH2Q+7N
	YPW0QuEiOR/hxTZBgZ0ckbqOwm9uJbasH+t/Gl2ne/TjHJAFkxGhv1CN/C0ZTzLuFghorQlXrlj
	igiOfBkNays996TJapp5CLDhQ==
X-Received: by 2002:a05:6000:4022:b0:481:58ac:7aeb with SMTP id ffacd0b85a97d-481607382c5mr6202716f8f.15.1786700316777;
        Fri, 14 Aug 2026 02:38:36 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b13c3sm5501086f8f.19.2026.08.14.02.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 02:38:36 -0700 (PDT)
Message-ID: <534df8a0-92e2-4b4f-9c66-2f20a73937fa@suse.com>
Date: Fri, 14 Aug 2026 11:38:35 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] module: Extend module_blacklist parameter to
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
 <20260807012601.360452-2-atomlin@atomlin.com>
 <af6aaa0a-03de-4175-84a5-7c253198d184@suse.com>
 <DKNWJNKYK5HY.1BZYPRXP3BZSS@garyguo.net>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <DKNWJNKYK5HY.1BZYPRXP3BZSS@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/13/26 4:56 PM, Gary Guo wrote:
> On Thu Aug 13, 2026 at 3:15 PM BST, Petr Pavlu wrote:
>> On 8/7/26 3:26 AM, Aaron Tomlin wrote:
>>> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
>>> index 06c18e207508..13353b43b38d 100644
>>> --- a/rust/macros/module.rs
>>> +++ b/rust/macros/module.rs
>>> @@ -479,6 +479,7 @@ pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
>>>      let ident_init = format_ident!("__{ident}_init");
>>>      let ident_exit = format_ident!("__{ident}_exit");
>>>      let ident_initcall = format_ident!("__{ident}_initcall");
>>> +    let ident_modname = format_ident!("__{ident}_modname");
>>>      let initcall_section = ".initcall6.init";
>>>  
>>>      let global_asm = format!(
>>> @@ -590,6 +591,21 @@ pub extern "C" fn cleanup_module() {
>>>                  #[cfg(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS)]
>>>                  ::core::arch::global_asm!(#global_asm);
>>>  
>>> +                #[cfg(not(MODULE))]
>>> +                #[repr(C)]
>>> +                struct InitcallModname {
>>> +                    initcall_fn: extern "C" fn() -> ::kernel::ffi::c_int,
>>> +                    modname: *const ::kernel::ffi::c_char,
>>> +                }
>>> +
>>> +                #[cfg(not(MODULE))]
>>> +                #[used(compiler)]
>>> +                #[link_section = ".initcall.modnames"]
>>> +                static #ident_modname: InitcallModname = InitcallModname {
>>
>> Can Rust directly use the C definition of initcall_modname via
>> ::kernel::bindings::initcall_modname?
>>
>>> +                    initcall_fn: #ident_init,
>>> +                    modname: #name_cstr.as_ptr().cast(),
>>
>> Can the modname string be placed in .init.rodata to match the behavior
>> on the C side?
> 
> Putting strings in .init.rodata is more likely to grow the size of kernel
> because it cannot be deduplicated with other strings; the names are very likely
> to be in .rodata already due to it being added to sysfs when registering with a
> bus.

On the other hand, if these module name strings are not placed in
.init.rodata and don't get merged with an existing string in vmlinux,
some memory will be wasted after initialization completes. Built-in
drivers with device_driver::mod_name should have their names in vmlinux
but the same is not necessarily true for other modules.

For instance, my system is running openSUSE Tumbleweed with the stable
7.1.8 kernel. It has 227 built-in modules, about half of which are
drivers.

$ wc -l "/usr/lib/modules/$(uname -r)/modules.builtin"
227 /usr/lib/modules/7.1.8-1-default/modules.builtin
$ grep ^kernel/drivers "/usr/lib/modules/$(uname -r)/modules.builtin" | wc -l
125

Looking deeper, the script below runs the strings utility on vmlinux and
checks whether the name of each built-in module is already present in
the binary, at least as a suffix of another string.

On my system, the script shows that 156 modules have their names present
in vmlinux, while 71 names are missing. The total size of the present
module names is 1436 bytes, while the size of the missing module names
is 911 bytes.

This means that if .initcall.modnames places its strings in
.init.rodata, the size of the on-disk and initial kernel image should
increase by 1436+911 bytes. On the other hand, if the strings are not
placed in .init.rodata, 911 bytes will be wasted after initialization
completes.

So there is a trade-off.

-- 
Cheers,
Petr


#!/bin/bash

vmlinux=$(xzcat "/usr/lib/modules/$(uname -r)/vmlinux.xz" | strings)
matched=0 unmatched_modules=0 extra_bytes=0 lost_bytes=0

for file in $(cat "/usr/lib/modules/$(uname -r)/modules.builtin"); do
  base=$(basename --suffix=.ko "$file" | tr '-' '_')
  echo "$vmlinux" | grep -q "$base$"
  ret=$?
  if [ "$ret" -eq 0 ]; then
    matched_modules=$((matched_modules + 1))
    extra_bytes=$((extra_bytes + ${#base} + 1))
  else
    unmatched_modules=$((unmatched_modules + 1))
    lost_bytes=$((lost_bytes + ${#base} + 1))
  fi
  echo $ret $base
done

echo
echo "Matched modules: $matched_modules"
echo "Extra bytes: $extra_bytes"
echo
echo "Unmatched modules: $unmatched_modules"
echo "Lost bytes: $lost_bytes"
