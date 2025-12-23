Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCE830FF04
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766492955; cv=none; b=PVcXOzSmM8LOabTgpP842PA/A0cl1Vk8kmav7DWO70kKHb1sBIi1tgyzH0a2sa8dKRVGgMIe+2GgNJl7EuXhMnpTyxL19ZfX1w1qcomr93GwEGEZivKiHb0nRwNatahvzOhXWtxQ88eLnAeaq87ml5Jo/WBlsY2WHUL9NmnEYWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766492955; c=relaxed/simple;
	bh=cfEFhEd9HGDMtIVOOCTh5vYCtGBOevOzpDk+sKdX3Mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EF2nhhcBqUP1GtrtlWmj8xesLRB+o1k65l/Ei9inujuU1qlAZlg5utg/JMzUbfMT4IOZYGpNgY1Az5r6s2O83LA5U/w5r1cnv7qLmGQT6C0CbRNCzZOaWuCNr2uBSPo23aJlrOROA5WySGLu53UADe6H8buOZSadx0X/GfOFLQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hevOGqO2; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hevOGqO2"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64b9230f564so5395491a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 04:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766492952; x=1767097752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w5xTlcGpdeyQEFa92rXXck2wdXNlODn2lhJvH8AYtz8=;
        b=hevOGqO2yrzKzkXXVGzk7pVujvXpNomF5/M14+xBuonh+2N/nc/kIagS3uXZeP/a3b
         c+N14BIOWxQPe5hrm6SGA3d3+X1qmrVbCnXRJUEzqbDmSSkedYqLUq+h990xoKRyNKfA
         qxP7WUMFCLkl6SAL2x+GQB36r5yiNFj/gpJEMn+gFUxeCtxkUuGnWk1ApPhF+SZXFgBP
         g2MUV7i6RSUo6ZqP5JOgy0ceerCN6jeR5gayZ5cz5EJa4aobAtdozxtG52PbNnG5eYvF
         RGmFhHRFLX9QY3UrhXaPm6xSrsAdH/ECt0UHQrOL4cpE9819e0mpHnwo+4wYPGZ9pXLk
         pTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766492952; x=1767097752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5xTlcGpdeyQEFa92rXXck2wdXNlODn2lhJvH8AYtz8=;
        b=ROZg3b4SxCpyw+lv35AunLxwI1t2gdN9TCD1Xn+88w3WgncL4R8HR0x4nJzBK0lQ7b
         QbdyecolaDEYeQYOfXAnRFoVPoQee8Ei54l+Zevzj748Sjz+cuF7EMjeuMQh2+NUpbBS
         RZsv3EYyKOUpp7QuL6yg4HTuK9iZorOIRFq+F8Jj2Qqtr6WdW4qnEENW5YNM7o+5LoT/
         etO/o2r76qdTXPaRVhP24Z6U4Vxrri2VnCAoHBZQHIvBqwicC6/f5mVAN41a4f/IFeeI
         p5VsHjyD0hYJNZnWtdK5MnYK6UZVyTT0hwCFASgLOWwAg2drO7Usi8ltb+3mdq2R8dmO
         fuLg==
X-Forwarded-Encrypted: i=1; AJvYcCWvU2/Up5OUdhBPkxX1WFVVL9gEfVI1czEXUZOQTljmK79SeNr+NsHN46w/8Ez6xs0FrrwyV39xI4KFVoOqBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEYb9aZmlCdgftJePIqiceRlKoTvLiItj0ffy4shzmCt/ktVHr
	0GF76lMMWWXFjjDE5x/SqPjCF6pn2wW0yNte/QqW2boUz5AEaudzI4hC
X-Gm-Gg: AY/fxX6E74rH0M0xtIEhOBwacwZlgK3usZLi7vDpv4X1TFPc+tYtY5Tjgfdaw+G+gHQ
	ta7J9aOzmtnR9FVMI621ukFMJPmn9/8VL0ROihegi9jsCoQTipk/PickFV+kWEgyUgXx6RPBBLr
	AO8CyJ6zaiqbwiTK//qNPzBhGxnfWQAk6pTyndXRAtNPJgXlOhukxquexPHbU0zUSVlCTj09rwU
	p2n/sEO4Fxk4C1CqBSHFT/31dd1VboXncwNvyuXDYIwq+tCMuhOP8WUWTdg7qC4P9lckmr3M3IQ
	+SEmYixPPUkDw/x62uO7TIwu/i04egParB09MCi/UvwfaW7zgriMl97elHkRvgjk5FolhVX+ITJ
	JFDn0BvxQYt1euUNl8uIBQVtLHJKshGiVdBfpf6eTAMXnS4WAAUruanIemYt6zkwLak9U3ZHxhm
	9Blkvw/mnKTt+1a3oBasijqc77N8JBBusFo5HckZrIxeUwDfsbPW3COmDGs2HtXv3SUs1H7VWAS
	uvkZogQvLTqXHIaZT+Yq28HBSvfIVThm/YsPuWqoX6agg==
X-Google-Smtp-Source: AGHT+IFQKu463Ws0DeQGqtqtFbIzklz16SbCW/WpuT8pw8rwR8527OOqWdhaQqGG2VyTUZbhKeJ8Ag==
X-Received: by 2002:a17:907:6d0f:b0:b72:d001:7653 with SMTP id a640c23a62f3a-b8036f0f183mr1343019266b.19.1766492951664;
        Tue, 23 Dec 2025 04:29:11 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:d174:1f34:13cc:be92? (p200300dfbf2de300d1741f3413ccbe92.dip0.t-ipconnect.de. [2003:df:bf2d:e300:d174:1f34:13cc:be92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f5400bsm13550782a12.4.2025.12.23.04.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 04:29:11 -0800 (PST)
Message-ID: <46e188a4-4b74-4206-ba18-f107f45bb98d@gmail.com>
Date: Tue, 23 Dec 2025 13:29:10 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: page: Simplify overflow check using
 checked_add()
To: Gary Guo <gary@garyguo.net>, Kari Argillander <kari.argillander@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Dirk Behme <dirk.behme@de.bosch.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251223-rust-page-check-v2-1-fba3dbdde1d8@gmail.com>
 <20251223115726.621bfa38.gary@garyguo.net>
Content-Language: en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251223115726.621bfa38.gary@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.12.25 12:57, Gary Guo wrote:
> On Tue, 23 Dec 2025 12:06:17 +0200
> Kari Argillander <kari.argillander@gmail.com> wrote:
> 
>> Replace the explicit bounds comparisons with a single checked_add()-based
>> range check. This avoids redundant comparisons, makes the overflow case
>> explicit, and results in simpler generated code (checked with godbolt
>> for x86).
>>
>> No functional change intended.
>>
>> Reviewed-by: Dirk Behme <dirk.behme@de.bosch.com>
>> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
>> ---
>> Changes in v2:
>> - Added MSVR todo (Dirk Behme)
>> - Link to v1: https://lore.kernel.org/r/20251219-rust-page-check-v1-1-df2e52fa3bd5@gmail.com
>> ---
>>  rust/kernel/page.rs | 19 +++++++++----------
>>  1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
>> index 432fc0297d4a..cd2af7e4c357 100644
>> --- a/rust/kernel/page.rs
>> +++ b/rust/kernel/page.rs
>> @@ -239,17 +239,16 @@ fn with_pointer_into_page<T>(
>>          len: usize,
>>          f: impl FnOnce(*mut u8) -> Result<T>,
>>      ) -> Result<T> {
>> -        let bounds_ok = off <= PAGE_SIZE && len <= PAGE_SIZE && (off + len) <= PAGE_SIZE;
>> -
>> -        if bounds_ok {
>> -            self.with_page_mapped(move |page_addr| {
>> -                // SAFETY: The `off` integer is at most `PAGE_SIZE`, so this pointer offset will
>> -                // result in a pointer that is in bounds or one off the end of the page.
>> -                f(unsafe { page_addr.add(off) })
>> -            })
>> -        } else {
>> -            Err(EINVAL)
>> +        // TODO: Replace `map_or` with `is_none_or` once the MSRV is >= 1.82.
> 
> I was about to suggest just enable the feature gate, but turns out it was
> only added in 1.81. That's a fast one to stabilize!


With Alexandre's `matches!` proposal I was thinking that we could drop
the TODO comment and we won't need to touch this file again once MSRV
is >= 1.82. Opinions?

Cheers

Dirk


> Reviewed-by: Gary Guo <gary@garyguo.net>
> 
> Best,
> Gary
> 
>> +        if off.checked_add(len).map_or(true, |end| end > PAGE_SIZE) {
>> +            return Err(EINVAL);
>>          }
>> +
>> +        self.with_page_mapped(move |page_addr| {
>> +            // SAFETY: The `off` integer is at most `PAGE_SIZE`, so this pointer offset will
>> +            // result in a pointer that is in bounds or one off the end of the page.
>> +            f(unsafe { page_addr.add(off) })
>> +        })
>>      }
>>  
>>      /// Maps the page and reads from it into the given buffer.
>>
>> ---
>> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
>> change-id: 20251219-rust-page-check-819ccc39c53a
>>
>> Best regards,
> 
> 

